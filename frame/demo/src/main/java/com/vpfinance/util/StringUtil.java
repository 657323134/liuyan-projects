package com.vpfinance.util;

import java.util.*;

public final class StringUtil {
    /**
     * 将指定字符串隐藏为星号
     *
     * @param src   字符串
     * @param start 开始隐藏位置
     * @param len   隐藏的多少位字符串
     * @return
     */
    public static String replaceStar(String src, int start, int len) {

        StringBuffer buf = new StringBuffer();
        if (src == null) {
            return buf.toString();
        }
        int strLen = src.length();
        if (strLen <= start) {
            buf.append(src);
        } else {
            buf.append(src.substring(0, start - 1));
            if (strLen < start + len) {
                len = strLen - start + 1;
            }
            for (int i = 0; i < len; i++) {
                buf.append("*");
            }

            if (strLen >= start + len) {
                buf.append(src.substring(start + len - 1));
            }
        }
        return buf.toString();
    }

    public static boolean chackUserName(String uname) {
        List<String> notName = new ArrayList<String>();
        notName.add("51flm");
        notName.add("flm");
        notName.add("fuck");
        notName.add("fulema");
        notName.add("hengsheng");
        return notName.contains(uname);
    }

    /**
     * 转换智付通宝返回的Stirng为map
     *
     * @param rest
     * @return
     */
    public static Map<String, String> spitStringtoMap(String rest) {
        String[] resuts = rest.split("&");
        Map<String, String> map = new TreeMap<>();
        for (String string : resuts) {
            String[] smlmap = string.split("=");
            map.put(smlmap[0], smlmap[1]);
        }
        return map;
    }

    /**
     * 智付划款返回，转换为map
     *
     * @param remark
     * @return
     */
    public static Map<String, String> spitRemarktoMap(String remark) {
        String[] resuts = remark.split("^");
        Map<String, String> map = new TreeMap<>();
        for (int i = 0; i < resuts.length; i++) {
            switch (i) {
                case 0:
                    map.put("bizType", resuts[i]);
                    break;
                case 1:
                    map.put("amount", resuts[i]);
                    break;
                case 2:
                    map.put("transTime", resuts[i]);
                    break;
                case 3:
                    map.put("status", resuts[i]);
                    break;

            }
        }
        return map;
    }

    /**
     * 智付划款返回，转换为List<map>
     *
     * @param remark
     * @return
     */
    public static List<Map<String, String>> spitRemarktoListMap(String remark) {
        boolean rest = remark.contains("|");
        List<Map<String, String>> remarks = new ArrayList<Map<String, String>>();
        Map<String, String> map = new TreeMap<>();
        if (rest) {
            String[] remarkRest = remark.split("|");
            for (String str1 : remarkRest) {
                map = spitRemarktoMap(str1);
            }
            remarks.add(map);
        } else {
            map = spitRemarktoMap(remark);
            remarks.add(map);
        }
        return remarks;
    }

    public static Integer getvalidcode() {
        Random random = new Random();
        int num = 100000 + random.nextInt(8999) + 1;
        return num;
    }
    public static String StringTrim(String code){
        return code.replace(" ","");
    }
    public static void main(String[] args) {
        System.out.println(replaceStar("测试啦", 2, 1));
        System.out.println(replaceStar("12345678", 8, 3));
        System.out.println(replaceStar("12345678", 9, 3));

        System.out.println(replaceStar("12345678", 3, 3));
        System.out.println(replaceStar("12345678", 3, 6));
        System.out.println(replaceStar("12345678", 3, 8));
    }
}
