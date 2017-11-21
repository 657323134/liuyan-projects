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
<body class="view-staff">
<header>
    <a class="back-btn" href="/buser/selectMyWorker.do"></a>

    <div class="title">查看员工信息</div>
    <div class="header-right"><a href="/buser/addWorker?bUserId=${user.id}">编辑</a></div>
</header>

<div class="page__bd container">
    <div class="weui-cells">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <p>姓名</p>
            </div>
            <div class="weui-cell__ft">${user.name}
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <p>手机号</p>
            </div>
            <div class="weui-cell__ft">${user.phone}
            </div>
        </div>
    </div>

    <div class="weui-toptips weui-toptips_warn">错误提示</div>

    <div class="weui-flex">
        <div class="weui-flex__item">
            <div class="placeholder">
                <a href="javascript:;" class="weui-btn weui-btn_default" id="frozenWorker">
                    <c:if test="${user.isEnable==0}">
                        冻结员工
                    </c:if>
                    <c:if test="${user.isEnable==1}">
                        解冻员工
                    </c:if>
                </a>
            </div>
        </div>
        <div class="weui-flex__item">
            <div class="placeholder">
                <a href="javascript:;" class="weui-btn weui-btn_default" id="deleteWorker">删除员工</a>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/weui.min.js"></script>
<script>
    $(function () {
        $("#frozenWorker").click(function () {
            $.post("/buser/frozenWorker.do",
                    {userId: '${user.id}'},
                    function (msg) {
                        if (msg == 1) {
                            $(".weui-toptips_warn").css("background-color", "#e64340");
                            $(".weui-toptips").css("display", "block").html("请重试！")
                        } else if (msg == 2) {
                            $(".weui-toptips_warn").css("background-color", "#e64340");
                            $(".weui-toptips").css("display", "block").html("该用户不存在！");
                        } else if (msg == 3) {
                            $(".weui-toptips").css("display", "block").html("操作成功！");
                            $(".weui-toptips_warn").css("background-color", "green");
                        }
                    }
            );
        });
        $("#deleteWorker").click(function () {
            $(".weui-toptips_warn").css("background-color", "#e64340");
            $.post("/buser/deleteWorker.do",
                    {userId: '${user.id}'},
                    function (msg) {
                        if (msg == 1) {
                            $(".weui-toptips").css("display", "block").html("请重试！")
                        } else if (msg == 2) {
                            $(".weui-toptips").css("display", "block").html("该用户不存在！");
                        } else if (msg == 3) {
                            $(".weui-toptips").css("display", "block").html("操作成功！");
                            $(".weui-toptips_warn").css("background-color", "green");
                        }
                    }
            );
        });
    });
</script>
</html>