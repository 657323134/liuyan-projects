package com.vpfinance.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 *
 * @author Administrator
 * @date 2015/11/27
 */
public class IPUtil {

    private static final Logger logger = LoggerFactory.getLogger(IPUtil.class);

    public static void main(String[] args) {
        InetAddress netAddress = getInetAddress();
        System.out.println("host ip:" + getHostIp(netAddress));
        System.out.println("host name:" + getHostName(netAddress));

    }

    public static InetAddress getInetAddress() {

        try {
            return InetAddress.getLocalHost();
        } catch (UnknownHostException e) {
            logger.error("unknown host!");
        }
        return null;
    }

    public static String getHostIp(InetAddress netAddress) {
        if (null == netAddress) {
            return null;
        }
        String ip = netAddress.getHostAddress(); //get the ip address
        return ip;
    }

    public static String getHostName(InetAddress netAddress) {
        if (null == netAddress) {
            return null;
        }
        String name = netAddress.getHostName(); //get the host address
        return name;
    }

    public static String getRemoteHost(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
    }


    /**
     * <p>
     * Title: getIp
     * </p>
     * <p>
     * Description: 获取ip
     * </p>
     *
     * @param request HttpServletRequest
     * @return ip地址
     */
    public static String getIp(HttpServletRequest request) {

        String unknow = "unknown";

        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || unknow.equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || unknow.equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || unknow.equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if (ip != null) {
            String[] ip1 = ip.split(",");
            if (ip1.length > 1) {
                return ip1[0];
            } else {
                return ip;
            }
        } else {
            return ip;
        }

    }
}
