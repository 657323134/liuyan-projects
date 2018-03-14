package com.liuyan.jvm.a0314;

import com.liuyan.User;

/**
 * @Author: ly
 * @Description: final关键字测试
 * 基本类型，是值不能被改变
 * 引用类型，是地址值不能被改变,对象中的属性可以改变
 * @Date: Created in 9:38 2018/3/14
 */
public class Test {
    public static final int i;

    public final int j;
    static {
        i=1; // final 修饰的变量进行初始化，且值不能改变
    }


    public Test(int j) {
        this.j = j;
    }

    public static void main(String[] args) {
        final User p = new User(1,"liuyan");
        System.out.println(p.getId() + ":" + p.getName());
        User p2 = new User(2,"lisi");
//        p = p2; // 引用类型是地址值不能改变，应用中的对象的值可以变
        p.setId(3);
        p.setName("wangwu");
        System.out.println(p.getId() + ":" + p.getName());
    }

}
