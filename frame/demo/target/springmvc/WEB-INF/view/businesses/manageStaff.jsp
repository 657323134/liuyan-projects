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
<body class="manage-staff">
<div class="weui-toptips weui-toptips_warn">错误提示</div>

<header>
    <a class="back-btn" href="/buser/toBUserSettingPage.do"></a>

    <div class="title">管理员工账户</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="ui-float">
        <c:forEach items="${bUsers}" var="user">
            <div class="ui-float__item">
                <a href="/buser/selectWorkerDetail?bUserId=${user.id}">
                    <div class="avator-img">
                        <img src="/images/businesses/1.png"/>
                    </div>
                    <h3>${user.name}</h3>
                    <h4>${user.phone}</h4>
                </a>
            </div>
        </c:forEach>
        <%--<div class="weui-flex__item"><div class="placeholder">--%>
        <%--<div class="avator-img">--%>
        <%--<img src="/images/businesses/1.png" />--%>
        <%--</div>--%>
        <%--<h3>张三</h3>--%>
        <%--<h4>15834947869</h4>--%>
        <%--</div></div>--%>
        <%--<div class="weui-flex__item"><div class="placeholder">--%>
        <%--<div class="avator-img">--%>
        <%--<img src="/images/businesses/1.png" />--%>
        <%--</div>--%>
        <%--<h3>张三</h3>--%>
        <%--<h4>15834947869</h4>--%>
        <%--</div></div>--%>
        <div class="ui-float__item add-staff-item">
            <a href="/buser/addWorker">
                <div class="add-staff-btn">
                    +
                </div>
                <h3>添加员工</h3>
            </a>
        </div>
    </div>
</div>
</body>
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/weui.min.js"></script>
<script>
    $(function () {

    });
</script>
</html>