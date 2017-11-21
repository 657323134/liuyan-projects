<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>商品列表
</div>
<form id="searchForm" action="queryTGoodsList">
    <table class="table table-striped table-bordered search-table">
        <thead>
        <tr>
            <td colspan="10" class="auto-style2">&nbsp;请填写查询条件
                <input id="curPage" name="curPage" type="hidden" value="1"/>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>商品名称</td>
            <td class="detail">
                <input id="goodsname" class="dinp" name="goodsname" type="text" value=""/>
            </td>
            商品类型</td>
            <td>
                <select name="typeId" id="typeId" class="whereSource">
                    <option value="">--请选择--</option>
                    <c:forEach items="${tGoodsTypes}" var="tGoodsType">
                        <option value="${tGoodsType.id}">${tGoodsType.typeName}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="10" align="right">
                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>
                <%--
                        <input class="btn btn-inverse"  type="button" value="添加" onclick="goUrl('toSaveTGoods?action=add')"/>
                --%>
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
        <td class="auto-style1">商品品牌</td>
        <td class="auto-style1">商品价格</td>
        <td class="auto-style1">商品图片</td>
        <td class="auto-style1">商品类型</td>
        <td class="auto-style1">商品描述</td>
        <td class="auto-style1">首付金额</td>
        <td class="auto-style1">所属平台</td>
        <td class="auto-style1">审核状态</td>
        <td class="auto-style1">操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
            <td><a>${bean.id } </a>
            </td>
            <td>${bean.goodsname}</td>
            <td>${bean.brandName}</td>
            <td> ${bean.goodsprice} </td>
            <td><a target="_blank" href="${img_url}${bean.goodsimage}">点击查看</a></td>
            <td>
                <c:forEach items="${tGoodsTypes}" var="tGoodsType">
                    <c:choose>
                        <c:when test="${bean.typeId==tGoodsType.id}">${tGoodsType.typeName}</c:when>
                    </c:choose>
                </c:forEach>
                    <%--  <c:choose>
                        <c:when test="${bean.goodstype==1 }">种类1</c:when>
                        <c:when test="${bean.goodstype==2 }">种类2</c:when>
                        <c:otherwise>未知</c:otherwise>
                      </c:choose>--%>
            </td>
            <td>${bean.goodsremak}</td>
            <td>${bean.downpayment}</td>
            <td>
                <c:if test="${bean.platformType == 1}">
                    自有商品
                </c:if>
                <c:if test="${bean.platformType == 2}">
                    <a onclick="viewBuser('${bean.bUserId}');" style="cursor: pointer">商户商品</a>
                </c:if>
            </td>
            <td>
                <c:choose>
                    <c:when test="${bean.platformType == 1}">
                        无需审核
                    </c:when>
                    <c:when test="${bean.goodstype == 1}">
                        审核通过
                    </c:when>
                    <c:when test="${bean.goodstype == 2}">
                        待审核
                    </c:when>
                    <c:when test="${bean.goodstype == 3}">
                        审核不通过
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:if test="${bean.goodstype == 2 && bean.platformType == 2}">
                    <input class="btn btn-inverse" type="button" value="通过"
                           onclick="goCheck('checkGoodsStatus','${bean.id}','1');"/>&nbsp;
                    <input class="btn btn-inverse" type="button" value="不通过"
                           onclick="goCheck('checkGoodsStatus','${bean.id}','3');"/>&nbsp;
                </c:if>
                <c:if test="${bean.goodstype == 1 || bean.platformType == 1}">
                    <input class="btn btn-inverse" type="button" value="修改"
                           onclick="goUrl('toSaveTGoods?action=update&id=${bean.id}');"/>&nbsp;
                    <input class="btn btn-inverse" type="button" value="查看"
                           onclick="goUrl('toSaveTGoods?action=checkout&id=${bean.id}');"/>&nbsp;
                    <input class="btn btn-inverse" type="button" value="删除"
                           onclick="deleteTGoods('deleteTGoods?id=${bean.id}');"/>&nbsp;
                    <input class="btn btn-inverse" type="button" value="商品详情图片"
                           onclick="goUrl('toAddTGoodsPic?id=${bean.id}');"/>&nbsp;
                </c:if>
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

    function viewBuser(id) {

        openWindow("queryBUserIndexView?id=" + id, "商户信息", 800, 600);
    }

    function openWindow(url, name, iWidth, iHeight) {
        var url; //转向网页的地址;
        var name; //网页名称，可为空;
        var iWidth; //弹出窗口的宽度;
        var iHeight; //弹出窗口的高度;
        var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置;
        var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置;
        result = window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no, modal=yes,status=no');
        window.onfocus = function () {
            result.focus();
        };
        window.onclick = function () {
            result.focus();
        };
    };

    function goCheck(url, id, status) {

        $.ajax({
            type: 'post',
            url: url,
            data: {
                id: id,
                status: status
            },
            success: function (msg) {
                if (msg.status == 1) {
                    var params = $("#searchForm").serialize();
                    goUrl("queryTGoodsList?" + params);
                    //$("#mainContent").html($("#searchForm").submit());
                } else {
                    layer.alert("处理失败");
                }
            }
        });

    }
</script>
<!--右边框架结束-->