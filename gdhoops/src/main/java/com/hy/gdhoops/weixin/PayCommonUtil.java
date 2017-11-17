package com.hy.gdhoops.weixin;

import com.hy.gdhoops.model.PayInfo;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;

import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.*;
import java.security.KeyManagementException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.*;

/**
 * 微信H5支付 签名 随机码 时间戳等管理
 */
public class PayCommonUtil {

    private static Logger log = Logger.getLogger(PayCommonUtil.class);


    /***
     * 调用微信接口
     *
     * @param requestUrl
     * @param requestMethod
     * @param output
     * @return
     * @throws NoSuchAlgorithmException
     * @throws NoSuchProviderException
     * @throws KeyManagementException
     * @throws MalformedURLException
     * @throws IOException
     * @throws ProtocolException
     * @throws UnsupportedEncodingException
     */

    private static StringBuffer httpsRequest(String requestUrl, String requestMethod, String output)
            throws NoSuchAlgorithmException, NoSuchProviderException, KeyManagementException, MalformedURLException,
            IOException, ProtocolException, UnsupportedEncodingException {

        URL url = new URL(requestUrl);
        HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();

        connection.setDoOutput(true);
        connection.setDoInput(true);
        connection.setUseCaches(false);
        connection.setRequestMethod(requestMethod);
        if (null != output) {
            OutputStream outputStream = connection.getOutputStream();
            outputStream.write(output.getBytes("UTF-8"));
            outputStream.close();
        }

        // 从输入流读取返回内容
        InputStream inputStream = connection.getInputStream();
        InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
        BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
        String str = null;
        StringBuffer buffer = new StringBuffer();
        while ((str = bufferedReader.readLine()) != null) {
            buffer.append(str);
        }

        bufferedReader.close();
        inputStreamReader.close();
        inputStream.close();
        inputStream = null;
        connection.disconnect();
        return buffer;
    }


    public static JSONObject httpsRequestToJsonObject(String requestUrl, String requestMethod, String outputStr) {
        JSONObject jsonObject = null;
        try {
            StringBuffer buffer = httpsRequest(requestUrl, requestMethod, outputStr);
            jsonObject = JSONObject.fromObject(buffer.toString());
        } catch (ConnectException ce) {
            log.error("连接超时：" + ce.getMessage());
        } catch (Exception e) {
            log.error("https请求异常：" + e.getMessage());
        }
        return jsonObject;
    }


    public static Map<String, String> httpsRequestToXML(String requestUrl, String requestMethod, String outputStr) {
        Map<String, String> result = new HashMap<>();
        try {
            StringBuffer buffer = httpsRequest(requestUrl, requestMethod, outputStr);
            result = parseXml(buffer.toString());
        } catch (ConnectException ce) {
            log.error("连接超时：" + ce.getMessage());
        } catch (Exception e) {
            log.error("https请求异常：" + e.getMessage());
        }
        return result;
    }


    /**
     * 获取预支付ID时  获取随机码
     *
     * @return
     */
    public static String CreateNoncestr() {
        String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        String res = "";
        for (int i = 0; i < 16; i++) {
            Random rd = new Random();
            res += chars.charAt(rd.nextInt(chars.length() - 1));
        }
        return res;
    }

    /**
     * 获取微信支付时间戳
     *
     * @return
     */
    public static String create_timestamp() {
        return Long.toString(System.currentTimeMillis() / 1000);
    }

    /**
     * 获取支付随机码
     *
     * @return
     */
    public static String create_nonce_str() {
        return UUID.randomUUID().toString();
    }


    /**
     * 获取签名
     *
     * @param payInfo
     * @return
     * @throws Exception
     */
    public static String getSign(PayInfo payInfo) throws Exception {
        String signTemp = "appid=" + payInfo.getAppid()
                + "&attach=" + payInfo.getAttach()
                + "&body=" + payInfo.getBody()
                + "&device_info=" + payInfo.getDevice_info()
                + "&mch_id=" + payInfo.getMch_id()
                + "&nonce_str=" + payInfo.getNonce_str()
                + "&notify_url=" + payInfo.getNotify_url()
                + "&openid=" + payInfo.getOpenid()
                + "&out_trade_no=" + payInfo.getOut_trade_no()
                + "&spbill_create_ip=" + payInfo.getSpbill_create_ip()
                + "&total_fee=" + payInfo.getTotal_fee()
                + "&trade_type=" + payInfo.getTrade_type()
                + "&key=" + ConfigUtil.KEY; //这个key注意

        MessageDigest md5 = MessageDigest.getInstance("MD5");
        md5.reset();
        md5.update(signTemp.getBytes("UTF-8"));
        String sign = PayCommonUtil.byteToStr(md5.digest()).toUpperCase();
        return sign;
    }


