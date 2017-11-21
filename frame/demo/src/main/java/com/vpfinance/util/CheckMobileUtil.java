package com.vpfinance.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * ����Ƿ�Ϊ�ƶ����豸����
 *
 * @author :
 * @group : tgb8
 * @Version : 1.00
 * @Date : 2017-02-12 ����01:34:31
 */
public class CheckMobileUtil {

    // \b �ǵ��ʱ߽�(���ŵ�����(��ĸ�ַ� �� ����ĸ�ַ�) ֮����߼��ϵļ��),
    // �ַ����ڱ���ʱ�ᱻת��һ��,������ "\\b"
    // \B �ǵ����ڲ��߼����(���ŵ�������ĸ�ַ�֮����߼��ϵļ��)
    static String phoneReg = "\\b(ip(hone|od)|android|opera m(ob|in)i"
            + "|windows (phone|ce)|blackberry"
            + "|s(ymbian|eries60|amsung)|p(laybook|alm|rofile/midp"
            + "|laystation portable)|nokia|fennec|htc[-_]"
            + "|mobile|up.browser|[1-4][0-9]{2}x[1-4][0-9]{2})\\b";
    static String tableReg = "\\b(ipad|tablet|(Nexus 7)|up.browser"
            + "|[1-4][0-9]{2}x[1-4][0-9]{2})\\b";

    //�ƶ��豸����ƥ�䣺�ֻ��ˡ�ƽ��
    static Pattern phonePat = Pattern.compile(phoneReg, Pattern.CASE_INSENSITIVE);
    static Pattern tablePat = Pattern.compile(tableReg, Pattern.CASE_INSENSITIVE);

    /**
     * ����Ƿ����ƶ��豸����
     *
     * @param userAgent �������ʶ
     * @return true:�ƶ��豸���룬false:pc�˽���
     * @Title: check
     * @Date : 2014-7-7 ����01:29:07
     */
    public static boolean check(String userAgent) {
        if (null == userAgent) {
            userAgent = "";
        }
        // ƥ��
        Matcher matcherPhone = phonePat.matcher(userAgent);
        Matcher matcherTable = tablePat.matcher(userAgent);
        if (matcherPhone.find() || matcherTable.find()) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean getBrowserName(String agent) {
        if (agent.indexOf("msie 7") > 0) {
            return true;
        } else if (agent.indexOf("msie 8") > 0) {
            return true;
        } else if (agent.indexOf("msie 9") > 0) {
            return true;
        } else if (agent.indexOf("msie 10") > 0) {
            return true;
        } else if (agent.indexOf("msie") > 0) {
            return true;
        } else if (agent.indexOf("opera") > 0) {
            return false;
        } else if (agent.indexOf("opera") > 0) {
            return false;
        } else if (agent.indexOf("firefox") > 0) {
            return false;
        } else if (agent.indexOf("webkit") > 0) {
            return false;
        } else if (agent.indexOf("gecko") > 0 && agent.indexOf("rv:11") > 0) {
            return true;
        } else {
            return false;
        }
    }
}
