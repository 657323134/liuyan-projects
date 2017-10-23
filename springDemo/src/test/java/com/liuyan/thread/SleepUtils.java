package com.liuyan.thread;

import java.util.concurrent.TimeUnit;

/**
 * Created by liuyan on 2017/9/20.
 */
public class SleepUtils {
    public static final void second(long seconds) {
        try {
            TimeUnit.SECONDS.sleep(seconds);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
}
