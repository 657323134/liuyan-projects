package com.liuyan.zookeeper;

import org.apache.curator.RetryPolicy;
import org.apache.curator.RetrySleeper;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.zookeeper.CreateMode;

/**
 * @Author: ly
 * @Description: curator，zookeeper高级封装库
 * @Date: Created in 16:06 2018/4/8
 */
public class Zk02 {
    CuratorFramework zkc = CuratorFrameworkFactory.newClient("127.0.0.7:2181", new RetryPolicy() {
        @Override
        public boolean allowRetry(int i, long l, RetrySleeper retrySleeper) {
            return false;
        }
    });
    public void run() {
        try {
            // curator的流畅式api
            zkc.create().withMode(CreateMode.EPHEMERAL).forPath("/mypath",new byte[0]);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
