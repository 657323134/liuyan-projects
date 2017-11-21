<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>品牌商列表
</div>
<form id="searchForm" action="queryBrandUserList">
    <table class="table table-striped table-bordered search-table">
        <thead>
        <tr>
            <td colspan="10" class="auto-style2">&nbsp;请填写查询条件
                <input id="curPage" name="curPage" type="hidden" value="1"/>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>品牌商账户手机号</td>
            <td>
                <input id="phone" name="phone" class="dinp" type="text" value="${model.phone }"/>
            </td>
            <td>品牌商账户名</td>
            <td>
                <input id="name" name="name" class="dinp" type="text" value="${model.name }"/>
            </td>
            <%--  <td>是否禁用</td>--%>
        </tr>
        <tr>
            <td colspan="10" align="right">
                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>
                <input class="btn btn-inverse" type="button" onclick="goUrl('addBrandUserIndex')" value="添加"/>&nbsp;
            </td>
        </tr>
        </tbody>
    </table>
</form>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">

        <td class="auto-style1">序号</td>
        <td class="auto-style1">品牌商编号</td>
        <td class="auto-style1">品牌账户名</td>
        <td class="auto-style1">品牌商账户手机号</td>
        <td class="auto-style1">品牌商法人姓名</td>
        <td class="auto-style1">品牌商法人身份证号</td>
        <td class="auto-style1">法人手机号码</td>
        <td class="auto-style1">账户余额</td>
        <td class="auto-style1">操作</td>
    </tr>
    </thead>
    <tbody>
    <c:set var="dataIndex"></c:set>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <c:set var="dataIndex" value="${dataIndex+1}"></c:set>
        <tr>
            <td>${dataIndex}</td>
            <td> ${bean.id } </td>
            <td>${bean.name}</td>
            <td>${bean.phone}</td>
            <td>${bean.corporate_name}</td>
            <td>${bean.corporate_cardid}</td>
            <td>${bean.corporate_phone}</td>
            <td>${bean.cashbalance}</td>
            <td>
                <c:if test="${bean.storeId == null}">
                    <input class="btn btn-inverse" type="button" value="修改品牌商"
                           onclick="goUrl('updateBrandUserIndex?id=${bean.id}');"/>&nbsp;

                    <input class="btn btn-inverse" type="button" value="开通门店"
                           onclick="goUrl('addBrandStoreIndex?id=${bean.id}');"/>
                </c:if>
                <c:if test="${bean.storeId != null}">
                    <input class="btn btn-inverse" type="button" value="修改品牌商"
                           onclick="goUrl('updateBrandUserIndex?id=${bean.id}');"/>&nbsp;

                    <input class="btn btn-inverse" type="button" value="修改直营门店"
                           onclick="goUrl('updateBrandStoreIndex?bStoreId=${bean.storeId}&brandId=${bean.id}');"/>
                </c:if>
                &nbsp;
                <input class="btn btn-inverse" type="button" value="编辑附件"
                       onclick="goUrl('editImages?id=${bean.id}&url=queryBrandUserList');"/>&nbsp;
            </td>
        </tr>
    </c:forEach>
    <tr class="tr_pagenumber">
        <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit }"
                                    totalCount="${page.totalCount }"/></td>
    </tr>
    </tbody>
</table>
<script type="text/javascript">
    <!--
    $(function () {
        $(".isEnableCls").val('${model.isEnable}');
    });
    //-->
</script>
