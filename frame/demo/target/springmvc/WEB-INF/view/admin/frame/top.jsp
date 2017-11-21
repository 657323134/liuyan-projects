<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--头部开始-->
<div class="top_c">
    <div class="title">
        <span class="logo"></span>优卡分期后台管理系统
    </div>
    <%--
    <div class="top-menu">
        <ul class="top-menu-nav">
            <li><a href="/">首页</a>
            </li>
            <li><a href="#">查询界面</a></li>
            <li><a href="#">辅助信息</a></li>
        </ul>
    </div>
    --%>
    <div class="top-nav">
        <span>上午好，欢迎您，${admin.adminName }！&nbsp;&nbsp;</span>
        <a class="changepass" href="javascript:goUrl('updateBAdminPwdIndex')"></a>
        <a class="logout" href="loginOut"></a>
    </div>
</div>
<!--头部结束-->
