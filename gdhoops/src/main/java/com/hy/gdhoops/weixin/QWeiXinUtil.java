package com.hy.gdhoops.weixin;


import com.hy.gdhoops.util.HttpUtil;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2016/9/29.
 */
public class QWeiXinUtil {

    private static final Logger logger = Logger.getLogger(QWeiXinUtil.class);

    // 缓存添加的时间
    public static String cacheAddTime = null;
    // token,ticket缓存
    public static Map<String, AccessToken> TOKEN_TICKET_CACHE = new HashMap<String, AccessToken>();
    // token对应的key
    private static final String TOKEN = "token";
    // ticket对应的key
    private static final String TICKET = "ticket";


    /**
     * 获取微信配置参数
     *
     * @param request
     * @param url
     * @return
     */
    public static Map<String, String> getWXConfigMap(HttpServletRequest request, String url) {
        AccessToken token = getAccessToken();
        logger.debug(getTicket(token.getToken()).getTicket());
        logger.debug("url.toString():" + url.toString());
        Map map = getJsSignMap(getTicket(token.getToken()).getTicket(), url);
        return map;
    }

    /**
     * 获取access_token
     *
     * @return
     */
    public static AccessToken getAccessToken() {
        String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + ConfigUtil.APPID + "&secret=" + ConfigUtil.APP_SECRECT + "";
        AccessToken tockenTicketCache = getTokenTicket(TOKEN);
        AccessToken accessToken = null;

        if (tockenTicketCache != null && (System.currentTimeMillis() - tockenTicketCache.getAddTime() <= tockenTicketCache.getExpiresIn() * 1000)) {// 缓存存在并且没过期
            logger.info("==========缓存中token已获取时长为：" + (System.currentTimeMillis() - tockenTicketCache.getAddTime()) + "毫秒，可以重新使用");
            return tockenTicketCache;
        }
        logger.info("==========缓存中token不存在或已过期===============");
        String access_token_json = new HttpRequestSimple().getSendHttp(url);
        // 如果请求成功
        if (null != access_token_json && !"".equals(access_token_json)) {
            accessToken = new AccessToken();
            accessToken.setToken(JSONObject.fromObject(access_token_json).getString("access_token"));
            accessToken.setExpiresIn(JSONObject.fromObject(access_token_json).getInt("expires_in") / 2);
            logger.info("==========tocket缓存过期时间为:" + accessToken.getExpiresIn() * 1000 + "毫秒");
            accessToken.setAddTime(System.currentTimeMillis());
            updateAccessToken(TOKEN, accessToken);
        }
        return accessToken;
    }


    /**
     * 获取ticket
     *
     * @param token
     * @return
     */
    private static AccessToken getTicket(String token) {
        String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + token + "&type=jsapi";
        AccessToken tockenTicketCache = getTokenTicket(TICKET);
        AccessToken accessToken = null;
        if (tockenTicketCache != null && (System.currentTimeMillis() - tockenTicketCache.getAddTime() <= tockenTicketCache.getExpiresIn() * 1000)) {// 缓存中有ticket
            logger.info("==========缓存中ticket已获取时长为：" + (System.currentTimeMillis() - tockenTicketCache.getAddTime()) + "毫秒，可以重新使用");
            return tockenTicketCache;
        }
        logger.info("==========缓存中ticket不存在或已过期===============");
        String ticket_json = new HttpRequestSimple().getSendHttp(url);
        // 如果请求成功
        if (null != ticket_json) {
            accessToken = new AccessToken();
            accessToken.setTicket(JSONObject.fromObject(ticket_json).getString("ticket"));
            accessToken.setExpiresIn(JSONObject.fromObject(ticket_json).getInt("expires_in") / 2);// 正常过期时间是7200秒，此处设置3600秒读取一次
            logger.info("==========ticket缓存过期时间为:" + accessToken.getExpiresIn() * 1000 + "毫秒");
            accessToken.setAddTime(System.currentTimeMillis());
            updateAccessToken(TICKET, accessToken);
        }
        return accessToken;
    }


