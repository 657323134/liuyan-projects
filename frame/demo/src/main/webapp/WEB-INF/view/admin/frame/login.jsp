<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>后台管理系统</title>
    <meta charset="utf-8"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="This is my page">

    <script type="text/javascript" src="${basePath}/js/admin/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="${basePath}/js/Validform_v5.3.2_min.js"></script>

    <%--<link href="${basePath}/css/Default.css" type=text/css rel=stylesheet>--%>
    <%--<link href="${basePath}/css/xtree.css" type=text/css rel=stylesheet>--%>
    <link href="${basePath}/css/User_Login.css" type=text/css rel=stylesheet>
</head>

<body class="userlogin-body">
<h1 class="title">深圳市优卡分期科技有限公司城市运营平台</h1>

<div id="user_login">
    <form action="adminLogin" id="editForm">
        <c:if test="${logo !=null && logo !=''}">
            <div class="coop-logo">
                <img src="/images/admin/coop-logo/iroadking.jpg" alt="logo"/>
                <img src="/images/logo.svg" alt="logo"/>
            </div>
        </c:if>

        <c:if test="${logo ==null || logo ==''}">
            <div class="logo">
                <img src="/images/logo.svg" alt="logo"/>
            </div>
        </c:if>

        <div class="input-cell user">
            <span></span>
            <input type="text" name="adminName" placeholder="请输入账户名"/>
        </div>
        <div class="input-cell pass">
            <span></span>
            <input type="password" name="pwd" placeholder="请输入账户密码"/>
        </div>
        <div id="btnLogin" type="submit">登录</div>
    </form>

</div>
<footer>Copyright ©2017 深圳市优卡分期科技有限公司 版权所有</footer>
<script type="text/javascript">
    $('.input-cell input').focus(function () {
        $(this).parent('.input-cell').addClass('hover').siblings().removeClass('hover');
    })

    var valiForm = $("#editForm").Validform({
        btnSubmit: "#btnLogin",
        tiptype: function (msg, o, cssctl) {
            var objtip = $("#errorMsg");
            cssctl(objtip, o.type);
            objtip.text(msg);
        },
        postonce: true,
        ajaxPost: true,
        callback: function (data) {
            if (data.status == 'y') {
                window.location.href = "toMain";
            } else {
                alert(data.info);
            }
        }
    });
    $.Tipmsg.r = "";
</script>
</body>
</html>
