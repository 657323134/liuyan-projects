package com.liuyan.thread;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 16:16 2018/3/8
 */
public class Waiter implements Runnable{
    private Message msg;

    public Waiter(Message msg) {
        this.msg = msg;
    }

    public void run() {
        String threadName = Thread.currentThread().getName();
        synchronized (msg) {
            try {
                System.out.println(threadName + "waiting to get notifyed at time:" + System.currentTimeMillis());
                msg.wait();
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println(threadName + "waiter thread got notified at time :" + System.currentTimeMillis());
            System.out.println(threadName + "processed:" + msg.getMsg());
        }
    }

}
