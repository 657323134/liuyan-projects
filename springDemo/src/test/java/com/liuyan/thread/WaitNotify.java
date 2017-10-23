package com.liuyan.thread;

/**
 * Created by liuyan on 2017/9/21.
 */
public class WaitNotify {
    static boolean flag = true;
    static Object obj = new Object();

    /**
     * wait线程首先启动，并调用了wait方法，暂停该线程执行，并且释放了该线程锁持有的锁；
     * 等到notify线程执行时，调用了同一个对象的notify（）方法，使wait线程继续执行，但是因为notify线程持有obj对象锁，所以wait
     * 线程会阻塞等待notify线程释放该锁之后，才能执行。
     * @param args
     */
    public static void main(String[] args) {
        Thread wait = new Thread(new Wait(), "wait");
        wait.start();
        SleepUtils.second(2);

        Thread notify = new Thread(new Notify(), "notify");
        notify.start();

    }
    static class Wait implements Runnable{

        @Override
        public void run() {
            synchronized (obj) {
                while(flag) {
                    System.out.println(Thread.currentThread().getName() + ":wait");
                    try {
                        obj.wait(); // 调用wait会释放

                        System.out.println(Thread.currentThread().getName() + ":is notifyed");
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                System.out.println(Thread.currentThread().getName() + ":"+flag);

            }
        }
    }

    static class Notify implements Runnable {

        @Override
        public void run() {
            synchronized (obj) {
                obj.notify();
                try {
                    Thread.sleep(1000l);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                flag = false;
                System.out.println(Thread.currentThread().getName() + ":notify and modify flag=false");
            }
        }
    }
}
