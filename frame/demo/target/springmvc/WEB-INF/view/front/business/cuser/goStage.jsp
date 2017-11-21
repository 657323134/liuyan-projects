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
<jsp:include page="/WEB-INF/view/comm/baidu_tongji_header.html"/>
<body class="go-stage">
<div class="facade">
    <img src="/images/front/5.jpg">
    <button>我要分期</button>
</div>

<input type="hidden" name="openid" value="${openid}" id="openid"/>

<div class="input-box user-data reg-input">
    <div class="data-input">
        <div class="data-left">手机号码</div>
        <input  type="text" placeholder="请输入手机号码" size="11" id="cellPhone" name="cellPhone"
               value="${cUser.cellPhone}">
    </div>
    <div class="data-input">
        <div class="data-left">验证码</div>
        <input id="send-code" class="right-ele right-ele-btn" type="button" value="获取" readOnly="true"/>
        <input type="text" class="w-54" placeholder="请输入验证码" name="validateCode" id="validateCode" value="${cUser.validateCode}">
    </div>
    <button onclick="userRegister()">注册会员</button>
</div>

<div class="tip-login">
    <p>已有平台账号？<a href="/userinfo/tologin">立即登录</a></p>
</div>

<div class="ui-footer">
    <p class="ui-footer__text">©2017 优卡分期 版权所有</p>
</div>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/front/cuser_common.js"></script>
<script>
    $(function () {
        $('.facade button').click(function () {
            $('.facade').hide();
        })
    });

    //
    //  发送短信
    //
    $("#send-code").click(function () {
        var phone = $("#cellPhone").val();
        sendMessage(phone, $("#send-code"));
    });


    function userRegister() {
        //基本信息
        var cellPhone = $("#cellPhone").val();
        if (isBlank(cellPhone)) {
            alert("手机号不能为空");
            return;
        }
        var validateCode = $("#validateCode").val();
        if (isBlank(validateCode)) {
            alert("验证码不能为空");
            return;
        }
        var openid = $("#openid").val();
        //校验手机
        $.ajax({
            url: '/cuser/userCheck',
            type: 'POST',
            data: {cellPhone: cellPhone, validateCode: validateCode},
            success: function (msg) {
                if (msg.status == 'success'){

                    //用户注册
                    $.ajax({
                        url: '/cuser/saveRegisterInfo',
                        type: 'POST',
                        data: {openid: openid, cellPhone: cellPhone},
                        success: function (msg) {
                            if (msg.status == 'success') {
                                location.href = "/cuser/baseInfoDone.htm";
                            } else {
                                alert("注册失败，请重试！");
                            }
                        }
                    });

                } else {
                    alert(msg.errmsg);
                }
            }
        });


    }


</script>
</body>
</html>