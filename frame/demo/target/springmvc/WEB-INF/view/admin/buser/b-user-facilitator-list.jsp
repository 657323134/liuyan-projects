<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>用户列表
</div>
<input type="hidden" value="${backUrl}" id="backUrl"/>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">序号</td>
        <td class="auto-style1">店名</td>
        <td class="auto-style1">地址</td>
        <td class="auto-style1">电话</td>
        <td class="auto-style1">联系人</td>
        <td class="auto-style1">操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
            <td><a>${bean.id } </a></td>
            <td> ${bean.facilitator_name} </td>
            <td>${bean.facilitator_address}</td>
            <td> ${bean.failitator_phone}</td>
            <td> ${bean.failitator_contacts}</td>
            <td>
                    <%--<input class="btn btn-inverse" type="button" value="修改" onclick="goUrl('updateBUserIndex?id=${bean.id}');" />&nbsp;--%>
                <input class="btn btn-inverse" type="button" value="查看"
                       onclick="goUrl('queryCFacilitatorIndex?id=${bean.id}');"/>&nbsp;
            </td>
        </tr>
    </c:forEach>
    <tr class="tr_pagenumber">
        <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit }"
                                    totalCount="${page.totalCount}"/></td>
    </tr>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="6">
            <input class="btn btn-inverse" id="btnBack" type="button" onclick="goBack()" value="返回"/>
        </td>
    </tr>
    </tfoot>
</table>

<script type="text/javascript">
    function goBack() {
        var backUrl = $("#backUrl").val();
        if (backUrl != '' && backUrl != null) {
            goUrl(backUrl);
        } else {
            goUrl("queryBUserList");
        }
    }

</script>