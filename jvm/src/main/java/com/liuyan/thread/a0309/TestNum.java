package com.liuyan.thread.a0309;

/**
 * @Author: ly
 * @Description: ThreadLocal 线程本地变量，为每个线程
 * @Date: Created in 15:03 2018/3/9
 */
public class TestNum {
    private static ThreadLocal<Integer> seqNum = new ThreadLocal<Integer>(){
        @Override
        protected Integer initialValue() {
            return 0;
        }
    };
    public int getNextNum() {
        seqNum.set(seqNum.get() +1);
        return seqNum.get();
    }

    public static void main(String[] args) {
        TestNum tn = new TestNum();
        new TestClient(tn).start();
        new TestClient(tn).start();
        new TestClient(tn).start();

    }

    private static class TestClient extends Thread {
        private TestNum sn;

        public TestClient(TestNum sn) {
            this.sn = sn;
        }

        @Override
        public void run() {
            for (int i = 0; i < 3; i++) {
                System.out.println("thread[" + Thread.currentThread().getName() + "]-->sn["+sn.getNextNum() + "]");
            }
            super.run();
        }
    }
}
