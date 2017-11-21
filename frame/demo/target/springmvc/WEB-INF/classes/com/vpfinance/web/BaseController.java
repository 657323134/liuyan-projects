package com.vpfinance.web;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.gson.Gson;
import com.vpfinance.dto.InfoMsg;
import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public abstract class BaseController {
    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected HttpSession session;
    // 页面表单存放数据
    protected Map<String, String> paramMap = new HashMap<String, String>();
    protected PageBounds pageBounds;
    private static Log log = LogFactory.getLog(BaseController.class);

    private static String Access_Control_Allow_Origin = "*";

    @ModelAttribute
    public void setReqAndResp(HttpServletRequest request,
                              HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.session = request.getSession();
        String start = request.getParameter("curPage");
        String limit = request.getParameter("pageSize");
        if (StringUtils.isBlank(start)) {
            start = "1";
        }
        if (StringUtils.isBlank(limit)) {
            limit = "12";
        }
        if (StringUtils.isNotEmpty(start) && StringUtils.isNotEmpty(limit)) {
            pageBounds = new PageBounds(Integer.valueOf(start),
                    Integer.valueOf(limit));
        }

        getRequsetUri();
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

    public void toWrite(String str) {
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter pw = null;
            pw = response.getWriter();
            pw.write(str);
            pw.flush();
            pw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void writeJson(Object obj) {
        Gson gson = new Gson();
        String json = gson.toJson(obj);
        System.out.println("json==>" + json);
        try {
            //response.addHeader("Access-Control-Allow-Origin", SysConstans.Access_Control_Allow_Origin);
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/x-json;charset=UTF-8");
            PrintWriter pw = null;
            pw = response.getWriter();
            pw.write(json);
            pw.flush();
            pw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void write(String content) {
        try {
            response.addHeader("Access-Control-Allow-Origin", Access_Control_Allow_Origin);
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter pw = null;
            pw = response.getWriter();
            pw.write(content);
            pw.flush();
            pw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * JSON返回
     *
     * @param s
     */
    protected void responseStringStream(String s) {
        try {
            response.addHeader("Access-Control-Allow-Origin", Access_Control_Allow_Origin);
            response.setContentType("text/html;charset=utf-8");
            response.setContentLength((s.getBytes("utf-8")).length);
            response.getWriter().write(s);
            response.flushBuffer();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected Map<String,Object> responseResult(PageList<?> pageList) {
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", 0);
        map.put("count", pageList.getPaginator().getTotalCount());
        map.put("data", pageList);
        return map;
    }

    protected void responseMobileResult(InfoMsg info) {
        JSONArray ja = new JSONArray();
        JSONObject json = new JSONObject();
        try {
            if (info.getDatas() != null && !StringUtils.isEmpty(info.getDatas().toString())) {
                json.put("datas", info.getDatas());
            }
            json.put("status", info.getStatus());
            json.put("info", info.getInfo());
            json.put("value", info.getValue());
//			ja.add(json);
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        responseStringStream(String.valueOf(json));
    }

    /**
     * 微品会对接json返回
     *
     * @param info
     */
    protected void responsevpResult(InfoMsg info) {
        JSONObject json = new JSONObject();
        try {
            if (info.getDatas() != null && !StringUtils.isEmpty(info.getDatas().toString())) {
                json.put("data", info.getDatas());
            }
            json.put("ResultCode", info.getStatus());
            json.put("Message", info.getInfo());
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        responseStringStream(String.valueOf(json));
    }

    protected void export(HSSFWorkbook wb, String fileName) throws IOException {

        // 设置response的编码方式
        response.setContentType("application/x-msdownload");        // 写明要下载的文件的大小
        // response.setContentLength((int)fileName.length());		// 设置附加文件名
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName);        // 解决中文乱码
        // response.setHeader("Content-Disposition","attachment;filename="+new
        // String
        // (filename.getBytes("gbk"),"iso-8859-1"));
        OutputStream output = response.getOutputStream();
        PrintWriter out = response.getWriter();
        wb.write(output);

        output.flush();
        output.close();
    }

    public Map<String, String> getParamMap() {
        return paramMap;
    }

    public void setParamMap(Map<String, String> paramMap) {
        this.paramMap = paramMap;
    }

    public void resp(String status, String msg, JSONObject obj) {
        InfoMsg info = new InfoMsg();
        try {
            info.setInfo(msg);
            info.setStatus(status);
            info.setDatas(obj);
        } catch (Exception e) {
            log.error(e);
        } finally {
            responseMobileResult(info);
        }
    }

    protected String getRequsetUri() {
        String uri = request.getRequestURI();
        //if (GoUrlConfig.getGoUrlSet().contains(uri)) {

            if (request.getQueryString() != null && !"".equals(request.getQueryString()) && !"null".equals(request.getQueryString())) {
                uri = uri + "?" + request.getQueryString();
            }
            request.getSession().setAttribute("goUrl", uri);
        //}
        return uri;
    }

}