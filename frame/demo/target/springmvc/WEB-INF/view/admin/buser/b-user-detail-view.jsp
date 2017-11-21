<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/admin-all.css"/>
<title>商户信息</title>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>管理员信息
</div>
<div class="detail">
    <table class="table table-striped table-bordered table-condensed">
        <tr>
            <td class="key">
                <strong>商户姓名：</strong>
            </td>
            <td>${bUserModel.name }</td>
            <td class="key">
                <strong>手机号：</strong>
            </td>
            <td>
                ${bUserModel.phone }
            </td>
        </tr>
        <tr>
            <td class="key">
                <strong>创建时间：</strong>
            </td>
            <td>${bUserModel.create_time }</td>
            <td class="key">
                <strong>是否禁用：</strong>
            </td>
            <td>
                <c:choose>
                    <c:when test="${bUserModel.isEnable==0 }">否</c:when>
                    <c:otherwise>是</c:otherwise>
                </c:choose>
            </td>
        </tr>

        <tr>
            <td class="key">
                <strong>门店数：</strong>
            </td>
            <td></td>
            <td class="key">
                <strong>员工数：</strong>
            </td>
            <td></td>
        </tr>

        <%--<tfoot>
            <tr>
                <td colspan="4">
                    <input class="btn btn-inverse" id="btnBack" type="button" onclick="goUrl('queryBUserList')" value="返回" />
                </td>
            </tr>
        </tfoot>--%><%--<tfoot>
			<tr>
				<td colspan="4">
					<input class="btn btn-inverse" id="btnBack" type="button" onclick="goUrl('queryBUserList')" value="返回" />
				</td>
			</tr>
		</tfoot>--%>
    </table>

</div>
<!--右边框架结束-->