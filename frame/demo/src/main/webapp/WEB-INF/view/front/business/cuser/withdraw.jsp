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
<body class="withdraw">

<header>
    <%--<a class="back-btn" href="javascript:history.back()"></a>--%>
    <a class="back-btn" href="/userinfo/myIncome"></a>
    <div class="title">提现</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">到账银行卡</label></div>
            <div class="weui-cell__bd">
                ${tUserBank.bankname}（尾号${tUserBank.bankAccount}）
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">提现金额</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input withdraw-num" type="number" placeholder="请输入提现金额"/>元
            </div>
        </div>
        <div class="weui-cell weui-cell_vcode">
            <div class="weui-cell__hd">
                <label class="weui-label">验证码</label>
            </div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="tel" id="smsCode" placeholder="请输入手机验证码">
            </div>
            <div class="weui-cell__ft">
                <button class="weui-vcode-btn " id="sendCode">获取验证码</button>
            </div>
        </div>
    </div>
    <p class="page__desc">手续费 3 元</p>

    <div class="weui-toptips weui-toptips_warn">错误提示</div>
    <a href="javascript:;" class="weui-btn ui-btn_primary" id="withdraw">提现</a>
    <input value="${phone}" type="hidden" id="bPhone"/>
</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/weui.min.js"></script>
<script>
    $(function () {
        //验证码
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

        document.getElementById("sendCode").onclick = function () {
            var phone = $("#bPhone").val();
            $.post("/userinfo/sendSms.do",
                    {phone: phone},
                    function (msg) {
                        if (msg.status == 1) {
                            $(".weui-toptips").css("display", "block").html("已发送,请查看");
                            $(".weui-toptips_warn").css("background-color", "green");

                        } else {
                            $(".weui-toptips").css("display", "block").html("发送失败请重试");
                            return false;
                        }
                    }
            );
            time(this);
        }

        $("#withdraw").click(function () {
            var smsCode = $("#smsCode").val();
            var money = $(".withdraw-num").val();
            if ('${tUserBank}' == null) {

                return false;
            }
            $.post("/cuserAccountInfo/withdrawApply.do",
                    {smsCode: smsCode, money: money},
                    function (msg) {
                        if (msg.msg == 1) {
                            $(".weui-toptips").css("display", "block").html("您输入的金额有误请重新输入");
                            $(".weui-toptips_warn").css("background-color", "#e64340");
                        } else if (msg.msg == 2) {
                            $(".weui-toptips").css("display", "block").html("验证码已过期请重新输入");
                            $(".weui-toptips_warn").css("background-color", "#e64340");
                        } else if (msg.msg == 3) {
                            $(".weui-toptips").css("display", "block").html("验证码输入错误请重新输入");
                            $(".weui-toptips_warn").css("background-color", "#e64340");
                        } else if (msg.msg == 4) {
                            $(".weui-toptips").css("display", "block").html("提现金额不能少于手续费");
                            $(".weui-toptips_warn").css("background-color", "#e64340");
                        } else if (msg.msg == 5) {
                            $(".weui-toptips").css("display", "block").html("您的余额不足以发起此次提现");
                            $(".weui-toptips_warn").css("background-color", "#e64340");
                        } else if (msg.msg == 6) {
//                            $(".weui-toptips").css("display","block").html("提现成功") ;
//                            $(".weui-toptips_warn").css("background-color","green") ;
//                            $("#withdraw").html("继续提现") ;
//                            $(".withdraw-num").val("") ;
//                            $("#smsCode").val("") ;
                            alert("提现申请成功");
                            location.href = "/userinfo/myIncome.do";
                        } else if (msg.msg == 7) {
                            $(".weui-toptips").css("display", "block").html("未绑定银行卡");
                            $(".weui-toptips_warn").css("background-color", "#e64340");
                        }
                    }
            );

        });
    });
</script>
</html>