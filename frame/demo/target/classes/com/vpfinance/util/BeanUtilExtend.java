package com.vpfinance.util;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.beanutils.converters.SqlDateConverter;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by kuros on 2016/12/27.
 */
public class BeanUtilExtend {
    static {
        //ע��sql.date��ת������������BeanUtils.copyPropertiesʱ��ԴĿ���sql���͵�ֵ����Ϊ��
        ConvertUtils.register(new SqlDateConverter(), java.util.Date.class);
        //ConvertUtils.register(new SqlTimestampConverter(), java.sql.Timestamp.class);
        //ע��util.date��ת������������BeanUtils.copyPropertiesʱ��ԴĿ���util���͵�ֵ����Ϊ��
        ConvertUtils.register(new DateConverter(), java.util.Date.class);
    }

    public static void copyProperties(Object target, Object source) throws
            InvocationTargetException, IllegalAccessException {
        //֧�ֶ�����copy
        org.apache.commons.beanutils.BeanUtils.copyProperties(target, source);
    }
}

class DateConverter implements Converter {

    public Object convert(Class arg0, Object arg1) {
        if (arg1 instanceof Date) {
            return arg1;
        }
        String p = (String) arg1;
        if (p == null || p.trim().length() == 0) {
            return null;
        }
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            return df.parse(p.trim());
        } catch (Exception e) {
            try {
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                return df.parse(p.trim());
            } catch (ParseException ex) {
                return null;
            }
        }
    }
}

