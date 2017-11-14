package com.company.project.configurer;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * Created by liuyan on 2017/7/26.
 */
public class Test {
    public static void main(String[] args) {
        String s = "{\"certNo\":\"429005199206020875\",\"certType\":\"IDENTITY_CARD\",\"mobile\":\"13266750144\",\"name\":\"刘岩\",\"sn\":\"1501039887263\"}";
        try {
            s = URLEncoder.encode(s, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println(s);
    }
}
