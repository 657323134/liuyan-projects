package com.liuyan.thread;

import java.io.IOException;
import java.io.PipedReader;
import java.io.PipedWriter;

/**
 * 管道输入输出流
 * Created by liuyan on 2017/9/22.
 */
public class Piped {
    public static void main(String[] args) {
        PipedWriter out = new PipedWriter();
        PipedReader in = new PipedReader();
        try {
            out.connect(in);
            Print print = new Print(in);
            Thread thread = new Thread(print,"print");
            thread.start();
            int receive = 0;
            try {
                while ((receive = System.in.read()) != -1) {
                    out.write(receive);
                }
            } finally {
                out.close();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    static class Print implements Runnable {
        PipedReader reader = null;

        public Print(PipedReader reader) {
            this.reader = reader;
        }

        @Override
        public void run() {
            int receive = 0;
            try {
                while ((receive=reader.read())!=-1){
                    System.out.print((char)receive);

                }
            } catch (IOException e) {
                e.printStackTrace();
            } {

            }
        }
    }
}

