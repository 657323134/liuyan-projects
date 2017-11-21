package com.vpfinance.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 读取配置文件
 *
 * @author ldd
 */
public class PropertiesUtil {

    /**
     * 读取
     *
     * @param name name
     * @return Properties
     */
    public static Properties getReadAbleProperties(String name) {
        InputStream ins = null;

        // 生成properties对象
        Properties p = new Properties();

        try {
            ins = PropertiesUtil.class.getResourceAsStream(name);
            p.load(ins);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ins != null) {
                    ins.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return p;

    }

}
