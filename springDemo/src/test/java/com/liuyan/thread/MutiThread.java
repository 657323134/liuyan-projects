package com.liuyan.thread;

import java.lang.management.ManagementFactory;
import java.lang.management.ThreadInfo;
import java.lang.management.ThreadMXBean;

/**
 * Created by liuyan on 2017/9/20.
 */
public class MutiThread {
    public static void main(String[] args) {
        ThreadMXBean threadMXBean = ManagementFactory.getThreadMXBean();
        ThreadInfo[] threadInfos = threadMXBean.dumpAllThreads(false, false);
        for (ThreadInfo threadInfo : threadInfos) {
            System.out.println(threadInfo.getThreadId() + ":" + threadInfo.getThreadName());
        }
        /**
         * [4] Signal Dispatcher // 分发处理发送给JVM信号的线程
         [3] Finalizer // 调用对象finalize方法的线程
         [2] Reference Handler // 清除Reference的线程
         [1] main // main线程，用户程序入口
         */
    }
}
