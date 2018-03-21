package com.liuyan.jvm.a0314.a0316;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 14:22 2018/3/16
 */
public class Test03 {
    public Test03() {
        System.out.println("father");
    }

    public static void main(String[] args) {
        new Test04();
        new Test03();
    }
}
class Test04 extends Test03{

}
