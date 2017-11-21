<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>

<head>
    <link rel="stylesheet" type="text/css" href="/css/admin/admin-all.css"/>
    <link rel="stylesheet" type="text/css" href="/css/admin/base.css"/>
    <link rel="stylesheet" type="text/css" href="/css/admin/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/admin/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/validform.css"/>
    <link type="text/css" rel="stylesheet" href="/js/plugins/jBox/Skins/Blue/jbox.css"/>
</head>

<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>多级产品授权设置
</div>
<form id="setMutiTGoodsGrant" action="setMutiTGoodsGrant" method="post">
    <input type="hidden" value="${goodsid}" name="goodsid"/>
    <input type="hidden" value="" name="bonusJson" id="bonusJson"/>
    <table class="table table-striped table-bordered edit-table">
        <thead>
        <tr>
            <td colspan="10"><b>多级产品授权设置</b>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>分红类型<font color="FF0000">*</font>
            </td>
            <td>
                <select id="bonusType" name="bonusType">
                    <option value="2">多级分红</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>标准零售价<font color="FF0000">*</font>
            </td>
            <td><input name="goodsprice" id="goodsprice" type="text" readonly value="${tGoods.goodsprice}"/>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>各级代理分红：</td>
            <td>
                一级代理<input id="salesBonus1" type="text" style="width: 100px"
                           <c:if test="${unedit == 'true'}">readonly value="${level1}"</c:if>  />元
            </td>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                二级代理<input id="salesBonus2" type="text" style="width: 100px" <c:if test="${unedit == 'true'}">readonly
                           value="${level2}"</c:if>/>元
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                三级代理<input id="salesBonus3" type="text" style="width: 100px" <c:if test="${unedit == 'true'}">readonly
                           value="${level3}"</c:if>/>元
            </td>
        </tr>
        <tr>
            <td>我的出货价<font color="FF0000">*</font>
            </td>
            <td><input name="costPrice" id="costPrice" type="text" readonly value="${tGoods.goodsprice}"/>
                <%--<td><input name="costPrice"  id="costPrice" type="text" readonly--%>
                <%--<c:choose>--%>
                <%--<c:when test="${unedit == 'true'}">--%>
                <%--value="${costPriceA}"--%>
                <%--</c:when>--%>
                <%--<c:otherwise>--%>
                <%--value="${tGoodsGrant.goodsprice}"--%>
                <%--</c:otherwise>--%>
                <%--</c:choose>--%>
                <%--/>--%>
                <%--</td>--%>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="4">
                <span style="color: red">"提示： 单级设置 "为每次由上级代理设置下一级代理的分红金额“多级设置”由品牌商一次性为下多级代理设置分红金额，设置后不可修改</span>
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="6">
                <c:choose>
                    <c:when test="${unedit == 'true'}">
                        <span style="color: red">已设置的多级分红暂时不支持修改</span>
                    </c:when>
                    <c:otherwise>
                        <input class="btn btn-inverse" id="btnSave"
                               type="button" value="保存"/>&nbsp;
                    </c:otherwise>
                </c:choose>
                <%--<input id="btnReset"--%>
                <%--class="btn btn-inverse" type="reset" value="重置" />&nbsp;--%>
                <input
                        class="btn btn-inverse" id="btnBack" type="button"
                        onclick="window.opener.closeWin()" value="返回"/>&nbsp;&nbsp;<span
                    id="errorMsg" class="Validform_checktip"> </span>

            </td>
        </tr>
        </tfoot>
    </table>
</form>
<script type="text/javascript" src="/js/admin/jquery-1.7.2.js"></script>
<script type="text/javascript">

    //两值进行加和(避免精度丢失)
    function accAdd(arg1, arg2) {
        var r1, r2, m;
        try {
            r1 = arg1.toString().split(".")[1].length;
        } catch (e) {
            r1 = 0;
        }
        ;
        try {
            r2 = arg2.toString().split(".")[1].length;
        } catch (e) {
            r2 = 0;
        }
        ;
        m = Math.pow(10, Math.max(r1, r2));
        return (arg1 * m + arg2 * m) / m;
    }
    //两值进行减法(避免精度丢失)
    function accDel(arg1, arg2) {
        var r1, r2, m;
        try {
            r1 = arg1.toString().split(".")[1].length;
        } catch (e) {
            r1 = 0;
        }
        ;
        try {
            r2 = arg2.toString().split(".")[1].length;
        } catch (e) {
            r2 = 0;
        }
        ;
        m = Math.pow(10, Math.max(r1, r2));
        return (arg1 * m - arg2 * m) / m;
    }

    //算成本价
    $("#salesBonus1").on('input', function (e) {
//    var salesBonus = $("#salesBonus1").val();
//    if(!isNaN(salesBonus)){
//      var goodsprice = $("#goodsprice").val();
//      var costPrice = accDel(goodsprice,salesBonus);
//      $("#costPrice").val(costPrice);
//    }
        var goodsprice = $("#goodsprice").val();
        $("#costPrice").val(goodsprice);
    });

    //判断是否为空
    function isBlank(keyVal) {
        if (keyVal == undefined || keyVal == "" || keyVal == null) {
            return true;
        }
        return false;
    }

    $("#btnSave").click(function () {

        var goodsprice = $("#goodsprice").val();
        if (isBlank(goodsprice)) {
            alert("页面过期，请重新登录");
            return;
        }

        var salesBonus1 = $("#salesBonus1").val();
        var salesBonus2 = $("#salesBonus2").val();
        var salesBonus3 = $("#salesBonus3").val();

        if (isBlank(salesBonus1) || isBlank(salesBonus2) || isBlank(salesBonus3)) {
            alert("金额不能为空");
            return;
        }

        if (accAdd(accAdd(salesBonus1, salesBonus2), salesBonus3) > goodsprice) {
            alert("代理分红总额不能大于零售价");
            return;
        }


        var bonusJson = {};
        bonusJson.level1 = salesBonus1;
        bonusJson.level2 = salesBonus2;
        bonusJson.level3 = salesBonus3;
        var str = JSON.stringify(bonusJson);
        $("#bonusJson").val(str);

        $("#setMutiTGoodsGrant").submit();
    });
</script>
<!--右边框架结束-->