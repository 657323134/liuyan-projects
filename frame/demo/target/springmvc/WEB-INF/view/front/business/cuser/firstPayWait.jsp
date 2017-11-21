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
    <style>
        #show {
            display: block;
            font-size: 24px;
            color: #fff;
            margin: 50% auto;
            text-align: center;
        }
    </style>
</head>
<script src="/js/jquery-1.8.3.min.js"></script>
<body class="">
<div class="pop-up" style="display:block;"><span id="show">处理中，请等待......</span></div>
<script type="text/javascript">
    var t = 5;//设定跳转的时间
    setInterval("refer()", 1000); //启动1秒定时
    function refer() {
        if (t == 0) {
            window.location.href = "/PeriodizationPayNotify/firstPayWaitCommit"; //#设定跳转的链接地址
        }
        t--; // 计数器递减
    }
</script>

</body>

</html>
