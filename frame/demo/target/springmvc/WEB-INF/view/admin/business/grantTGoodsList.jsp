<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>商品列表
</div>
<form id="searchForm" action="toGrantTGoods">
    <input id="curPage" name="curPage" type="hidden" value="1"/>
    <input id="goodsid" name="goodsid" type="hidden" value="${goodsid}"/>
</form>
<table class="table table-striped table-bordered search-table">
    <tbody>
    <tr>
        <td colspan="10" class="auto-style2">&nbsp;代理的产品
        </td>
    </tr>
    <tr>
        <td colspan="2">
            ${tGoods.goodsname}
        </td>
    </tr>
    </tbody>
</table>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">序号</td>
        <td class="auto-style1">代理商名称</td>
        <td class="auto-style1">法人姓名</td>
        <td class="auto-style1">授权时间</td>
        <td class="auto-style1">成本价</td>
        <td class="auto-style1">标准零售价</td>
        <td class="auto-style1">代理分红</td>
        <td class="auto-style1">销售分红</td>
        <td class="auto-style1">操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
           <%-- <td>${bean.bUserId}</td>--%>
            <td>${st.index+1}</td>
            <td>${bean.agentName}</td>
            <td>${bean.bUserName}</td>
            <td>${bean.grantTime}</td>
            <td>${bean.costPrice}</td>
            <td>${tGoods.goodsprice}</td>
            <td>${bean.agentBonus}</td>
            <td>${bean.salesBonus}</td>
            <td>
                <c:choose>
                    <c:when test="${tGoods.bonusType == 1}">
                        <%--<input class="btn btn-inverse" type="button" value="授权"     onclick="grantRgihts('${tGoods.id}','${bean.bUserId}','${tGoods.bonusType}');" />&nbsp;--%>
                        <input class="btn btn-inverse" type="button" value="修改分红"
                               onclick="viewSetBonus('${tGoods.id}','${bean.bUserId}');"/>&nbsp;
                    </c:when>
                    <c:when test="${tGoods.bonusType == 2}">
                        <!--多级授权时，计算已设置好的分红-->
                        <input class="btn btn-inverse" type="button" value="授权"
                               onclick="grantRgihts('${tGoods.id}','${bean.bUserId}','${tGoods.bonusType}');"/>&nbsp;
                        <!--品牌商设置分红 ： 在产品列表页设置-->
                        <%--<input class="btn btn-inverse" type="button" value="修改分红" onclick="viewSetBonus('${tGoods.id}','${bean.bUserId}');" />&nbsp;--%>
                    </c:when>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    <tr class="tr_pagenumber">
        <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit }"
                                    totalCount="${page.totalCount }"/></td>
    </tr>
    </tbody>
</table>
<tfoot>
<tr>
    <input class="btn btn-inverse" id="btnBack" type="button"
           onclick="goUrl('productList')" value="返回"/>&nbsp;&nbsp;
    <span id="errorMsg" class="Validform_checktip"> </span></td>
</tr>
</tfoot>


<script type="text/javascript">

    function goUrl(url) {
        $.lionPost(url, {}, function (data) {
            $("#mainContent").html(data);
        });
    }

    //授权  多级分红
    function grantRgihts(goodsid, grantedid, bonusType) {

        //ajax校验是否已授权。授权后才能设置分红
        $.ajax({
            type: "POST",
            url: "/admin/grantRightsOrNot?goodsid=" + goodsid + "&grantedid=" + grantedid,
            success: function (data) {
                if (data.status == 'unsuccess') {//还未授权
                    $.ajax({
                        type: "POST",
                        url: "/admin/grantRights?goodsid=" + goodsid + "&grantedid=" + grantedid + "&bonusType=" + bonusType,
                        success: function (data) {
                            if (data.status == 'success') {
                                alert("授权成功");
                                goUrl('toGrantTGoods?goodsid=' + goodsid);
                            } else if (data.status == 'loginout') {
                                alert("登录失效，请重新登录");
                                window.location.href = '/admin/loginIndex';
                            } else {
                                alert("授权失败");
                            }
                        }
                    });
                } else if (data.status == 'loginout') {
                    alert("登录失效，请重新登录");
                    window.location.href = '/admin/loginIndex';
                } else if (data.status == 'succeed') {
                    alert("已经授权");
                } else {
                    alert("授权失败");
                }
            }
        });


    }

    //设置分红  ，单级分红
    function viewSetBonus(goodsid, grantedid) {

        openWindow("grantTGoodsList?goodsid=" + goodsid + "&grantedid=" + grantedid, "设置分红", 800, 600);

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

</script>
<!--右边框架结束-->