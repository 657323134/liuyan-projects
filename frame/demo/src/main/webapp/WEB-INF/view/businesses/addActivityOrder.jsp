<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <title>优卡分期</title>
    <link rel="stylesheet" href="/css/businesses/weui.min.css">
    <link rel="stylesheet" href="/css/businesses/style.css">
    <link rel="stylesheet" href="/css/front/style.css">
</head>
<body class="add-order">
<div class="weui-toptips weui-toptips_warn">错误提示</div>
<!--二维码-->
<div class="pop-up" id="qrCode">
    <div class="weui-mask"></div>
    <div class="weui-dialog">
        <div class="weui-dialog__hd">
            <strong class="weui-dialog__title">商品二维码</strong>
            <img class="close" src="/images/businesses/close.svg"/>
        </div>
        <div class="weui-dialog__bd">
            <img class="code-img erweima" src="/images/businesses/product-details.png"/>
        </div>
        <div class="weui-dialog__ft">
            将二维码给客户扫描可生成订单
        </div>
    </div>
</div>

<!--分期还款计划表-->
<div class="pop-up" id="returnPlan">
    <div class="weui-mask"></div>
    <div class="weui-dialog">
        <div class="weui-dialog__hd">
            <strong class="weui-dialog__title">分期还款计划表</strong>
            <img class="close" src="/images/businesses/close.svg"/>
        </div>
        <div class="weui-dialog__bd">
            <div class="table-box">
                <table class="identify-info" cellpadding="0" cellspacing="0" width="100%" style="line-height: 30px">
                    <thead>
                    <tr>
                        <td>期数</td>
                        <td>每期金额</td>
                        <td>每期时间</td>
                    </tr>
                    </thead>
                    <tbody id="returnContent">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<header>
    <a class="back-btn" href="javascript:history.back()"></a>
    <div class="title">添加订单</div>
    <div class="header-right"></div>
</header>

<div class="page__bd add-product1 addProduct1">
<div class="weui-cells__title">添加商品1</div>
<div class="weui-cells weui-cells_form">
    <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
            <label for="" class="weui-label">商品来源</label>
        </div>
        <div class="weui-cell__bd">
            <select class="weui-select platType1" onchange="sourceChange(1)" disabled>
                <option value="-100">请选择商品来源</option>
                <option value="1" <c:if test="${source==1}">selected</c:if>>品牌专区</option>
                <option value="2" <c:if test="${source==2}">selected</c:if>>我的专区</option>
            </select>
        </div>
    </div>

    <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
            <label for="" class="weui-label">商品类型</label>
        </div>
        <div class="weui-cell__bd">
            <select class="weui-select goodsType1" name="select2" id="selectGoodsType1" onchange="changeGoodsType(1)"   disabled="disabled">
                <c:if test="${source==1}">
                    <c:forEach items="${goodsTypes}" var="type">
                        <option value="${type.id}" <c:if test="${type.id == tGoods.typeId}">selected</c:if>>${type.typeName}</option>
                    </c:forEach>
                </c:if>
                <%--<c:forEach items="${goodsType}" var="type">--%>
                <%--<option value="${type.id}" >${type.typeName}</option>--%>
                <%--</c:forEach>--%>
            </select>
        </div>
    </div>

    <div class="weui-cell weui-cell_select weui-cell_select-after goodsClass1">
        <div class="weui-cell__hd">
            <label for="" class="weui-label">商品名称</label>
        </div>
        <div class="weui-cell__bd goodsName1">
            <select class="weui-select goodsSelect1" name="select2" onchange="changeGoods(1)"  disabled="disabled">
                <option value="${tGoods.id}" selected>${tGoods.goodsname}</option>
                <%--<c:forEach items="${goods}" var="good">--%>
                <%--<option value="${good.id}" data-price="${good.goodsprice}" >${good.goodsname}</option>--%>
                <%--</c:forEach>--%>
            </select>
        </div>
    </div>

    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">商品价格</label></div>
        <div class="weui-cell__bd">
            <p><input class="weui-input priceClass" data-price="1" type="number" name="price1" value="${tGoods.goodsprice}"  disabled="disabled"/></p>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">商品数量</label></div>
        <div class="weui-cell__bd">
            <div class="select-num">
                <span class="subtract" onclick="subGoodsNum(1)">一</span>
                <input data-num="1" type="number" name="goodNumber1" id= goodNumber1 value="1" disabled/>
                <span class="add" onclick="addGoodsNum(1)">十</span>
            </div>
            <%--<p><input class="weui-input numClass" data-num="1" type="number" name="goodNumber1" value="1"/></p>--%>
        </div>
    </div>

    <c:if test="${way != 1}">
        <div id="simAndImeiMap1"  style="display: none">
            <div class="card-id-box weui-cell" id="simAndImeiMapDetail1">
                <div class="weui-cell card-id" id="simRelation1">
                    <div class="weui-cell__hd"><label class="weui-label">设备号1</label></div>
                    <div class="weui-cell__bd">
                        <div class="sim-box">
                            <div class="sim-box-left">
                                <input class="weui-input priceClass" data-sim="1" type="text" oninput="this.value=this.value.toUpperCase()" name="simNo1"
                                       placeholder="请输入SIM卡号" />
                            </div>
                            <div class="sim-box-img" id="scanSimImg11" onclick="scanImgBtn(this.id)">
                                <img src="/images/businesses/scan-icon.png"/>
                            </div>
                        </div>
                        <div class="ime-box">
                            <div class="ime-box-left">
                                <input class="weui-input priceClass" data-imei="1" type="text" oninput="this.value=this.value.toUpperCase()" name="imeiNo1"
                                       placeholder="请输入IMEI卡号"/>
                            </div>
                            <div class="ime-box-img" id="scanImeImg11" onclick="scanImgBtn(this.id)">
                                <img src="/images/businesses/scan-icon.png"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <c:if test="${way == 1}">
    <c:choose>
    <c:when test="${source == 1 && tGoods.typeId ==2}">
    <div id="simAndImeiMap1">
        </c:when>
        <c:otherwise>
        <div id="simAndImeiMap1"  style="display: none">
            </c:otherwise>
            </c:choose>
            <div class="card-id-box weui-cell" id="simAndImeiMapDetail1">
                <div class="weui-cell card-id" id="simRelation1">
                    <div class="weui-cell__hd"><label class="weui-label">设备号1</label></div>
                    <div class="weui-cell__bd">
                        <div class="sim-box">
                            <div class="sim-box-left">
                                <input class="weui-input priceClass" data-sim="1" type="text" oninput="this.value=this.value.toUpperCase()" name="simNo1"
                                       placeholder="请输入SIM卡号" />
                            </div>
                            <div class="sim-box-img" id="scanSimImg11" onclick="scanImgBtn(this.id)">
                                <img src="/images/businesses/scan-icon.png"/>
                            </div>
                        </div>
                        <div class="ime-box">
                            <div class="ime-box-left">
                                <input class="weui-input priceClass" data-imei="1" type="text" oninput="this.value=this.value.toUpperCase()" name="imeiNo1"
                                       placeholder="请输入IMEI卡号"/>
                            </div>
                            <div class="ime-box-img" id="scanImeImg11" onclick="scanImgBtn(this.id)">
                                <img src="/images/businesses/scan-icon.png"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:if>

    </div>
