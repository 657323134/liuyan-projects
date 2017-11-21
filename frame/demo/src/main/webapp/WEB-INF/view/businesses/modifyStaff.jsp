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
<body class="modify-staff">


<header>

    <c:if test="${empty user}">
        <a class="back-btn" href="/buser/selectMyWorker.do"></a>
    </c:if>
    <c:if test="${not empty user}">
        <a class="back-btn" href="/buser/selectWorkerDetail?bUserId=${user.id}"></a>
    </c:if>

    <div class="title">
        <c:if test="${empty user}">
            添加员工
        </c:if>
        <c:if test="${not empty user}">
            更新员工
        </c:if>
    </div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">姓名</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="text" id="name"
                       <c:if test="${not empty user}">value="${user.name}"</c:if> placeholder="请输入员工姓名"/>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">手机号</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="number" id="phone"
                       <c:if test="${not empty user}">value="${user.phone}"</c:if> pattern="[0-9]*"
                       placeholder="请输入手机号"/>
            </div>
        </div>
        <div class="weui-toptips weui-toptips_warn">错误提示</div>
    </div>
    <a href="javascript:;" class="weui-btn ui-btn_primary" id="saveOrUpdate">
        <c:if test="${empty user}">
            添加员工
        </c:if>
        <c:if test="${not empty user}">
            更新员工
        </c:if>
    </a>
</div>

</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/weui.min.js"></script>
<script>
    $(function () {
        $("#saveOrUpdate").click(function () {
            var name = $("#name").val();
            var phone = $("#phone").val();
            if (name == "") {
                $(".weui-toptips_warn").css("background-color", "#e64340");
                $(".weui-toptips").css("display", "block").html("请输入员工姓名");
                return false;
            }
            if (phone == "") {
                $(".weui-toptips_warn").css("background-color", "#e64340");
                $(".weui-toptips").css("display", "block").html("请输入手机号");
                return false;
            }
            if (!isTel(phone)) {
                $(".weui-toptips_warn").css("background-color", "#e64340");
                $(".weui-toptips").css("display", "block").html("您的手机号输入有误请重新输入");
                return false;
            }
            $.post("/buser/addOrUpdateWorker.do",
                    {phone: phone, name: name, userId: '${user.id}'},
                    function (msg) {
                        if (msg == 1) {
                            $(".weui-toptips_warn").css("background-color", "#e64340");
                            $(".weui-toptips").css("display", "block").html("员工姓名和手机号不能为空！")
                        } else if (msg == 2) {
                            $(".weui-toptips_warn").css("background-color", "#e64340");
                            $(".weui-toptips").css("display", "block").html("您输入的手机号已存在请重新输入");
                            return false;
                        } else if (msg == 3) {
                            $(".weui-toptips").css("display", "block").html("操作成功！");
                            $(".weui-toptips_warn").css("background-color", "green");
                            return false;
                        }
                    }
            );

        });
    });
    function isTel(tel) {
        var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
        return reg.test(tel);
    }
</script>
</html>