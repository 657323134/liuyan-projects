package com.liuyan.zookeeper;

import org.apache.zookeeper.*;
import org.apache.zookeeper.data.Stat;

import java.io.IOException;

import static org.apache.zookeeper.ZooDefs.Ids.OPEN_ACL_UNSAFE;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 9:45 2018/4/8
 */
public class Zk01 {
    ZooKeeper zk;
    Watcher myWatcher = new Watcher() {
        @Override
        public void process(WatchedEvent watchedEvent) {
            System.out.println("this is myWatcher");

        }
    };
    AsyncCallback.StatCallback existsCallback = new AsyncCallback.StatCallback() {
        @Override
        public void processResult(int rc, String path, Object ctx, Stat stat) {
            System.out.println("this is callback");

            switch (KeeperException.Code.get(rc)) {
                case CONNECTIONLOSS:
                    masterExists();
                    break;
                case OK:
                    if(stat == null) {
//                        stat = MasterStates.RUNNING;
                        runForMaster();
                    }
                    break;
                default:
                    // 判断是否是主节点
//                    checkMaster();
                    break;

            }
        }
    };


    void masterExists() {
        zk.exists("/master", myWatcher, existsCallback, null);
    }

    Watcher masterExistsWatcher = new Watcher() {
        @Override
        public void process(WatchedEvent watchedEvent) {
            // 如果主节点master被删除
            if (watchedEvent.getType() == Event.EventType.NodeDeleted) {
                assert "/master".equals(watchedEvent.getPath());
                // 设置为主节点
                runForMaster();
            }

        }
    };

    void runForMaster() {
        try {
            // 创建主节点
            zk.create("/master", null, OPEN_ACL_UNSAFE, CreateMode.EPHEMERAL);
        } catch (KeeperException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void startZk() {
        try {
            zk = new ZooKeeper("localhost:2181", 15000, myWatcher);
        } catch (IOException e) {
            System.out.println("创建zk失败");
            e.printStackTrace();
        }
    }

    public void run() {
        startZk();
        zk.exists("/myZnode", myWatcher, existsCallback, null);
        System.out.println("main");
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Zk01 zk01 = new Zk01();
        zk01.run();

    }


}
