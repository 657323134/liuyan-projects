package com.liuyan.thread;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 16:22 2018/3/8
 */
public class Notifier  implements Runnable{
    private Message msg;

    public Notifier(Message msg) {
        this.msg = msg;
    }

    public Message getMsg() {
        return msg;
    }

    public void setMsg(Message msg) {
        this.msg = msg;
    }

    public void run() {
        String name = Thread.currentThread().getName();
        System.out.println(name + "started");
        try {
            Thread.sleep(1000);
            synchronized (msg) {
                msg.setMsg(name + "notifier work done");
                msg.notify();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
}