</div>

<div class="page__bd">
    <div class="weui-cells__title">选择分期</div>
    <div class="weui-cells weui-cells_form">

        <div class="weui-cell weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd">
                <label for="" class="weui-label">金融方案</label>
            </div>
            <div class="weui-cell__bd">
                <c:choose>
                <c:when test="${isLimit == '1'}">
                <select class="weui-select planIds" name="select2" onchange="selectPlans()" disabled="disabled">
                    </c:when>
                    <c:otherwise>
                    <select class="weui-select planIds" name="select2" onchange="selectPlans()">
                        </c:otherwise>
                        </c:choose>
                        <option value="-100">选择金融方案</option>
                        <c:forEach var="plan" items="${tFinancialPlans}">
                            <option value="${plan.id}"  <c:if test="${planId == plan.id}">selected</c:if>>${plan.name}</option>
                        </c:forEach>

                    </select>
            </div>
        </div>
        <div class="weui-cell weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd">
                <label for="" class="weui-label">选择分期</label>
            </div>
            <div class="weui-cell__bd">
                <c:choose>
                <c:when test="${bActivitySharing.payPeriods > 0}">
                <select class="weui-select periods" name="select2" onchange="selectPeriods()"  disabled="disabled">
                    </c:when>
                    <c:otherwise>
                    <select class="weui-select periods" name="select2" onchange="selectPeriods()">
                        </c:otherwise>
                        </c:choose>
                        <option value="3"  <c:if test="${bActivitySharing.payPeriods == 3}">selected</c:if>>3</option>
                        <option value="6"  <c:if test="${bActivitySharing.payPeriods == 6}">selected</c:if>>6</option>
                        <option value="9"  <c:if test="${bActivitySharing.payPeriods == 9}">selected</c:if>>9</option>
                        <option value="12"  <c:if test="${bActivitySharing.payPeriods == 12}">selected</c:if>>12</option>
                        <%--
                                            <option value="${bActivitySharing.payPeriods}" selected>${bActivitySharing.payPeriods}</option>
                        --%>
                    </select>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">贷款总额</label></div>
            <div class="weui-cell__bd">
                <p style="color: graytext">￥<span class="totalPrice">${tGoods.goodsprice}</span></p>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">首付金额</label></div>
            <div class="weui-cell__bd">
                <p>￥<span class="payPrice">0.00</span></p>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">每月还款</label></div>
            <div class="weui-cell__bd">
                <p>
                    <%--￥<span class="monthMoney">0.00</span>--%>
                    <span id="returnPlanBtn">查看还款计划表</span></p>

            </div>
        </div>
    </div>
    <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">车主车牌号</label></div>
            <div class="weui-cell__bd">
                <span id="carCodeArea">粤B</span>
                <input type="text" class="weui-input" placeholder="请输入车牌号" size="11" oninput="this.value=this.value.toUpperCase()" name="car_num" id="car_num" style="width: 60%;" value="">
            </div>
        </div>
    </div>
