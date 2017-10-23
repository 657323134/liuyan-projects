package com.liuyan.thread;

/**
 * Created by liuyan on 2017/9/18.
 */
public class ReorderingTest {
    int a = 0;
    boolean flag = false;

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

    /*编译器的重排序，1、2由于没有依赖可能会发生重排序，3/4也会发生重排序
    若线程1执write时发生重排序，先执行flag=true，这是线程2开始执行时，a的值还是0*/
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
