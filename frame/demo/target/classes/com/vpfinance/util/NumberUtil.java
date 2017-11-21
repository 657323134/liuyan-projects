package com.vpfinance.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;

public class NumberUtil {
    private static DecimalFormat df = new DecimalFormat("0.00");
    private static DecimalFormat df_show = new DecimalFormat("#,##0.00");

    public static String fomatAmount(BigDecimal amount) {
        return df.format(amount);
    }

    public static String fomatShowAmount(BigDecimal amount) {
        return df_show.format(amount);
    }

    public static Object save2Double(String str) {
        if (StringUtils.isEmpty(str)) {
            return "0.00";
        }
        double dble = Double.parseDouble(str);
        return formatDouble(dble);
    }

    public static Object formatDouble(double d) {
        DecimalFormat formater = new DecimalFormat("######0.00");
//		DecimalFormat formater = new DecimalFormat();
        formater.setMaximumFractionDigits(2);
        formater.setGroupingSize(0);
        formater.setRoundingMode(RoundingMode.FLOOR);
//		System.out.println(formater.format(d));
        return formater.format(d);
    }

}
