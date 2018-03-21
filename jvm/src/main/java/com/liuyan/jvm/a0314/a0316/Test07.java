package com.liuyan.jvm.a0314.a0316;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 15:11 2018/3/16
 */
public class Test07 {
    public static void main(String[] args) {
        Test07 tst = new Test07();
        try {
            tst.test();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("3333");
        }

    }
    public void test () {
        System.out.println("`23");
        throw new Error();
    }
}
