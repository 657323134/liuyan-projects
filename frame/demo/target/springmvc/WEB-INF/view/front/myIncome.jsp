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
    <title>我的收入-优卡分期</title>
    <link rel="stylesheet" href="/css/businesses/weui.min.css">
    <link rel="stylesheet" href="/css/front/common.css">
    <style>
        .my-income .my-money {
            background-image: linear-gradient(45deg, #f82e42 0%, #fa6977 100%);
            overflow: hidden;
        }

        .my-income .my-money .weui-cells__title {
            font-size: 18px;
            color: #ffcbd0;
        }

        .my-income .my-money .money-num {
            line-height: 60px;
            font-size: 20px;
            padding-left: 20px;
            color: #fff;
        }

        .my-income .my-money .money-num strong {
            font-size: 40px;
            margin-right: 10px;
        }

        .my-income .page__bd .weui-cells:first-child {
            margin-top: 0px;
        }

        .my-income span.tip {
            border: 1px solid #ef2034;
            color: #ef2034;
            border-radius: 3px;
            padding: 0 5px;
            font-size: 14px;
        }

        .my-income span.ico {
            width: 25px;
            height: 25px;
            display: block;
            background-image: url("/images/front/income-ico.png");
            background-repeat: no-repeat;
            background-size: 221px 27px;
            margin-right: 5px;
        }

        .my-income .withdraw-ico {
            background-position: 0px 0px;
        }
        .my-income .manage-card-ico {
            background-position: -197px 0px;
        }
        .my-income .gift-ico {
            background-position: -97px 0px;
        }

        .my-income .flow-ico {
            background-position: -27px 0px;
        }
    </style>
</head>
<body class="my-income">
<div class="weui-toptips weui-toptips_warn">错误提示</div>

<header>
    <a class="back-btn" href="/userinfo/personCenter.do"></a>

    <div class="title">我的收入</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">

    <div class="weui-cells">

        <div class="my-money">
            <div class="weui-cells__title">
                可提现金额(元)
            </div>
            <c:if test="${cUserfundinfo == null}">
                <div class="money-num"><strong>  <fmt:formatNumber pattern="0.00" value="0.00"></fmt:formatNumber></strong></div>
            </c:if>
            <c:if test="${cUserfundinfo != null}">
                <div class="money-num"><strong>  <fmt:formatNumber pattern="0.00" value="${cUserfundinfo.cashBalance}"></fmt:formatNumber></strong></div>
            </c:if>
        </div>

        <a class="weui-cell weui-cell_access" href="/cuserAccountInfo/toWithdrawPage.do?ben=2">
            <div class="weui-cell__hd">
                <span class="ico withdraw-ico"></span>
            </div>
            <div class="weui-cell__bd">
                <p>提现</p>
            </div>
            <div class="weui-cell__ft">
            </div>
        </a>
        <a class="weui-cell weui-cell_access" href="/cuserAccountInfo/manageCar?ben=1"> <%--如果未绑定链接地址为：/order/bindCard--%>
            <div class="weui-cell__hd">
                <span class="ico manage-card-ico"></span>
            </div>
            <div class="weui-cell__bd">
                <p>管理银行卡</p>
            </div>
            <div class="weui-cell__ft">
                <c:if test="${bind!=null}">
                    <span class="tip">${bind}</span>
                </c:if>
            </div>
        </a>
    </div>
    <div class="weui-cells">
        <%--<a class="weui-cell weui-cell_access" href="/userinfo/bonusRecord">
            <div class="weui-cell__hd">
                <span class="ico gift-ico"></span>
            </div>
            <div class="weui-cell__bd">
                <p>分享有礼</p>
            </div>
            <div class="weui-cell__ft">
                <span class="tip">现金奖励</span>
            </div>
        </a>--%>
        <a class="weui-cell weui-cell_access" href="/cuserAccountInfo/accountFlow">
            <div class="weui-cell__hd">
                <span class="ico flow-ico"></span>
            </div>
            <div class="weui-cell__bd">
                <p>资金流水</p>
            </div>
            <div class="weui-cell__ft">
            </div>
        </a>
    </div>

</div>
</body>
<%--<script src="/js/jquery-1.8.3.min.js"></script>--%>
</html>
