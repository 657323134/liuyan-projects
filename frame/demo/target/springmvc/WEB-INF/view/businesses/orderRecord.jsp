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
<body class="order-record">
<div class="weui-toptips weui-toptips_warn">错误提示</div>

<header>
    <a class="back-btn" href="/buser/toBMainPage.do"></a>

    <div class="title">订单记录</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="weui-tab">
        <div class="weui-navbar">
            <div class="weui-navbar__item weui-bar__item_on">
                未完成
            </div>
            <div class="weui-navbar__item">
                已完成
            </div>
        </div>
        <div class="weui-tab__panel" id="content">
        </div>
    </div>
</div>
</body>
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/weui.min.js"></script>
<script>
    var type = 0;
    var page = 1;
    var title = 0;
    var totalPage = 0;
    $(function () {

        //Tab切换
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            var index = $('.weui-navbar .weui-navbar__item').index($(this));
            console.log(index);
//            $('.weui-tab__panel .order-list').eq(index).show().siblings().hide();


            if (type == index) {
                return false;
            }
            type = index;
            $("#content").html("");
            page = 1;
            totalPage = 0;
            productList(type, page, title);
        });

        //产品列表初始化
        productList(type, page, title);
    });

    function productList(type, page, title) {
//        if(page == 0){
//            var start = 0;
//        }else{
//            var start = page * 12;
//        }
        if (totalPage != 0 && page > totalPage) {
            return false;
        }
        //获取产品列表
        var timeType = '${timeType}';
        $.ajax({
            type: 'post',
            url: '/border/toBUserOrderRecordPageData.do',
            data: {
                orderStatus: type + 1,
                start: page,
                timeType: timeType
            },
            success: function (data) {
                if (data) {
                    var list = data.pageBean;
                    var html = "";
                    totalPage = data.page.totalPages;
                    for (var i = 0; i < list.length; i++) {
                        html += '<div class="order-list">';
                        html += '<div class="weui-form-preview">';
                        html += '<div class="weui-form-preview__hd">';
                        html += '<a href="/border/toOrderDetailPage?orderId=' + list[i].id + '">';
                        html += '<div class="weui-form-preview__item">';
                        html += '<label class="weui-form-preview__label">订单号：' + list[i].order_num + '</label>';
                        html += '</div>';
                        html += '</a>';
                        html += '</div>';
                        html += '<div class="weui-form-preview__bd">';
                        var goods = list[i].goods;
                        var count = 0;
                        var totalMoney = 0.00;
                        for (var j = 0; j < goods.length; j++) {
                            html += '<div class="weui-form-preview__item">';
                            html += '<label class="weui-form-preview__label">' + goods[j].goodsname + '</label>';
                            html += '<span class="weui-form-preview__value">￥' + goods[j].goodsprice + ' <br>x ' + goods[j].goodsNums + '</span>';
                            html += '</div>';
                            count += goods[j].goodsNums;
                            totalMoney += (parseFloat(goods[j].goodsprice) * parseInt(goods[j].goodsNums));
                        }
                        html += '</div>';
                        html += '<div class="weui-form-preview__ft">';
                        if (list[i].cancelOrderStatus == 1) {
                            html += '<span href="javascript:;" class="weui-btn_mini">退款中</span>';
                        } else if (list[i].cancelOrderStatus == 2) {
                            if (list[i].status < 2) {
                                html += '<span href="javascript:;" class="weui-btn_mini">已取消</span>';
                            } else {
                                html += '<span href="javascript:;" class="weui-btn_mini">已退款</span>';
                            }
                        } else {
                            if (list[i].status == 0) {
                                html += '<a href="/border/toOrderDetailPage?orderId=' + list[i].id + '" class="weui-btn weui-btn_mini weui-btn_default">上传凭证</a>';
                            } else if (list[i].status == 1) {
                                html += '<span href="javascript:;" class="weui-btn_mini">审核中</span>';
                            } else if (list[i].status == 2) {
                                html += '<span href="javascript:;" class="weui-btn_mini">结算中</span>';
                            } else if (list[i].status == 3) {
                                html += '<span href="javascript:;" class="weui-btn_mini">已结算</span>';
                            } else if (list[i].status == 4) {
                                html += '<span href="javascript:;" class="weui-btn_mini">已失效</span>';
                            }
                        }
                        html += ' <span class="total-info">共<i>' + count + '</i>件商品 合计：<strong>￥' + totalMoney + '</strong></span>';
                        html += '</div>';
                        html += '</div>';
                        html += '</div>';
                    }
                    $("#content").append(html);
                }
            }
        });
    }
    /*滚动条到底部时自己加载新的内容*/
    $(window).scroll(function () {
        if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
            page++;
            productList(type, page, title);
        }
    });
</script>
</html>