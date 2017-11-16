package com.company.project.util;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.security.cert.CertificateException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by kuros on 2016/4/6.
 */
public class HttpUtil {
    private static final Logger logger = LoggerFactory.getLogger(HttpUtil.class);

    public static String post(String url, Map<String, String> params) {
        DefaultHttpClient httpclient = new DefaultHttpClient();
        String body = null;
        HttpPost post = postForm(url, params);
        body = invoke(httpclient, post);
        httpclient.getConnectionManager().shutdown();
        return body;
    }

    private static HttpPost postForm(String url, Map<String, String> params) {

        HttpPost httpost = new HttpPost(url);
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();

        Set<String> keySet = params.keySet();
        for (String key : keySet) {
            nvps.add(new BasicNameValuePair(key, params.get(key)));
        }
        try {
            httpost.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return httpost;
    }

    public static String get(String url) {
        DefaultHttpClient httpclient = new DefaultHttpClient();
        //enableSSL(httpclient);
        String body = null;
        // httpclient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 0);
//        httpclient.getParams().setParameter("http.protocol.content-charset",
//                HTTP.UTF_8);
//        httpclient.getParams().setParameter(HTTP.CONTENT_ENCODING, HTTP.UTF_8);
//        httpclient.getParams().setParameter(HTTP.CHARSET_PARAM, HTTP.UTF_8);
//        httpclient.getParams().setParameter(HTTP.DEFAULT_PROTOCOL_CHARSET,
//                HTTP.UTF_8);

        HttpGet get = new HttpGet(url);
        //  long t1 = System.currentTimeMillis();
        body = invoke(httpclient, get);
        //    long t2 = System.currentTimeMillis();
        //    System.out.println( " 调用接口耗费的时间为："+ (t2 - t1) + "毫秒，转化为"  + (t2 - t1)/1000 + "秒" );

        httpclient.getConnectionManager().shutdown();

        return body;
    }

//    public static SmsResult sendYuyinSms(String url) {
//        InetAddress netAddress = IPUtil.getInetAddress();
//        if (!IPUtil.getHostIp(netAddress).equals(SysConstans.SYS_IP_ADDR)) {
//            logger.info("语音短信发送失败:发送服务器IP为非信任IP");
//            logger.info("语音短信内容:" + url);
//            return new SmsResult(false, "sms", url);
//        }
//        return new SmsResult(false, "sms", get(url));
//    }

    private static HttpResponse sendRequest(DefaultHttpClient httpclient,
                                            HttpUriRequest httpost) {
        HttpResponse response = null;

        try {
            response = httpclient.execute(httpost);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return response;
    }

    private static String invoke(DefaultHttpClient httpclient,
                                 HttpUriRequest httpost) {

        HttpResponse response = sendRequest(httpclient, httpost);
        String body = paseResponse(response);

        return body;
    }

    private static String paseResponse(HttpResponse response) {
        HttpEntity entity = response.getEntity();
        String charset = EntityUtils.getContentCharSet(entity);
        String body = null;
        try {
            body = EntityUtils.toString(entity);
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return body;
    }

    /**
     * 访问https的网站
     *
     * @param httpclient
     */
    private static void enableSSL(HttpClient httpclient) {
        //调用ssl
        try {
            SSLContext sslcontext = SSLContext.getInstance("TLS");
            sslcontext.init(null, new TrustManager[]{truseAllManager}, null);
            SSLSocketFactory sf = new SSLSocketFactory(sslcontext);
            sf.setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
            Scheme https = new Scheme("https", sf, 443);
            httpclient.getConnectionManager().getSchemeRegistry().register(https);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 重写验证方法，取消检测ssl
     */
    private static TrustManager truseAllManager = new X509TrustManager() {

        public void checkClientTrusted(
                java.security.cert.X509Certificate[] arg0, String arg1)
                throws CertificateException {
            // TODO Auto-generated method stub

        }

        public void checkServerTrusted(
                java.security.cert.X509Certificate[] arg0, String arg1)
                throws CertificateException {
            // TODO Auto-generated method stub

        }

        public java.security.cert.X509Certificate[] getAcceptedIssuers() {
            // TODO Auto-generated method stub
            return null;
        }

    };

    public static void main(String[] args) throws Exception {

        //String url = "http://222.73.117.158/msg/HttpBatchSendSM?account=yuyin-wp1&pswd=Weipin123&mobile=13424306806&msg=测试别发是335569&needstatus=true";
//       String urls = "https://222.73.117.146/msg/HttpBatchSendSM?account=yuyin-wp1&pswd=Weipin123&mobile=13424306806&msg=测试别发是335569&needstatus=true";
//        long t1 = System.currentTimeMillis();
//        String response = get(urls);
//        long t2 =  System.currentTimeMillis();
//        System.out.println(response + " 总共耗时：" + (t2 - t1) + "毫秒,转化为 " + (t2 - t1)/1000);

        System.out.println();
        // String response = get("http://222.73.117.158/msg/HttpBatchSendSM?"+URLEncoder.encode("account=yuyin-wp1&pswd=Weipin123&mobile=13424306806&msg=您的验证码是999999&needstatus=true","utf-8"));
        String response = get("http://222.73.117.158/msg/HttpBatchSendSM?account=yuyin-wp1&pswd=Weipin123&mobile=13424306806&msg=您的验证码是999999&needstatus=true");
//        String response = get("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx0b3d59359f1039e5&redirect_uri=http://new.vpfinance.cn/&response_type=code&scope=snsapi_base&state=park#wechat_redirect");
        System.out.println(response);
//        org.apache.commons.httpclient.HttpClient client = new org.apache.commons.httpclient.HttpClient();
//        org.apache.commons.httpclient.methods.GetMethod method = new org.apache.commons.httpclient.methods.GetMethod("https://222.73.117.146/msg/HttpBatchSendSM?account=yuyin-wp1&pswd=Weipin123&mobile=13424306806&msg=测试别发是335569&needstatus=true");
//        //enableSSL(client);
//        try {
//            org.apache.commons.httpclient.URI base = new org.apache.commons.httpclient.URI("http://222.73.117.158/msg/HttpBatchSendSM?account=yuyin-wp1&pswd=Weipin123&mobile=13424306806&msg=测试别发是335569&needstatus=true", false);
//            //method.setURI(new org.apache.commons.httpclient.URI(base, "HttpBatchSendSM", false));
// //           org.apache.http.NameValuePair[] nameValuePairs = new org.apache.http.NameValuePair[]{ new BasicNameValuePair("account", "yuyin-wp1"), new BasicNameValuePair("pswd", "Weipin123"), new BasicNameValuePair("mobile", "13424306806")
// //          , new BasicNameValuePair("mobile", "13424306806"),new BasicNameValuePair("needstatus", "true"),  new BasicNameValuePair("msg", "测试别发是335569")};
////            method.setQueryString(new NameValuePair[] {
////                    new BasicNameValuePair("account", "yuyin-wp1"),
////                    new BasicNameValuePair("pswd", "Weipin123"),
////                    new BasicNameValuePair("mobile", "13424306806"),
////                    new BasicNameValuePair("needstatus", "true"),
////                    new BasicNameValuePair("msg", "测试别发是335569"),
////                    new BasicNameValuePair("extno", "")
////            });
////            method.setQueryString(nameValuePairs);
//
//            int result = client.executeMethod(method);
//
//            if (result == org.apache.commons.httpclient.HttpStatus.SC_OK) {
//                java.io.InputStream in = method.getResponseBodyAsStream();
//                java.io.ByteArrayOutputStream baos = new java.io.ByteArrayOutputStream();
//                byte[] buffer = new byte[1024];
//                int len = 0;
//                while ((len = in.read(buffer)) != -1) {
//                    baos.write(buffer, 0, len);
//                }
//                System.out.println(baos.toString());
//            } else {
//                throw new Exception("HTTP ERROR Status: " + method.getStatusCode() + ":" + method.getStatusText());
//            }
//        } finally {
//            method.releaseConnection();
//        }
    }

    //JAVA 获取完整URL 方法
    public static String getRequestURL(HttpServletRequest request) {
        if (request == null) {
            return "";
        }
        String url = request.getRequestURL().toString();

        if (request.getQueryString() != null && !"".equals(request.getQueryString()) && !"null".equals(request.getQueryString())) {
            url = url + "?" + request.getQueryString();
        }

        logger.info("链接完整地址？后的参数" + request.getQueryString());

        return url;
    }

}
