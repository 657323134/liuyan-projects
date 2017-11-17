package com.hy.gdhoops.util; /**
 *
 */

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 时间工具类
 *
 * @author Administrator
 */
public class DateUtil {

    public final static DateFormat YYYY_MM_DD_MM_HH_SS = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public final static DateFormat YYYY_MM_DD = new SimpleDateFormat("yyyy-MM-dd");

    public final static DateFormat YYYYMMDDHHMMSSSSS = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    public final static DateFormat YYYYMMDDHHMMSS = new SimpleDateFormat("yyyyMMddHHmmss");
    public final static DateFormat YYMMDDHHMMSS = new SimpleDateFormat("yyMMddHHmmss");
    public final static DateFormat HHMMSS = new SimpleDateFormat("HHmmss");

    public final static DateFormat YMD = new SimpleDateFormat("yyyy年MM月dd日");
    public final static DateFormat YMDHM = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");


    public static String dateToStringByFormat(DateFormat dateFormat, Date date) {
        return dateFormat.format(date);
    }

    /**
     * 时间转换为yyyy-MM-dd HH:mm:ss格式的字符串
     *
     * @param date
     * @return
     */
    public static String dateToString(Date date) {
        return YYYY_MM_DD_MM_HH_SS.format(date);
    }


    /**
     * 时间转换为 yyyy年MM月dd日 格式的字符串
     *
     * @param date
     * @return
     */
    public static String dateToYMD(Date date) {
        if (date == null) {
            return "";
        }
        return YMD.format(date);
    }

    /**
     * 时间转换为 yyyy年MM月dd日 HH:mm 格式的字符串
     *
     * @param date
     * @return
     */
    public static String dateToYMDHM(Date date) {
        if (date == null) {
            return "";
        }
        return YMDHM.format(date);
    }

