package com.liuyan.thread.a0327;

/**
 * @Author: ly
 * @Description: 线程间通信
 * @Date: Created in 14:52 2018/3/27
 */
public class ThreadCommunication {
    public static void main(String[] args) {
        final MySignal mySignal = new MySignal();
        Thread thread1 = new Thread(new Runnable() {
            @Override
            public void run() {
                mySignal.setFlag(true);
            }
        });
        thread1.start();
      while (thread1.isAlive()) {
          System.out.println("alive"); // 这里会一直打印，占用系统资源，所以用睡眠或者wait更加合理
      }

        Thread thread2 = new Thread(new Runnable() {
            @Override
            public void run() {
                boolean flag = mySignal.isFlag();
                System.out.println(flag);
            }
        });
        thread2.start();

    }
}
class MySignal {
    protected boolean flag = false;

    public synchronized boolean  isFlag() {
        return flag;
    }

    public synchronized void setFlag(boolean flag) {
        this.flag = flag;
    }
}
