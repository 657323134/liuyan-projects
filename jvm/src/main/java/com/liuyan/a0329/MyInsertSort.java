package com.liuyan.a0329;

import java.util.concurrent.ForkJoinPool;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 17:11 2018/3/29
 */
public class MyInsertSort {
    public static void main(String[] args) {
        int [] a = {5,7,3,5,9,34,67,34,12,23,11,5,3,4,8,7,6,0};
        System.out.println("排序前：");
        for (int s:a) {
            System.out.print(s + " ");
        }
        for (int i = 1; i < a.length; i++) {
            int temp = a[i];
            for (int j = i-1; j >=0 ; j--) {
                if (temp<a[j]) {
                    // 大于temp往后移动一位
                    a[j+1] = a[j];
                    a[j] = temp;

                } else {
                    break;
                }
            }
        }

        System.out.println("排序后：");
        for (int s:a) {
            System.out.print(s + " ");
        }



    }
}
