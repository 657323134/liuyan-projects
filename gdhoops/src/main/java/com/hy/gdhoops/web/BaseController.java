package com.hy.gdhoops.web;



import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public abstract class BaseController {
    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected String start;
    protected String limit;
    protected HttpSession session;
    // 页面表单存放数据
    protected Map<String, String> paramMap = new HashMap<String, String>();
    private static Log log = LogFactory.getLog(BaseController.class);

    @ModelAttribute
    public void setReqAndResp(HttpServletRequest request,
                              HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.start = request.getParameter("curPage");
        this.limit = request.getParameter("pageSize");
        if (StringUtils.isBlank(start)) {
            start = "1";
        }
        if (StringUtils.isBlank(limit)) {
            limit = "12";
        }

//        getRequsetUri();
    }

    protected Map<String, String> getRequestMap() {
        Map<String, String> map = new HashMap<String, String>();
        Enumeration<String> enumeration = request.getParameterNames();
        while (enumeration.hasMoreElements()) {
            String name = enumeration.nextElement();
            map.put(name, request.getParameter(name));
        }
        return map;
    }

    protected String getRequsetUri() {
        String uri = request.getRequestURI();
//        if (GoUrlConfig.getGoUrlSet().contains(uri)) {
//
//            if (request.getQueryString() != null && !"".equals(request.getQueryString()) && !"null".equals(request.getQueryString())) {
//                uri = uri + "?" + request.getQueryString();
//            }
//            request.getSession().setAttribute("goUrl", uri);
//        }
        return uri;
    }
}