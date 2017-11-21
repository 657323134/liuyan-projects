<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>商品列表
</div>
<form id="searchForm" action="productList">
    <input id="curPage" name="curPage" type="hidden" value="1"/>
    <table class="table table-striped table-bordered search-table">
        <thead>
        <%--<tr>--%>
        <%--<td colspan="10" class="auto-style2">&nbsp;请填写查询条件--%>
        <%--<input id="curPage" name="curPage" type="hidden" value="1" />--%>
        <%--</td>--%>
        <%--</tr>--%>
        <%--</thead>--%>
        <%--<tbody>--%>
        <%--<tr>--%>
        <%--<td>产品名称：</td>--%>
        <%--<td class="detail">--%>
        <%--<input id="tgoodsname" class="dinp" name="tgoodsname" type="text"  />--%>
        <%--</td>--%>
        <%--<td>分红类型：</td>--%>
        <%--<td class="detail">--%>
        <%--<select name="bonusType" id="bonusType">--%>
        <%--<option value="0"  >--请选择--</option>--%>
        <%--<option value="1"  >单级分红设置</option>--%>
        <%--<option value="2"  >多级分红设置</option>--%>
        <%--</select>--%>
        <%--</td>--%>
        <%--</tr>--%>
        <tr>
            <td colspan="5" align="left">
                <c:if test="${userAdmin ==  '1'}">
                    <input class="btn btn-inverse" type="button" value="添加"
                           onclick="viewDialog('publishProduct?optType=admin','添加产品')"/>
                </c:if>
                <%--
                        <c:if test="${buser.userType == 3}">
                          <input class="btn btn-inverse"  type="button" value="添加" onclick="viewDialog('publishProduct','添加产品')"/>
                        </c:if>--%>
            </td>
            <td colspan="5" align="right">
                <%--<input class="btn btn-inverse" onclick="queryForm()"  type="button" value="查询" />&nbsp;--%>
            </td>
        </tr>
        </tbody>
    </table>
</form>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">产品名称</td>
        <td class="auto-style1">品牌名称</td>
        <td class="auto-style1">型号</td>
        <td class="auto-style1">商品类目</td>
        <td class="auto-style1">零售价</td>
        <td class="auto-style1">所属商户</td>
        <td class="auto-style1">分红类型</td>
        <td class="auto-style1">状态</td>
        <td class="auto-style1">上架时间</td>
        <td class="auto-style1">总销量</td>
        <td class="auto-style1">操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
            <td>${bean.goodsname}</td>
            <td> ${bean.brandName} </td>
            <td> ${bean.goodsModel} </td>
            <td>
                <c:forEach items="${tGoodsTypes}" var="tGoodsType">
                    <c:choose>
                        <c:when test="${bean.typeId==tGoodsType.id}">${tGoodsType.typeName}</c:when>
                    </c:choose>
                </c:forEach>
            </td>
            <td>${bean.goodsprice}</td>
            <td>${bean.bUserName}</td>
            <td>
                <c:choose>
                    <c:when test="${bean.bonusType == 1}">
                        单级分红
                    </c:when>
                    <c:when test="${bean.bonusType == 2}">
                        多级分红
                    </c:when>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${bean.goodstype == -1}">
                        删除
                    </c:when>
                    <c:when test="${bean.goodstype == 0}">
                        已下架
                    </c:when>
                    <c:when test="${bean.goodstype == 1}">
                        已上架
                    </c:when>
                    <c:when test="${bean.goodstype == 2}">
                        待审核
                    </c:when>
                </c:choose>
            </td>
            <td>
                    ${bean.createTime}
            </td>
            <td>
                    ${bean.salesNum}
            </td>
            <td>
                <c:if test="${bean.goodstype == 2 && bean.platformType == 2}">
                    <input class="btn btn-inverse" type="button" value="通过"
                           onclick="goCheck('checkGoodsStatus','${bean.id}','1');"/>&nbsp;
                    <input class="btn btn-inverse" type="button" value="不通过"
                           onclick="goCheck('checkGoodsStatus','${bean.id}','3');"/>&nbsp;
                </c:if>
                <c:if test="${(bean.goodstype == 1 || bean.platformType == 1) && userAdmin != '1'}">
                    <c:choose>
                        <c:when test="${bean.bonusType == 1}">
                            <input class="btn btn-inverse" type="button" value="授权代理(单级)"
                                   onclick="setBonusType('${bean.id}','${bean.bonusType}')"/>&nbsp;
                        </c:when>
                        <c:when test="${bean.bonusType == 2}">
                            <input class="btn btn-inverse" type="button" value="授权代理(多级)"
                                   onclick="setBonusType('${bean.id}','${bean.bonusType}');"/>&nbsp;
                            <!--品牌商需要先设置分红，才能授权-->
                            <c:if test="${buser.userType == 3 }">
                                <input class="btn btn-inverse" type="button" value="多级分红设置"
                                       onclick="viewDialog('grantTGoodsListMuti?goodsid=${bean.id}','多级分红设置');"/>&nbsp;
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <input class="btn btn-inverse" type="button" value="授权代理"
                                   onclick="setBonusType('${bean.id}',0)"/>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <input class="btn btn-inverse" type="button" value="产品详情"
                       onclick="goUrl('productInfo?goodsid=${bean.id}');"/>&nbsp;
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

    //设置分红类型
    function setBonusType(goodsid, bonusType) {

        if (bonusType == 0) {//未设置分红类型
            viewDialog('setBonusType?goodsid=' + goodsid, '设置产品分红类型');
        } else if (bonusType == 1) {//单级分红
            //单级
            goUrl('toGrantTGoods?goodsid=' + goodsid)
        } else if (bonusType == 2) {//多级分红
            //多级
            setMutiBonusOrNot(goodsid);
        }
    }


    //判断多级分红是否设置
    function setMutiBonusOrNot(goodsid) {

        $.ajax({
            type: "POST",
            url: "/admin/setMutiBonusOrNot?goodsid=" + goodsid,
            success: function (data) {
                if (data.status == 'setted') {
                    goUrl('toGrantTGoods?goodsid=' + goodsid, '授权代理');
                } else if (data.status == 'loginout') {
                    alert("登录失效，请重新登录");
                    window.location.href = '/admin/loginIndex';
                } else if (data.status == 'unset') {
                    alert("请先设置多级分红");
                }else if(data.status=='unfalse'){
                    alert("该商品最多可授权至第3级代理")
                    goUrl('productList', '商品列表');
                } else {
                    alert("系统繁忙，请稍后再试！");
                }
            }
        });

    }


    function viewDialog(url, boxname) {

        openWindow(url, boxname, 800, 600);
    }


    function openWindow(url, name, iWidth, iHeight) {
        var url;                                 //转向网页的地址;
        var name;                           //网页名称，可为空;
        var iWidth;                          //弹出窗口的宽度;
        var iHeight;                        //弹出窗口的高度;
        var iTop = (window.screen.availHeight - 30 - iHeight) / 2;       //获得窗口的垂直位置;
        var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;           //获得窗口的水平位置;
        result = window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no, modal=yes,status=no');
        window.onfocus = function () {
            result.focus();
        };
        window.onclick = function () {
            result.focus();
        };
    }
    ;

    function closeWin() {
        result.close();
    }


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