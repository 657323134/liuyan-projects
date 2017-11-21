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
<div class="logo">
    <img src="/css/images/front/logo.png"/>
</div>
<div class="login-box">
    <form action="/userinfo/login" id="loginform">
        <input type="hidden" name="state" value="${state}"/>

        <div class="login-list">
            <div class="login-icon phone-icon"></div>
            <input class="login-in" type="text" placeholder="请输入手机号" id="phone" name="phone"/>
        </div>
        <div class="login-list">
            <div class="login-icon code-icon"></div>
            <input class="login-in" type="text" placeholder="请输入验证码" id="smscode" name="smscode"/>
            <input id="send-code" class="send-code" type="text" value="获取验证码" readOnly="true"/>
        </div>
        <div class="login-btn">登录</div>
    </form>
</div>
<script src="/js/front/jquery-1.8.3.min.js"></script>
<c:if test="${ not empty msg}">
    <script type="text/javascript">
        alert('${msg}');
    </script>
</c:if>
<script type="text/javascript">
    $(".login-btn").click(function () {
        var phone = $("#phone").val();
        if (phone == null || phone == '') {
            alert("手机号不能为空!");
            return;
        }
        var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
        if (reg.test(phone) == false) {
            alert("手机号格式有误!");
            return;
        }
        var smscode = $("#smscode").val();
        if (smscode == null || smscode == '') {
            alert("验证码不能为空!");
            return;
        }

        $("#loginform").submit();
    });

    /****发送手机验证码****/
        // 第一步 发送验证码
    $("#send-code").click(function () {
        var phone = $("#phone").val();
        if (phone == null || phone == '') {
            alert("手机号不能为空!");
            return;
        }
        var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
        if (reg.test(phone) == false) {
            alert("手机号格式有误!");
            return;
        }
        var $this = $(this);
        $.ajax({
            type: 'post',
            url: '/userinfo/sendSms',
            data: {
                phone: phone
            },
            success: function (data) {
                if (data.status == "1") {
                    SendSmsCode.init($this);
                } else {
                    alert("系统繁忙，稍后再试！");
                }
            }
        });
    });


    var SendSmsCode = {
        smsobj: null,
        count: 120,
        start: function () {
            this.count = this.count - 1;
            if (this.count > 0) {
                this.smsobj.attr("value", this.count + "秒后重新获取");
                this.smsobj.attr("disabled", "true");
                var _this = this;
                setTimeout(function () {
                    _this.start();
                }, 1000);
            } else {
                this.smsobj.removeAttr("disabled");
                this.smsobj.attr("value", "获取验证码");
                this.count = 120;
            }
        },
        //初始化
        init: function (smsobj) {
            this.smsobj = smsobj;
            this.smsobj.attr("disabled", "true");
            this.start();
        }
    };


</script>
</body>
</html>