</div>

<a href="javascript:;" class="weui-btn ui-btn_primary" id="createCode">生成二维码</a>

</body>
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/weui.min.js"></script>
<script src="//res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
//车牌区号
$('#carCodeArea').on('click', function () {
    var area = $(this);
    var areaAlias = ["京", "沪", "浙", "苏", "粤", "鲁", "晋", "冀", "豫", "川", "渝", "辽", "吉", "黑", "皖", "鄂", "湘", "赣", "闽", "陕", "甘", "宁", "蒙", "津", "贵", "云", "桂", "琼", "青", "新", "藏"];
    var areaWord = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
//        for(var i=0;i<26;i++){
//            areaWord.push(String.fromCharCode(65+i));//输出A-Z  26个大写字母
//        }
    var areaWordList = [];
    for (i in areaWord){
        var label = {
            label: areaWord[i],
            value: areaWord[i]
        };
        areaWordList.push(label);
    }
    var codeArea = [];
    for (i in areaAlias){
        var label = {
            label: areaAlias[i],
            value: areaAlias[i],
            children: areaWordList
        }
        codeArea.push(label);
    }


    weui.picker(codeArea, {
        className: 'custom-classname',
        defaultValue: [1, 3],
        onChange: function (result) {

            console.log(result)
        },
        onConfirm: function (result) {
            area.html(result.join(""));
        },
        id: 'doubleLinePicker'
    });
});

var sumMoney = 0;
var index = 1;
var plans = ${tFinancialPlans};

function addGoodsNum(id){
    var goodsNum = $("#goodNumber" + id).val();
    goodsNum = parseInt(goodsNum) + 1;
    $("#goodNumber" + id).val(goodsNum);

    var html = '<div class="card-id-box weui-cell" id="simAndImeiMapDetail'+id +"_" +goodsNum+'"><div class=\"weui-cell card-id\" id="simRelation'+goodsNum+'">'
            + '<div class=\"weui-cell__hd\"><label class=\"weui-label\">设备号'+goodsNum+'</label></div>'
            + '<div class=\"weui-cell__bd\">'
            + '<div class="sim-box">'
            + '<div class="sim-box-left">'
            + '<input class=\"weui-input priceClass\" data-sim=\"1\" type=\"text\" oninput="this.value=this.value.toUpperCase()" name="simNo' + id + '" placeholder=\"请输入SIM卡号\" />'
            + '</div>'
            + '<div class="sim-box-img" id="scanSimImg'+id+''+goodsNum+'" onclick="scanImgBtn(this.id)">'
            + '<img src="/images/businesses/scan-icon.png"/>'
            + '</div>'
            + '</div>'
            + '<div class="ime-box">'
            + '<div class="ime-box-left">'
            + '<input class=\"weui-input priceClass\" data-imei=\"1\" type=\"text\" oninput="this.value=this.value.toUpperCase()" name="imeiNo' + id + '"   placeholder=\"请输入IMEI卡号\"/>'
            + '</div>'
            + '<div class="ime-box-img" id="scanImeImg'+id+''+goodsNum+'" onclick="scanImgBtn(this.id)">'
            + '<img src="/images/businesses/scan-icon.png"/>'
            + '</div>'
            + '</div>'
            + '</div>'
            + '</div>'
            + '</div>'
    $("#simAndImeiMap" +id).append(html);
    calculationMoney(index);
}

function subGoodsNum(id){
    var goodsNum = $("#goodNumber" + id).val();
    if(goodsNum <= 1){
        return false;
    }
    var goodsNum = $("#goodNumber" + id).val();
    $("#simAndImeiMapDetail" + id+"_"+goodsNum).remove();
    goodsNum = parseInt(goodsNum) - 1;
    $("#goodNumber" + id).val(goodsNum);
    calculationMoney(index);
}


