package com.liuyan.thread;

/**
 * Created by liuyan on 2017/9/21.
 */
public class SynchronizedTest {
    public static void main(String[] args) {
        synchronized (SynchronizedTest.class) {

        }
        m();

    }

    static synchronized void  m() {

    }
}
