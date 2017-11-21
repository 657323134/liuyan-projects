<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>门店列表
</div>
<form id="searchForm" action="queryBUserBusinessList">
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
            <%-- <td>代理人姓名</td>
             <td>
               <input id="name" name="name" class="dinp" type="text" value="${model.name }" />
             </td>--%>
        </tr>
        <tr>
            <td colspan="10" align="right">
                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>
                <%--
                        <input class="btn btn-inverse" type="button" onclick="goUrl('addBusinessUserIndex')" value="添加" />&nbsp;
                --%>
            </td>
        </tr>
        </tbody>
    </table>
</form>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">商户编号</td>
        <td class="auto-style1">商户名</td>
        <td class="auto-style1">商户手机</td>
        <td class="auto-style1">门店名称</td>
        <td class="auto-style1">门店地址</td>
        <td class="auto-style1">门店联系人</td>
        <td class="auto-style1">门店电话</td>
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
            <td>${dataIndex} </td>
            <td>${bean.name}</td>
            <td>${bean.phone}</td>
            <td>${bean.facilitator_name}</td>
            <td>${bean.facilitator_address}</td>
            <td>${bean.failitator_contacts}</td>
            <td>${bean.failitator_phone}</td>
            <td>
                <input class="btn btn-inverse" type="button" value="查看详情"
                       onclick="goUrl('showStoreDetail?id=${bean.id}');"/>
                    <%--      <input class="btn btn-inverse" type="button" value="修改" onclick="goUrl('updateBusinessUserIndex?id=${bean.id}');" />&nbsp;
                          <input class="btn btn-inverse" type="button" value="编辑附件" onclick="goUrl('editImages?id=${bean.id}');" />&nbsp;
                  --%>
                    <%--
                      <input class="btn btn-inverse" type="button" value="门店" onclick="goUrl('agentFacilitators?id=${bean.id}&userType=${bean.user_type}');" />&nbsp;
              --%>
                    <%--<input class="btn btn-inverse" type="button" value="编辑附件" onclick="goUrl('editImages?id=${bean.id}');" />&nbsp;--%>
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