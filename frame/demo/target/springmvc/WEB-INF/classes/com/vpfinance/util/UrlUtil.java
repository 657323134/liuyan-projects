package com.vpfinance.util;

import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2017/4/6.
 */
public class UrlUtil {

    private static final Logger logger = Logger.getLogger(UrlUtil.class);

    //JAVA 获取完整URL 方法
    public static String getRequestURL(HttpServletRequest request) {
        if (request == null) {
            return "";
        }
        String url = request.getRequestURL().toString();

        if (request.getQueryString() != null && !"".equals(request.getQueryString()) && !"null".equals(request.getQueryString())) {
            url = url + "?" + request.getQueryString();
        }

        logger.info("链接完整地址？后的参数" + request.getQueryString());

        return url;
    }

}
