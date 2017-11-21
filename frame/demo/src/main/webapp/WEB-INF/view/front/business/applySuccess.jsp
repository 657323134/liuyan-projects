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

    <div class="title">支付成功</div>
    <div class="header-right"></div>
</header>
<div class="container">
    <div class="apple-state">
        <img class="ico" src="/css/images/front/check_big.svg">

        <h3>支付成功</h3>

        <p>可凭订单号或手机号到店安装产品</p>
    </div>
    <div class="order-info">
        <table cellspacing="0" cellpadding="0">
            <tbody>
            <tr>
                <td>订单号</td>
                <td>${bOrder.order_num}</td>
            </tr>
            <td>订单日期</td>
            <td>${bOrder.order_date}</td>
            <tr>
                <td>商品名称</td>
                <td>${tGoods.goodsname}</td>
            <tr>
                <td>总价</td>
                <td>￥${bOrder.order_money}</td>
            <tr>
                <td>支付方式</td>
                <c:choose>
                    <c:when test="${bOrder.periodization == 1}">
                        <td>立即支付</td>
                    </c:when>
                    <c:otherwise>
                        <td>分期付款分${bOrder.periodization}期,订单日即为每月还款日,请留意每月还款短信提醒</td>
                    </c:otherwise>
                </c:choose>

            </tr>
            </tbody>
        </table>
    </div>
    <div class="a-btn">
        <c:choose>
            <c:when test="${bOrder.user_id == 0}">
                <a class="look-order-btn" href="/index">查看订单</a>
            </c:when>
            <c:otherwise>
                <a class="look-order-btn" href="/order/orderlist">查看订单</a>
            </c:otherwise>
        </c:choose>
        <a class="back-home-btn" href="/index">返回首页</a>
    </div>
</div>
</body>
<script src="/js/front/jquery-1.8.3.min.js"></script>
<script>

</script>
</html>