$(function () {
//        $(".planSelect1").attr("disabled", true);
    //绑定价格输入事件
    $(".priceClass").bind('input propertychange', function () {
        var index = $(this).attr("data-price");
        calculationMoney(index);
    });
    //绑定数量输入事件
    $(".numClass").bind('input propertychange', function () {
        var index = $(this).attr("data-num");
        calculationMoney(index);
    });
    var num = 1;
    function chengeNum(ele) {
        ele.siblings('input').val(num);
        var str = '<div class="weui-cell card-id">' +
                '<div class="weui-cell__hd">' +
                '<label class="weui-label">设备号</label></div>' +
                '<div class="weui-cell__bd">' +
                '<input class="weui-input priceClass" data-sim="1" type="text" oninput="this.value=this.value.toUpperCase()" name="simNo" placeholder="请输入SIM卡号"/>' +
                '<input class="weui-input priceClass" data-imei="1" type="text" oninput="this.value=this.value.toUpperCase()" name="imeiNo" placeholder="请输入IMEI卡号"/>' +
                '</div>' +
                '</div>';
        ele.parents('.weui-cell').siblings('.card-id-box').html(str);
    }


    //添加产品
    $('.add-product-btn').click(function () {
        index++;
        var html = '<div class="page__bd add-product2 addProduct' + index + '">';
        html += '<div class="weui-cells__title">添加商品' + index + ' <span class="delete" onclick="deleteProduct(' + index + ')">删除商品</span></div>';
        html += '<div class="weui-cells weui-cells_form">';

        html += '<div class="weui-cell weui-cell_select weui-cell_select-after">';
        html += '<div class="weui-cell__hd">';
        html += ' <label for="" class="weui-label">商品来源</label>';
        html += ' </div>';
        html += '<div class="weui-cell__bd">';
        html += '<select class="weui-select platType' + index + '" onchange="sourceChange(' + index + ')" >';
        html += '<option value="-100" >请选择商品来源</option>';
        html += '<option value="1" >品牌专区</option>';
        html += '<option value="2" >我的专区</option>';
        html += '</select>';
        html += '</div>';
        html += '</div>';
        html += ' <div class="weui-cell weui-cell_select weui-cell_select-after">';
        html += '<div class="weui-cell__hd">';
        html += '<label for="" class="weui-label">商品类型</label>';
        html += '</div>';
        html += ' <div class="weui-cell__bd">';
        html += '<select class="weui-select goodsType' + index + '" name="select' + index + '" onchange="changeGoodsType(' + index + ')" id="selectGoodsType'+index+'">';
        html += '<option value="-100" >请选择商品类型</option>';
        var goodsType = ${goodsTypeStr};
        for (var i = 0; i < goodsType.length; i++) {
            html += '<option value="' + goodsType[i].id + '">' + goodsType[i].typeName + '</option>';
        }
        html += '</select>';
        html += '</div>';
        html += '</div>';
        html += '<div class="weui-cell weui-cell_select weui-cell_select-after goodsClass' + index + '">';
        html += '<div class="weui-cell__hd" >';
        html += '<label for="" class="weui-label">商品名称</label>';
        html += ' </div>';
        html += ' <div class="weui-cell__bd goodsName' + index + '">';
        html += '<select class="weui-select goodsSelect' + index + '" name="select' + index + '" onchange="changeGoods(' + index + ')">';
        html += '<option value="-100" >请选择商品名称</option>';

        html += '</select>';
        html += ' </div>';
        html += ' </div>';

        html += '<div class="weui-cell">';
        html += '<div class="weui-cell__hd"><label class="weui-label">商品价格</label></div>';
        html += '<div class="weui-cell__bd">';
        html += '<p><input class="weui-input priceClass" data-price="' + index + '" type="number" name="price' + index + '"/></p>';
        html += '</div>';
        html += '</div>';

        html += '<div class="weui-cell">';
        html += '<div class="weui-cell__hd"><label class="weui-label">商品数量</label></div>';
        html += '<div class="weui-cell__bd">';
        /*
         html += '<p><input class="weui-input  numClass" type="number" value="1" data-num="' + index + '" name="goodNumber' + index + '"/></p>';
         */
        html += ' <div class=\"select-num\"><span class=\"subtract\" onclick="subGoodsNum('+index+')">一</span><input data-num=\"1\" type=\"number\" name="goodNumber'+index+'" id="goodNumber'+index+'" value=\"1\" disabled/><span class=\"add\" onclick="addGoodsNum('+index+')">十</span></div>';
        html += '</div>';
        html += '</div>';
        html += '<div id="simAndImeiMap'+index+'" style="display: none">';
        html +=  '<div class="card-id-box weui-cell" id="simAndImeiMapDetail'+index +'"_"'+ 1+'"><div class="weui-cell card-id" id="simRelation'+index+'">';
        html += '<div class="weui-cell__hd"><label class="weui-label">设备号1</label></div>' +
                '<div class="weui-cell__bd"><input class="weui-input priceClass" data-sim="1" type="text" oninput="this.value=this.value.toUpperCase()" name="simNo'+index+'" placeholder=\"请输入SIM卡号\"/>' +
                '<input class="weui-input priceClass" data-imei="1" type="text" oninput="this.value=this.value.toUpperCase()" name="imeiNo'+index+'" placeholder="请输入IMEI卡号"/></div>'
                + '</div></div>' +
                '</div>';
        html += '</div>';
        html += '</div>';
        $(".addProduct" + (index - 1)).after(html);

        $(".planSelect" + index).attr("disabled", true);

        //重新绑定输入事件
        $(".priceClass").bind('input propertychange', function () {
            var index = $(this).attr("data-price");
            calculationMoney(index);
        });
        //重新绑定输入事件
        $(".numClass").bind('input propertychange', function () {
            var index = $(this).attr("data-num");
            calculationMoney(index);
        });
        calculationMoney(index);
    });

    //生成二维码
    $('#createCode').click(function () {
        var totalPrice = parseFloat($(".totalPrice").html());
        if (totalPrice > 8000) {
            alert("货款总额不能超过8000");
            return false;
        }
        if (totalPrice < 600) {
            alert("货款总额不能小于600");
            return false;
        }
        var goodsNum = "";
        var goodsPrice = "";
        var goodsId = "";
        var goodsType = "";
        var platType = "";
        var planIds = "";
        var firstPrices = "";
        var planId = $(".planIds").val();
        var isRelation = false;
        var simAndImeiJson = "{ \"relation\":[";
        if (planId < 0) {
            alert("请选择金融方案");
            return false;
        }
        for (var i = 1; i <= index; i++) {

            var pId = $(".goodsSelect" + i + " option:selected").attr('data-planId');
            if (pId != null && pId != "" && pId != 'undefined' && pId != planId) {
                alert("商品" + i + "不支持当前选择金融方案");
                return false;
            }
            if ($(".platType" + i).val() == -100) {
                alert("商品" + i + "未选择商品来源");
                return false;
            }
            if ($(".goodsType" + i).val() == -100) {
                alert("商品" + i + "未选择商品类型");
                return false;
            }
            if ($(".goodsSelect" + i).val() == -100) {
                alert("商品" + i + "未选择商品名称");
                return false;
            }
            if ($(".planSelect" + i).val() == -100) {
                alert("商品" + i + "未选择金融方案");
                return false;
            }

            if ($(".goodsSelect" + i).val() == "" || typeof $(".goodsSelect" + i).val() == 'undefined') {
                break;
            }
            goodsId += $(".goodsSelect" + i).val() + ",";

            if ($("input[name='price" + i + "']").val() == "" || typeof $("input[name='price" + i + "']").val() == 'undefined') {
                goodsPrice = "";
                break;
            }

//                if ($("input[name='price" + i + "']").val() < 1000) {
//                    alert("商品" + i + "价格小于1000");
//                    return false;
//                }
            goodsPrice += $("input[name='price" + i + "']").val() + ",";

            if ($("input[name='goodNumber" + i + "']").val() == "" || typeof $("input[name='goodNumber" + i + "']").val() == 'undefined') {
                goodsNum = "";
                break;
            }
            goodsNum += $("input[name='goodNumber" + i + "']").val() + ",";

            var firstPrice = $("input[name='firstPrice" + i + "']").val();
            if (firstPrice == "" || typeof firstPrice == 'undefined') {
                firstPrice = 0.00;
            }
            //判断输入首付金额是否在允许范围以内
            if ($(".planSelect" + i).val() == 3) {
                var firstRepay = firstMoneyById($(".planSelect" + i).val(), $("input[name='goodNumber" + i + "']").val() * $("input[name='price" + i + "']").val());
                if (firstRepay > firstPrice) {
                    alert("商品" + i + "首付金额不能低于" + firstRepay);
                    return false;
                }
            }
            firstPrices += firstPrice + ",";
            platType += $(".platType" + i).val() + ",";
            goodsType += $(".goodsType" + i).val() + ",";
            planIds += planId + ",";
            //sim及imei卡对应关系。
            var goodTypeId = $("#selectGoodsType1").val();
            if(goodTypeId == 2){
                isRelation = true;
                var simNoes = $("input[name='simNo" + i + "']");
                var imeiNoes = $("input[name='imeiNo" + i + "']");
                simAndImeiJson = simAndImeiJson + "{\"goodsId\":" +  $(".goodsSelect" + i).val() + ",\"map\":[";
                for(var n = 0;n<simNoes.length;n++){
                    simAndImeiJson =  simAndImeiJson + "{";
                    var sim = simNoes[n].value;
                    var imei = imeiNoes[n].value;
                    if(sim== '' || sim == null || imei== '' || imei == null) {
                        alert("请完善sim号和imei号对应关系");
                        return;
                    }
                    simAndImeiJson =  simAndImeiJson + "\"sim\":\"" + sim +"\",";
                    simAndImeiJson =  simAndImeiJson + "\"imei\":\"" + imei +"\"";
                    if(n < simNoes.length - 1){ simAndImeiJson =  simAndImeiJson + "},";}
                    else{
                        simAndImeiJson =  simAndImeiJson + "}";
                    }
                }
                simAndImeiJson =  simAndImeiJson + "]},";
            }
        }
        if(isRelation) {
            simAndImeiJson = simAndImeiJson.substring(0, simAndImeiJson.length - 1)
            simAndImeiJson = simAndImeiJson + "]}";
        }else{
            simAndImeiJson = '';
        }

        if (goodsId == "") {
            alert("请输入商品型号");
            return false;
        }
        if (goodsPrice == "") {
            alert("请输入商品价格");
            return false;
        }
        if (goodsNum == "") {
            alert("请输入商品数量");
            return false;
        }
        var carCodeArea= $("#carCodeArea").html();
        var car_num = $("#car_num").val();
        console.info("car_num:"+car_num);
        if(car_num==null ||car_num==''){
            alert("请填写车牌号");
            return false;
        }
        var carNum = $("#carCodeArea").html()+$("#car_num").val().toLocaleUpperCase();
        var periods = $(".periods option:selected").attr('value');
        var firstMoney = $(".payPrice").html();
        var totalMoney = $(".totalPrice").html();
        $.post(
                "/border/generateOrderTem.do",
                {
                    typeIds: goodsType,
                    goodsIds: goodsId,
                    nums: goodsNum,
                    platTypes: platType,
                    planIds: planIds,
                    goodsPrices: goodsPrice,
                    periods: periods,
                    firstMoney: firstMoney,
                    totalMoney: totalMoney,
                    firstPrices: firstPrices,
                    simAndImeiJson:simAndImeiJson
                },
                function (data) {
                    if (data.mess == 1) {
                        var url = "/border/loadQRCode.do?tempIds=" + data.tempIds+"&carNum="+carNum;
                        $(".erweima").attr("src", url);
                        $('#qrCode').show();
                    }
                }
        );

    });

    //显示还款计划
    $('#returnPlanBtn').on('click', function () {
        $("#returnContent").html("");
        $('#returnPlan').show();
        var totalMoney = parseFloat($(".totalPrice").html());
        if (totalMoney > 8000) {
            alert("货款总额不能超过8000");
            return false;
        }
        if (totalMoney < 600) {
            alert("货款总额不能小于600");
            return false;
        }
        var periods = $(".periods").val();
        if (totalMoney > 0) {
            var monthMoney = (totalMoney / periods).toFixed(3).substring(0, (totalMoney / periods).toFixed(3).indexOf('.') + 3);
            var myDate = new Date();
            var htmlT = "";
            var planSelect1 = $(".planIds").val();
            for (var i = 0; i < parseInt(periods) - 1; i++) {
                htmlT += "<tr>";
                htmlT += "<td>" + (i + 1) + "/" + periods + "</td>";
                htmlT += "<td>¥" + monthMoney + "</td>";
                if (planSelect1 == 4) {
                    if (i > 0) {
                        myDate.setMonth(myDate.getMonth() + 1)
                    }
                    htmlT += "<td>" + repayTime(myDate.getFullYear(), myDate.getMonth() + 1, myDate.getDate()) + "</td>";
                } else {
                    myDate.setMonth(myDate.getMonth() + 1)
                    htmlT += "<td>" + repayTime(myDate.getFullYear(), myDate.getMonth() + 1, myDate.getDate()) + "</td>";
                }
                htmlT += "</tr>";
            }
            htmlT += "<tr>";
            htmlT += "<td>" + periods + "/" + periods + "</td>";
            htmlT += "<td>¥" + (totalMoney - (parseFloat(monthMoney) * (periods - 1))).toFixed(2) + "</td>";
            myDate.setMonth(myDate.getMonth() + 1)
            htmlT += "<td>" + repayTime(myDate.getFullYear(), myDate.getMonth() + 1, myDate.getDate()) + "</td>";
            htmlT += "</tr>";
            $("#returnContent").html(htmlT);
        }

    });

    function repayTime(year, month, day) {
//            if(month>12){
//                year=year+1 ;
//                month=month-12 ;
//            }
        if (month < 10) {
            month = "0" + month;
        }
        var tDay1 = new Date(year, new Date().getMonth() + 1, 0);
        var tDay2 = new Date(year, month + 1, 0);
        if (day == tDay1) {

        }
        if (day < 10) {
            day = "0" + day;
        }
        return year + "-" + month + "-" + day;
    }

    //关闭按钮
    $('.close').on('click', function () {
        $(this).parents('.pop-up').hide(200);
    });
});


