<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>门店详情
</div>
<table class="table table-striped table-bordered table-hover" id="top">
    <tr>
        <td class="key">
            <strong>店名：</strong>
        </td>
        <td>${cFacilitatorModel.facilitator_name }</td>
        <td class="key">
            <strong>地址：</strong>
        </td>
        <td>
            ${cFacilitatorModel.facilitator_address }
        </td>
    </tr>
    <tr>
        <td class="key">
            <strong>电话：</strong>
        </td>
        <td>${cFacilitatorModel.failitator_phone }</td>
        <td class="key">
            <strong>联系人：</strong>
        </td>
        <td>${cFacilitatorModel.failitator_contacts }</td>
    </tr>

    <tfoot>
    <tr>
        <td colspan="4">
            <input class="btn btn-inverse" id="btnBack" type="button"
                   onclick="goUrl('queryBUserFacilitatorIndex?id=${cFacilitatorModel.id}');" value="返回"/>
        </td>
    </tr>
    </tfoot>
</table>
<!--右边框架结束-->