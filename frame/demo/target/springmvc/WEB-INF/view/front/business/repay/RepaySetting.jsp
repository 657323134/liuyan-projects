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
    <link rel="stylesheet" href="/css/businesses/repay.style.css">
</head>
<body class="repay-setting">
<div class="weui-toptips weui-toptips_warn">错误提示</div>

<header>
    <a class="back-btn" href="index.html"></a>

    <div class="title">设置</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <!--<div class="weui-cells__title">带跳转的列表项</div>-->
    <div class="weui-cells">
        <a class="weui-cell weui-cell_access" href="javascript:;">
            <div class="weui-cell__bd">
                <p>绑定手机号</p>
            </div>
            <div class="weui-cell__ft">18023651789</div>
        </a>
        <a class="weui-cell weui-cell_access" href="javascript:;">
            <div class="weui-cell__bd">
                <p>我的银行卡</p>
            </div>
            <div class="weui-cell__ft">已绑定
            </div>
        </a>
    </div>
    <div class="weui-cells__title"></div>
    <div class="weui-cells">
        <a class="weui-cell weui-cell_access" href="javascript:;">
            <div class="weui-cell__bd">
                <p>平台服务热线</p>
            </div>
            <div class="weui-cell__ft"></div>
        </a>
    </div>
</div>
</body>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/weui.min.js"></script>
<script>
    $(function () {

    });
</script>
</html>