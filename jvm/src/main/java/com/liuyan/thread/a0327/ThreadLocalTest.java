package com.liuyan.thread.a0327;

/**
 * @Author: ly
 * @Description: ThreadLocal对象，每个线程仅需要实例化一次即可，虽然不同的线程执行同一段代码时，
 * 访问同一个threadLocal对象，但是每个线程只能看到私有的ThreadLocal实例，所以不同的线程在给ThreadLocal对象设置不同的
 * 值时，他们也不能看到彼此的修改。
 * @Date: Created in 16:26 2018/3/27
 */
public class ThreadLocalTest {
    private static ThreadLocal threadLocal = new ThreadLocal();
    private static ThreadLocal threadLocal2 = new ThreadLocal<String>(){
        @Override
        protected String initialValue() {
            return "this is initialValue";
        }
    };

    public static void main(String[] args) {
        Thread thread1 = new Thread(new Runnable() {
            @Override
            public void run() {
                threadLocal.set("123");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println(Thread.currentThread().getName() +":"+ threadLocal.get());
            }
        },"thread1");
        thread1.start();

        Thread thread2 = new Thread(new Runnable() {
            @Override
            public void run() {
                threadLocal.set("456");
                try {
                    Thread.sleep(2000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println(Thread.currentThread().getName() + ":" + threadLocal.get());

            }
        },"thread2");
        thread2.start();
    }
}
