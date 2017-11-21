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
    <script type="text/javascript"
            src="${basePath}/js/admin/jquery-ui-1.8.22.custom.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/admin/index.js"></script>
    <script type="text/javascript" src="${basePath}/js/Validform_v5.3.2_min.js"></script>
<body style="width: 1024px;height: 100%;">
<div class="warp" style="width: 1024px;height: 100%;">

    <!--右边框架开始-->
    <div id="mainContent" class="Conframe" style="left:0px;top:0px;bottom:0px; width: 100%;height: 100%;">

        <div class="crumbs">
            当前位置<b class="tip"></b>商品列表
        </div>
        <form id="searchForm" action="queryTGoodsList">
            <table class="table table-striped table-bordered search-table">
                <thead>
                <tr>
                    <td colspan="6" class="auto-style2">&nbsp;请填写查询条件 <input
                            id="curPage" name="curPage" type="hidden" value="1"/></td>

                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>商品名称</td>
                    <td class="detail"><input id="selectGoodsName" name="selectGoodsName"
                                              type="text" value="${model.selectGoodsName }"/>
                    </td>

                    <td>商品价格</td>
                    <td class="detail"><input id="smlsprice" name="smlsprice"
                                              type="text" value="${model.smlSprice }"/>
                    </td>
                    <td class="detail">至<input id="maxsprice" name="maxsprice"
                                               type="text" value="${model.maxSprice }"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="right"><input class="btn btn-inverse"
                                                         onclick="queryForm()" type="button" value="查询"/>&nbsp; <input
                            class="btn btn-inverse" type="reset" value="清空"/>&nbsp; <input
                            class="btn btn-inverse" type="button"
                            onclick="goUrl('addTGoodsIndex')" value="添加"/>&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </form>
        <table class="table table-striped table-bordered table-hover" id="top">
            <thead>
            <tr class="tr_detail">
                <td class="auto-style1">序号</td>
                <td class="auto-style1">商品名称</td>
                <td class="auto-style1">商品价格</td>
                <td class="auto-style1">图片路径</td>
                <td class="auto-style1">商品状态</td>
                <td class="auto-style1">商品简介</td>
                <td class="auto-style1">操作</td>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageBean}" var="bean" varStatus="st">
                <tr>
                    <td><a>${bean.id } </a></td>
                    <td>${bean.goodsname}</td>
                    <td>${bean.goodsprice}</td>
                    <td>${bean.goodsimage}</td>
                    <td>
                        可用
                    </td>
                    <td>${bean.goodsremak}</td>
                    <td>
                        <input class="btn btn-inverse" type="button" value="选择"
                               onclick="checkGoods('${bean.id }','${bean.goodsname}');"/>
                    </td>
                </tr>


            </c:forEach>


            <tr class="tr_pagenumber">
                <td colspan="100"><my:pager curPage="${page.page }"
                                            pageSize="${page.limit }" totalCount="${page.totalCount }"/></td>
            </tr>
            </tbody>
        </table>


        <!--右边框架结束-->
    </div>

    <!--右边框架结束-->


</div>
<script type="text/javascript">
    /**点击选择，触发js*/
    function checkGoods(goodsId, goodsName) {
        /**点击选择，调用之前页面js*/
        window.parent.checkGoods(goodsId, goodsName);
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