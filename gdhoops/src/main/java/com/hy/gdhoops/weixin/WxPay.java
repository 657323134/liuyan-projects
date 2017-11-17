package com.hy.gdhoops.weixin;

import java.io.Serializable;

/**
 * Created by Administrator on 2016/9/29.
 */
public class WxPay implements Serializable {

    private static final long serialVersionUID = 3843862351717555525L;
    private String paySign;
    private String prepay_id;
    private String nonce_str;
    private String timeStamp;

    public String getPaySign() {
        return paySign;
    }

    public void setPaySign(String paySign) {
        this.paySign = paySign;
    }

    public String getPrepay_id() {
        return prepay_id;
    }

    public void setPrepay_id(String prepay_id) {
        this.prepay_id = prepay_id;
    }

    public String getNonce_str() {
        return nonce_str;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public String getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(String timeStamp) {
        this.timeStamp = timeStamp;
    }
}
