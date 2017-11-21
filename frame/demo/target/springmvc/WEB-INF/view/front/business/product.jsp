<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="/css/front/common.css">
    <link rel="stylesheet" href="/css/front/style.css">
    <link rel="stylesheet" href="/css/front/swiper.3.1.2.min.css">
</head>
<body class="bg-eee">
<header>
    <a class="back-btn" href="javascript:window.history.go(-1)"></a>

    <div class="title">产品详情</div>
    <div class="header-right"></div>
</header>
<input type="hidden" id="downpayment" value="${tGoods.downpayment}"><!--首付-->
<input type="hidden" id="goodsprice" value="${tGoods.goodsprice}"/>
<input type="hidden" id="product_id" value="${tGoods.id}"/><!--商品id-->
<input type="hidden" id="facilitator_id" name="facilitator_id"
       <c:if test="${empty cFacilitator}">value="0"</c:if>
       <c:if test="${not empty cFacilitator}">value="${cFacilitator.id}"</c:if> ><!--门店id-->
<input type="hidden" id="phone" name="phone" value="${user.cellPhone}"/>
<input type="hidden" id="userid" name="userid" value="${user.id}"/>
<input type="hidden" id="pay_type" name="pay_type"
       <c:if test="${not empty pay_type}">value="${pay_type}" </c:if>
       <c:if test="${empty pay_type}">value="0" </c:if> /><!--支付方式--->
<input type="hidden" id="periodization" name="periodization"
       <c:if test="${not empty periodization}">value="${periodization}" </c:if> <c:if
        test="${empty periodization}"> value="1" </c:if>/><!---期数--->
<div class="container">
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <c:forEach items="${tGoodsPiclist}" var="tgoodspic">
                <div class="swiper-slide"><img width="100%" height="150" src="/imgs${tgoodspic.img_url}"/></div>
            </c:forEach>
            <%--<c:if test="${fn:length(tGoodsPiclist) <= 0}">--%>
            <%--<div class="swiper-slide"><img width="100%" src="/css/images/front/product-details.png"/></div>--%>
            <%--<div class="swiper-slide"><img width="100%" src="/css/images/front/product-details.png"/></div>--%>
            <%--<div class="swiper-slide"><img width="100%" src="/css/images/front/product-details.png"/></div>--%>
            <%--</c:if>--%>
        </div>
        <div class="swiper-pagination"></div>
    </div>
    <div class="product-title">
        <div class="title-left">
            <p class="p1">${tGoods.goodsname}</p>

            <p class="p2">总价：￥${tGoods.goodsprice}</p>
        </div>
        <div class="title-right">
            <p>已售${saledgoodscount}件</p>
        </div>
    </div>
    <div class="product-info margin-top10">
        <div class="info-left">选择支付类型</div>
        <div class="info-right">
      <span class='option-span
       <c:choose>
          <c:when test="${empty pay_type}">active</c:when>
          <c:when test="${pay_type == 0}">active</c:when>
          <c:when test="${pay_type == 1}">disabled</c:when>
       </c:choose>
       pay-now'>立即支付</span>
      <span class='option-span
       <c:choose>
          <c:when test="${empty pay_type}">disabled</c:when>
          <c:when test="${pay_type == 0}">disabled</c:when>
          <c:when test="${pay_type == 1}">active</c:when>
       </c:choose>
      active instalments'>分期付款</span>
        </div>
    </div>
    <div class="product-info margin-top10">
        <div class="info-left">选择分期</div>
        <div class="info-right">
      <span class='option-span
       <c:choose>
          <c:when test="${empty periodization}">active</c:when>
          <c:when test="${periodization == 3}">active</c:when>
          <c:when test="${periodization == 6}">disabled</c:when>
       </c:choose>
       three-period' id="period3">¥<fmt:formatNumber type="number" value="${(tGoods.goodsprice-tGoods.downpayment)/3}"
                                                     pattern="0.00"/> x 3期</span>
      <span class='option-span
       <c:choose>
          <c:when test="${empty periodization}">disabled</c:when>
          <c:when test="${periodization == 3}">disabled</c:when>
          <c:when test="${periodization == 6}">active</c:when>
       </c:choose>
        six-period' id="period6">¥<fmt:formatNumber type="number" value="${(tGoods.goodsprice-tGoods.downpayment)/6}"
                                                    pattern="0.00"/> x 6期</span>
        </div>
    </div>
    <div class="product-info border-top-ccc"
            <c:choose>
                <c:when test="${empty user.userName or user.userName == ''}">
                    onclick="checkoutUserInfo()"
                </c:when>
                <c:otherwise>
                    onclick="baseinfo()"
                </c:otherwise>
            </c:choose>
            >
        <div class="info-left">客户信息</div>
        <div class="info-right">
      <span class="info-text">
        <c:choose>
            <c:when test="${empty user.userName or user.userName == ''}">
                请填写用户信息
            </c:when>
            <c:otherwise>
                ${user.userName}
            </c:otherwise>
        </c:choose>
      </span>
            <span class="right-arrow"></span>
        </div>
    </div>
    <div class="product-info border-top-ccc" onclick="installCar()">
        <div class="info-left">安装车辆</div>
        <input type="hidden" value="${cUserCar.id}" id="carnum"/>

        <div class="info-right">
      <span class="info-text">
      <c:choose>
          <c:when test="${empty cUserCar.car_num or cUserCar.car_num == ''}">
              请填写车辆信息
          </c:when>
          <c:otherwise>
              ${cUserCar.car_num}
          </c:otherwise>
      </c:choose>
      </span>
            <span class="right-arrow"></span>
        </div>
    </div>
    <div class="product-info border-top-ccc" onclick="selectStore()">
        <div class="info-left">服务商门店</div>
        <div class="info-right">
      <span class="info-text">
        <c:if test="${empty cFacilitator}">请选择门店</c:if>
        <c:if test="${not empty cFacilitator}">${cFacilitator.facilitator_name}</c:if>
      </span>
            <span class="right-arrow"></span></div>
    </div>
    <p class="prompt-text margin-top10">目前只支持上门安装客户，请确认是在服务商指引下操作。</p>

    <div class="agree-btn" id="agreementdiv">

    </div>
    <div class="pay-box">
        <input type="hidden" id="paying" value="0"/>

        <div class="pay-left">待支付金额：<span class="c-f47c2c" id="payingshow">首付 ¥100</span></div>
        <div class="pay-right">立即购买</div>
    </div>
