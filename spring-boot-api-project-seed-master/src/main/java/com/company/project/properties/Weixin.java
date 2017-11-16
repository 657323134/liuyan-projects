package com.company.project.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @Author: ly
 * @Description: 微信配置文件
 * @Date: Created in 16:45 2017/11/16
 */
@Component
@ConfigurationProperties(prefix = "weixin")
public class Weixin {
    private String appid;
    private String app_secrect;
    private String mch_id;
    private String sign_type;
    private String notify_url;
    private String key;
    private String protocol;
    private String host;

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getApp_secrect() {
        return app_secrect;
    }

    public void setApp_secrect(String app_secrect) {
        this.app_secrect = app_secrect;
    }

    public String getMch_id() {
        return mch_id;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
    }

    public String getSign_type() {
        return sign_type;
    }

    public void setSign_type(String sign_type) {
        this.sign_type = sign_type;
    }

    public String getNotify_url() {
        return notify_url;
    }

    public void setNotify_url(String notify_url) {
        this.notify_url = notify_url;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getProtocol() {
        return protocol;
    }

    public void setProtocol(String protocol) {
        this.protocol = protocol;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }
}
