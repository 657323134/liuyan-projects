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
    <link rel="stylesheet" href="/css/businesses/repay.style.css">
</head>
<body class="repay-index">
<!--用户信息-->
<section id="headerMain">
    <a class="setting" href="">
        <img src="img/setting.svg"/>
    </a>

    <div id="headerMain_portrait">
        <img src="img/1.png">
    </div>
    <p>烂醉刘德华</p>
</section>
<div class="no-order-tip">暂无还款记录</div>
<div class="repay-order">
    <!--订单信息-->
    <div class="weui-loadmore weui-loadmore_line last-order-title">
        <span class="weui-loadmore__tips">还款记录</span>
    </div>
    <div class="page__bd order-list">
        <div class="weui-form-preview">
            <div class="weui-form-preview__hd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">订单号：22016473248</label>
                    <em class="weui-form-preview__value">2016-12-22 14:22:46</em>
                </div>
            </div>
            <div class="weui-form-preview__bd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">汽车后视镜宽屏智能显示</label>
                    <span class="weui-form-preview__value">￥2999.00 <br>x 1</span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">汽车后视镜宽屏智能显示</label>
                    <span class="weui-form-preview__value">￥2999.00<br>x 1</span>
                </div>
            </div>
            <div class="weui-form-preview__ft">
                <span class="total-info">共<i>2</i>件商品 合计：<strong>¥5000.00</strong></span>
            </div>
            <div class="repay-by-stages">
                <table>
                    <tr>
                        <td>
                            <div class="weui-cells_checkbox"><input type="checkbox" class="weui-check" name="checkbox1"
                                                                    data-num="555.56">
                                <i class="weui-icon-checked"></i>
                            </div>
                        </td>
                        <td>555.56元</td>
                        <td>2/6期</td>
                        <td>已还款</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="weui-cells_checkbox"><input type="checkbox" class="weui-check" name="checkbox1"
                                                                    data-num="550.56">
                                <i class="weui-icon-checked"></i>
                            </div>
                        </td>
                        <td>555.56元</td>
                        <td>2/6期</td>
                        <td>已还款</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <a href="javascript:;" class="weui-btn ui-btn_primary" id="iRepay">我要还款</a>

    <div class="settlement">
        <div class="all-select">
            <div class="weui-cells_checkbox">
                <input type="checkbox" class="weui-check total-select" name="checkbox1">
                <i class="weui-icon-checked"></i>
            </div>
            全选
        </div>
        <span class="all-num">待支付： ¥<strong id="sum">0</strong></span>
        <a href="">立即还款</a>
    </div>
</div>
<script src="js/jquery-1.8.3.min.js"></script>
<script>
    $(function () {
        $('#iRepay').click(function () {
            $(this).hide();
            $('.repay-by-stages .weui-cells_checkbox').show();
            $('.settlement').show();
        })

        $('.weui-check').click(function () {
            var state = 1;
            if ($(this).hasClass('total-select')) {
                if ($(this).attr("checked")) {
                    state = 2;
                } else {
                    state = 0;
                }
            }
            allNum(state);
        })

        function allNum(state) { //state 0全不选  1部分选 2 全选
            var sum = 0;
            var itemState = true;
            if (state === 0) {
                $('.weui-check').attr("checked", false);
                sum = 0;
            } else {
                $('.repay-by-stages td .weui-check').each(function () {
                    if (state === 1) {
                        itemState = ($(this).attr("checked") == 'checked' ? true : false) && itemState;
                        if ($(this).attr("checked")) {
                            sum += Number($(this).data('num'));
                        }
                    }
                    if (state === 2) {
                        $(this).attr("checked", true);
                        sum += Number($(this).data('num'));
                    }
                })
            }
            if (state == 1) {
                $('.total-select').attr("checked", itemState);
            }
            console.log(sum);
            $('#sum').html(sum);
        }
    });
</script>
</body>

</html>