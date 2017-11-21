<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <title>个人中心</title>
    <link rel="stylesheet" href="/css/businesses/weui.min.css">
    <link rel="stylesheet" href="/css/front/common.css">
    <style>
        .person-center .prompt {
            position: relative;
            background: #ffae12;
            overflow: hidden;
        }

        .person-center .prompt p {
            width: 85%;
            font-size: 12px;
            color: #fff;
            line-height: 30px;
            margin: 5px 10px;
        }
        .person-center .prompt .close-btn {
            background: url(/images/front/close-icon.png) no-repeat center;
        }

        .person-center .weui-cells:nth-child(2){
            /*margin-top: 0px;*/
        }
        .person-center .my-info {
            /*background-image: linear-gradient(45deg, #f82e42 0%, #fa6977 100%);*/
            background-image: linear-gradient(-45deg, #F92E42 0%, #FB6977 100%);
            overflow: hidden;
            height: 180px;
        }
        .person-center .my-info .state {
            position: relative;
            height: 30px;
            margin: 10px;
        }
        .person-center .my-info .state a.setting {
            position: absolute;
            top: 0px;
            display: block;
            width: 30px;
            height: 30px;
            right: 0px;
        }

        .person-center .my-info .state a.setting img,
        .person-center .my-info .state .avator img{
            width:100%;}
        .person-center .my-info .state .avator{
            width: 30px;
            float: left;
            height: 30px;
            border-radius: 15px;
            overflow: hidden;
            margin-right: 10px;
        }
        /*.person-center .my-info .info { padding:10px;}*/
        .person-center .my-info .info .money{
            display: inline-block;
            font-size: 16px;
            padding: 10px 20px;
            bottom: 0;
            position: absolute;}
        .person-center .my-info .info .title {
            color: #ffcbd0;
            opacity: 0.7;
        }

        .person-center .my-info .money-num {
            line-height: 50px;
            font-size: 20px;
            color: #fff;
        }

        .person-center .my-info .money-num strong {
            font-size: 36px;
            line-height: 60px;
        }
        .person-center .my-info .weui-btn {
            position: absolute;
            font-size: 14px;
            line-height: 2;
            right: 30px;
            bottom: 30px;
            border-color: #fff;
            color: #fff;
            border-radius: 2px;
            padding: 2px 18px;
        }

        .person-center .my-info .info .scan {
            float: right;
            margin: 20px;
            padding-left: 20px;
            border-left: 1px solid rgba(255,255,255,0.5);
        }
        .person-center .my-info .info .scan #scan-btn{
            padding-top: 60px;
            line-height: 30px;
            background: url(/images/front/scan-img.png) center top no-repeat;
            background-size: 55px 55px;
        }

        .person-center .page__bd .weui-cells:first-child {
            margin-top: 0px;
        }
        .person-center span.tip {
            border: 1px solid #ef2034;
            color: #ef2034;
            border-radius: 2px;
            padding: 0 5px;
            font-size: 13px;
            background: none;
            margin-right: 7px;
        }

        .person-center span.ico {
            width: 25px;
            height: 25px;
            display: block;
            background-image: url("/images/front/income-ico.png");
            background-repeat: no-repeat;
            background-size: 221px 27px;
            margin-right: 10px;
        }

        .person-center .order-ico {
            background-position: -73px 0px;
        }

        .person-center .income-ico {
            background-position: -50px 0px;
        }
        .person-center .scan-ico {
            background-position: -172px 0px;
        }

        .person-center .set-ico {
            background-position: -121px 0px;
        }
        .person-center .hotline-ico {
            background-position: -146px 0px;
        }

        .person-center .congratulation {
            /*display: block;*/
            margin:30% auto;
            width: 300px;
        }
        .person-center .congratulation .box{
            background: url("/images/front/congratulation-bg.png") no-repeat;
            background-size: 300px 260px;
            width:300px;
            height:260px;
            text-align: center;
            overflow: hidden;
            font-size: 14px;
        }

        .person-center .congratulation .box p{
            margin: 80px auto 11px auto;
        }
        .person-center .congratulation .box strong{
            font-size: 36px;
            color: #ef2034;
        }
        .person-center .congratulation .box a{
            display: block;
            margin: 10px auto;
            width: 160px;
            height: 50px;
            background: url("/images/front/go-buy.png") no-repeat;
            -webkit-background-size: 160px 50px;
            background-size: 160px 50px;
        }
        .person-center .big-close-btn{
            display: block;
            margin: 30px auto;
            width: 40px;
            height: 40px;
            background: url("/images/front/big-close.png") no-repeat;
            -webkit-background-size: 40px 40px;
            background-size: 40px 40px;
        }

        .wait-tip {
            /*display: block;*/
            width: 80%;
            margin: 20% auto;
            background: #fff;
            border-radius: 5px;
            padding-bottom: 20px;
        }
        .wait-tip figure img{
            margin: -45px auto 0 auto;
            display: inline-block;
            margin-left: 50%;
            transform: translateX(-68px);
        }
        .wait-tip p{
            text-align: center;
            font-size: 14px;
        }
        .wait-tip .weui-btn{
            width: 80%;
            border: 1px solid #ef2034;
            background: #fff;
            color: #ef2034;
        }
        .tip-ico{
            display: inline-block;
            /*margin: 10px auto;*/
            width: 20px;
            height: 20px;
            background: url("/images/front/tips.png") no-repeat;
            -webkit-background-size: 20px 20px;
            background-size: 20px 20px;
        }
    </style>
