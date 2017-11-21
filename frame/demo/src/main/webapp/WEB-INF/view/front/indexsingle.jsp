<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="/css/front/style.css">
</head>
<body class="bg-eee">
<div class="title-img">
    <img src="/css/images/front/banner1.png"/>
</div>
<div class="single-project">
    <div class="single-top">
        <img src="/css/images/front/single-project-img.png"/>
        <%--<img src="/imgs${tgoods.goodsimage}"/>--%>
        <p class="p1">${tgoods.goodsname}</p>

        <p class="p2">${tgoods.goodsremak}</p>
    </div>
    <div class="single-bottom">
        <div class="project-price">
            <div class="price-left">￥${tgoods.goodsprice}</div>
            <div class="price-right">月供：¥<fmt:formatNumber type="number"
                                                           value="${(tgoods.goodsprice-tgoods.downpayment)/6}"
                                                           pattern="0.00"/> x 6期
            </div>
        </div>
        <a class="repayment-btn" href="/order/product?product_id=${tgoods.id}">我要分期</a>
    </div>
</div>
</body>
</html>