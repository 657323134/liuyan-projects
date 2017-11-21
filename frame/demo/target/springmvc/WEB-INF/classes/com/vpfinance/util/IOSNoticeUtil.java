package com.vpfinance.util;

import java.util.ArrayList;
import java.util.List;

import javapns.devices.implementations.basic.BasicDevice;
import javapns.notification.AppleNotificationServerBasicImpl;
import javapns.notification.PushNotificationPayload;
import javapns.notification.PushedNotification;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;

/**
 * IOS 推送基类
 */
public class IOSNoticeUtil {
    private static Log log = LogFactory.getLog(IOSNoticeUtil.class);
    private String errorMessage;

    /**
     * 通知中的消息KEY
     */
    public static final String NOTIFICATION_PARAM_KEY = "mine";
    /**
     * Port
     */
    private static final int PORT = 2195;

    /**
     * 连接APNS
     */
    private static final String APNS_SERVER_PATH = PropertiesUtils.getProperties("APNS_SERVER_PATH");

    /**
     * p12文件密码
     */
    private static final String P12_PASSWORD = PropertiesUtils.getProperties("P12_PASSWORD");
//	private static final String P12_PASSWORD = "1234";

    private static final String KEY_P12_NAME = "aps_developer_identity.p12";

    public boolean sendNotification(List<String> tokens, String alert, String msg, boolean sendCount) {
        int badge = 1;//图标小红圈的数值
        String sound = "default";//铃音
        System.out.println("certificatePath:");
        String certificatePath = PropertiesUtils.getProperties("IOS_PUSH_CERT");// 前面生成的用于JAVA后台连接APNS服务的*.p12文件位置

        System.out.println(certificatePath);

        try {
            PushNotificationPayload payLoad = new PushNotificationPayload();
            payLoad.addAlert(alert); // 消息内容
            payLoad.addBadge(badge); // iphone应用图标上小红圈上的数值
            payLoad.addCustomDictionary(NOTIFICATION_PARAM_KEY, msg);
            if (!StringUtils.isBlank(sound)) {
                payLoad.addSound(sound);//铃音
            }
            javapns.notification.PushNotificationManager pushManager = new javapns.notification.PushNotificationManager();
            //true：表示的是产品发布推送服务 false：表示的是产品测试推送服务
            pushManager.initializeConnection(new AppleNotificationServerBasicImpl(certificatePath, P12_PASSWORD, true));
            List<PushedNotification> notifications = new ArrayList<PushedNotification>();
            // 发送push消息
            if (sendCount) {
                javapns.devices.Device device = new BasicDevice();
                device.setToken(tokens.get(0));
                PushedNotification notification = pushManager.sendNotification(device, payLoad, true);
                notifications.add(notification);
            } else {
                List<javapns.devices.Device> device = new ArrayList<javapns.devices.Device>();
                for (String token : tokens) {
                    device.add(new BasicDevice(token));
                }
                notifications = pushManager.sendNotifications(payLoad, device);
            }
            List<PushedNotification> failedNotifications = PushedNotification.findFailedNotifications(notifications);
            List<PushedNotification> successfulNotifications = PushedNotification.findSuccessfulNotifications(notifications);
            int failed = failedNotifications.size();
            int successful = successfulNotifications.size();
            System.out.println("failed=" + failed + ",successful=" + successful);
            if (successful > 0 && failed == 0) {
                log.debug("-----All notifications pushed 成功 (" + successfulNotifications.size() + "):");
            } else if (successful == 0 && failed > 0) {
                log.debug("-----All notifications 失败 (" + failedNotifications.size() + "):");
            } else if (successful == 0 && failed == 0) {
                System.out.println("No notifications could be sent, probably because of a critical error");
            } else {
                log.debug("------Some notifications 失败 (" + failedNotifications.size() + "):");
                log.debug("------Others 成功 (" + successfulNotifications.size() + "):");
            }
            pushManager.stopConnection();
        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = e.toString();
            return false;
        }
        return true;
    }

    public static void main(String[] args) {
        IOSNoticeUtil mIOSNoticeUtil = new IOSNoticeUtil();
        String msg = "IOS Notice Test ";

        try {
            JSONObject json = new JSONObject();
            json.put("titleCN", "Title CHI");
            json.put("titleEN", "Title ENG");
            json.put("contentCN", "Content CHI");
            json.put("contentEN", "Content ENG");
            json.put("type", 1);
            json.put("itemId", 1);

            List<String> tokens = new ArrayList<String>();
            String deviceToken = "ba73eadf2093d5cfc249147556ae9898b2e001da54bea0d3d2f87557eb9db7ac";
            tokens.add(deviceToken);
            System.out.println("Send Notice Result = " + mIOSNoticeUtil.sendNotification(tokens, "ios test", json.toString(), false));
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }

    public String getErrorMessage() {
        return errorMessage;
    }

}
