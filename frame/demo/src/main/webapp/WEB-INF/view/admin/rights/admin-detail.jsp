<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>管理员信息
</div>
<div class="detail">
    <table class="table table-striped table-bordered table-condensed">
        <tr>
            <td class="key">
                <strong>管理员用户名：</strong>
            </td>
            <td>${bAdminModel.adminName }</td>
            <td class="key">
                <strong>是否禁用：</strong>
            </td>
            <td>
                <c:choose>
                    <c:when test="${bAdminModel.isEnable==0 }">否</c:when>
                    <c:otherwise>是</c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td class="key">
                <strong>创建时间：</strong>
            </td>
            <td colspan="3" valign="top">
                <fmt:formatDate value="${bAdminModel.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
        </tr>
        <tfoot>
        <tr>
            <td colspan="4">
                <input class="btn btn-inverse" id="btnBack" type="button" onclick="goUrl('queryBAdminList')"
                       value="返回"/>
            </td>
        </tr>
        </tfoot>
    </table>
</div>
<!--右边框架结束-->