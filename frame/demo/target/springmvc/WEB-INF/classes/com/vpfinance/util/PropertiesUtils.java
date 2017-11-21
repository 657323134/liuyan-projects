package com.vpfinance.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtils {

    private static final String LOCATION = "vpjr.properties";
    private static final String LOCATION_SYS = "sys.properties";
    private static final String LOACTION_WECHAT_TEMPLATEMSG = "wechat-templateMsg.properties";

    private static Properties properties = null;
    private static Properties sysProperties = null;
    private static Properties wechatTmpProperties = null;

    /**
     * 根据KEY获取参数
     *
     * @param key
     * @return
     */
    public static String getProperties(String key) {

        String result = null;
        InputStream input = null;
        try {
            if (properties == null) {
                synchronized (LOCATION) {
                    properties = new Properties();
                    input = PropertiesUtils.class.getClassLoader().getResourceAsStream(LOCATION);
                    properties.load(input);
                }
            }
            result = properties.getProperty(key);
        } catch (IOException e) {
            e.printStackTrace();
            result = "";
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    result = "";
                }
            }
        }
        return result;
    }


    public static String getSysProperties(String key) {

        String result = null;
        InputStream input = null;
        try {
            if (sysProperties == null) {
                synchronized (LOCATION_SYS) {
                    sysProperties = new Properties();
                    input = PropertiesUtils.class.getClassLoader().getResourceAsStream(LOCATION_SYS);
                    sysProperties.load(input);
                }
            }

            result = sysProperties.getProperty(key);
        } catch (IOException e) {
            e.printStackTrace();
            result = "";
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    result = "";
                }
            }
        }
        return result;
    }

    public static String getWeChatTmp(String key) {

        String result = null;
        InputStream input = null;
        try {
            if (wechatTmpProperties == null) {
                synchronized (LOACTION_WECHAT_TEMPLATEMSG) {
                    wechatTmpProperties = new Properties();
                    input = PropertiesUtils.class.getClassLoader().getResourceAsStream(LOACTION_WECHAT_TEMPLATEMSG);
                    wechatTmpProperties.load(input);
                }
            }

            result = wechatTmpProperties.getProperty(key);
        } catch (IOException e) {
            e.printStackTrace();
            result = "";
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    result = "";
                }
            }
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(getWeChatTmp("REMARK"));
    }

}
