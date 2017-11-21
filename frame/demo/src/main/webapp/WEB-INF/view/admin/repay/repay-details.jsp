<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/base.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap-responsive.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/admin-all.css"/>
<script type="text/javascript" src="${basePath}/js/admin/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${basePath}/js/lion-jquery.js"></script>
<title>
    还款详情
</title>
<!--右边框架开始-->
<div class="crumbs">
    <b class="tip"></b>还款详情
</div>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
            <td class="auto-style1">订单号</td>
            <td class="auto-style1">用户名</td>
            <td class="auto-style1">还款本金</td>
            <td class="auto-style1">预期还款时间</td>
            <td class="auto-style1">实际还款时间</td>
            <td class="auto-style1">还款状态</td>
            <td class="auto-style1">期数</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
            <td><a onclick="orderDetails('${bean.order_num}')">${bean.order_num } </a></td>
            <td>${bean.realName}</td>
            <td>${bean.capitalAmount}</td>
            <td>${bean.repayDate}</td>
            <td>${bean.realRepayTime}</td>
            <td>
                <c:choose>
                    <c:when test="${bean.repayStatus==1}">未还款</c:when>
                    <c:when test="${bean.repayStatus==2}">已还款</c:when>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${bean.numOfPeriods == 0}">
                        首付
                    </c:when>
                    <c:otherwise>
                        ${bean.numOfPeriods}/${bean.peroids}
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    <%-- <tr class="tr_pagenumber">
       <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit }" totalCount="${page.totalCount }" /></td>
     </tr>--%>
    </tbody>
</table>
<script type="text/javascript">

    function goUrl(url) {
        $.lionPost(url, {}, function (data) {
            window.location.href = url;
            return;
        });
    }

</script>
<!--右边框架结束-->