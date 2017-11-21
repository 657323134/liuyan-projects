<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <title>变更还款计划测试页面</title>

</head>
<body class="bg-eee">
订单id<input type="text" name="order_id" id="order_id">
<br>
（请修改数据库还款计划日期后再变更还款计划）
<input type="button" id="changePayPlan" value="变更还款计划">

<input type="button" id="startQuartz" value="执行一次定时任务">
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    //更改还款计划
    $("#changePayPlan").click(function () {
        $.ajax({
            type: "POST",
            url: "/payQuartz/changePay?order_id=" + $("#order_id").val(),
            success: function (data, textStatus) {
                if (data.status == '1') {
                    alert("变更还款计划成功");
                } else {
                    alert("变更还款计划失败");
                }
            }
        });
    });
    //执行一次定时任务
    $("#startQuartz").click(function () {
        $.ajax({
            type: "POST",
            url: "/payQuartz/autoPeriodizationPay?order_id=" + $("#order_id").val(),
            success: function (data, textStatus) {
                alert("请后台查看日志扣款是否成功");
            }
        });
    });
</script>
</html>