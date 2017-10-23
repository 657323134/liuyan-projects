package com.liuyan.thread;

/**
 * 10个线程按顺序执行
 * Created by liuyan on 2017/9/22.
 */
public class ThreadJoin {
    public static void main(String[] args) {
        Thread previous = null;
        for (int i = 0; i < 10; i++) {
            // 每个线程拥有前一个线程的引用，需要等待前一个线程终止，才能从等待中返回
            Thread thread = new Thread(new Domino(previous),"thread-"+ i);
            thread.start();
            previous = thread;
        }
        SleepUtils.second(5);
        System.out.println("main 线程执行完毕");
    }
    static class Domino implements Runnable {
        Thread previous = null;

        public Domino(Thread previous) {
            this.previous = previous;
        }

        @Override
        public void run() {
            try {
                if (previous != null) {
                    previous.join(); // join会等待previous线程执行完，然后才执行当前线程

                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(Thread.currentThread().getName());
        }
    }
}
