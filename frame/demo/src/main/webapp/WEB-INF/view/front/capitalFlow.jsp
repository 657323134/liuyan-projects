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
    <title>资金流水-优卡分期</title>
    <link rel="stylesheet" href="/css/front/common.css">
    <link rel="stylesheet" href="/css/businesses/weui.min.css">
    <link rel="stylesheet" href="/css/front/bonusRecord.css">
    <style>
        .capital-flow .page__bd .weui-media-box span {
            float: right;
            color: #666;
        }

        .capital-flow .blank {
            margin: 20% auto;
            display: none;
        }

        .capital-flow .blank img {
            margin: 0% auto;
            display: block;
        }

        .capital-flow .blank figcaption {
            text-align: center;
            font-size: 18px;
            color: #999;
        }
    </style>
</head>
<body class="capital-flow">

<header>
    <a class="back-btn" href="javascript:history.back()"></a>

    <div class="title">资金流水</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="weui-panel weui-panel_access">
        <%--<div class="weui-panel__hd">文字组合列表</div>--%>

        <!--空白提示-->
        <%--<img class="blank" style="display: none;" src="/images/front/bonus-blank.svg" alt="暂无分享"/>--%>
        <figure class="blank">
            <img src="/images/front/order-blank.svg" alt="暂无还款记录" width="240" height="176">
            <figcaption>暂无还款记录</figcaption>
        </figure>

        <div class="weui-panel__bd">

                <c:forEach items="${pageBean}" var="flow">
                    <div class="weui-media-box weui-media-box_text">
                    <h4 class="weui-media-box__title">${flow.explan}<span>
                        <c:choose>
                            <c:when test="${flow.income gt 0}">
                                + <fmt:formatNumber pattern="0.00" value="${flow.income}"></fmt:formatNumber>
                            </c:when>
                            <c:when test="${flow.expenditure gt 0}">
                                - <fmt:formatNumber pattern="0.00" value="${flow.expenditure}"></fmt:formatNumber>
                            </c:when>
                            <c:when test="${flow.income == 0}">
                                + <fmt:formatNumber pattern="0.00" value="${flow.expenditure}"></fmt:formatNumber>
                            </c:when>
                        </c:choose>
                    </span></h4>
                    <p class="weui-media-box__desc">${flow.time}</p>
                    </div>
                </c:forEach>

        </div>
        <%--<div class="weui-panel__ft">--%>
        <%--<a href="javascript:void(0);" class="weui-cell weui-cell_access weui-cell_link">--%>
        <%--<div class="weui-cell__bd">查看更多</div>--%>
        <%--&lt;%&ndash;<span class="weui-cell__ft"></span>&ndash;%&gt;--%>
        <%--</a>--%>
        <%--</div>--%>
    </div>
</div>

</body>
<%--<script src="/js/jquery-1.8.3.min.js"></script>--%>
</html>
