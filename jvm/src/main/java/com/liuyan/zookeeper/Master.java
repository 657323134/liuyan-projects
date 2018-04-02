package com.liuyan.zookeeper;

import org.apache.zookeeper.*;
import org.apache.zookeeper.data.Stat;

import java.io.IOException;
import java.util.Random;

import static org.apache.zookeeper.ZooDefs.Ids.OPEN_ACL_UNSAFE;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 9:52 2018/4/2
 */
public class Master implements Watcher {
    ZooKeeper zk;
    String hostPort;
    Random random = new Random();
    String serverId = Integer.toString(random.nextInt());
    boolean isLeader = false;
    boolean checkMaster() {
        while (true){
            try {
                Stat stat = new Stat();

                byte data[] = zk.getData("/master",false,stat);
                isLeader = new String(data).equals(serverId);
                return true;
            } catch (KeeperException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
    void runForMaster() throws InterruptedException {
        while (true) {
            try {
                zk.create("/master", serverId.getBytes(), OPEN_ACL_UNSAFE, CreateMode.EPHEMERAL);
                isLeader = true;
                break;
            } catch (KeeperException.NodeExistsException e) {
                isLeader = false;
                break;
            } catch (KeeperException.ConnectionLossException e) {
            } catch (KeeperException e) {
                e.printStackTrace();
            }
            if (checkMaster()) break;
        }

    }
    Master(String hostPort) {
        this.hostPort = hostPort;

    }
    void startZK() {
        try {
            zk = new ZooKeeper(hostPort, 15000, this);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    void stopZK() {
        try {
            zk.close();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void process(WatchedEvent e) {
        System.out.println(e);
    }

    public static void main(String[] args) {
        Master m = new Master("127.0.0.1:2181");
        m.startZK();
        try {
            m.runForMaster();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
//        try {
//            Thread.sleep(6000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        m.stopZK();

    }

}
