<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/base.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap-responsive.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/admin-all.css"/>
<script type="text/javascript" src="${basePath}/js/admin/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${basePath}/js/lion-jquery.js"></script>
<title>
    签约信息
</title>
<!--右边框架开始-->
<div class="crumbs">
    <b class="tip"></b>签约信息
</div>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">姓名</td>
        <td class="auto-style1">银行卡</td>
        <td class="auto-style1">银行名称</td>
        <td class="auto-style1">签约时间</td>
        <td class="auto-style1">签约号</td>
    </tr>
    </thead>
    <tbody>
        <c:forEach items="${signInfos}" var="bean" varStatus="st">
            <tr>
                <td>${bean.name}</td>
                <td>${bean.card_no}</td>
                <td>${bean.bank_name}</td>
                    <td><fmt:formatDate value="${bean.signDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${bean.no_agree}</td>
            </tr>
        </c:forEach>

    </tbody>
</table>

<!--右边框架结束-->