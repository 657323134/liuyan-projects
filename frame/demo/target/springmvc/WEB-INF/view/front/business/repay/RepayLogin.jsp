<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!DOCTYPE html>
<html class="html-100">
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
<body class="repay-login">
<div class="page__bd">
    <h1 class="page__title">优卡分期个人中心</h1>

    <div class="login-panel">
        <div class="weui-cells weui-cells_form">
            <!--手机号-->
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">手机号</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="number" id="phone" onfocus="hideFooter()" onblur="showFooter()" pattern="[0-9]*" placeholder="请输入手机号" value=""/>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">验证码</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="tel" onfocus="hideFooter()" onblur="showFooter()" placeholder="请输入验证码" id="smsCode">
                </div>
                <div class="weui-cell__ft">
                    <button class="weui-vcode-btn" id="send-code">获取验证码</button>
                </div>
            </div>
        </div>
        <div class="weui-toptips weui-toptips_warn">错误提示</div>
        <a href="javascript:;" class="weui-btn ui-btn_primary" id="loginBtn">登录</a>
        <%--<a href="javascript:;" class="weui-cells__title forget-password">忘记密码</a>--%>
    </div>
</div>
<div class="weui-footer">
    <p class="weui-footer__text">©2017 优卡分期 | 粤ICP备16073355号-2</p>
</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/weui.min.js"></script>
<script>
    $(function () {
        var wait = 60;

        function time(o) {
            if (wait == 0) {
                o.removeAttribute("disabled");
                o.value = "获取验证码";
                o.innerHTML = "获取验证码";
                wait = 60;
            } else {
                o.setAttribute("disabled", true);
                o.value = wait + "s";
                o.innerHTML = "倒计时：" + wait + "s";
                wait--;
                setTimeout(function () {
                    time(o)
                }, 1000);
            }
        }

        document.getElementById("send-code").onclick = function () {
            var phone = $("#phone").val();
            if (phone == "") {
                $(".weui-toptips").css("display", "block").html("请输入手机号");
                return false;
            }
            if (!isTel(phone)) {
                $(".weui-toptips").css("display", "block").html("您的手机号输入有误请重新输入");
                return false;
            }
            $.post("/userinfo/sendSms",
                    {phone: phone},
                    function (msg) {
                        if (msg.status == 1) {
                            $(".weui-toptips").css("display", "block").html("已发送,请查看");
                            time(document.getElementById("send-code"));
                        } else if (msg.status == 3) {
                            $(".weui-toptips").css("display", "block").html("您的手机号不存在");
                            return false;
                        } else {
                            $(".weui-toptips").css("display", "block").html("发送失败请重试");
                            return false;
                        }
                    }
            );
        }

        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            var index = $('.weui-navbar .weui-navbar__item').index($(this));
            $('.weui-tab__panel .weui-cells_form .login-type').eq(index).addClass('flex').siblings('.login-type').removeClass('flex');
        });

        $("#loginBtn").click(function () {
            var data = {};
            var phone = $("#phone").val();
            if (phone == "") {
                $(".weui-toptips").css("display", "block").html("请输入手机号");
                return false;
            }
            if (!isTel(phone)) {
                $(".weui-toptips").css("display", "block").html("您的手机号输入有误");
                return false;
            }
            var smsCode = $("#smsCode").val();
            if (smsCode == "") {
                $(".weui-toptips").css("display", "block").html("请输入验证码");
                return false;
            }
            data = {phone: phone, smscode: smsCode};
            $.post("/userinfo/cUserLogin.do",
                    data,
                    function (msg) {
                        if (msg == 1) {
                            //location.href = "/order/orderlist.do" ;
                            location.href = "/userinfo/personCenter.do";
                        } else if (msg == 2) {
                            $(".weui-toptips").css("display", "block").html("验证码错误,请重新输入");
                            return false;
                        } else if (msg == 3) {
                            $(".weui-toptips").css("display", "block").html("您输入的手机号不存在");
                            return false;
                        }
                    }
            );
        });
    });


    function hideFooter(){
        $(".weui-footer").hide();
    }
    function showFooter(){
        $(".weui-footer").show();
    }

//    验证手机号
    function isTel(tel) {
        var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
        return reg.test(tel);
    }
</script>
</html>