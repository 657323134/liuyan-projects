package com.liuyan.proxy.jdk;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * jdk代理类
 * Created by liuyan on 2018/3/4.
 */
public class BookFacadeProxy implements InvocationHandler{
    private Object target;

    /**
     * 绑定委托对象并返回一个代理类
     * @param target
     * @return
     */
    public Object bind(Object target) {
        this.target = target;

        return Proxy.newProxyInstance(target.getClass().getClassLoader(),
                target.getClass().getInterfaces(), this);//要绑定接口(这是一个缺陷，cglib弥补了这一缺陷)
    }

    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Object result = null;
        System.out.println("事物开始");
        result = method.invoke(target,args);
        System.out.println("事物结束");
        return result;
    }

}
