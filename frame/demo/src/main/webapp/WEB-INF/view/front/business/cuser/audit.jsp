<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=utf-8" %>
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
<body class="audit">

<div class="container show-data by-stage">
    <!--等待审核-->
    <div class="input-box audit">
        <figure class="wait">
            <img src="/images/front/wait.png"/>
            <p>您提交的资料正在审核中<br>
                请耐心等待3-5分钟
            </p>
        </figure>
        <div class="autoLink" id="refresh">您将在<span id="second">5</span>秒后自动跳转<a href="/userinfo/personCenter">个人中心>></a></div>
    </div>
</div>

<div class="ui-footer">
    <p class="ui-footer__text">©2017 优卡分期 版权所有</p>
</div>
</body>
<script>
    //提交完成后，倒计时
    var t = 5;
    var second = document.getElementById('second');
    setInterval( function count() {
        second.innerHTML = t;
        --t;
        if(t<=0){
            location.href="/userinfo/personCenter";
        }
    },1000);
</script>
</html>