<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>

<head>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/admin-all.css"/>
    <link rel="stylesheet" type="text/css" href="/css/validform.css"/>
    <link type="text/css" rel="stylesheet" href="/js/plugins/jBox/Skins/Blue/jbox.css"/>
</head>

<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>单级产品授权设置
</div>
<form id="saveBonusType" action="saveBonusType" method="post">
    <input type="hidden" value="${goodsid}" name="goodsid"/>
    <table class="table table-striped table-bordered edit-table">
        <thead>
        <tr>
            <td colspan="10"><b>单级产品授权设置</b>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>分红类型<font color="FF0000">*</font>
            </td>
            <td>
                <select id="bonusType" name="bonusType">
                    <option value="1">单级分红</option>
                    <option value="2">多级分红</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <span style="color: red">"提示： 单级设置 "为每次由上级代理设置下一级代理的分红金额“多级设置”由品牌商一次性为下多级代理设置分红金额，设置后不可修改</span>
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="6"><input class="btn btn-inverse" id="btnSave"
                                   type="button" value="保存"/>&nbsp;<input id="btnReset"
                                                                          class="btn btn-inverse" type="reset"
                                                                          value="重置"/>&nbsp;<input
                    class="btn btn-inverse" id="btnBack" type="button"
                    onclick="window.opener.closeWin()" value="返回"/>&nbsp;&nbsp;<span
                    id="errorMsg" class="Validform_checktip"> </span></td>
        </tr>
        </tfoot>
    </table>
</form>
<script type="text/javascript" src="/js/admin/jquery-1.7.2.js"></script>
<script type="text/javascript">

    $("#btnSave").click(function () {
        $("#saveBonusType").submit();
    });
</script>
<!--右边框架结束-->