</div>
<div class="pop-up">
    <div class="pop-box ">
        <div class="close-btn"></div>
        <div class="send-text" id="smstips"></div>
        <input class="code-in" type="text" placeholder="请输入短信验证码" id="code"/>

        <div class="confirm-btn">确认</div>
        <input type="hidden" id="btnclickflag" value="true"/><!--按钮重复点击标志-->
    </div>
</div>
</body>
<script src="/js/front/swiper.3.1.2.min.js"></script>
<script src="/js/front/jquery-1.8.3.min.js"></script>
<script>

    /**
     *个人资料
     */
    function checkoutUserInfo() {
        location.href = "/userinfo/touserinfo?product_id=" + $("#product_id").val() + "&pay_type=" + $("#pay_type").val() + "&periodization=" + $("#periodization").val();
    }

    function baseinfo() {
        location.href = "/userinfo/baseinfo";
    }

    /**
     *车辆资料
     */
    function installCar() {

        var userid = $("#userid").val();
        if (userid == undefined || userid == null || userid == '') {
            alert("请先填写用户资料！");
            checkoutUserInfo();
            return;
        }

        location.href = "/userinfo/tocarlist?userid=" + userid + "&product_id=${tGoods.id}" + "&pay_type=" + $("#pay_type").val() + "&periodization=" + $("#periodization").val();
    }

    //门店选择
    function selectStore() {
        location.href = "/order/selectstore?product_id=${tGoods.id}" + "&pay_type=" + $("#pay_type").val() + "&periodization=" + $("#periodization").val();
    }

    function initPeriodData(downpayment, goodsprice) {
        var paying3 = (goodsprice - downpayment) / 3;
        var paying6 = (goodsprice - downpayment) / 6;
        $("#period3").html("¥" + paying3 + " x 3期");
        $("#period6").html("¥" + paying6 + " x 6期");
    }

    $(function () {
        // 初始化分期数据
        var downpayment = $("#downpayment").val();
        var goodsprice = $("#goodsprice").val();
//    initPeriodData(downpayment,goodsprice);

        //初始化页面信息
//    $(".pay-now").removeClass("disabled").addClass("active");
//    $(".pay-now").siblings(".option-span").removeClass("active").addClass("disabled");
        var pay_type = '${pay_type}';
        $("#agreementdiv").html('<input type="checkbox" id="agreement"><p>我已阅读并同意喜卡车联还款合同</p>');
        $("#paying").val(downpayment);
        $("#payingshow").html("￥" + downpayment);
        if (pay_type != '1') {
            $("#agreementdiv").html('');
            $(".product-info").not(":eq(0)").hide();
            $("#paying").val(goodsprice);
            $("#payingshow").html("￥" + goodsprice);
        }
    });

    var mySwiper = new Swiper('.swiper-container', {
        autoplay: 5000, //可选选项，自动滑动
        pagination: '.swiper-pagination'
    });
    $(".option-span").click(function () {
        if ($(this).hasClass("disabled")) {
            $(this).removeClass("disabled").addClass("active");
            $(this).siblings(".option-span").removeClass("active").addClass("disabled");
        }
        //商品价格
        var downpayment = $("#downpayment").val();
        var goodsprice = $("#goodsprice").val();

        if ($(this).hasClass("pay-now")) {//立即支付
            $("#agreementdiv").html('');
            $("#pay_type").val(0);
            $("#periodization").val(1);
            $(".product-info").not(":eq(0)").hide();
            $("#paying").val(goodsprice);
            $("#payingshow").html("¥" + goodsprice);
        }
        if ($(this).hasClass("instalments")) {//分期付款
            $("#agreementdiv").html('<input type="checkbox" id="agreement"><p>我已阅读并同意喜卡车联还款合同</p>');
            $("#pay_type").val(1);
            $(".product-info").not(":eq(0)").show();
            if ($(".three-period").hasClass("active")) {
                $("#periodization").val(3);
                $("#paying").val(downpayment);
                $("#payingshow").html("首付：¥" + downpayment);
            }
            if ($(".six-period").hasClass("active")) {
                $("#periodization").val(6);
                $("#paying").val(downpayment);
                $("#payingshow").html("首付：¥" + downpayment);
            }
        }
        if ($(this).hasClass("three-period")) {//分三期
            $("#periodization").val(3);
            $("#paying").val(downpayment);
            $("#payingshow").html("首付：¥" + downpayment);
        }
        if ($(this).hasClass("six-period")) {//分六期
            $("#periodization").val(6);
            $("#paying").val(downpayment);
            $("#payingshow").html("首付：¥" + downpayment);
        }


    });


    //立即购买
    $(".pay-right").click(function () {

        var phone = $("#phone").val();
        var product_id = $("#product_id").val();
        var facilitator_id = $("#facilitator_id").val();
        var pay_type = $("#pay_type").val();
        var periodization = $("#periodization").val();
        var carnum = $("#carnum").val();
        var agreement = document.getElementById("agreement");
        if (product_id != undefined && agreement != null && product_id != '') {
            agreement = document.getElementById("agreement").checked;
        }
        if (product_id == undefined || product_id == null || product_id == '') {
            alert("需重新选择商品");
            location.href = "/index";
            return;
        }

        if ($(".pay-now").hasClass("active")) {//立即支付：无需填写资料
            //按钮点击判断
            if ($("#btnclickflag").val() == "true") {
                $("#btnclickflag").val("false");
            } else {
//        alert("等待响应");
                return;
            }

            //生成订单
            $.ajax({
                type: 'post',
                url: '/order/createorder',
                data: {
                    product_id: product_id, pay_type: pay_type, periodization: periodization
                },
                success: function (data) {
                    if (data.status == "1") {
//            alert("生成订单成功");
                        var trepayids = data.trepayid;
                        var orderid = data.orderid;
                        var goodsid = data.goodsid;
                        $.ajax({
                            type: 'post',
                            url: '/order/wxpayConfig',
                            data: {
                                trepayids: trepayids
                            },
                            success: function (data) {
//                alert(data);
                                $("#btnclickflag").val("true");//按钮 可以点击
                                if (data.status == '1') {
                                    h5invokeweixinpay(data.timestamp, data.nonceStr, data.packages, data.paySign, trepayids, orderid, goodsid);
                                } else {
                                    alert("weixin config failed");
                                }

                            }
                        });
                    } else {
                        alert("订单生成异常");
                    }
                }
            });

            return;
        }

        //  分期付款判断
        if (agreement == false) {
            alert("请先阅读喜卡车联还款合同！");
            return;
        }

        if (phone == undefined || phone == null || phone == '') {
            alert("需完善客户资料");
            checkoutUserInfo();
            return;
        }
        if (carnum == undefined || carnum == null || carnum == '') {
            alert("车牌号不能为空");
            installCar();
            return;
        }


        //按钮点击判断
        if ($("#btnclickflag").val() == "true") {
            $("#btnclickflag").val("false");
        } else {
//        alert("等待响应");
            return;
        }

        //同一车牌不能购买同一商品多次
        $.ajax({
            type: 'post',
            url: '/order/checkCarAndOrder',
            data: {
                product_id: product_id, carnum: carnum
            },
            success: function (data) {
                if (data.status == "1") {//第一次购买

                    if (facilitator_id == '0') {
                        alert("请选择一个门店");
                        return;
                    }

                    if ($(".instalments").hasClass("active")) {//分期支付

                        var phone = $("#phone").val();
                        //发送短信
                        $.ajax({
                            type: 'post',
                            url: '/userinfo/sendSms',
                            data: {
                                phone: phone
                            },
                            success: function (data) {
                                if (data.status == "1") {
                                    $("#smstips").html("验证码已经发送到" + phone.substr(0, 3) + "****" + phone.substr(7) + "请注意查收");
                                    $(".pop-up").show();
                                    $(".pop-box").show();
                                } else {
                                    alert("短信发送失败，请稍后再试！");
                                }
                            }
                        });
                    }

                } else {
                    alert("此车已购买过该产品，不可重复购买！");
                }
            }
        });

    });
    //短信框
    $(".close-btn").click(function () {
        $("#btnclickflag").val("true");
        $(".pop-up").hide();
        $(".pop-box").hide();
    });
    //确认按钮
    $(".confirm-btn").click(function () {

        var phone = $("#phone").val();
        var product_id = $("#product_id").val();
        var facilitator_id = $("#facilitator_id").val();
        var pay_type = $("#pay_type").val();
        var periodization = $("#periodization").val();
        var carnum = $("#carnum").val();

        var code = $("#code").val();
        if (code == null || code == '') {
            alert("短信验证码不能为空！");
            return;
        }
        //  短信验证
        $.ajax({
            type: 'post',
            url: '/userinfo/validateSms',
            data: {
                phone: phone, code: code
            },
            success: function (data) {

                if (data.status == "1") {
                    //生成订单
                    $.ajax({
                        type: 'post',
                        url: '/order/createorder',
                        data: {
                            phone: phone,
                            product_id: product_id,
                            facilitator_id: facilitator_id,
                            pay_type: pay_type,
                            periodization: periodization,
                            carnum: carnum
                        },
                        success: function (data) {
                            if (data.status == "1") {
//                alert("生成订单成功");
                                var money = $("#paying").val();
                                var trepayids = data.trepayid;
                                var orderid = data.orderid;
                                var goodsid = data.goodsid;
                                if (money > 0) {//首付>0
                                    //微信配置
                                    $.ajax({
                                        type: 'post',
                                        url: '/order/wxpayConfig',
                                        data: {
                                            trepayids: trepayids
                                        },
                                        success: function (data) {
                                            $("#btnclickflag").val("true");
//                    alert(data);
                                            if (data.status == '1') {
                                                h5invokeweixinpay(data.timestamp, data.nonceStr, data.packages, data.paySign, trepayids, orderid, goodsid);
                                            } else {
                                                alert("weixin config failed");
                                            }

                                        }
                                    });
                                } else {

                                    //发送短信
                                    $.ajax({
                                        type: 'post',
                                        url: '/order/applySuccessSendSms',
                                        data: {
                                            orderid: orderid, goodsid: goodsid
                                        },
                                        success: function (data) {
                                            if (data.status == "0") {
                                                alert("短信发送异常");
                                            }
                                        }
                                    });
                                    location.href = "/order/applySuccess?orderid=" + orderid + "&goodsid=" + goodsid;
                                }

                            } else {
                                alert("订单生成异常");
                            }
                        }
                    });

                } else {
                    alert("验证失败");
                }
            }
        });


        $(".pop-up").hide();
        $(".pop-box").hide();
    });


