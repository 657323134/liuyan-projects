<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>用户列表
</div>
<form id="searchForm" action="queryBUserList">
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
            <td>真实姓名</td>
            <td>
                <input id="name" name="name" class="dinp" type="text" value="${model.name }"/>
            </td>
            <td>是否禁用</td>
            <td>
                <select name="isEnable" id="isEnable" class="isEnableCls">
                    <option value="">--请选择--</option>
                    <option value="0">不禁用</option>
                    <option value="1">禁用</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="10" align="right">
                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>
                <input class="btn btn-inverse" type="button" onclick="goUrl('addBUserIndex')" value="添加"/>&nbsp;
            </td>
        </tr>
        </tbody>
    </table>
</form>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">序号</td>
        <td class="auto-style1">真实姓名</td>
        <td class="auto-style1">手机号码</td>
        <td class="auto-style1">状态</td>
        <%--<td class="auto-style1" style="width: 100px;">手机号码</td>--%>
        <%--<td class="auto-style1" style="width: 120px;">创建时间</td>--%>
        <%--<td class="auto-style1">身份证号</td>--%>
        <%--<td class="auto-style1">车牌号</td>--%>
        <td class="auto-style1">门店资料</td>
        <td class="auto-style1">操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
            <td><a>${bean.id } </a></td>
            <td> ${bean.name} </td>
            <td>${bean.phone}</td>
            <td>
                <c:choose>
                    <c:when test="${bean.isEnable==0 }"><font color='green'>启用</font></c:when>
                    <c:when test="${bean.isEnable==1 }"><font color='red'>禁用</font></c:when>
                    <c:otherwise>未知</c:otherwise>
                </c:choose>
            </td>
            <td>
                    <%--<input class="btn btn-inverse" type="button" onclick="goUrl('');" value="营业执照"/>--%>
                    <%--<input class="btn btn-inverse" type="button" onclick="goUrl('');" value="法人身份证"/>--%>
                    <%--<input class="btn btn-inverse" type="button" onclick="goUrl('');" value="对公账号"/>--%>
                    <%--<input class="btn btn-inverse" type="button" onclick="goUrl('');" value="门头照片"/>--%>
                    <%--<input class="btn btn-inverse" type="button" onclick="goUrl('');" value="工作照片"/>--%>
                    <%--<input class="btn btn-inverse" type="button" onclick="goUrl('');" value="产品照片"/>--%>
                    <%--<input class="btn btn-inverse" type="button" onclick="goUrl('');" value="合作协议"/>--%>
            </td>
            <td>
                <input class="btn btn-inverse" type="button" value="修改"
                       onclick="goUrl('updateBUserIndex?id=${bean.id}');"/>&nbsp;
                <input class="btn btn-inverse" type="button" value="查看"
                       onclick="goUrl('queryBUserIndex?id=${bean.id}');"/>&nbsp;
                <input class="btn btn-inverse" type="button" value="门店"
                       onclick="goUrl('queryBUserFacilitatorIndex?id=${bean.id}');"/>&nbsp;
                <input class="btn btn-inverse" type="button" value="员工"
                       onclick="goUrl('queryChildBUserPage?id=${bean.id}');"/>&nbsp;
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