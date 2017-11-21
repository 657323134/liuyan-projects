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
    <link rel="stylesheet" href="/css/businesses/weui.min.css">
    <link rel="stylesheet" href="/css/businesses/style.css">
</head>
<body class="manage-card">
<div class="weui-toptips weui-toptips_warn">错误提示</div>

<header>
    <a class="back-btn" href="/buser/myIncome.do"></a>

    <div class="title">管理银行卡</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="card-show">
        <h2>${tUserBank.bankname}</h2>

        <p>${tUserBank.bankAccount}</p>
        <img src="/images/businesses/card.png"/>
    </div>

    <div class="weui-cells">

        <div class="weui-cell">
            <div class="weui-cell__bd">
                <p>开户行区域</p>
            </div>
            <div class="weui-cell__ft">${tUserBank.provinceName} ${tUserBank.cityName}
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <p>开户行支行</p>
            </div>
            <div class="weui-cell__ft">${tUserBank.branch}
            </div>
        </div>
        <a class="weui-cell weui-cell_access" href="javascript:;">
        <div class="weui-cell__bd">
        <p>管理提现银行卡</p>
        </div>
        <div class="weui-cell__ft">${tUserBank.bankname} 尾号6666</div>
        </a>
    </div>
    <p class="page__desc">如提现遇到问题或需要更换银行卡请联系客服：<a href="tel:0755-86627551">0755-86627551</a></p>
</div>
</body>
<%--<script src="/js/jquery-1.8.3.min.js"></script>--%>
<%--<script>--%>
    <%--$(function () {--%>

    <%--});--%>
<%--</script>--%>
</html>