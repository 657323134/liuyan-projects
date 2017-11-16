package com.company.project.weixin;


import com.company.project.model.PayInfo;

import com.company.project.util.OrdIdUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import java.util.HashMap;
import java.util.Map;

/**
 * 微信接口
 */
public class WxPayUtil {
    private static Logger logger = Logger.getLogger(WxPayUtil.class);


    // 缓存添加的时间
    public static String cacheAddTime = null;
    // token,ticket缓存
    public static Map<String, AccessToken> TOKEN_TICKET_CACHE = new HashMap<String, AccessToken>();
    // token对应的key
    private static final String TOKEN = "token";
    // ticket对应的key
    private static final String TICKET = "ticket";

    /**
     * 创建统一下单的xml的java对象
     *
     * @param ip       用户的ip地址
     * @param openId   用户的openId
     * @param money    支付金额
     * @return
     */
    public static PayInfo createPayInfo(String ip, String openId, int money) {
        PayInfo payInfo = new PayInfo();
        payInfo.setAppid(ConfigUtil.APPID);
        payInfo.setDevice_info("WEB");
        payInfo.setMch_id(ConfigUtil.MCH_ID);
        payInfo.setNonce_str(PayCommonUtil.CreateNoncestr());
        payInfo.setBody("向商户付款");
        payInfo.setAttach(String.valueOf(0));
        payInfo.setOut_trade_no(OrdIdUtil.generateOrdId(OrdIdUtil.OrdType.REPAY_TYPE));
        payInfo.setTotal_fee(money);
        payInfo.setSpbill_create_ip(ip);
        payInfo.setNotify_url(ConfigUtil.NOTIFY_URL);
        payInfo.setTrade_type("JSAPI");
        payInfo.setOpenid(openId);
        return payInfo;
    }


    /**
     * 预支付接口获取预支付id   prepayid
     *
     * @param openid   用户标识
     * @param ip       ip地址
     * @param money    支付金额
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public static String unifiedorder(String openid, String ip, int money) throws Exception {

        PayInfo payInfo = createPayInfo(ip, openid, money);
        String sign = PayCommonUtil.getSign(payInfo);
        payInfo.setSign(sign);

        logger.info(PayCommonUtil.payInfoToXML(payInfo).replace("__", "_"));
        Map<String, String> map = PayCommonUtil.httpsRequestToXML(ConfigUtil.UNIFIED_ORDER_URL, "POST", PayCommonUtil.payInfoToXML(payInfo).replace("__", "_").replace("<![CDATA[", "").replace("]]>", ""));
        logger.info("prepayid  map " + map.toString());
        String return_code = map.get("return_code");
        if (StringUtils.isNotBlank(return_code) && return_code.equals("SUCCESS")) {
            String return_msg = map.get("return_msg");
            if (StringUtils.isNotBlank(return_msg) && !return_msg.equals("OK")) {
                return null;
            }
        } else {
            return null;
        }

        String prepay_Id = map.get("prepay_id");

        return prepay_Id;
    }


    /**
     * 获取页面上weixin支付JS所需的参数
     *
     * @return
     */
    public static WxPay getWxPayInfo(String prepay_id) throws Exception {
        String nonce = PayCommonUtil.create_nonce_str().replace("-", "");
        String timeStamp = PayCommonUtil.create_timestamp();
        //再算签名
        String newPrepay_id = "prepay_id=" + prepay_id;
        String args = "appId=" + ConfigUtil.APPID
                + "&nonceStr=" + nonce
                + "&package=" + newPrepay_id
                + "&signType=MD5"
                + "&timeStamp=" + timeStamp
                + "&key=" + ConfigUtil.KEY;
        String paySign = PayCommonUtil.getSign(args);
        WxPay wxPay = new WxPay();
        wxPay.setNonce_str(nonce);
        wxPay.setPaySign(paySign);
        wxPay.setPrepay_id(newPrepay_id);
        wxPay.setTimeStamp(timeStamp);
        return wxPay;
    }


}