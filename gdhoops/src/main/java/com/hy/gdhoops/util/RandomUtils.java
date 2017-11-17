package com.hy.gdhoops.util;

import java.io.IOException;
import java.util.Random;

/**
 * 随机码
 *
 * @author Administrator
 */
public class RandomUtils {
    public static String createRadom() {
        Random radmon = new Random();
        Integer num = radmon.nextInt(900000);
        num += 100000;
        return num.toString();
    }

    public static String createFourRadom() {
        Random radmon = new Random();
        Integer num = radmon.nextInt(9000);
        num += 1000;
        return num.toString();
    }

    public static void main(String[] args) throws IOException {
        System.out.println(createRadom());
    }


    /**
     * 随机数生成
     *
     * @param charCount
     * @return
     */


    public static String getRandNum(int charCount) {
        String charValue = "";
        for (int i = 0; i < charCount; i++) {
            char c = (char) (randomInt(0, 10) + '0');
            charValue += String.valueOf(c);
        }
        return charValue;
    }

    public static int randomInt(int from, int to) {
        Random r = new Random();
        return from + r.nextInt(to - from);
    }
}
