package com.vpfinance.util;

import javax.servlet.http.HttpServletRequest;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 链接工具
 *
 * @author dgg
 */
public class GenerateLinkUtils {

    /**
     * CHECK_CODE
     */
    private static final String CHECK_CODE = "checkCode";


    /**
     * 获取服务器的域名（包含端口号）
     *
     * @param request 请求
     * @return 域名
     */
    public static String getServiceHostnew(HttpServletRequest request) {

        String serverPort = "";

        if (request.getServerPort() != 80) {
            serverPort = ":" + request.getServerPort();
        }

        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName()
                + serverPort + path + "/";

        return basePath;
    }

    /**
     * <p>Title: bytes2Hex</p>
     * <p>Description:  加密法</p>
     *
     * @param byteArray 要加密的信息
     * @return 加密后的
     */
    private static String bytes2Hex(byte[] byteArray) {
        StringBuffer strBuf = new StringBuffer();
        for (int i = 0; i < byteArray.length; i++) {
            if (byteArray[i] >= 0 && byteArray[i] < 16) {
                strBuf.append("0");
            }
            strBuf.append(Integer.toHexString(byteArray[i] & 0xFF));
        }
        return strBuf.toString();
    }

    /**
     * <p>Title: md5</p>
     * <p>Description: MD5加密 </p>
     *
     * @param string 加密的字符串
     * @return 结果
     */
    public static String md5(String string) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("md5");
            md.update(string.getBytes());
            byte[] md5Bytes = md.digest();
            return bytes2Hex(md5Bytes);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return null;
    }

}
