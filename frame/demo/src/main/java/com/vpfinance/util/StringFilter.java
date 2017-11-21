package com.vpfinance.util;

import org.apache.commons.lang.*;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by vp on 2017/7/11.
 */
public class StringFilter {

    /**
     * 判断是否包含特殊字符
     * @param s
     * @return
     */
    public static boolean checkSpecialChar(String s) {
        String carRegix = "[`~!@#$^&*()=|{}':;',\\\\[\\\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]";
        Pattern p = Pattern.compile(carRegix);
        Matcher m = p.matcher(s);
        return m.find();
    }
}
