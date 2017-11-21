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
</head>
<body class="bg-eee">
<div class="login-box">
    <label>手机号：</label>
    <input type="text" id="phone" value=""/>
    <label>验证码:</label>
    <span id="code"></span>
    <br>
    <input type="button" value="查询" id="serach-btn"/>
</div>
<script src="/js/front/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $("#serach-btn").click(function () {

        var phone = $("#phone").val();

        if (phone == '') {
            alert("手机号不为空");
            return;
        }

        $.ajax({
            type: 'post',
            url: '/userinfo/getsms',
            data: {
                phone: phone
            },
            success: function (data) {
                $("#code").html(data.code);
            }
        });

    });

</script>
</body>
</html>
