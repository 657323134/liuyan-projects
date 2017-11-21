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
<body class="member-success">
<div class="input-box show-state">
    <figure class="gohead">
        <img src="/images/front/vip.png"/>

        <p>恭喜您注册成功</p>
        <h3>您有8000元额度尚未开通</h3>
    </figure>
    <a class="next-btn" href="/cuser/cuser.htm">申请开通</a>
    <a class="next-btn back-white" href="/userinfo/tologin">前往个人中心</a>
    <%--<a class="link" href="/cuser/cuser.htm">立即分期</a>--%>
    <%--<a class="link" href="">优卡分期合作门店列表</a>--%>
</div>
<div class="ui-footer">
    <%--<p class="ui-footer__text">客服热线</p>--%>
    <p class="ui-footer__text">©2017 优卡分期 版权所有</p>
</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script>
    $(function () {
        $(".option-span").click(function () {
            if ($(this).hasClass("disabled")) {
                $(this).removeClass("disabled").addClass("active");
                $(this).siblings(".option-span").removeClass("active").addClass("disabled");
            }
            if ($(this).hasClass("sesame-option")) {
                if ($(".sesame").css("display") == "none") {
                    $(".sesame").show();
                    $(".wei-credit").hide();
                }
            } else {
                if ($(".wei-credit").css("display") == "none") {
                    $(".sesame").hide();
                    $(".wei-credit").show();
                }
            }
        });
    })
</script>
</html>