package com.liuyan.jvm;

import java.util.List;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 10:51 2018/2/24
 */
public class FinalizeEscapeGC {
    public static FinalizeEscapeGC SAVE_HOOK = null;
    public void isAlive() {
        System.out.println("yes,i am still alive");
    }

    @Override
    protected void finalize() throws Throwable {
        super.finalize();
        System.out.println("finalize method executed!");
        this.isAlive();
        SAVE_HOOK = this;
    }

    public static void main(String[] args) throws InterruptedException {
        SAVE_HOOK = new FinalizeEscapeGC();
        SAVE_HOOK = null;
        System.gc();
        // 第一次触发finalize方法，指向了应用对象拯救成功
        Thread.sleep(500);

        // 判断对象是否被回收
        if (SAVE_HOOK != null) {
            SAVE_HOOK.isAlive();
        } else {
            System.out.println("no,i am dead");
        }

        // 对象的finalize方法只能被触发一次，对象拯救失败
        SAVE_HOOK = null;
        System.gc();
        Thread.sleep(500);
        // 判断对象是否被回收
        if (SAVE_HOOK != null) {
            SAVE_HOOK.isAlive();
        } else {
            System.out.println("no,i am dead");
        }
    }


    public int test(List<Integer> list) {
        return 1;
    }
}
