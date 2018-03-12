package com.liuyan.thread.a0312;

import javax.sound.midi.Soundbank;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 10:04 2018/3/12
 */
public class SynchronizedDemo {
    public void method () {
        synchronized(this) {
            System.out.println("method 1 start");
        }
    }

    public static void main(String[] args) {
        System.out.println("main");
    }
}
