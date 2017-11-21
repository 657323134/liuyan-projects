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
    <a class="back-btn" href="/buser/toBMainPage.do"></a>

    <div class="title">添加订单</div>
    <div class="header-right"></div>
</header>
<div class="page__bd add-product1 addProduct1" id="addOrder" v-for="order in list">
    <div class="weui-cells__title">添加商品1</div>
    <div class="weui-cells weui-cells_form">
        <div class="weui-cell weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd">
                <label for="" class="weui-label">商品来源</label>
            </div>
            <div class="weui-cell__bd">
                <select class="weui-select platType1" onchange="sourceChange(1)">
                    <option value="-100">请选择商品来源</option>
                    <option value="1">品牌专区</option>
                    <option value="2">我的专区</option>
                </select>
            </div>
        </div>
        <div class="weui-cell weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd">
                <label for="" class="weui-label">商品类型</label>
            </div>
            <div class="weui-cell__bd">
                <select class="weui-select goodsType1" name="select2" onchange="changeGoodsType(1)">
                    <option value="-100">请选择商品类型</option>
                </select>
            </div>
        </div>
        <div class="weui-cell weui-cell_select weui-cell_select-after goodsClass1">
            <div class="weui-cell__hd">
                <label for="" class="weui-label">商品名称</label>
            </div>
            <div class="weui-cell__bd goodsName1">
                <select class="weui-select goodsSelect1" name="select2" onchange="changeGoods(1)">
                    <option value="-100">请选择商品名称</option>
                </select>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">商品价格</label></div>
            <div class="weui-cell__bd">
                <p><input class="weui-input priceClass" data-price="1" type="number" name="price1"/></p>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">商品数量</label></div>
            <div class="weui-cell__bd">
                <div class="select-num">
                    <span class="subtract">一</span>
                    <input data-num="1" type="number" name="goodNumber1" value="1" disabled/>
                    <span class="add">十</span>
                </div>
            </div>
        </div>
        <div class="card-id-box weui-cell">
            <div class="weui-cell card-id">
                <div class="weui-cell__hd"><label class="weui-label">设备号1</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input priceClass" data-sim="1" type="text" oninput="this.value=this.value.toUpperCase()" name="goodsSIM1" placeholder="请输入SIM卡号"/>
                    <input class="weui-input priceClass" data-imei="1" type="text" oninput="this.value=this.value.toUpperCase()" name="goodsIMEI1" placeholder="请输入IMEI卡号"/>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="add-product-btn"><span></span>添加商品</div>
<div class="page__bd">
    <div class="weui-cells__title">选择分期</div>
    <div class="weui-cells weui-cells_form">

        <div class="weui-cell weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd">
                <label for="" class="weui-label">金融方案</label>
            </div>
            <div class="weui-cell__bd">
                <select class="weui-select planIds" name="select2" onchange="selectPlans()">
                    <option value="-100">选择金融方案</option>
                    <c:forEach var="plan" items="${tFinancialPlans}">
                        <option value="${plan.id}">${plan.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="weui-cell weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd">
                <label for="" class="weui-label">选择分期</label>
            </div>
            <div class="weui-cell__bd">
                <select class="weui-select periods" name="select2" onchange="selectPeriods()">
                    <option value="3">3</option>
                    <option value="6">6</option>
                    <option value="9">9</option>
                    <option value="12">12</option>
                </select>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">贷款总额</label></div>
            <div class="weui-cell__bd">
                <p>￥<span class="totalPrice">0.00</span></p>
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
                    <span id="returnPlanBtn">查看还款计划表</span></p>

            </div>
        </div>
    </div>
</div>

<a href="javascript:;" class="weui-btn ui-btn_primary" id="createCode">生成二维码</a>

</body>
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/weui.min.js"></script>
<script src="/js/vue/vue.min.js"></script>
<script>
    var example1 = new Vue({
        el: '#addOrder',
        data: {
            init: [],
            list: []
        },
        filters: {
            //产品列表地址
            toListUrl: function (value) {
                return "/loaninfo/openLoan.htm?type=" + value;
            },
        },
        //初始化
        mounted: function () {
            // `this` 指向 vm 实例
            this.initlist();
        },
        watch:{
        },
        computed: {
            //判断当前选择项是否有数据
        },

        methods: {
            initlist: function () {
                var self = this;
                $.ajax({
                    type: 'post',
                    url: '/borderoptimize/initlist',
                    dataType: "json",
                    success: function (data) {
                        self.init = data.initlist;
                        self.list = data.initlist;
                    }
                });
            }
        }
    });
</script>
</html>