</head>
<body class="page person-center">
<div class="pop-up">
    <%--恭喜您--%>
    <%--<div class="pop-up-box congratulation">--%>
        <%--<div class="box">--%>
            <%--<p>您有尚未开通的消费额度</p>--%>
            <%--<strong>￥8000.00</strong>--%>
            <%--<a href="/cuser/register.htm"></a>--%>
        <%--</div>--%>
        <%--<div class="big-close-btn"></div>--%>
    <%--</div>--%>

    <div class="pop-up-box wait-tip">
        <figure>
            <img src="/images/front/wait.png" width="136" height="136"/>
            <p>您提交的资料正在审核中<br>请耐心等待3-5分钟</p>
            <p style="margin: 20px auto; color: #999;">工作时间：9:00-21:00</p>
        </figure>
        <a href="javascript:;" id="i-know" class="weui-btn weui-btn_plain-primary">知道了</a>
    </div>

</div>

<%--<div class="weui-toptips weui-toptips_warn">错误提示</div>--%>

<%--<header>--%>
    <%--<a class="back-btn" href="/buser/toBMainPage.do"></a>--%>

    <%--<div class="title">个人中心</div>--%>
    <%--<div class="header-right"></div>--%>
<%--</header>--%>

<div class="page__bd">

    <div class="weui-cells">
        <div class="prompt">
            <span class="close-btn"></span>
            <p>为确保扣款成功，请保证还款储蓄卡有足够资金。</p>
        </div>
        <div class="my-info">
            <%-- <div class="state">
                 <div class="avator">
                     <img src="/images/yang.png" alt=""/>
                 </div>
                 <span>欢迎回来，根生</span>
                 <a class="setting" href="/buser/toBUserSettingPage.do">
                     <img src="/images/businesses/setting.svg"/>
                 </a>
             </div>--%>

            <div class="info">
                <div class="money">
                    <div class="title">
                        可用额度(元)
                    </div>
                    <div class="money-num">
                        <strong>
                           8000
                        </strong>
                        <span class="tip-ico"></span>
                    </div>
                 <%--   <p>近七日待还款：268.00</p>--%>
                </div>
              <%--<div class="scan">--%>
                    <%--<div id="scan-btn">扫码分期</div>--%>
                <%--</div>--%>
                <c:if test="${applimit != null}">
                    <a class="weui-btn weui-btn_plain-default" id="appLimitBtn" href="/cuser/cuser.htm">申请额度</a>
                </c:if>
            </div>
        </div>
    </div>
    <div class="weui-cells">
        <a class="weui-cell weui-cell_access" href="/cuser/register.htm?status=1">
            <div class="weui-cell__hd">
                <span class="ico scan-ico"></span>
            </div>
            <div class="weui-cell__bd">
                <p>扫码分期</p>
            </div>
            <div class="weui-cell__ft">
                <%--<fmt:formatNumber pattern="0.00" value="${income}"></fmt:formatNumber>--%>
            </div>
        </a>
        <a class="weui-cell weui-cell_access" href="/order/orderlist">
            <div class="weui-cell__hd">
                <span class="ico order-ico"></span>
            </div>
            <div class="weui-cell__bd">
                <p>我的订单</p>
            </div>
            <div class="weui-cell__ft">
            </div>
        </a>
    </div>
    <div class="weui-cells">

        <a class="weui-cell weui-cell_access" href="/userinfo/myIncome">
            <div class="weui-cell__hd">
                <span class="ico income-ico"></span>
            </div>
            <div class="weui-cell__bd">
                <p>我的收入</p>
            </div>
            <div class="weui-cell__ft">
                <fmt:formatNumber pattern="0.00" value="${income}"></fmt:formatNumber>
            </div>
        </a>
    </div>
    <div class="weui-cells">
        <a class="weui-cell weui-cell_access" href="/userinfo/bonusRecord">
            <div class="weui-cell__hd">
                <span class="ico gift-ico"></span>
            </div>
            <div class="weui-cell__bd">
                <p>分享有礼</p>
            </div>
            <div class="weui-cell__ft">
                <span class="tip">现金奖励</span>
            </div>
        </a>
    </div>

   <%-- <div class="weui-cells">
        <a class="weui-cell weui-cell_access" href="/userinfo/myIncome">
            <div class="weui-cell__hd">
                <span class="ico set-ico"></span>
            </div>
            <div class="weui-cell__bd">
                <p>个人设置</p>
            </div>
            <div class="weui-cell__ft">
            </div>
        </a>
        <a class="weui-cell weui-cell_access" href="/order/orderlist">
            <div class="weui-cell__hd">
                <span class="ico hotline-ico"></span>
            </div>
            <div class="weui-cell__bd">
                <p>客服热线</p>
            </div>
            <div class="weui-cell__ft">
                0755-86627551
            </div>
        </a>
    </div>
--%>
</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script>
    //弹框方法
    var popUp = {
        show : function(ele){
            $('.pop-up').show().children(ele).show();
        },
        hide : function (ele) {
            $('.pop-up').hide().children(ele).hide();
        }
    };

    //如果未申请弹出提示
//    popUp.show('.congratulation');

    //还款计划弹框
    $(".big-close-btn").click(function () {
        popUp.hide('.congratulation');
    })
    //关闭提示
    $(".close-btn").click(function () {
        $('.prompt').hide();
    })

    //审核提示
    $('.tip-ico').click(function () {
        popUp.show('.wait-tip');
    })

    $('#i-know').click(function () {
        popUp.hide('.wait-tip');
    })
</script>
</html>
