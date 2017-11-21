package com.vpfinance.util;

import java.util.Date;

public final class OrdIdUtil {


    /**
     * 充值订单类型
     *
     * @author Administrator
     */
    public static enum OrdType {
        CREATEORDER_TYPE("100"),
        RECHAGER_TYPE("110"),
        INVEST_TYPE("120"),
        WITHDRAW_TYPE("130"),
        REPAY_TYPE("140"),
        CLAIM_TYPE("150"),
        REPAY_BORROWER_TYPE("160"),
        BORROW_TYPE("170"),
        TTRANSFER_TYPE("180"),;
        String value;

        private OrdType(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }


    }

    /**
     * 生成订单ID
     *
     * @return
     */
    public static String generateOrdId(OrdType ordType) {
        StringBuffer ordId = new StringBuffer();
        ordId.append(ordType.getValue());
        ordId.append(DateUtil.YYYYMMDDHHMMSSSSS.format(new Date()));
        ordId.append(RandomUtils.createRadom());
        return ordId.toString();
    }

    /**
     * 生成订单ID
     *
     * @return
     */
    public static String generateOrdId2(OrdType ordType) {
        StringBuffer ordId = new StringBuffer();
        ordId.append(1);
        ordId.append(DateUtil.YYMMDDHHMMSS.format(new Date()));
        ordId.append(RandomUtils.createFourRadom());
        return ordId.toString();
    }


    /**
     * 生成订单ID
     *
     * @return
     */
    public static String generateOrdId() {
        StringBuffer ordId = new StringBuffer();

        ordId.append(DateUtil.YYYYMMDDHHMMSSSSS.format(new Date()));
        return ordId.toString();
    }
}
