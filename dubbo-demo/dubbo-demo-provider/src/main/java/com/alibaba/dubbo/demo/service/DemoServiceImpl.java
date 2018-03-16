package com.alibaba.dubbo.demo.service;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 15:39 2018/3/15
 */
public class DemoServiceImpl implements DemoService{
    @Override
    public String sayHello(String name) {

        return "Hello" + name;
    }
}
