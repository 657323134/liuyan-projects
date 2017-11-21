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
<body class="bg-eee">
<header>
    <a class="back-btn" href="index.html"></a>

    <div class="title">等待审核</div>
    <div class="header-right"></div>
</header>
<div class="container show-data by-stage">
    <!--步骤条-->
    <div class="steps-bar">
        <div class="sui-steps-round steps-round-auto steps-5">
            <div class="finished">
                <div class="wrap">
                    <div class="round">1</div>
                    <div class="bar"></div>
                </div>
                <label>提交资料</label>
            </div>
            <div class="finished">
                <div class="wrap">
                    <div class="round">2</div>
                    <div class="bar"></div>
                </div>
                <label>芝麻信用</label>
            </div>
            <div class="current">
                <div class="wrap">
                    <div class="round">3</div>
                    <div class="bar"></div>
                </div>
                <label>等待审核</label>
            </div>
            <div class="todo">
                <div class="wrap">
                    <div class="round">4</div>
                    <div class="bar"></div>
                </div>
                <label>商户识别</label>
            </div>
            <div class="todo last">
                <div class="wrap">
                    <div class="round">5</div>
                </div>
                <label>申请成功</label>
            </div>
        </div>
    </div>
    <!--等待审核-->
    <div class="input-box audit">
        <c:if test="${tAuditInfo.status == 1}">
            <figure class="wait">
                <img src="/images/front/waiting.svg" width="80" height="80"/>

                <p>您提交的资料正在审核中<br>
                    请耐心等待3-5分钟，非工作时间第二天审核
                </p>
            </figure>
            <span class="next-btn">刷新查看审核状态</span>
        </c:if>
        <%--<c:if test="${tAuditInfo.status == 2}">--%>
        <figure class="gohead">
            <img src="/images/front/success.svg" width="80" height="80"/>

            <p>太棒了您的资料已经通过审核<br>
                可立即前往下一步
            </p>
        </figure>
        <%--</c:if>--%>
        <c:if test="${tAuditInfo.status == 3}">
            <figure class="gohead">
                <img src="/images/front/false.svg" width="80" height="80"/>

                <p>未通过审核<br>
                    重新修改后再提交
                </p>
            </figure>
        </c:if>

    </div>

    <%--<a class="next-btn <c:if test="${tAuditInfo.status == 1 }">grey</c:if> "--%>
    <%--<c:if test="${tAuditInfo.status == 1 }"></c:if>--%>
    <%--<c:if test="${tAuditInfo.status == 2 }">href="/cuser/identify.htm?action=pass"</c:if>--%>
    <%--<c:if test="${tAuditInfo.status == 3 }">href="/cuser/cuser.htm?action=update"</c:if>--%>
    <%-->下一步</a>--%>

    <a class="next-btn" href="/demoshow/identify.htm">下一步</a>

</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
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