package com.liuyan.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * Created by liuyan on 2017/7/30.
 */
@Configuration
@ComponentScan(basePackages = {"com.liuyan"},
excludeFilters = {
        @Filter(type= FilterType.ANNOTATION,value= EnableWebMvc.class)
})
public class RootConfig {
}
