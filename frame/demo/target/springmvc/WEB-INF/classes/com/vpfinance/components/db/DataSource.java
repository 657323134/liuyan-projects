package com.vpfinance.components.db;

import com.vpfinance.components.db.DataSourceType;

import java.lang.annotation.*;

/**
 * Created by vp on 2017/6/23.
 * 数据源注解
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
public @interface DataSource {

    DataSourceType value();

}