//计算首付金额 ，商品总额
function calculationMoney(id) {
    var goodsType = $(".goodsSelect1").val();
    if (goodsType == -100) {
        return false;
    }
    $(".payPrice").html("0.00");

    var totalPrice = 0;
    var firstTotal = 0;

    for (var i = 1; i <= index; i++) {
//            var planId = $(".planSelect" + i + " option:selected").attr('value');
        var goodsNum = $("input[name='goodNumber" + i + "']").val();
        var goodsPrice = $("input[name='price" + i + "']").val();
        if (goodsPrice == "" || typeof goodsPrice == 'undefined') {
            goodsPrice = 0;
        }
        if (goodsNum == "" || typeof goodsNum == 'undefined') {
            goodsNum = 0;
        }

        var firstPrice = $("input[name='firstPrice" + i + "']").val();
        if (firstPrice == "" || typeof firstPrice == 'undefined') {
            firstPrice = 0;
        }
//                    $(".payPrice").html(firstPrice) ;


        var sumPrice = goodsNum * goodsPrice;
//            var price = calculationMoneyByPlan(sumPrice, planId, i);

        totalPrice += sumPrice;
        firstTotal += parseFloat(firstPrice);
    }

    totalPrice = calculationMoneyByPlan(totalPrice, null, id);
    $(".totalPrice").html(formatMoney(totalPrice.toFixed(3)));
    $(".payPrice").html(formatMoney(firstTotal.toFixed(3)));

//        sumMoney = totalPrice;


    //筛选期数
//        changePeriods();
//        $(".monthMoney").html(((totalPrice)/$(".periods").val()).toFixed(3).substring(0,((totalPrice)/$(".periods").val()).toFixed(3).indexOf('.')+3)) ;
//        $(".monthMoney").html(formatMoney(((totalPrice) / $(".periods").val()).toFixed(3)));

}

