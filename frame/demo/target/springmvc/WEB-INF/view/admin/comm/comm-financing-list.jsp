<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <title>后台管理系统</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/admin-all.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/validform.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath }/js/plugins/jBox/Skins/Blue/jbox.css"/>
    <script type="text/javascript" src="${basePath}/js/admin/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="${basePath}/js/lion-jquery.js"></script>
    <script type="text/javascript" src="${basePath}/js/admin/jquery-ui-1.8.22.custom.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/admin/index.js"></script>
    <script type="text/javascript" src="${basePath}/js/Validform_v5.3.2_min.js"></script>
<body style="width: 1024px;height: 100%;">
<div class="warp" style="width: 1024px;height: 100%;">

    <!--右边框架开始-->
    <div id="mainContent" class="Conframe"
         style="left:0px;top:0px;bottom:0px; width: 100%;height: 100%;">

        <!--右边框架开始-->
        <div class="crumbs">
            当前位置<b class="tip"></b>融资机构列表
        </div>
        <form id="searchForm" action="queryTGoodsList">
            <table class="table table-striped table-bordered search-table">
                <thead>
                <tr>
                    <td colspan="6" class="auto-style2">&nbsp;请填写查询条件 <input
                            id="curPage" name="curPage" type="hidden" value="1"/>
                    </td>

                </tr>
                </thead>
                <tbody>

                <tr>
                    <td colspan="6" align="right"><input class="btn btn-inverse"
                                                         type="button" onclick="goUrl('selectFinancingAdd')"
                                                         value="添加"/>&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </form>
        <table class="table table-striped table-bordered table-hover" id="top">
            <thead>
            <tr class="tr_detail">
                <td class="auto-style1">序号</td>
                <td class="auto-style1">机构名称</td>
                <td class="auto-style1">操作</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageBean}" var="bean" varStatus="st">
                <tr>
                    <td><a>${bean.id } </a>
                    </td>
                    <td>${bean.financingName}</td>
                    <td><input class="btn btn-inverse" type="button" value="选择"
                               onclick="checkFinancing('${bean.financingName}','${bean.id }');"/>&nbsp;
                    </td>
                </tr>
            </c:forEach>
            <tr class="tr_pagenumber">
                <td colspan="100"><my:pager curPage="${page.page }"
                                            pageSize="${page.limit }" totalCount="${page.totalCount }"/>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <!--右边框架结束-->

</div>
<script type="text/javascript">
    /**点击选择，触发js*/
    function checkFinancing(financingName, financingId) {
        /**点击选择，调用之前页面js*/
        window.parent.checkFinancing(financingName, financingId);
    }
    function goUrl(url) {
        $.lionPost(url, {}, function (data) {
            $("#mainContent").html(data);
        });
    }

    function queryForm() {
        var url = $("#searchForm").attr("action");
        var arrays = $("#searchForm").serializeArray();
        $.lionPost(url, arrays, function (data) {
            $("#mainContent").html(data);
        });
    }

    function resetForm() {
        var url = $("#searchForm").attr("action");
        var arrays = null;
        $.lionPost(url, arrays, function (data) {
            $("#mainContent").html(data);
        });
    }

    function turnPage(curPage) {
        $("#curPage").val(curPage);
        queryForm();
    }
</script>
</body>
</html>