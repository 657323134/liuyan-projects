<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>资金流水列表
</div>
<form id="searchForm" action="accountInfoList">
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
            <td>开始时间</td>
            <td>
                <input id="beginTm" name="beginTm" class="dinp" type="date" value="${beginTm}"/>
            </td>
            <td>结束时间</td>
            <td>
                <input id="endTm" name="endTm" class="dinp" type="date" value="${endTm}"/>
            </td>
            <td colspan="6"></td>
        </tr>
        <tr>
            <td colspan="10" align="right">
                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>
            </td>
        </tr>
        </tbody>
    </table>
</form>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <%--<td class="auto-style1">公司名称</td>--%>
        <td class="auto-style1">收入</td>
        <td class="auto-style1">支出</td>
        <td class="auto-style1">交易类型</td>
        <td class="auto-style1">可用余额</td>
        <td class="auto-style1">时间</td>
    </tr>
    </thead>
    <tbody>
    <c:set var="dataIndex"></c:set>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <c:set var="dataIndex" value="${dataIndex+1}"></c:set>
        <tr>
                <%--<td>${dataIndex}</td>--%>
            <td> ${bean.income } </td>
            <td>${bean.expenditure}</td>
            <td>${bean.explan}</td>
            <td>${bean.money}</td>
            <td>${bean.time}</td>
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
    //默认皮肤
    //-->
</script>
<!--右边框架结束-->