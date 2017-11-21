package com.vpfinance.components.db;

import com.vpfinance.components.db.DataSourceType;

/**
 * Created by vp on 2017/6/23.
 */
public class JdbcContextHolder {
    private static final ThreadLocal<DataSourceType> contextHolder = new ThreadLocal<DataSourceType>();

    public static void setJdbcType(DataSourceType type) {
        contextHolder.set(type);
    }

    public static DataSourceType getJdbcType() {
        return (DataSourceType) contextHolder.get();
    }

    public static void clearJdbcType() {
        contextHolder.remove();
    }
}
