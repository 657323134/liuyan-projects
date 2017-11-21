package com.vpfinance.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Created by Administrator on 2017/7/4.
 */

public class BeanHelper implements ApplicationContextAware {

    private static ApplicationContext applicationContext=null;

   /* public static Object getBean(String beanName) {
        return applicationContext.getBean(beanName);
    }*/


   /* public static <T> T getBean(String beanName, Class<T> clazs) {
        System.out.println("全局变量是否为空:"+applicationContext);
        return clazs.cast(getBean(beanName));
    }*/
    public void setApplicationContext(ApplicationContext applicationContext)
            throws BeansException {
        BeanHelper.applicationContext = applicationContext;
    }
    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }
    public static Object getBean(String name) throws BeansException {
        return applicationContext.getBean(name);
    }

    public static Object getBean(String name, Class requiredType) throws BeansException {
        return applicationContext.getBean(name, requiredType);
    }

    public static boolean containsBean(String name) {
        return applicationContext.containsBean(name);
    }


    public static boolean isSingleton(String name) throws NoSuchBeanDefinitionException {
        return applicationContext.isSingleton(name);
    }


    public static Class getType(String name) throws NoSuchBeanDefinitionException {
        return applicationContext.getType(name);
    }


    public static String[] getAliases(String name) throws NoSuchBeanDefinitionException {
        return applicationContext.getAliases(name);
    }
}
