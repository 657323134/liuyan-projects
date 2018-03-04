package com.liuyan.proxy;

import java.io.Serializable;

/**
 * Created by liuyan on 2018/3/4.
 */
public class BookFacadeImpl implements BookFacade,Serializable{
    private static final long serialVersionUID = -8386912241781085417L;

    public void addBook() {
        System.out.println("增加图书方法。。。");

    }
}