function formatMoney(money) {
    var v = money.substring(money.length - 1, money);
    if (v == 0) {
        return money.substring(0, money.indexOf('.') + 3)
    } else {
        return (parseFloat(money.substring(0, money.indexOf('.') + 3)) + parseFloat(0.01)).toFixed(2);
    }
}
function selectPeriods() {
    calculationMoney(index);
}
function changePeriods() {
    var flag = false;
    for (var i = 1; i <= index; i++) {
        var planId = $(".planSelect" + i + " option:selected").attr("value");
        if (planId == 2) {
            flag = true;
            break;
        }
    }
    if (flag) {
        $(".periods").val(10);
        $(".periods").attr("disabled", true);
    } else {
        $(".periods").attr("disabled", false);
    }
}
//商品类型选择
function changeGoodsType(id) {
    var goodsType = $(".goodsType" + id + " option:selected").attr('value');
    var platType = $(".platType" + id + " option:selected").attr('value');
    var goodType =  $("#selectGoodsType"+id).val();

    if(goodType == 2){ //如果是车联网产品，实在是受不了了，先写死。
        $("#simAndImeiMap" + id).show();
    }else{
        removeSIMComp(id)
    }


    var html = "";
    if (goodsType < 0 && goodsType != -100) {
        $(".goodsClass" + id).removeClass("weui-cell_select weui-cell_select-after");
        html += '<p><input class="weui-input goodsSelect' + id + '" type="text" name="goodsName"/></p>';
        $(".goodsName" + id).html(html);

//            var html1 = '<option value="-100" >请选择金融方案</option>';
//            for (var i = 0; i < plans.length; i++) {
//                html1 += '<option value="' + plans[i].id + '" >' + plans[i].name + '</option>';
//            }
//            $(".planSelect"+index).html(html1);

    } else {
        $.post("/border/getGoodsByTypeId.do",
                {typeId: goodsType, platType: platType},
                function (data) {
                    if (data) {
                        var goods = data.goods;
                        html += '<select class="weui-select goodsSelect' + id + '" name="select2" onchange="changeGoods(' + id + ')">';
                        html += '<option value="-100" data-price="-100" data-planId="-100">请选择商品名称</option>';
                        for (var i = 0; i < goods.length; i++) {
                            html += '<option value="' + goods[i].id + '" data-price="' + goods[i].goodsprice + '" data-planId="' + goods[i].planId + '">' + goods[i].goodsname + '</option>';
                        }
                        html += "</select>";
                        $(".goodsName" + id).html(html);
                        $(".goodsClass" + index).addClass("weui-cell_select weui-cell_select-after");
                        calculationMoney(id);
                    }
                }
        );
    }

}


