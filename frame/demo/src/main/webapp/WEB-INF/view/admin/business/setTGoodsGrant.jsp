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
<form id="addGrantRelation" action="addGrantRelation" method="post">
    <input type="hidden" value="${goodsid}" name="goodsid"/>
    <input type="hidden" value="${grantedid}" name="grantedid"/>
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
                </select>
            </td>
        </tr>
        <tr>
            <td>标准零售价<font color="FF0000">*</font>
            </td>
            <td><input name="goodsprice" id="goodsprice" type="text" readonly value="${tGoods.goodsprice}"/>
            </td>
        </tr>
        <tr>
            <td>设置销售分红金额<font color="FF0000">*</font>
            </td>
            <td>
                <!--原始的销售和代理分红-->
                <input type="hidden" id="agentBonusA" value="${tGoodsGrant.agentBonus}">
                <input type="hidden" id="salesBonusA" value="${tGoodsGrant.salesBonus}">

                <input name="salesBonus" id="salesBonus" type="text" datatype="s4-20" nullmsg="请输入金额"
                       value="${tGoodsGrant.salesBonus}"/>
                <c:choose>
                    <c:when test="${not empty tGoodsGrantUp}">
                        <span>最大额度：${tGoodsGrantUp.salesBonus}</span>
                        <input type="hidden" id="salesBonusLimit" value="${tGoodsGrantUp.salesBonus}"/><!--上级销售分红限制-->
                    </c:when>
                    <c:otherwise>
                        <input type="hidden" id="salesBonusLimit" value="0"/><!--上级销售分红限制-->
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td>我的成本价<font color="FF0000">*</font>
            </td>
            <td><input name="costPrice" id="costPrice" type="text" readonly value="${tGoodsGrant.costPrice}"/>
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
    $("#salesBonus").on('input', function (e) {
        var salesBonus = $("#salesBonus").val();
        if (!isNaN(salesBonus)) {
            var goodsprice = $("#goodsprice").val();
            var costPrice = accDel(goodsprice, salesBonus);
            $("#costPrice").val(costPrice);
        }
    });


    $("#btnSave").click(function () {
        var salesBonus = $("#salesBonus").val();
        if (salesBonus == undefined || salesBonus == '' || salesBonus == null) {
            alert("销售分红不能为空");
            return;
        }
        var salesBonusLimit = $("#salesBonusLimit").val();
        var goodsprice = $("#goodsprice").val();
        if (parseFloat(salesBonusLimit) > 0) {
            if (accDel(salesBonusLimit, salesBonus) < 0) {
                alert("销售分红不能超过最大限额");
                return;
            }
        }
        if (accDel(goodsprice, salesBonus) < 0) {
            alert("销售分红不能大于等于零售价");
            return;
        }
//    var agentBonusA = $("#agentBonusA").val();
        var salesBonusA = $("#salesBonusA").val();
        if (accDel(salesBonus, salesBonusA) < 0) {
            alert("销售分红不能小于原有值！");
            return;
        }

//    if(agentBonusA != undefined && agentBonusA != null && agentBonusA != ''){
//      //下级代理商可分的利润
//      var salesBonusDown = accDel(salesBonusA,agentBonusA);
//      if(salesBonus < salesBonusDown){
//        alert("本级的销售分红不能下级的销售分红");
//        return;
//      }
//    }
        $("#addGrantRelation").submit();
    });
</script>
<!--右边框架结束-->