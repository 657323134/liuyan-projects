package com.vpfinance.components.db;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * Created by vp on 2017/6/23.
 */
public class DynamicDataSource extends AbstractRoutingDataSource {

    @Override
    protected Object determineCurrentLookupKey() {
        // 获取当前数据源连接
        return JdbcContextHolder.getJdbcType();
    }
}
