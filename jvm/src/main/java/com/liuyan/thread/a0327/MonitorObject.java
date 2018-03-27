package com.liuyan.thread.a0327;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 15:19 2018/3/27
 */
public class MonitorObject {
    private Object object = new Object();
    public void objectWait() {
        synchronized (object){
            try {
                object.wait();
                System.out.println(Thread.currentThread().getName() + "被唤醒，继续执行");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public void objectNotify() {
        synchronized (object) {
            object.notify();
        }
    }



    public static void main(String[] args) {
        MonitorObject monitorObject = new MonitorObject();

        Thread thread1= new Thread(new Runnable() {
            @Override
            public void run() {
                monitorObject.objectWait();
            }
        },"thread1");
        thread1.start();
        Thread thread3= new Thread(new Runnable() {
            @Override
            public void run() {
                monitorObject.objectWait();
            }
        },"thread3");
        thread3.start();

        Thread thread2 = new Thread(new Runnable() {
            @Override
            public void run() {
                monitorObject.objectNotify();
            }
        },"thread2");
        System.out.println("thread1 wait，释放object对象锁");
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("thread2 调用notify随机唤醒该对象一个线程");
        thread2.start();


        Thread thread4 = new Thread(new Runnable() {
            @Override
            public void run() {
                monitorObject.objectNotify();
            }
        },"thread4");
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("thread4 调用notify随机唤醒该对象一个线程");
        thread4.start();

    }
}
