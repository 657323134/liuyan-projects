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
        <c:choose>
            <c:when test="${not empty unpay and unpay == true}">
                <p>良好信用要继续保持哦</p>
            </c:when>
            <c:otherwise>
                <p>分期已全部还清,感谢您的支持</p>
            </c:otherwise>
        </c:choose>
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