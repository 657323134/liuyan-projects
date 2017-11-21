package com.vpfinance.util;

import java.math.BigDecimal;

/**
 * Created by xuhua on 2017/4/15.
 */
public class ArithmeticUtil {


    /**
     *�O�þ��ȵļӷ�
     * @param d1
     * @param d2
     * @param scale
     * @param roundMode
     * @return
     */
    public  static double add(double d1,double d2,int scale,int roundMode){
        BigDecimal bd1 = new BigDecimal(String.valueOf(d1));
        BigDecimal bd2 = new BigDecimal(String.valueOf(d2));
        return  bd1.add(bd2).setScale(scale,roundMode).doubleValue();
    }

    /**
     *�O�þ��ȵļ���
     * @param d1
     * @param d2
     * @param scale
     * @param roundMode
     * @return
     */
    public  static double subtract(double d1,double d2,int scale,int roundMode){
        BigDecimal bd1 = new BigDecimal(String.valueOf(d1));
        BigDecimal bd2 = new BigDecimal(String.valueOf(d2));
        return  bd1.subtract(bd2).setScale(scale,roundMode).doubleValue();
    }


    /**
     *�O�þ��ȵĳ˷�
     * @param d1
     * @param d2
     * @param scale
     * @param roundMode
     * @return
     */
    public static double multiply(double d1,double d2,int scale,int roundMode){
        BigDecimal bd1 = new BigDecimal(String.valueOf(d1));
        BigDecimal bd2 = new BigDecimal(String.valueOf(d2));
        return  bd1.multiply(bd2).setScale(scale,roundMode).doubleValue();
    }
    public static double multiply(double d1,double d2,int scale){
        BigDecimal bd1 = new BigDecimal(String.valueOf(d1));
        BigDecimal bd2 = new BigDecimal(String.valueOf(d2));
        return  bd1.multiply(bd2).setScale(scale).doubleValue();
    }

    /**
     *�O�þ��ȵĳ�
     * @param d1
     * @param d2
     * @param scale
     * @param roundMode
     * @return
     */
    public static double divide(double d1,double d2,int scale,int roundMode){/*参数依次是：d1(代理商服务费比例)，d2()*/
        BigDecimal bd1 = new BigDecimal(String.valueOf(d1));
        BigDecimal bd2 = new BigDecimal(String.valueOf(d2));
        return  bd1.divide(bd2, scale, roundMode).doubleValue();
    }



    public static void main(String[] args){
            double d1 = 222.34556d;
            double d2 = 231.43331d;
            int scale = 4;
            int roundMode = BigDecimal.ROUND_DOWN;
        System.out.println(add(d1,d2,scale,roundMode));
        System.out.println(subtract(d1, d2, scale, roundMode));
        System.out.println(multiply(d1, d2, scale, roundMode));
        System.out.println(divide(d1,d2,scale,roundMode));
    }

}