function   removeSIMComp(id){
    $("#simAndImeiMap" + id).hide();
    var goodsNum = parseInt($("#goodNumber" + id).val());
    for(var i =goodsNum;i>1;i--){
        $("#simAndImeiMapDetail" + id+"_"+i).remove();
    }
    $("#goodNumber" + id).val(1);
}

function sourceChange(index) {
    var sourceType = $(".platType" + index + " option:selected").attr("value");
    if (sourceType == -100) {
        return false;
    }
    var html1 = "";
    if (sourceType == 2) {
        $(".goodsClass" + index).addClass("weui-cell_select weui-cell_select-after");
        var goodsType = ${goodsTypeStr1};
        html1 += '<option value="-100">请选择商品类型</option>';
        for (var i = 0; i < goodsType.length; i++) {
            html1 += '<option value="' + goodsType[i].id + '">' + goodsType[i].typeName + '</option>';
        }

        html1 += "<option value='-1'>汽车维修</option>";
        html1 += "<option value='-2'>汽车保养</option>";
        html1 += "<option value='-3'>汽车维护</option>";
        html1 += "<option value='-4'>其它</option>";
        $(".goodsType" + index).html(html1);

    } else {
        $(".goodsClass" + index).addClass("weui-cell_select weui-cell_select-after");
        var goodsType = ${goodsTypeStr};
        html1 += '<option value="-100">请选择商品类型</option>';
        for (var i = 0; i < goodsType.length; i++) {
            html1 += '<option value="' + goodsType[i].id + '">' + goodsType[i].typeName + '</option>';
        }
        $(".goodsType" + index).html(html1);
        $(".firstDiv" + index).remove();

    }

    if ($(".platType" + index).val() == 1) {
        <%--if('${isNJ}'==1){--%>
        <%--$(".planSelect" + index).val(4);--%>
        <%--}else{--%>
        <%--$(".planSelect" + index).val(1);--%>
        <%--}--%>
//            $(".planSelect" + index).attr("disabled", true);
        $("input[name='price" + index + "']").attr("readOnly", true);
    } else {
        $(".planSelect" + index).attr("disabled", false);
        $("input[name='price" + index + "']").attr("readOnly", false);
        $("input[name='price" + index + "']").val("");
    }

    var html2 = '<option value="-100" >请选择金融方案</option>';
    $(".planSelect" + index).html(html2);


    var html3 = '<select class="weui-select goodsSelect' + index + '" name="select2" onchange="changeGoods(' + index + ')">';
    html3 += '<option value="-100" data-price="-100">请选择商品名称</option>';
    html3 += "</select>";
    $(".goodsName" + index).html(html3);
}
function deleteProduct(i) {
    index--;
    $(".addProduct" + i).remove();
    subtractionMoney(index);

}
//选择商品
function changeGoods(i) {

    //查询金融方案
    var goodsid = $(".goodsSelect" + i + " option:selected").val();
    $.ajax({
        type: "POST",
        url: "/border/getPlanByTGoodsId?goodsid=" + goodsid,
        timeout: 20000,
        cache: false,
        success: function (data, textStatus) {
            if (data.status == 'true') {
                var tFinancialPlanId = data.tFinancialPlanId;
                var tFinancialPlanName = data.tFinancialPlanName;
                var plans = data.plans;
                if (tFinancialPlanId == "" && plans != null) {
                    var html = '<option value="-100" >请选择金融方案</option>';
                    ;
                    for (var j = 0; j < plans.length; j++) {
                        html += '<option value="' + plans[j].id + '">' + plans[j].name + '</option>';
                    }
                    $(".planSelect" + i).html(html);
                } else {
                    $(".planSelect" + i).html('<option value="' + tFinancialPlanId + '">' + tFinancialPlanName + '</option>');
                }

                $("input[name='price" + i + "']").val("");
                var platType = $(".platType" + i).val();
                if (platType == 1) {
                    var money = $(".goodsSelect" + i + " option:selected").attr('data-price');
                    if (money > 0) {
                        $("input[name='price" + i + "']").val(formatMoney(parseFloat(money).toFixed(3)));
                    }
                }

                calculationMoney(i);

            } else {
                alert("系统繁忙！");
            }
        }
    });
}

