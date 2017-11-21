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
                <input class="btn btn-inverse" type="button" onclick="goUrl('addAgentUserIndex')" value="添加"/>&nbsp;
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
        <td class="auto-style1">区域</td>
        <td class="auto-style1">级别</td>
        <td class="auto-style1">代理人姓名</td>
        <td class="auto-style1">代理人身份证号</td>
        <td class="auto-style1">法人手机号码</td>
        <td class="auto-style1">开始合作时间</td>
        <td class="auto-style1">代理状态</td>
        <td class="auto-style1">总门店数</td>
        <td class="auto-style1">账户余额</td>

        <%--<td class="auto-style1" style="width: 100px;">手机号码</td>--%>
        <%--<td class="auto-style1" style="width: 120px;">创建时间</td>--%>
        <%--<td class="auto-style1">身份证号</td>--%>
        <%--<td class="auto-style1">车牌号</td>--%>
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
            <td>${bean.area}</td>
            <td>${bean.agent_level}</td>
            <td>${bean.agentor}</td>
            <td>${bean.agentor_cardid}</td>
            <td>${bean.corporate_phone}</td>
            <td>${bean.begin_tm}</td>
            <td>
                <c:if test="${bean.status == 1}">
                    正常代理
                </c:if>
                <c:if test="${bean.status == 2}">
                    异常代理
                </c:if>
            </td>
            <td>
                <c:if test="${bean.buserNum == '' || bean.buserNum == null}">
                    0
                </c:if>
                <c:if test="${bean.buserNum != '' && bean.buserNum != null}">
                    ${bean.buserNum}
                </c:if>
            </td>
            <td>${bean.cashbalance}</td>
            <td>
                <input class="btn btn-inverse" type="button" value="修改"
                       onclick="goUrl('updateAgentUserIndex?id=${bean.id}');"/>&nbsp;
                    <%--
                            <input class="btn btn-inverse" type="button" value="查看" onclick="goUrl('queryBUserIndex?id=${bean.id}');" />&nbsp;
                    --%>
                <input class="btn btn-inverse" type="button" value="门店"
                       onclick="goUrl('agentFacilitators?id=${bean.id}&userType=${bean.user_type}');"/>&nbsp;
                <input class="btn btn-inverse" type="button" value="编辑附件" onclick="goUrl('editImages?id=${bean.id}');"/>&nbsp;
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
<!--右边框架结束-->