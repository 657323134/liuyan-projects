package com.company.project.weixin;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * Created by Administrator on 2016/12/26.
 */
@Service
public class WeiXinService {
    public static Log logger = LogFactory.getLog(WeiXinService.class);

    /**
     * openid是否存在
     *
     * @param request
     * @return
     */

    public boolean isOpenIdExist(HttpServletRequest request) {
        String openid = (String) request.getSession().getAttribute("openid");
        if (openid != null && !"".equals(openid)) {
            return true;
        } else {
            String code = request.getParameter("code");
            if (code != null) {
                openid = PayCommonUtil.getOpenId(code);//code换openid
                request.getSession().setAttribute("openid", openid);//OPENID 存入session
                logger.info("获取用户openid= " + openid);
                return true;
            } else {
                return false;
            }
        }
    }

    public Map<String,String> getRequestParams(HttpServletRequest request) {
        Map map = new HashMap();
        Enumeration paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();

            String[] paramValues = request.getParameterValues(paramName);
            if (paramValues.length == 1) {
                String paramValue = paramValues[0];
                if (paramValue.length() != 0) {
                    map.put(paramName, paramValue);
                }
            }
        }

        Set<Map.Entry<String, String>> set = map.entrySet();
        System.out.println("------------------------------");
        for (Map.Entry entry : set) {
            System.out.println(entry.getKey() + ":" + entry.getValue());
        }
        System.out.println("------------------------------");

        return map;
    }





    /**
     * 获取授权链接
     *
     * @param request
     * @return
     */
    public String getAouthLink(HttpServletRequest request) {
        //是否根据微信openid自动登录
        try {
            String uri = request.getRequestURI().replace("/", "%2F");
            logger.info("调用微信授权跳转uri= " + uri);
            Map<String,String> map = getRequestParams(request);
            return getOauthLink(request, uri + "%2F",map);//授权
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getQrConnectLink(HttpServletRequest request) {
        //是否根据微信openid自动登录
        try {
            String uri = request.getRequestURI().replace("/", "%2F");
            logger.info("调用微信扫码登录" + uri);
            Map<String,String> map = getRequestParams(request);
            return getQRLink(request, uri + "%2F",map);//授权
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 获取授权链接，以便重定向授权
     * address  /h5/wxbind/isbind/    :  %3A  /  %2F
     *
     * @return
     */
    public static String getOauthLink(HttpServletRequest request, String address, Map params) {


        Set<Map.Entry<String, String>> set = params.entrySet();
        String param = "";
        for (Map.Entry entry : set) {
            param += "&"+entry.getKey() + "=" + entry.getValue();
        }
        logger.info("param--> "+param);

        logger.info("redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + ConfigUtil.APPID + "&redirect_uri=" + ConfigUtil.PROTOCOL + "%3A%2F%2F" + ConfigUtil.HOST + address + "&response_type=code&scope=snsapi_base&state=park"+param+"#wechat_redirect");


        return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + ConfigUtil.APPID + "&redirect_uri=" + ConfigUtil.PROTOCOL + "%3A%2F%2F" + ConfigUtil.HOST + address + "&response_type=code&scope=snsapi_base&state=park"+param+"#wechat_redirect";

    }

    public static String getQRLink(HttpServletRequest request, String address, Map params) {


        Set<Map.Entry<String, String>> set = params.entrySet();
        String param = "";
        for (Map.Entry entry : set) {
            param += "&"+entry.getKey() + "=" + entry.getValue();
        }
        logger.info("param--> "+param);

        logger.info("redirect:https://open.weixin.qq.com/connect/qrconnect?appid=" + ConfigUtil.APPID + "&redirect_uri=" + ConfigUtil.PROTOCOL + "%3A%2F%2F" + ConfigUtil.HOST + address + "&response_type=code&scope=snsapi_login&state=park"+param+"#wechat_redirect");

        // https://open.weixin.qq.com/connect/qrconnect?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect
        return "redirect:https://open.weixin.qq.com/connect/qrconnect?appid=" + ConfigUtil.APPID + "&redirect_uri=" + ConfigUtil.PROTOCOL + "%3A%2F%2F" + ConfigUtil.HOST + address + "&response_type=code&scope=snsapi_login&state=park"+param+"#wechat_redirect";

    }


    /**
     * 判断是否微信浏览器打开网页
     *
     * @param request
     * @return
     */
    public static boolean isWeiXinUserAgent(HttpServletRequest request) {
        String ua = request.getHeader("user-agent").toLowerCase();
        if (ua.indexOf("micromessenger") > 0) {// 是微信浏览器
            return true;
        }
        return false;
    }


    /**
     * 字符串替换
     *
     * @param source
     * @return
     */
    public static String replaceURLString(String source) {
        return source.replace(":", "%3A").replace("/", "%2F");
    }


    public static void main(String[] args) {

        System.out.println(replaceURLString("http://new.vpfinance.cn/index"));

    }

}