function subtractionMoney(index) {
    calculationMoney(index);
}
//    function changePlan(index) {
//        var planId = $(".planSelect" + index).val();
//        if (planId == -100) {
//            return false;
//        }
//        if (planId == 3) {
//            var html = '<div class="weui-cell firstDiv' + index + '">';
//            html += '<div class="weui-cell__hd"><label class="weui-label">首付金额</label></div>';
//            html += '<div class="weui-cell__bd">';
//            html += '<p><input class="weui-input firstClass" data-price="' + index + '" type="number" name="firstPrice' + index + '"/></p>';
//            html += '</div>';
//            html += '</div>';
//            $(".addProduct" + index + " .weui-cells_form").append(html);
//        } else {
//            $(".firstDiv" + index).remove();
//        }
//        $(".firstClass").bind('input propertychange', function () {
//            var index = $(this).attr("data-price");
//            calculationMoney(index);
//        });
//        calculationMoney(index);
//    }

function selectPlans() {
    calculationMoney(index);
}
//根据金融方案计算货款总额
function calculationMoneyByPlan(sumPrice, planId, id) {
    planId = $(".planIds").val();
    if (planId < 0) {
        return sumPrice;
    }
    if (sumPrice > 0) {
        var plan = plans[0];
        var planPrice = 0;
        var periods = parseInt($(".periods option:selected").val());
        if (plan != null) {
            if (planId == 1 || planId == 4) {
                planPrice = sumPrice;
            } else if (planId == 2) {
                planPrice = sumPrice + sumPrice * plan.platformGet;
            } else if (planId == 3) {
//                    var firstRepay = firstMoneyById(planId,sumPrice) ;

                var firstPrice = $("input[name='firstPrice" + id + "']").val();
                if (firstPrice == "" || typeof firstPrice == 'undefined') {
                    firstPrice = 0.00;
                }
//
                planPrice = (sumPrice - firstPrice) + (sumPrice - firstPrice) * plan.platformGet * periods;
            }
        }
        return planPrice;
    }
    return 0;
}
function firstMoneyById(planId, sumPrice) {
    if (planId == 3) {
        var plan = plans[planId - 1];
        var firstRepay = JSON.parse(plan.firstRepay);
        var bili = "";
        for (var o in firstRepay) {
            var value = firstRepay[o];
            var range = value.split(",");
            if (sumPrice < range[1]) {
                bili = o;
                break;
            }
        }
        return bili * sumPrice;
    }
    return 0;
}

var appid = '${appid}';
var times = '${timestamp}';
var nonce = '${nonceStr}';
var signa = '${signature}';
wx.config({
    debug: false,
    appId: appid,
    timestamp: times,
    nonceStr: nonce,
    signature: signa,

    jsApiList: [
        'scanQRCode'
    ]
});

function scanImgBtn(id){
    var scanSim=id;
    wx.scanQRCode({
        needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
        scanType: ["qrCode", "barCode"], // 可以指定扫二维码还是一维码，默认二者都有
        success: function (res) {
            var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
            scanImgCallBack(result);
        }
    });

    function scanImgCallBack(result){

        if(result.indexOf(",")>=0){
            var simlength = result.indexOf(",");
            var scanSimText = result.substring(simlength+1,result.length);
            var aaa=$("#"+scanSim).prev().children("input:first-child").val(scanSimText);
        }else{
            alert("条码格式不正确");
        }
    }
}


</script>
</html>