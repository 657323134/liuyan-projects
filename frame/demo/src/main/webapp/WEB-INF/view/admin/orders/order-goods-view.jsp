<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/base.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap-responsive.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/admin-all.css"/>
<script type="text/javascript" src="${basePath}/js/admin/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${basePath}/js/lion-jquery.js"></script>
<title>
    订单商品
</title>
<!--右边框架开始-->
<div class="crumbs">
    <b class="tip"></b>商品列表
</div>
<form id="searchForm" action="queryTGoodsList">
    <input id="orderid" class="dinp" name="orderid" type="hidden" value="${orderid}"/>

</form>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <%--
            <td class="auto-style1">序号</td>
        --%>
        <td class="auto-style1">商品名称</td>
        <td class="auto-style1">商品价格</td>
        <td class="auto-style1">商品图片</td>
        <td class="auto-style1">商品类型</td>
        <td class="auto-style1">商品描述</td>
        <td class="auto-style1">首付金额</td>
        <td class="auto-style1">数量</td>
        <td class="auto-style1">操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
                <%--   <td><a>${bean.id } </a>
                   </td>--%>
            <td>${bean.goodsname}</td>
            <td> ${bean.goodsprice} </td>
            <td><a href="${resourceURL}${bean.goodsimage}" target="_blank" style="cursor: pointer;color: #08c">查看图片</a>
            </td>
            <td>
                <c:choose>
                    <c:when test="${bean.goodstype==1 }">种类1</c:when>
                    <c:when test="${bean.goodstype==2 }">种类2</c:when>
                    <c:otherwise>未知</c:otherwise>
                </c:choose>
            </td>
            <td>${bean.goodsremak}</td>
            <td>${bean.downpayment}</td>
            <td> ${bean.goodsNum} </td>

            <td>
                <input class="btn btn-inverse" type="button" value="查看"
                       onclick="goUrl('queryGoodDetailView?id=${bean.id}&orderId=${orderId}');"/>&nbsp;
                <input class="btn btn-inverse" type="button" value="商品详情图片"
                       onclick="goUrl('queryGoodsPicsView?id=${bean.id}&orderId=${orderId}');"/>&nbsp;
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