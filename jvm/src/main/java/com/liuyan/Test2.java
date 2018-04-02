package com.liuyan;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by liuyan on 2018/3/29.
 */
public class Test2 {
    public static void main(String[] args) {
        GenericMemoryCell<Integer> list = new GenericMemoryCell<>();
        list.write(1);
        Object object = list;
//        GenericMemoryCell<String> list2 = (GenericMemoryCell<String>)list;
    }
}
class GenericMemoryCell<T> {
    public void write(T t) {
        System.out.println("write:" + t);
    }

}
