package com.liuyan.thread;

/**
 * Created by liuyan on 2017/9/21.
 */
public class InterruptedTest {
    public static void main(String[] args) {
        Thread sleepThread = new Thread(new SleepThread(),"sleepThread");
        Thread busyThread = new Thread(new BusyThread(), "busyThread");

        sleepThread.setDaemon(true);
        busyThread.setDaemon(true);
        sleepThread.start();
        busyThread.start();

        SleepUtils.second(2);

        sleepThread.interrupt();
        busyThread.interrupt();

        SleepUtils.second(2);

        System.out.println(sleepThread.getName() + ":" + sleepThread.isInterrupted()); // false
        System.out.println(busyThread.getName() + ":" + busyThread.isInterrupted()); // true

    }
    static class SleepThread implements Runnable {

        @Override
        public void run() {
            while (true) {
                SleepUtils.second(10);
            }
        }
    }
    static class BusyThread implements Runnable {

        @Override
        public void run() {
            while (true) {

            }
        }
    }
}
