package com.liuyan.thread.a0327;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 14:33 2018/3/27
 */
public class Test {
    private static Integer a = 1;
    public static void test01() {
        synchronized (a) {
            String name = Thread.currentThread().getName();
            System.out.println(name);
            try {
                Thread.sleep(5000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        }

    }

    public static synchronized Integer getA() {
        return a;
    }

    public static synchronized void setA(Integer a) {
        Test.a = a;
    }

    public static void main(String[] args) {

        Thread thread1 = new Thread(new Runnable() {
            @Override
            public void run() {
                Test.test01();
            }
        });
        Thread thread2 = new Thread(new Runnable() {
            @Override
            public void run() {
                Integer a = Test.getA();
                System.out.println("thread2修改a的值");
                Test.test01();
                Test.setA(4); // thread1锁住了对象a，等待获取锁
                System.out.println("thread2修改后值为：" + Test.getA());

            }
        });
        thread1.start(); // thread1 锁住了对象Integer a，并且需要1秒才能释放对象的锁
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        thread2.start();

    }
}
