<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>用户列表
</div>

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
                <%--<input class="btn btn-inverse" type="button" value="修改" onclick="goUrl('updateBUserIndex?id=${bean.id}');" />&nbsp;--%>
            <input class="btn btn-inverse" type="button" value="查看" onclick="goUrl('queryBUserIndex?id=${bean.id}');"/>&nbsp;
                <%--<input class="btn btn-inverse" type="button" value="门店" onclick="goUrl('queryBUserFacilitatorIndex?id=${bean.id}');" />&nbsp;--%>
                <%--<input class="btn btn-inverse" type="button" value="员工" onclick="goUrl('queryChildBUserPage?id=${bean.id}');" />&nbsp;--%>
        </td>
    </tr>
    </c:forEach>
    <tr class="tr_pagenumber">
        <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit }"
                                    totalCount="${page.totalCount }"/></td>
    </tr>
    <tfoot>
    <tr>
        <td colspan="5">
            <input class="btn btn-inverse" id="btnBack" type="button" onclick="goUrl('queryBUserList')" value="返回"/>
        </td>
    </tr>
    </tfoot>
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