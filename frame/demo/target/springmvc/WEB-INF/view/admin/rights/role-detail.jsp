<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>角色信息
</div>
<div class="detail">
    <table class="table table-striped table-bordered table-condensed">
        <tr>
            <td class="key"><strong>角色名称：</strong>
            </td>
            <td>${bRoleModel.roleName }</td>
            <td class="key"><strong>描述：</strong>
            </td>
            <td>${bRoleModel.description }</td>
        </tr>

        <tfoot>
        <tr>
            <td colspan="4"><input class="btn btn-inverse" id="btnBack"
                                   type="button" onclick="goUrl('queryBRoleList')" value="返回"/>
            </td>
        </tr>
        </tfoot>
    </table>
</div>
<!--右边框架结束-->
