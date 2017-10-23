package com.liuyan.thread;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by liuyan on 2017/9/14.
 */
public class DeadLockTest {
    private static Object a = new Object();
    private static Object b = new Object();
    public static void main(String[] args) {
        AtomicInteger atomicInteger1 = new AtomicInteger(0);
        AtomicInteger atomicInteger2 = new AtomicInteger(0);

        List<Thread> list = new ArrayList<Thread>();
        for (int i = 0; i < 1000; i++) {
            Thread a = new Thread(new Runnable() {
                @Override
                public void run() {
                    atomicInteger1.getAndIncrement();
                    atomicInteger2.getAndIncrement();
                }
            });
            list.add(a);
        }
        for (Thread thread:list) {
            thread.start();
        }
        for (Thread thread: list) {
            try {
                thread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        System.out.println(atomicInteger1);

    }
}
