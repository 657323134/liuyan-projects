package com.liuyan.thread;

/**
 * @Author: ly
 * @Description: 线程间的通信test，对象调用了wait方法会释放该对象的锁
 * @Date: Created in 16:25 2018/3/8
 */
public class WaitNotifyTest {
    public static void main(String[] args) {
        Message msg = new Message("process it");
        Waiter waiter = new Waiter(msg);
        new Thread(waiter).start();

        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        Notifier notifier = new Notifier(msg);
        new Thread(notifier).start();
    }
}
