package com.liuyan.thread;

/**
 * Created by liuyan on 2017/9/18.
 */
public class VolatileTest {
    private volatile int a = 0;

    public int getA() { // 原子操作
        return a;
    }

    public int getAndIncreament() { // 先执行读，然后再加1是复合操作不具备原子性
        return a++;
    }

    public void setA(int a) {
        this.a = a;
    }

    public static void main(String[] args) {
        VolatileTest test = new VolatileTest();

        new Thread(new Runnable() {
            @Override
            public void run() {
                test.setA(1);

            }
        }).start();
        new Thread(new Runnable() {
            @Override
            public void run() {

                System.out.println(test.getA());
            }
        }).start();
    }
}
