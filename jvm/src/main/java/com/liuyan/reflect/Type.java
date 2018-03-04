package com.liuyan.reflect;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Created by liuyan on 2018/3/4.
 */
public class Type {
    public int pubIntField;
    public String pubStringField;
    private int prvintField;

    public Type() {
        System.out.println("default constructor");
    }

    public Type(int pubIntField, String pubStringField, int prvintField) {
        this.pubIntField = pubIntField;
        this.pubStringField = pubStringField;
        this.prvintField = prvintField;
        System.out.println("constructor with params");
    }

    public int getPubIntField() {
        return pubIntField;
    }

    public void setPubIntField(int pubIntField) {
        this.pubIntField = pubIntField;
    }

    public String getPubStringField() {
        return pubStringField;
    }

    public void setPubStringField(String pubStringField) {
        this.pubStringField = pubStringField;
    }

    public int getPrvintField() {
        return prvintField;
    }

    public void setPrvintField(int prvintField) {
        this.prvintField = prvintField;
    }


    private void Log(String msg) {
        System.out.println("Type"+ msg);
    }
}
class ExtendType extends Type {
    public int pubIntExtendField;
    public String pubStringExtendField;
    private int prvIntExtendField;

    public ExtendType() {
        Log("default constructor");
    }

    public ExtendType(int pubIntExtendField, String pubStringExtendField) {
        this.pubIntExtendField = pubIntExtendField;
        this.pubStringExtendField = pubStringExtendField;
        Log("contrucotr with params");
    }
    private void Log(String msg) {
        System.out.println("ExtendType"+ msg);
    }

    public int getPubIntExtendField() {
        return pubIntExtendField;
    }

    public void setPubIntExtendField(int pubIntExtendField) {
        this.pubIntExtendField = pubIntExtendField;
    }

    public String getPubStringExtendField() {
        return pubStringExtendField;
    }

    public void setPubStringExtendField(String pubStringExtendField) {
        this.pubStringExtendField = pubStringExtendField;
    }

    public int getPrvIntExtendField() {
        return prvIntExtendField;
    }

    public void setPrvIntExtendField(int prvIntExtendField) {
        this.prvIntExtendField = prvIntExtendField;
    }

    public static void main(String[] args) {
       /* Class<?> clazz = ExtendType.class;
        Field[] fields = clazz.getFields();
        for (Field field :
                fields) {
            System.out.println(field);
        }
        System.out.println("--");
        fields = clazz.getDeclaredFields();
        for (Field field :
                fields) {
            System.out.println(field);
        }*/

        Class<?> classType = ExtendType.class;
        Method[] methods = classType.getMethods();
        for (Method m : methods)
        {
            System.out.println(m);
        }

        System.out.println("--");

// 使用getDeclaredMethods获取函数
        methods = classType.getDeclaredMethods();
        for (Method m : methods)
        {
            System.out.println(m);
        }
    }
}
