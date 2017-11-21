<link href="images/favicon.ico" type="image/x-icon" rel=icon/>
<link href="images/favicon.ico" type="image/x-icon" rel="shortcut icon"/>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!-- 公用CSS部分 -->
<link rel="stylesheet" href="css/common.css" type="text/css"/>
<link rel="stylesheet" href="css/page.css" type="text/css"/>
<link rel="stylesheet" href="css/css.css" type="text/css"/>
<!--[if IE]>
<script src="js/html5.js" type="text/javascript"></script>
<script src="js/excanvas.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
<script src="js/DD_belatedPNG.js"></script>
<script>
DD_belatedPNG.fix('*','.tran');
</script>
<![endif]-->
<header>
    <div class="wrapTopBg">
        <div class="wrapTop">
            <span class="tel">400 - 808 - 3900</span> <span class="rig"><c:choose>
            <c:when test="${null==sessionScope.user}">
                <a href="regIndex.html">免费注册</a>
                <a href="loginIndex.html">登 录</a>
            </c:when>
            <c:otherwise>
                <a href="center/selectUserIndex.html" class="top_user tran">${sessionScope.user.cellPhone}</a>
                <a href="loginOut.html">退出登录</a>
            </c:otherwise>
        </c:choose><a href="helpInfo.html">帮助中心</a>
			</span>
        </div>
    </div>
    <div class="header">
        <div class="logo">
            <a href="${path }"><img src="images/logo.png">
            </a>
        </div>
        <div class="kouhao"><img src="images/index/kouhao.png"/></div>
        <div class="nav">
            <ul>
                <li id="vpHead1"><a href="${path }">首 页</a>
                </li>
                <li id="vpHead2"><a href="borrowList.html">我要投资</a>
                </li>
                <!-- <li><a href="borrowList.html">新手理财</a></li> -->
                <li id="vpHead3"><a href="safe.html">安全保障</a>
                </li>
                <li id="vpHead4"><a href="aboutus.html">关于我们</a>
                </li>
            </ul>
        </div>
    </div>

</header>
