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

    <script>
        function modifyInfo(userId) {
            window.location.href="/cuser/queryBaseInfo?userId=" + userId;
        }
    </script>
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
 </div>
    <!--等待审核-->
    <c:if test="${auditStatus==3}">
        <div class="input-box audit">

            <div class="tubiao-x">X</div>
            <div class="shbtg">
                <span class="shbtg-span">授信不通过</span>
            </div>
            <div class="shbtg-d"><p>很抱歉，您提交的个人资料不符合授信条件，感谢您的选择优卡分期！</p></div>
        </div>

        <a class="next-btn" style="background: #999999">下一步</a>
    </c:if>

    <c:if test="${auditStatus==4}">
        <div class="input-box audit">

            <div class="tubiao-x">X</div>
            <div class="shbtg">
                <span class="shbtg-span">审核不通过</span>
            </div>
            <div class="shbtg-d"><p>您提交的资料不符合标准请修改后重新提交！</p></div>
        </div>

        <a class="next-btn" onclick="modifyInfo('${userId}');">修改资料</a>
    </c:if>



</div>
</body>


</html>