    /**
     * 字符串转换为时间
     *
     * @param dateString 字符串格式yyyy-MM-dd HH:mm:ss
     * @return
     */
    public static Date strToDate(String dateString) {
        Date date = null;
        try {
            date = YYYY_MM_DD_MM_HH_SS.parse(dateString);
        } catch (ParseException e) {
            date = new Date();
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 字符串转换为时间
     *
     * @param dateString 字符串格式yyyy-MM-dd
     * @return
     */
    public static Date strYMDToDate(String dateString) {
        Date date = null;
        try {
            date = YYYY_MM_DD.parse(dateString);
        } catch (ParseException e) {
            date = new Date();
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 计算两个时间之间相差的天数
     *
     * @param startDate
     * @param endDate
     * @return
     */
    public static long diffDays(Date startDate, Date endDate) {
        long days = 0;
        long start = startDate.getTime();
        long end = endDate.getTime();
        //一天的毫秒数1000 * 60 * 60 * 24=86400000
        days = (end - start) / 86400000;
        return days;
    }

    /**
     * 日期加上月数的时间
     *
     * @param date
     * @param month
     * @return
     */
    public static Date dateAddMonth(Date date, int month) {
        return add(date, Calendar.MONTH, month);
    }


    /**
     * 日期加上天数的时间
     *
     * @param date
     * @param month
     * @return
     */
    public static Date dateAddDay(Date date, int day) {

        return add(date, Calendar.DAY_OF_YEAR, day);
    }


    /**
     * 日期减去天数的时间
     *
     * @param date2
     * @param day
     * @return
     * @throws ParseException
     */
    public static Date datejqDay(Date date2, int day) {
        SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd");

        Calendar date = Calendar.getInstance();
        date.setTime(date2);
        date.set(Calendar.DATE, date.get(Calendar.DATE) - day);
        Date endDate = null;
        try {
            endDate = dft.parse(dft.format(date.getTime()));

        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return endDate;
    }

    /**
     * 日期加上年数的时间
     *
     * @param date
     * @param year
     * @return
     */
    public static Date dateAddYear(Date date, int year) {
        return add(date, Calendar.YEAR, year);
    }

    /**
     * 日期加上分的时间
     *
     * @param date
     * @param year
     * @return
     */
    public static Date dateAddMinute(Date date, int minute) {
        return add(date, Calendar.MINUTE, minute);
    }

    /**
     * 计算剩余时间 (多少天多少时多少分)
     *
     * @param startDateStr
     * @param endDateStr
     * @return
     */
    public static String remainDateToString(Date startDate, Date endDate) {
        StringBuilder result = new StringBuilder();
        long times = endDate.getTime() - startDate.getTime();
        if (times < -1) {
            result.append("过期");
        } else {
            long temp = 1000 * 60 * 60 * 24;
            //天数
            long d = times / temp;

            //小时数
            times %= temp;
            temp /= 24;
            long m = times / temp;
            //分钟数
            times %= temp;
            temp /= 60;
            long s = times / temp;

            result.append(d);
            result.append("天");
            result.append(m);
            result.append("小时");
            result.append(s);
            result.append("分");
        }
        return result.toString();
    }

    private static Date add(Date date, int type, int value) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(type, value);
        return calendar.getTime();
    }

    /**
     * 得到当前时间是星期几
     *
     * @param args
     * @return
     */
    public static int getday() {
        Calendar c = Calendar.getInstance();

        java.text.Format f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E");

        return c.get(Calendar.DAY_OF_WEEK);
    }

    /**
     * 比较时间
     *
     * @param d1：时间1
     * @param d2：时间2
     * @return 1：相等；2：d1小于d2；3：d1大于d2
     * @author xty
     */
    public static int compareDate(Date d1, Date d2) {
        int flag = 0;
        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        try {
            c1.setTime(d1);
            c2.setTime(d2);
            int result = c1.compareTo(c2);
            if (result == 0) {
                flag = 1;
            } else if (result < 0) {
                flag = 2;
            } else {
                flag = 3;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return flag;
    }

    /**
     * 比较时间
     *
     * @param d1：时间1
     * @param d2：时间2
     * @return 1：相等；2：d1小于d2；3：d1大于d2
     * @author xty
     */
    public static int compareDate(String d1, String d2) {
        int flag = 0;
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        try {
            c1.setTime(df.parse(d1));
            c2.setTime(df.parse(d2));
        } catch (ParseException ex) {
            System.err.println("格式不正确");
        }
        int result = c1.compareTo(c2);
        if (result == 0) {
            flag = 1;
        } else if (result < 0) {
            flag = 2;
        } else {
            flag = 3;
        }
        return flag;
    }

    public static String currentMonthFirstDay() {
        Calendar calendar = Calendar.getInstance();
//		calendar.add(Calendar.MONTH, -1);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(calendar.getTime());
    }


    public static Date nextMonthFirstDay() {
        Calendar calendar = Calendar.getInstance();
//		calendar.add(Calendar.MONTH, -1);
        calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 1);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        return calendar.getTime();
    }

    public static String currentMonthLastDay() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DATE));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(calendar.getTime());
    }

    public static String getCurrentDay() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String dateString = dateFormat.format(date);
        return dateString;
    }

    public static String getCurrentDayStr() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String dateString = dateFormat.format(date);
        return dateString;
    }
    public static String getCurrentDayHaom(){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
        Date date = new Date();
        String dateString = dateFormat.format(date);
        return dateString;
    }
    public static String getCurrentDayStr1() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmSS");
        Date date = new Date();
        String dateString = dateFormat.format(date);
        return dateString;
    }


    /**
     * 计算两个日期之间相差的天数
     *
     * @param smdate 较小的时间
     * @param bdate  较大的时间
     * @return 相差天数
     * @throws ParseException
     */
    public static int daysBetween(Date smdate, Date bdate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        smdate = sdf.parse(sdf.format(smdate));
        bdate = sdf.parse(sdf.format(bdate));
        Calendar cal = Calendar.getInstance();
        cal.setTime(smdate);
        long time1 = cal.getTimeInMillis();
        cal.setTime(bdate);
        long time2 = cal.getTimeInMillis();
        long between_days = (time2 - time1) / (1000 * 3600 * 24);

        return Integer.parseInt(String.valueOf(between_days));
    }

    /**
     * 字符串的日期格式的计算
     */
    public static int daysBetween(String smdate, String bdate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.setTime(sdf.parse(smdate));
        long time1 = cal.getTimeInMillis();
        cal.setTime(sdf.parse(bdate));
        long time2 = cal.getTimeInMillis();
        long between_days = (time2 - time1) / (1000 * 3600 * 24);

        return Integer.parseInt(String.valueOf(between_days));
    }

    public static boolean isAfterDays(Date dt, int days) {
        Date date = DateUtil.dateAddDay(dt, days);
        if (System.currentTimeMillis() <= date.getTime()) {
            return true;
        } else {
            return false;
        }
    }

    public static Date now() {
        Date date = new Date(System.currentTimeMillis());
        return date;
    }

    public static String formatHHMMSS(String time) {
        try {
            return HHMMSS.format(Long.parseLong(time));
        } catch (Exception e) {
            e.printStackTrace();
            return "000000";
        }
    }

    public static Date formatyyyyMMddHHmmss(String date) {
        try {
            return YYYYMMDDHHMMSS.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) throws ParseException {
        System.out.println(currentMonthFirstDay());
        System.out.print(currentMonthLastDay());
    }
}
