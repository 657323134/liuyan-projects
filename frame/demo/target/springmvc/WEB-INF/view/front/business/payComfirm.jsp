<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <title>优卡分期</title>
    <link rel="stylesheet" href="/css/front/common.css">
    <link rel="stylesheet" href="/css/front/style1.css">
</head>
<body class="bg-eee">
<header>
    <a class="back-btn" href="javascript:window.history.go(-1)"></a>

    <div class="title">申请成功</div>
    <div class="header-right"></div>
</header>
<input type="hidden" id="trepayids" value="${trepayids}"/>
<input type="hidden" id="firstpay" value="${firstpay}"/>
<input type="hidden" id="orderid" value="${orderid}"/>
<input type="hidden" id="goodsid" value="${goodsid}"/>

<div class="container">
    <div class="apple-state">
        <img class="ico" src="/css/images/front/check_big.svg">

        <h3>订单支付页面</h3>

        <p>可凭订单号或手机号到店安装产品</p>
    </div>
    <%--<div class="order-info">--%>
    <%--<table cellspacing="0" cellpadding="0">--%>
    <%--<tbody>--%>
    <%--<tr>--%>
    <%--<td>订单号</td>--%>
    <%--<td>${bOrder.order_num}</td>--%>
    <%--</tr>--%>
    <%--<td>订单日期</td>--%>
    <%--<td>${bOrder.order_date}</td>--%>
    <%--<tr>--%>
    <%--<td>商品名称</td>--%>
    <%--<td>${tGoods.goodsname}</td>--%>
    <%--<tr>--%>
    <%--<td>总价</td>--%>
    <%--<td>￥${bOrder.order_money}</td>--%>
    <%--<tr>--%>
    <%--<td>支付方式</td>--%>
    <%--<td>分期付款分${bOrder.periodization}期,订单日即为每月还款日,请留意每月还款短信提醒</td>--%>
    <%--</tr>--%>
    <%--</tbody>--%>
    <%--</table>--%>
    <%--</div>--%>
    <div class="a-btn">
        <a class="look-order-btn" href="/order/orderlist">查看订单</a>
        <a class="back-home-btn" href="/index">返回首页</a>
    </div>
</div>
</body>
<script src="/js/front/jquery-1.8.3.min.js"></script>


<!-- 引入微信接口js-->
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>

    //web投资成功后，微信扫描二维码，跳转到这个页面，弹出提示窗口，分享领红包

    var appid = '${appid}';
    var times = '${timestamp}';
    var nonce = '${nonceStr}';
    var signa = '${signature}';


    wx.config({

        /*   debug: false,
         appId: 'wxf8b4f85f3a794e77',
         timestamp: 1421142450,
         nonceStr: '9hKgyCLgGZOgQmEI',
         signature: 'bf7a5555f9ad0e7e491535f232349a40510a6f8f',*/
        appId: appid,
        timestamp: times,
        nonceStr: nonce,
        signature: signa,

        /*     appId: ${appid}, // 必填，企业号的唯一标识，此处填写企业号corpid
         timestamp:${timestamp} , // 必填，生成签名的时间戳
         nonceStr:${nonceStr}, // 必填，生成签名的随机串
         signature: '',// 必填，签名，见附录1*/

        jsApiList: [
            'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo',
            'hideMenuItems',
            'showMenuItems',
            'hideAllNonBaseMenuItem',
            'showAllNonBaseMenuItem',
            'translateVoice',
            'startRecord',
            'stopRecord',
            'onRecordEnd',
            'playVoice',
            'pauseVoice',
            'stopVoice',
            'uploadVoice',
            'downloadVoice',
            'chooseImage',
            'previewImage',
            'uploadImage',
            'downloadImage',
            'getNetworkType',
            'openLocation',
            'getLocation',
            'hideOptionMenu',
            'showOptionMenu',
            'closeWindow',
            'scanQRCode',
            'chooseWXPay',//微信支付模块
            'openProductSpecificView',
            'addCard',
            'chooseCard',
            'openCard'
        ]
    });
    /*
     * 注意：
     * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
     * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
     * 3. 完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
     *
     * 如有问题请通过以下渠道反馈：
     * 邮箱地址：weixin-open@qq.com
     * 邮件主题：【微信JS-SDK反馈】具体问题
     * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
     */
    wx.ready(function () {
        wx.chooseWXPay({
            timestamp: (${wxpay.timeStamp}),
            nonceStr: '${wxpay.nonce_str}',
            package: '${wxpay.prepay_id}',
            signType: 'MD5',
            paySign: '${wxpay.paySign}',
            success: function (res) {
//        alert("支付成功");
                //修改repay状态
                var trepayids = $("#trepayids").val();
//        alert("repayid="+trepayids);
                var firstpay = $("#firstpay").val();
                $.ajax({
                    type: 'post',
                    url: '/order/updateTRepay',
                    data: {
                        trepayids: trepayids
                    },
                    success: function (data) {
                        if (data.status == "1") {
                            if (firstpay == 'true') {
                                var orderid = $("#orderid").val();
                                var goodsid = $("#goodsid").val();
                                location.href = "/order/applySuccess?orderid=" + orderid + "&goodsid=" + goodsid;
                            } else {
                                location.href = "/order/orderPaySuccess";
                            }
                        } else {
                            //支付成功，修改记录失败，可记录失败的还款记录
                            alert("支付成功，服务器异常，更改还款记录失败");
                        }
                    }
                });

            }
        });
    });
</script>

</html>