    /**
     * md5方式获取签名
     *
     * @param str
     * @return
     */
    public static String getSign(String str) throws Exception {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        md5.reset();
        md5.update(str.getBytes("UTF-8"));
        String sign = PayCommonUtil.byteToStr(md5.digest()).toUpperCase();
        return sign;
    }


    /**
     * 将字节数组转换为十六进制字符串
     *
     * @param byteArray
     * @return
     */
    public static String byteToStr(byte[] byteArray) {
        String strDigest = "";
        for (int i = 0; i < byteArray.length; i++) {
            strDigest += byteToHexStr(byteArray[i]);
        }
        return strDigest;
    }

    /**
     * 将字节转换为十六进制字符串
     *
     * @param bytes
     * @return
     */
    public static String byteToHexStr(byte bytes) {
        char[] Digit = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        char[] tempArr = new char[2];
        tempArr[0] = Digit[(bytes >>> 4) & 0X0F];
        tempArr[1] = Digit[bytes & 0X0F];

        String s = new String(tempArr);
        return s;
    }

    /**
     * 获取ip地址
     *
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request) {
        InetAddress addr = null;
        try {
            addr = InetAddress.getLocalHost();
        } catch (UnknownHostException e) {
            return request.getRemoteAddr();
        }
        byte[] ipAddr = addr.getAddress();
        String ipAddrStr = "";
        for (int i = 0; i < ipAddr.length; i++) {
            if (i > 0) {
                ipAddrStr += ".";
            }
            ipAddrStr += ipAddr[i] & 0xFF;
        }
        return ipAddrStr;
    }


    /**
     * 获取用户的openId，并放入session
     *
     * @param code 微信返回的code
     */
    public static String getOpenId(String code) {
        String openId = "";
        String oauth2_url = ConfigUtil.OAUTH2_URL.replace("APPID", ConfigUtil.APPID).replace("SECRET", ConfigUtil.APP_SECRECT).replace("CODE", code);
        log.info("oauth2_url:" + oauth2_url);
        JSONObject jsonObject = httpsRequestToJsonObject(oauth2_url, "POST", null);
        log.info("jsonObject:" + jsonObject);
        Object errorCode = jsonObject.get("errcode");
        if (errorCode != null) {
            log.info("code不合法");
        } else {
            openId = jsonObject.getString("openid");
            log.info("openId:" + openId);
        }
        return openId;
    }


    /**
     * 扩展xstream使其支持CDATA
     */
    private static XStream xstream = new XStream(new XppDriver() {
        public HierarchicalStreamWriter createWriter(Writer out) {
            return new PrettyPrintWriter(out) {
                //增加CDATA标记
                boolean cdata = true;

                @SuppressWarnings("rawtypes")
                public void startNode(String name, Class clazz) {
                    super.startNode(name, clazz);
                }

                protected void writeText(QuickWriter writer, String text) {
                    if (cdata) {
                        writer.write("<![CDATA[");
                        writer.write(text);
                        writer.write("]]>");
                    } else {
                        writer.write(text);
                    }
                }
            };
        }
    });

    public static String payInfoToXML(PayInfo pi) {
        xstream.alias("xml", pi.getClass());
        return xstream.toXML(pi);
    }


    @SuppressWarnings("unchecked")
    public static Map<String, String> parseXml(String xml) throws Exception {
        Map<String, String> map = new HashMap<String, String>();

        Document document = DocumentHelper.parseText(xml);
        Element root = document.getRootElement();
        List<Element> elementList = root.elements();

        for (Element e : elementList)
            map.put(e.getName(), e.getText());
        return map;
    }

    /**
     * 微信支付签名算法sign
     *
     * @param characterEncoding
     * @param parameters
     * @return
     */
    @SuppressWarnings("unchecked")
    public static String createSign(String characterEncoding, SortedMap<Object, Object> parameters) {
        StringBuffer sb = new StringBuffer();
        Set es = parameters.entrySet();//所有参与传参的参数按照accsii排序（升序）
        Iterator it = es.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            String k = (String) entry.getKey();
            Object v = entry.getValue();
            if (null != v && !"".equals(v)
                    && !"sign".equals(k) && !"key".equals(k)) {
                sb.append(k + "=" + v + "&");
            }
        }
        sb.append("key=" + ConfigUtil.APP_SECRECT);
        String sign = MD5Util.MD5Encode(sb.toString(), characterEncoding).toUpperCase();
        return sign;
    }


}
