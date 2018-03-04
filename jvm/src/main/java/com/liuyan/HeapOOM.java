package com.liuyan;

/**
 * @Author: ly
 * @Description: -Xms20m-Xmx20m-XX:+HeapDumpOnOutOfMemoryError
 * @Date: Created in 12:08 2018/2/23
 */
public class HeapOOM {
    private int stackLength=1;
    public void stackLeak(){
        stackLength++;
        stackLeak();
    }


    public static void main(String[] args) {
        HeapOOM oom = new HeapOOM();
        try {
            oom.stackLeak();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(oom.stackLength);
        }

    }
}
