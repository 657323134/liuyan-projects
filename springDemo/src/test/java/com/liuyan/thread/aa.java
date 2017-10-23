package com.liuyan.thread;

/**
 * Created by liuyan on 2017/9/18.
 */
public class aa {

    int a = 0;
    volatile boolean flag = false;

    /**
     * happens-before规则，1 before 2  3 before 4
     */
    public void write() {
        a=1; // 1
        flag = true;// 2
    }
    public void reader() {
        System.out.println(a);
        if(flag) {
            int i =a*a; // 3
            System.out.println(a); // 4
        }
    }

    /** 线程a写一个volatile变量之后，线程b读取同一个bolatile变量，在线程a写volatile变量之前的所有可见的共享变量，
     * 线程b在读取用一个volatile变量后,将立即变得对b线程可见。
     * */
    public static void main(String[] args) {
        ReorderingTest test = new ReorderingTest();
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
