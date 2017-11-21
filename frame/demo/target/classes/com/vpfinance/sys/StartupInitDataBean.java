package com.vpfinance.sys;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
@Component
public class StartupInitDataBean implements InitializingBean, ServletContextAware {
    public static Log log = LogFactory.getLog(StartupInitDataBean.class);


    @Override
    public void setServletContext(ServletContext servletContext) {

        log.info("---------项目启动初始化数据------------");
        log.info("项目编码格式为：" + System.getProperty("file.encoding"));
        SpringContext.setSpringContext(WebApplicationContextUtils.getWebApplicationContext(servletContext));

    }

    @Override
    public void afterPropertiesSet() throws Exception {

        log.info("---------afterPropertiesSet 项目启动初始化数据------------");
    }

}