    /**
     * 获取jsapi相关参数map
     *
     * @param jsapi_ticket
     * @param url
     * @return
     */
    public static Map<String, String> getJsSignMap(String jsapi_ticket, String url) {
        Map<String, String> map = new HashMap<String, String>();

        String nonce_str = UUID.randomUUID().toString().substring(0, 15);
        String timestamp = Long.toString(System.currentTimeMillis() / 1000);
        //注意这里参数名必须全部小写，且必须有序
        String s = "jsapi_ticket=" + jsapi_ticket + "&noncestr=" + nonce_str + "&timestamp=" + timestamp + "&url=" + url;
        String signature = null;
        try {
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(s.getBytes("UTF-8"));
            signature = WXSign.byteToHex(crypt.digest());
        } catch (NoSuchAlgorithmException e) {
            logger.error("QWeiXinUtil getJsSignMap：获取微信公众号jsapi失败！" + e);
            ;
        } catch (UnsupportedEncodingException e) {
            logger.error("QWeiXinUtil getJsSignMap：获取微信公众号jsapi失败！" + e);
        }

        map.put("url", url);
        map.put("appid", ConfigUtil.APPID);
        map.put("jsapi_ticket", jsapi_ticket);
        map.put("nonceStr", nonce_str);
        map.put("timestamp", timestamp);
        map.put("signature", signature);

        return map;
    }


    /**
     * 从缓存中读取token或者ticket
     *
     * @return
     */
    private static AccessToken getTokenTicket(String key) {
        if (TOKEN_TICKET_CACHE != null && TOKEN_TICKET_CACHE.get(key) != null) {
            logger.info("==========从缓存中获取到了" + key + "成功===============");
            return TOKEN_TICKET_CACHE.get(key);
        }
        return null;
    }

    /**
     * 更新缓存中token或者ticket
     *
     * @return
     */
    private static void updateAccessToken(String key, AccessToken accessTocken) {
        if (TOKEN_TICKET_CACHE != null && TOKEN_TICKET_CACHE.get(key) != null) {
            TOKEN_TICKET_CACHE.remove(key);
            logger.info("==========从缓存中删除" + key + "成功===============");
        }
        TOKEN_TICKET_CACHE.put(key, accessTocken);
        cacheAddTime = String.valueOf(accessTocken.getAddTime());// 更新缓存修改的时间
        logger.info("==========更新缓存中" + key + "成功===============");
    }


    /**
     * 获取微信基本配置
     *
     * @param request
     */
    public static void getWeiXinConfig(HttpServletRequest request) {
        //微信配置
        String url = HttpUtil.getRequestURL(request);
        logger.info("payComfirm微信配置参数：" + url);
        Map<String, String> map = null;
        try {
            map = QWeiXinUtil.getWXConfigMap(request, url);
            request.setAttribute("appid", map.get("appid"));
            request.setAttribute("nonceStr", map.get("nonceStr"));
            request.setAttribute("timestamp", map.get("timestamp"));
            request.setAttribute("signature", map.get("signature"));
        } catch (Exception e) {
            if (map != null) {
                logger.debug("=====微信平台配置信息=====" + map.toString());
            } else {
                logger.debug("=====微信平台配置信息加载失败=====");
            }
        }
    }

    /**
     * 获取微信基本配置
     *
     * @param request
     */
    public static void getWeiXinConfig(HttpServletRequest request, Map<String, Object> data) {
        //微信配置
        String url = (String)data.get("pageUrl");
        logger.info("payComfirm微信配置参数：" + url);
        Map<String, String> map = null;
        try {
            map = QWeiXinUtil.getWXConfigMap(request, url);
//            shareGoodsResp.setAppid(map.get("appid"));
//            shareGoodsResp.setNonceStr(map.get("nonceStr"));
//            shareGoodsResp.setTimestamp(map.get("timestamp"));
//            shareGoodsResp.setSignatute(map.get("signature"));
            data.put("appid", map.get("appid"));
            data.put("nonceStr", map.get("nonceStr"));
            data.put("timestamp", map.get("timestamp"));
            data.put("signature", map.get("signature"));

        } catch (Exception e) {
            if (map != null) {
                logger.debug("=====微信平台配置信息=====" + map.toString());
            } else {
                logger.debug("=====微信平台配置信息加载失败=====");
            }
        }
    }


}
