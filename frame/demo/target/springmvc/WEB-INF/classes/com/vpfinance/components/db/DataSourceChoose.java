package com.vpfinance.components.db;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * Created by vp on 2017/6/23.
 * 数据源切面
 */
@Aspect
@Component
public class DataSourceChoose {

    /**
     * 扫描所有dao层
     */
    @Pointcut("execution(* com.vpfinance.dao.*.*(..))")
    public void annotationPointCut() {};

    /**
     * dao层添加了@DataSourec注解的方法，执行前动态切换数据源
     * @param point
     */
    @Before("annotationPointCut()")
    public void before(JoinPoint point) {

        Object target = point.getTarget();
        String method = point.getSignature().getName();
        Class<?>[] classz = target.getClass().getInterfaces();
        MethodSignature methodSignature = (MethodSignature)point.getSignature();
        Class<?>[] parameterTypes = methodSignature.getMethod().getParameterTypes();
        try {
            Method m = classz[0].getMethod(method, parameterTypes);
            if (m!=null && m.isAnnotationPresent(DataSource.class)) {
                DataSource data = m.getAnnotation(DataSource.class);
                JdbcContextHolder.clearJdbcType();
                JdbcContextHolder.setJdbcType(data.value());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
