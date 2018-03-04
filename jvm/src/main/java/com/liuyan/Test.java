package com.liuyan;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 15:58 2018/2/28
 */
public class Test {
    public static void main(String[] args) {
        {
            byte[] placeholder = new byte[64*1024*1024];
        }
        int a=0;
        System.gc();
    }
}
