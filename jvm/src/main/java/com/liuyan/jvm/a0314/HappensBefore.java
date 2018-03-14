package com.liuyan.jvm.a0314;

import com.liuyan.User;

/**
 * @Author: ly
 * @Description: java中的happens-before原则
 * @Date: Created in 9:50 2018/3/14
 */
public class HappensBefore {
    public static void main(String[] args) throws InterruptedException {
        final User user = new User();
        user.setId(1);
        new Thread(new Runnable() {
            public void run() {
                user.setId(2);
            }
        }).start();

        new Thread(new Runnable() {
            public void run() {
                user.setId(3);
            }
        }).start();
        Thread.sleep(100);
        System.out.println(user.getId());
    }
}
