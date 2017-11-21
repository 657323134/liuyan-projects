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
    <title>优卡分期</title>
    <link rel="stylesheet" href="/css/front/common.css">
    <link rel="stylesheet" href="/css/front/style.css">
</head>
<body class="bg-eee">
<div class="title-img">
    <img src="/css/images/front/banner1.png"/>
</div>
<ul class="project-box">
    <c:forEach items="${tGoodsList}" var="tgoods">
        <li onclick="window.location.href='/order/product?product_id=${tgoods.id}'">
                <%--<a href="/order/product?product_id=${tgoods.id}" style="width:100%;height: 108px;display: block">--%>
                <%--<div class="project-left"><img src="/css/images/front/project-title-img.png"/></div>--%>
            <div class="project-left"><img src="/imgs${tgoods.goodsimage}"/></div>
            <div class="project-right">
                <p class="p1">${tgoods.goodsname}</p>

                <p class="p2">${tgoods.goodsremak}</p>

                <p class="p3">月供：¥<fmt:formatNumber type="number" value="${(tgoods.goodsprice-tgoods.downpayment)/6}" pattern="0.00"/> x 6期 </p>

                <div class="project-op">
                    <div class="op-price">￥${tgoods.goodsprice}</div>
                    <a class="to-repayment">我要分期</a>
                </div>
            </div>
                <%--</a>--%>
        </li>
    </c:forEach>
</ul>

</body>
</html>
