<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<body class="my-income">
<div class="weui-toptips weui-toptips_warn">错误提示</div>

<header>
    <a class="back-btn" href="/buser/toBMainPage.do"></a>

    <div class="title">我的收入</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="weui-cells">
        <div class="my-money">
            <div class="weui-cells__title">
                可提现金额
            </div>
            <div class="money-num"><strong><fmt:formatNumber value="${buser.cashBalance}" pattern="0.00"/></strong>元
            </div>
        </div>
        <a class="weui-cell weui-cell_access" href="/buser/toWithdrawPage.do">
            <div class="weui-cell__bd">
                <p>提现</p>
            </div>
            <div class="weui-cell__ft">
            </div>
        </a>
        <a class="weui-cell weui-cell_access" href="/baccountinfo/toAccountInfoPage.do">
            <div class="weui-cell__bd">
                <p>资金流水</p>
            </div>
            <div class="weui-cell__ft">
            </div>
        </a>
        <a class="weui-cell weui-cell_access" href="/buser/toBankPage.do">
            <div class="weui-cell__bd">
                <p>管理提现银行卡</p>
            </div>
            <div class="weui-cell__ft">${tUserBank.bankname} 尾号${tUserBank.bankAccount}</div>
        </a>
    </div>

</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/weui.min.js"></script>
<script>
    $(function () {

    });
</script>
</html>