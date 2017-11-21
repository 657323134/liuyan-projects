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
            font-size: 28px;
            line-height: 60px;
            font-weight: 200;
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

        .wait-tip,.wait-ntp {
            /*display: block;*/
            width: 70%;
            margin: 45% 15%;
            background: #fff;
            border-radius: 10px;
            padding-bottom: 25px;
        }
        .pop-up-box figure{
            position: relative;
        }

        .wait-tip p{
            text-align: center;
            font-size: 14px;
            font-family: SimSun;
        }

        .wait-img{
            width: 21px;
            height: 21px;
            position: absolute;
            top: 5px;
            right: 5px;
            background: url("/images/front/wait-x.png") no-repeat;
            background-size: 21px 21px;
            -webkit-background-size: 21px 21px;
        }
        .wait-img2{
            display: inline-block;
            margin: -45px auto 0 auto;
            margin-left: 50%;
            transform: translateX(-68px);
            width: 136px;
            height: 136px;

        }
        .wait-ntp .wait-ntp-box {
            text-align: center;
        }
        .wait-ntp-box span{
            position: relative;
            padding-left: 22px;
        }
        .wait-ntp-box img{
            position: absolute;
            left: 0;
            top: 1px;
            width: 18px;
            height: 18px;
        }
        .wait-span{
            font-size: 18px;
            color: #303131;
            height: 38px;
            line-height: 38px;
            text-align: center;
            font-weight: 400;
        }
        .wait-ntp .wait-p2{
            text-align: center;
            padding: 10px 15%;
            font-family: PingFangSC-Regular;
            font-size: 14px;
            color: #333333;
            letter-spacing: 0;
            line-height: 19px;
        }
        .pop-up-box .weui-btn{
            margin-top: 25px;
            background-color: #fff;
            border-radius: 4px;
            width: 58%;
            height: 42px;
            line-height: 42px;
            color: #EF2034;
            border: 1px solid #EF2034;
            font-size: 15px;
        }
        .wait-ico{
            display: inline-block;
            /*margin: 10px auto;*/
            width: 20px;
            height: 20px;
            background: url("/images/front/tips.png") no-repeat;
            -webkit-background-size: 20px 20px;
            background-size: 20px 20px;
            margin-left: 8px;
        }
    </style>
</head>
<body class="page person-center">

<div class="pop-up">
    <%--恭喜您--%>
        <c:if test="${applimit=='申请额度'}">
    <div class="pop-up-box congratulation">
        <div class="box">
            <p>您有尚未开通的消费额度</p>
            <strong>￥8000.00</strong>
            <a href="/cuser/register.htm"></a>
        </div>
        <div class="big-close-btn"></div>
    </div>
            </c:if>
        <%--<c:if test="${applimit=='正在审核'}">--%>
    <div class="pop-up-box wait-tip">
        <figure>
            <a href="javascript:;" class="wait-img" id="wait-tip-ai"></a>
            <img src="/images/front/wait.png" class="wait-img2"/>
            <p>您提交的资料正在审核中<br>请耐心等待3-5分钟</p>
            <p style="margin: 20px auto; color: #999;">工作时间：9:00-21:00</p>
        </figure>
        <a href="javascript:;" id="i-know" class="weui-btn weui-btn_plain-primary">我知道了</a>
    </div>
        <%--</c:if>--%>

        <%--资料审核不通过--%>
        <div class="pop-up-box wait-ntp">
            <figure>
                <a href="javascript:;" class="wait-img" id="wait-ntp-ai"></a>
                <img src="/images/front/wait-w.png" class="wait-img2"/>
                <div class="wait-ntp-box">
                    <span class="wait-span"><img src="/images/front/wait-x2.png"/>审核未通过</span>
                </div>
                <p class="wait-p2">您提交的资料不符合标准,请修改后重新提交!</p>
            </figure>
            <a href="javascript:;" class="weui-btn weui-btn_plain-primary xiugai-a" onclick="modifyInfo('${userId}');">修改资料</a>
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
            <div class="info">
                <div class="money">
                    <div class="title">
                        可用额度(元)
                    </div>
                    <div class="money-num">
                        <c:if test="${applimit==null}">
                            <strong>
                            <fmt:formatNumber pattern="0.00" value="${canUseMoney}"></fmt:formatNumber>
                            </strong>
                        </c:if>
                        <c:if test="${applimit=='正在审核'}">
                            <strong>正在审核</strong><span class="wait-ico" id="tip-ico"></span>
                        </c:if>

                        <c:if test="${applimit=='授信不通过'}">
                            <strong>授信不通过</strong>
                        </c:if>
                        <c:if test="${applimit=='申请额度'}">
                            <strong>未开通</strong>
                        </c:if>
                        <c:if test="${applimit=='资料未通过'}">
                            <strong>资料未通过</strong><span class="wait-ico" id="ntp-ico"></span>
                        </c:if>
                    </div>
                </div>
                <c:if test="${applimit == '申请额度'}">
                    <a class="weui-btn weui-btn_plain-default" id="appLimitBtn" href="/cuser/cuser.htm">申请额度</a>
                </c:if>
                <c:if test="${applimit=='正在审核'}">
                    <a class="weui-btn weui-btn_plain-default" id="appLimitBtn" href="/userinfo/personCenter">刷新</a>
                </c:if>
                <c:if test="${applimit=='资料未通过'}">
                    <a class="weui-btn weui-btn_plain-default" id="appLimitBtn" onclick="modifyInfo('${userId}');">修改资料</a>
                </c:if>
            </div>
        </div>
    </div>
    <div class="weui-cells">
        <a class="weui-cell weui-cell_access" id="SaoMa">
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
    var sta ='${applimit}';
            if(sta=='申请额度'){
                popUp.show('.congratulation');
            };

    //还款计划弹框
    $(".big-close-btn").click(function () {
        popUp.hide('.congratulation');
    });
    //关闭提示
    $(".close-btn").click(function () {
        $('.prompt').hide();
    });

    //审核提示
    $('#tip-ico').click(function () {
        popUp.show('.wait-tip');
    });

    //资料未通过提示
    $('#ntp-ico').click(function () {
        popUp.show('.wait-ntp');
    });

//    关闭提示
    $('#i-know').click(function () {
        popUp.hide('.wait-tip');
    });
    $("#wait-tip-ai").click(function(){
        popUp.hide('.wait-tip');
    });
    $("#wait-ntp-ai").click(function(){
        popUp.hide('.wait-ntp');
    });


    $("#SaoMa").click(function(){
        $.ajax({
            url:'/userinfo/checkSaoMa',
            dataType:'JSON',
            success:function(data){
                if(data.msg=='apply'){/*未授信的情况下*/
                    window.location.href="/cuser/register.htm"
                }
                if(data.msg=='examine'){
                    alert("授信审核中");
                    return;
                }
                if(data.msg=='adopt'){
                    window.location.href="/cuser/identify.htm?status=1";
                }
                if(data.msg=='error'){
                    alert("很抱歉，您的资料未通过审核不能使用该功能");
                    return;
                }
            }
        });
    });

    function modifyInfo(userId) {
        window.location.href="/cuser/queryBaseInfo?userId=" + userId +"&flag=true";
    }
</script>

</html>
