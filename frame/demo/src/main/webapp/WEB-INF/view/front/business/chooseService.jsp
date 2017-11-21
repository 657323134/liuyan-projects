<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
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
<body class="bg-eee">
<header>
    <a class="back-btn" href="javascript:window.history.go(-1)"></a>

    <div class="title">选择服务商</div>
    <div class="header-right"></div>
</header>
<div class="container">
    <!--    <div class="search-box">
                <input type="text" class="search-in"/>
                <div class="search-icon">搜索</div>
            </div>-->
    <ul class="service-list margin-top10">

        <c:forEach items="${cFacilitatorList}" var="cFacilitator">
            <li value="${cFacilitator.id}">${cFacilitator.facilitator_name}</li>
        </c:forEach>

        <%--<li class="checked">喜卡车联南山一店</li>--%>
        <%--<li>喜卡车联南山二店</li>--%>
    </ul>
    <div class="done-btn">完成</div>

</div>
<input type="hidden" id="product_id" value="${product_id}"/>
</body>
<script src="/js/front/jquery-1.8.3.min.js"></script>
<script>
    $(function () {
        $(".service-list li").click(function () {
            if (!$(this).hasClass("checked")) {
                $(this).addClass("checked").siblings("li").removeClass("checked");
            }
        });
    });

    $(".done-btn").click(function () {
        $(".service-list li").each(function () {
            if ($(this).hasClass("checked")) {
                var facilitator_id = $(this).val();
                var product_id = $("#product_id").val();
//        alert("/product?product_id="+product_id+"&facilitator_id="+facilitator_id);
                location.href = "/order/product?product_id=" + product_id + "&facilitator_id=" + facilitator_id;
            }
        });
    });


</script>
</html>