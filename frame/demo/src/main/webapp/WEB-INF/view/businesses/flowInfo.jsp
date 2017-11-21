<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<body class="flow-info">
<div class="weui-toptips weui-toptips_warn">错误提示</div>

<header>
    <a class="back-btn" href="/baccountinfo/toAccountInfoPage.do"></a>

    <div class="title">资金流水</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="weui-form-preview">
        <div class="weui-form-preview__hd">
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">交易金额</label>
                <em class="weui-form-preview__value">
                    <c:if test="${bAccountInfo.income>0}">
                        + <fmt:formatNumber value="${bAccountInfo.income}" pattern="0.00"/>
                    </c:if>
                    <c:if test="${bAccountInfo.expenditure>0}">
                        <fmt:formatNumber value="${bAccountInfo.expenditure}" pattern="0.00"/>
                    </c:if>
                </em>
            </div>
        </div>
        <div class="weui-form-preview__bd">
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">交易类型</label>
                <span class="weui-form-preview__value">${bAccountInfo.typeName}</span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">交易时间</label>
                <span class="weui-form-preview__value">${bAccountInfo.time}</span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">交易流水号</label>
                <span class="weui-form-preview__value">${bAccountInfo.tranCode}</span>
            </div>
            <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">账户余额</label>
                <span class="weui-form-preview__value"><fmt:formatNumber value="${bAccountInfo.money}"
                                                                         pattern="0.00"/></span>
            </div>
        </div>
    </div>
    <c:if test="${not empty bOrder}">
        <div class="weui-cells__title">订单信息</div>
        <div class="weui-form-preview">

            <div class="weui-form-preview__bd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">订单号</label>
                    <span class="weui-form-preview__value">${bOrder.order_num}</span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">创建时间</label>
                    <span class="weui-form-preview__value">${bOrder.order_date}</span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">商品信息</label>
                    <c:forEach items="${bOrder.goods}" var="good">
                        <span class="weui-form-preview__value">${good.goodsname} x${good.goodsNums}</span>
                    </c:forEach>
                        <%--<span class="weui-form-preview__value">汽车后视镜/智能宽屏后视镜 x1</span>--%>
                        <%--<span class="weui-form-preview__value">汽车后视镜/智能宽屏后视镜 x1</span>--%>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${not empty bWithdraw}">
        <div class="weui-cells__title">提现信息</div>
        <div class="weui-form-preview">
            <div class="weui-form-preview__bd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">提现费用</label>
                    <span class="weui-form-preview__value"><fmt:formatNumber value="${bWithdraw.fee}"
                                                                             pattern="0.00"/></span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">实际到账余额</label>
                    <span class="weui-form-preview__value"><fmt:formatNumber value="${bWithdraw.realApplyNum}"
                                                                             pattern="0.00"/></span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">提现状态</label>
                    <span class="weui-form-preview__value">
                        <c:if test="${bWithdraw.status==0}">
                            待审核
                        </c:if>
                        <c:if test="${bWithdraw.status==1}">
                            已审核
                        </c:if>
                    </span>
                </div>
            </div>
        </div>
    </c:if>
</div>

</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script>
    $(function () {

    });
</script>
</html>