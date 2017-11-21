<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>商品列表
</div>
<form id="searchForm" action="queryTGoodsList">
    <table class="table table-striped table-bordered search-table">

        <tbody>
        <tr>
            <input id="orderid" class="dinp" name="orderid" type="hidden" value="${orderid}"/>

            <%--<td>商品名称</td>
              <td class="detail">
                <input id="goodsname" class="dinp" name="goodsname" type="text" value="" />
              </td>商品类型</td>--%>
            <%--<td>
              <select name="goodstype" id="goodstype" class="whereSource">
                <option value="">--请选择--</option>
                <option value="1">种类1</option>
                <option value="2">种类2</option>
                <option value="3">种类3</option>
              </select>
            </td>--%>
        </tr>
        <tr>
            <td colspan="10" align="right">
                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>
                <input class="btn btn-inverse" type="button" value="添加" onclick="goUrl('toSaveTGoods?action=add')"/>
            </td>
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
        <td class="auto-style1">商品图片</td>
        <td class="auto-style1">商品类型</td>
        <td class="auto-style1">商品描述</td>
        <td class="auto-style1">首付金额</td>
        <td class="auto-style1">操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
            <td><a>${bean.id } </a>
            </td>
            <td>${bean.goodsname}</td>
            <td> ${bean.goodsprice} </td>
            <td> ${bean.goodsimage} </td>
            <td>
                <c:choose>
                    <c:when test="${bean.goodstype==1 }">种类1</c:when>
                    <c:when test="${bean.goodstype==2 }">种类2</c:when>
                    <c:otherwise>未知</c:otherwise>
                </c:choose>
            </td>
            <td>${bean.goodsremak}</td>
            <td>${bean.downpayment}</td>
            <td>
                <input class="btn btn-inverse" type="button" value="查看"
                       onclick="goUrl('toSaveTGoods?action=checkout&id=${bean.id}');"/>&nbsp;
                <input class="btn btn-inverse" type="button" value="商品详情图片"
                       onclick="goUrl('toAddTGoodsPic?id=${bean.id}');"/>&nbsp;
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

    function deleteTGoods(url) {
        if (confirm("确认要删除该商品？")) {
            $.ajax({
                type: "POST",
                url: url,
                timeout: 20000,
                cache: false,
                beforeSend: function (XMLHttpRequest) {
                },
                success: function (data, textStatus) {
                    if (data.status == 'true') {
                        alert("删除成功!");
                        goUrl('queryTGoodsList');
                    } else {
                        alert("删除失败!");
                    }
                },
                complete: function (XMLHttpRequest, textStatus) {
                },
                error: function () {
                    alert("删除失败!");
                }
            });
        }
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

    function goUrl(url) {
        $.lionPost(url, {}, function (data) {
            $("#mainContent").html(data);
        });
    }

</script>
<!--右边框架结束-->