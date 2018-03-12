package com.liuyan;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 15:58 2018/2/28
 */
public class Test {
    public static void main(String[] args) {
       double a = 334.00000000002d;
       double b = new BigDecimal(String.valueOf(a)).setScale(2, RoundingMode.HALF_UP).doubleValue();
        System.out.println(b);
    }
}
