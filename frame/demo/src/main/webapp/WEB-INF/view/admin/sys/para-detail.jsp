<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>参数信息
</div>
<div class="detail">
    <table class="table table-striped table-bordered table-condensed">
        <tr>
            <td class="key">
                <strong>参数名称：</strong>
            </td>
            <td>${bParaModel.paraName }</td>
            <td class="key">
                <strong>编码：</strong>
            </td>
            <td>${bParaModel.paraCode }</td>
        </tr>
        <tr>
            <td class="key">
                <strong>参数键：</strong>
            </td>
            <td>${bParaModel.paraKey }</td>
            <td class="key">
                <strong>参数值：</strong>
            </td>
            <td>${bParaModel.paraValue }</td>
        </tr>
        <tr>
            <td class="key">
                <strong>是否隐藏：</strong>
            </td>
            <td colspan="3" valign="top">
                <c:choose>
                    <c:when test="${bParaModel.isDelete==0 }">否</c:when>
                    <c:otherwise>是</c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tfoot>
        <tr>
            <td colspan="4">
                <input class="btn btn-inverse" id="btnBack" type="button" onclick="goUrl('queryBParaList')" value="返回"/>
            </td>
        </tr>
        </tfoot>
    </table>
</div>
<!--右边框架结束-->