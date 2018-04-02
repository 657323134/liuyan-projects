package com.liuyan.zookeeper;

import org.apache.zookeeper.*;
import org.apache.zookeeper.data.Stat;

import java.util.Random;

import static org.apache.zookeeper.ZooDefs.Ids.OPEN_ACL_UNSAFE;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 15:37 2018/4/2
 */
public class CreateCallBack {
    ZooKeeper zk;
    static boolean isLeader;
    Random random = new Random();
    String serverId = Integer.toString(random.nextInt());
    static AsyncCallback.StringCallback masterCreateCall = new AsyncCallback.StringCallback() {
        @Override
        public void processResult(int rc, String path, Object ctx, String name) {
            switch (KeeperException.Code.get(rc)) {
                case CONNECTIONLOSS:
                    new CreateCallBack().checkMaster();
                    return;
                case OK:
                    isLeader=true;
                    break;
                default:
                    isLeader=false;
            }
            System.out.println("i'm" + (isLeader?"":"not") + "the leader");
        }
    };
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
    void runForMaster() {
        zk.create("/master",serverId.getBytes(),OPEN_ACL_UNSAFE,CreateMode.EPHEMERAL,masterCreateCall,null);
    }

}
