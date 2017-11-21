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
    <link rel="stylesheet" href="/css/front/swiper.3.1.2.min.css">
</head>
<body class="store-list">
<div class="choose-address">您当前选择&nbsp;&nbsp;<strong>深圳市</strong>
    <!--&nbsp;&nbsp;<span >切换</span>-->
</div>
<ul class="list">
    <c:forEach items="${pageBean}" var="store">
        <li>
            <p>${store.facilitator_name}</p>

            <p><span></span>${store.facilitator_address}</p>

            <p><span></span>${store.failitator_phone}(${store.failitator_contacts})</p>
        </li>
    </c:forEach>
</ul>
</body>
<script src="js/jquery-1.8.3.min.js"></script>
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