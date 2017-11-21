<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>用户列表
</div>
<form id="searchForm" action="queryAgentBUserList">
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
            <td>手机号码</td>
            <td>
                <input id="phone" name="phone" class="dinp" type="text" value="${model.phone }"/>
            </td>
            <td>代理人姓名</td>
            <td>
                <input id="name" name="name" class="dinp" type="text" value="${model.name }"/>
            </td>
            <td>是否禁用</td>
            <%--  <td>
                <select name="isEnable" id="isEnable" class="isEnableCls">
                  <option value="">--请选择--</option>
                  <option value="0">不禁用</option>
                  <option value="1">禁用</option>
                </select>
              </td>--%>
        </tr>
        <tr>
            <td colspan="10" align="right">
                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>
                <%--
                        <input class="btn btn-inverse" type="button" onclick="goUrl('addAgentUserIndex')" value="添加" />&nbsp;
                --%>
            </td>
        </tr>
        </tbody>
    </table>
</form>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">序号</td>
        <td class="auto-style1">代理商编号</td>
        <td class="auto-style1">公司名称</td>
        <td class="auto-style1">账户名</td>
        <td class="auto-style1">手机号</td>
        <td class="auto-style1">代理产品数</td>
        <td class="auto-style1">流水分红</td>
        <td class="auto-style1">是否自销</td>
        <td class="auto-style1">创建时间</td>
        <td class="auto-style1">状态</td>
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
            <td>${bean.agent_name}</td>
            <td>${bean.name}</td>
            <td>${bean.phone}</td>
            <td>${bean.goodsKindNum}</td>
            <td>${bean.percentage}</td>
            <td>
                <c:if test="${bean.isSell == 1}">
                    是
                </c:if>
                <c:if test="${bean.status == 2}">
                    否
                </c:if>
            </td>
            <td>
                <c:if test="${bean.status == 1}">
                正常代理
                </c:if>
            <td>${bean.create_time}</td>
            <c:if test="${bean.status == 2}">
                异常代理
            </c:if>
            </td>
            <td>
                <input class="btn btn-inverse" type="button" value="代理详情"
                       onclick="goUrl('queryAgentUserDetail?id=${bean.id}&name=admin');"/>&nbsp;
            </td>
        </tr>
    </c:forEach>
    <tr class="tr_pagenumber">
        <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit}"
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
<!--右边框架结束-->