package com.liuyan.jvm;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Created by liuyan on 2018/3/4.
 */
public class ReflectCase {
    static class Proxy {
        public void run() {
            System.out.println("run");
        }
    }
    public static void main(String[] args) throws Exception {
        Proxy proxy = new Proxy();
        Class<?> aClass = Class.forName("com.liuyan.ReflectCase$Proxy");
        Method method = aClass.getDeclaredMethod("run");
        method.invoke(aClass.newInstance());
    }
}
