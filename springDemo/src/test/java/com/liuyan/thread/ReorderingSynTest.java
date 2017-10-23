package com.liuyan.thread;

import java.util.concurrent.locks.ReentrantLock;

/**
 * Created by liuyan on 2017/9/18.
 */
public class ReorderingSynTest {
    int a = 0;
    boolean flag = false;

    public synchronized void write() {
        a=1; // 1
        flag = true;// 2
    }
    public synchronized void reader() {
        System.out.println(a);
        if(flag) {
            int i =a*a; // 3
            System.out.println(a); // 4
        }
    }

    /*编译器的重排序，1、2由于没有依赖可能会发生重排序，3/4也会发生重排序
     但是write、reader方法添加了内置锁，当a线程执行write时，线程b会阻塞，所以1/2的重排序对线程b没有影响*/
    public static void main(String[] args) {
        ReentrantLock lock = new ReentrantLock();
        lock.lock();
        ReorderingSynTest test = new ReorderingSynTest();
        new Thread(new Runnable() {
            @Override
            public void run() {
                test.write();
            }
        }).start();
        new Thread(new Runnable() {
            @Override
            public void run() {
                test.reader();
            }
        }).start();
    }
}
