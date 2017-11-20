package com.hy.gdhoops.security;

import com.hy.gdhoops.constans.SysConstans;
import org.junit.Test;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5工具类
 *
 * @author Hai
 */
public final class MD5 {

    /**
     * 将数据加密MD5值(默认编码格式为UTF-8)
     *
     * @param content 需要MD5的值
     * @return
     */
    public final static String encrypt(String content) {
        return encrypt(content + SysConstans.MD5_KEY, "UTF-8");
    }

    /**
     * 将数据加密MD5值
     *
     * @param content  需要MD5的值
     * @param encoding 内容的编码格式
     * @return 返回MD5值
     */
    public final static String encrypt(String content, String encoding) {
        String md5 = null;
        if (content == null) {
            content = "";
        }
        if (encoding == null || "".equals(encoding)) {
            encoding = "UTF-8";
        }
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] bytes = content.getBytes(encoding);
            md.update(bytes);
            byte md5Bytes[] = md.digest();
            md5 = HexUtil.bytesToHexString(md5Bytes);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return md5;
    }


    @Test
    public void test() {
        //96e79218965eb72c92a549dd5a330112
        System.out.println("MD5==>" + MD5.encrypt("YK31910607", "UTF-8"));
        System.out.println("MD5==>" + MD5.encrypt("123456" + "1111", "GBK"));
        BigDecimal bd1 = new BigDecimal(String.valueOf(15));
        BigDecimal bd2 = new BigDecimal(String.valueOf(100));
        System.out.println(bd1.divide(bd2, 4, 4).doubleValue());
    }
}