</script>


<!-- 引入微信接口js-->
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
    var appid = '${appid}';
    var times = '${timestamp}';
    var nonce = '${nonceStr}';
    var signa = '${signature}';

    wx.config({
//    debug: true,
        appId: appid,
        timestamp: times,
        nonceStr: nonce,
        signature: signa,
        jsApiList: [
            'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo',
            'hideMenuItems',
            'showMenuItems',
            'hideAllNonBaseMenuItem',
            'showAllNonBaseMenuItem',
            'translateVoice',
            'startRecord',
            'stopRecord',
            'onRecordEnd',
            'playVoice',
            'pauseVoice',
            'stopVoice',
            'uploadVoice',
            'downloadVoice',
            'chooseImage',
            'previewImage',
            'uploadImage',
            'downloadImage',
            'getNetworkType',
            'openLocation',
            'getLocation',
            'hideOptionMenu',
            'showOptionMenu',
            'closeWindow',
            'scanQRCode',
            'chooseWXPay',//微信支付模块
            'openProductSpecificView',
            'addCard',
            'chooseCard',
            'openCard'
        ]
    });


    /**
     * 支付函数
     * @param timeStamp
     * @param nonce_str
     * @param prepay_id
     * @param paySign
     * @param trepayids
     * @param orderid
     * @param goodsid
     */
    function h5invokeweixinpay(timeStamp, nonce_str, packages, paySign, trepayids, orderid, goodsid) {
        wx.chooseWXPay({
            timestamp: (timeStamp),
            nonceStr: nonce_str,
            package: packages,
            signType: 'MD5',
            paySign: paySign,
            success: function (res) {
//          alertObj(res);
//          alert("支付成功");
                //修改repay状态
                $.ajax({
                    type: 'post',
                    url: '/order/updateTRepay',
                    data: {
                        trepayids: trepayids
                    },
                    success: function (data) {
                        if (data.status == "1") {
                            //发送短信
                            $.ajax({
                                type: 'post',
                                url: '/order/applySuccessSendSms',
                                data: {
                                    orderid: orderid, goodsid: goodsid
                                },
                                success: function (data) {
                                    if (data.status == "0") {
                                        alert("短信发送异常");
                                    }
                                }
                            });

//                alert("修改repay状态成功");
                            location.href = "/order/applySuccess?orderid=" + orderid + "&goodsid=" + goodsid;
                        } else {
                            //支付成功，修改记录失败，可记录失败的还款记录，手工处理。
                            alert("支付成功，服务器异常，更改还款记录失败");
                        }
                    }
                });
            },
            cancel: function (res) {
//          alert("cancel");//delete order
                //删除生成的订单
                $.ajax({
                    type: 'post',
                    url: '/order/deleteOrder',
                    data: {
                        orderid: orderid
                    },
                    success: function (data) {
                    }
                });
            },
            fail: function (res) {
                alert("fail");
            }

        });

    }
    function alertObj(obj) {
        var output = "";
        for (var i in obj) {
            var property = obj[i];
            output += i + " = " + property + "\n";
        }
        alert(output);
    }

</script>


</html>
