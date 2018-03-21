package com.liuyan.jvm.a0314.a0316;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 14:20 2018/3/16
 */
public class Test01 {
    public static void main(String[] args) {
        Test01 test = new Test01();
        test.test();
    }
    public void test() {
        try {
            return;
        } finally {
            System.out.println("finally");

        }
    }
}
