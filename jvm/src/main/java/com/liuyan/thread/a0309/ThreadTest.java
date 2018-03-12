package com.liuyan.thread.a0309;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 14:53 2018/3/9
 */
public class ThreadTest {
    public static void main(String[] args) {
        final String str="abc";
        ExecutorService executorService= Executors.newFixedThreadPool(1);
        executorService.execute(new Runnable() {
            public void run() {
                try {
                    Thread.sleep(500);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("1"+str);
            }
        });executorService.execute(new Runnable() {
            public void run() {
                System.out.println("2"+str);
            }
        });executorService.execute(new Runnable() {
            public void run() {
                System.out.println("3"+str);
            }
        });
    }
}
