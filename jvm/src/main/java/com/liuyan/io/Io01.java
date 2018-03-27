package com.liuyan.io;

import java.io.*;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 9:31 2018/3/26
 */
public class Io01 {
    public static void main(String[] args) {
        try(PipedOutputStream output= new PipedOutputStream();
            PipedInputStream input = new PipedInputStream(output)) {
            Thread thread1 = new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        output.write("hello world!".getBytes());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            });

            Thread thread2 = new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        int data = input.read();
                        while (data !=-1){
                            System.out.println((char)data);
                            data = input.read();
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            });
            thread1.start();
            thread2.start();
            Thread.sleep(2000);
            System.out.println("over");
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
