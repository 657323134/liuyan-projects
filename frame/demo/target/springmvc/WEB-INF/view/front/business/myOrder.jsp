<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
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
    <link rel="stylesheet" href="/css/front/common.css">
    <link rel="stylesheet" href="/css/front/style1.css">
</head>
<jsp:include page="/WEB-INF/view/comm/baidu_tongji_header.html"/>
<body class="bg-eee my-order">
<header>
    <a class="back-btn" href="/userinfo/tologin"></a>

    <div class="title">我的订单</div>
    <div class="header-right"></div>
</header>

<div class="pop-up choose-pay">
    <div class="choose-box">
        <span class="close-ico"></span>

        <h3>待支付金额<span id="sumMoneyUnPay">555.56</span>元</h3>

        <p>选择支付方式</p>
        <%--<div class="radio"><div class="radio-btn"><input type="radio" name="pay" value="0"><i></i></div>微信支付</div>--%>
        <div class="radio">
            <div class="radio-btn"><input type="radio" name="pay" value="1" checked="checked"><i></i></div>
            银行卡(${tBanktype.name} 尾号${bankcard})
        </div>
        <div class="verification">
            <%--<label for="">验证码</label>--%>
            <input type="text" placeholder="输入验证码" id="smsCode"/>
            <span id="send-code">获取验证码</span>
            <input type="hidden" id="phone" value="${cUser.cellPhone}"/><!--手机号-->
        </div>
        <a id="pay_btn">支付</a>
    </div>
</div>

<!--逾期弹出框-->
<div class="pop-up beyond-pay">
    <div class="choose-box">
        <span class="close-ico"></span>

        <p>逾期详情</p>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td>还款期次</td>
                <td id="beyond_period">3/6期</td>
            </tr>
            <tr>
                <td>预计还款日期</td>
                <td id="beyond_date">2016-12-12</td>
            </tr>
            <tr>
                <td>每期还款</td>
                <td id="beyond_money">555</td>
            </tr>
            <tr>
                <td>逾期天数</td>
                <td id="beyond_day"></td>
            </tr>
            <tr>
                <td>罚息金额</td>
                <td id="beyond_overduemoney"></td>
            </tr>
        </table>
        <a id="close-beyond-pay">确认</a>
    </div>
</div>


<input type="hidden" value="0" id="repayids"/><!--还款记录id 逗号隔开-->
<input type="hidden" value="0" id="paymoney"> <!--还款金额-->
<input type="hidden" value="${cUser.id}" id="userid"/>
<div class="container">
    <!-- 判断没有订单显示图片-->
    <div class="noOrder">
        <div class="noOrder_box">
            <img src="/images/front/icon_zanwujilu.png" alt=""/>
            <p>暂无订单记录</p>
        </div>
    </div>
    <div class="order-box">
        <!--全部-->
        <c:forEach items="${resultList}" var="order">
            <div class="order-item">
                <div class="order-top">
                    <div class="top-left" id="orderNum">订单号${order.ordernum}</div>
                    <div class="top-right">${order.orderdate}</div>
                </div>
                <div class="order-details">
                    <div class="details-left">
                        <img src="${order.goodsurl}">
                    </div>
                    <div class="details-right">
                        <div class="order-title">${order.goodsname}</div>
                        <div class="order-money">￥${order.ordermoney}</div>
                        <div class="order-standard">
                            <span>¥${order.moneyofonce}x${order.periodization}期</span>
                            <span>剩余${order.unrepay}期</span>
                                <%--<span>首付${order.downpayment}元</span>--%>
                        </div>
                            <%--<div class="downPayment-info">首付${order.downpayment}元</div>--%>
                    </div>
                </div>

                <div class="order-table">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <c:forEach items="${order.repaylist}" var="repay">
                            <c:if test="${repay.numOfPeriods != 0}">
                                <tr
                                        <c:if test="${repay.isBeyond > 0}">class="c-e72525"</c:if>> <%--<c:if test="${repay.repayStatus == 2}" >class="c-e72525"</c:if>--%>
                                    <!--退货中和退货成功订单不让用户操作还款-->
                                    <c:choose>
                                        <c:when test="${repay.cancel_order_status == 1 || repay.cancel_order_status == 2  }">
                                            <td></td>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${repay.repayStatus == 1}">
                                                <td class="check-box">
                                                    <input type="checkbox" value="${repay.repayid}" name="repayid"/>
                                                    <label></label>
                                                    <input type="hidden" value="${repay.capitalAmount}"
                                                           name="paymoney"/>
                                                </td>
                                            </c:if>
                                            <c:if test="${repay.repayStatus == 2 || repay.repayStatus == 3}">
                                                <td>
                                                        <%--<input type="checkbox" value="${repay.repayid}" name="repayid" disabled checked/>--%>
                                                        <%--<label></label>--%>
                                                </td>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                    <td><span class="icon-padding <c:if test="${repay.isBeyond > 0}">info-icon </c:if>"
                                              name="paymoney"
                                              value="${repay.capitalAmount}">${repay.capitalAmount}元</span></td>
                                    <td>

                                            ${repay.numOfPeriods}/${repay.periodization}期

                                    </td>

                                    <!--已退货，和退货中不让用户手动还款-->
                                    <c:choose>
                                        <c:when test="${repay.cancel_order_status == 1 }">
                                            <td>申请退货中</td>
                                        </c:when>
                                        <c:when test="${repay.cancel_order_status == 2}">
                                            <td>退货成功</td>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${repay.repayStatus == 1}">
                                                <c:if test="${repay.isBeyond <= 0}">
                                                    <%--<td>剩余${repay.repayDate}天</td>--%>
                                                    <td>${repay.repayDate}</td>
                                                </c:if>
                                                <c:if test="${repay.isBeyond > 0}">
                                                    <td>已逾期${repay.repayDate}天</td>
                                                    <td name="beyondInfo" data-value="${repay.repayid}">>></td>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${repay.repayStatus == 2}">
                                                <td>已还款</td>
                                            </c:if>
                                            <c:if test="${repay.repayStatus == 3}">
                                                <td>扣款中</td>
                                            </c:if>
                                            <c:if test="${repay.repayStatus == 4}">
                                                <td>已取消</td>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </c:forEach>


    </div>
    <div class="order-operate">
        <p>待支付：<span class="sum-num">￥<span id="summoney">0</span></span></p>

        <span class="operate-btn pay-btn">立即还款</span>
        <input type="hidden" id="btnclickflag" value="true"/><!--按钮重复点击标志-->
        <input type="hidden" id="payType" value="1"/><!--0 微信支付或者1 连连支付  默认连连支付 important-->
    </div>
</div>
</body>
<script src="/js/front/jquery-1.8.3.min.js"></script>
<script>
   //没有订单提示
   window.onload=function(){
       var hasDatas = $("#orderNum").text();
       if(hasDatas == "" || hasDatas == null || hasDatas == undefined){
           $(".noOrder").css('display','block');
       }else{
           $(".noOrder").css('display','none');
       };
   }

    //发送短信验证码
    function isTel(tel) {
        var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
        return reg.test(tel);
    }

    var SendSmsCode = {
        smsobj: null,
        count: 120,
        start: function () {
            this.count = this.count - 1;
            if (this.count > 0) {
                this.smsobj.html(this.count + "秒");
                this.smsobj.attr("disabled", "true");
                var _this = this;
                setTimeout(function () {
                    _this.start();
                }, 1000);
            } else {
                this.smsobj.removeAttr("disabled");
                this.smsobj.html("获取验证码");
                this.count = 120;
            }
        },
        //初始化
        init: function (smsobj) {
            this.smsobj = smsobj;
            this.smsobj.attr("disabled", "true");
            this.start();
        }
    };

    $("#send-code").click(function () {
        var $this = $(this);

        if ($this.attr("disabled") != undefined && $this.attr("disabled") == "disabled") {
            return false;
        }

        var phone = $("#phone").val();
        if (phone == "") {
            alert("请输入手机号");
            return false;
        }
        if (!isTel(phone)) {
            alert("您的手机号输入有误请重新输入")
            return false;
        }

        $.post("/userinfo/sendSms",
                {phone: phone},
                function (msg) {
                    if (msg.status == 1) {
                        //alert("已发送,请查看");
                        SendSmsCode.init($this);
                    } else if (msg.status == 3) {
                        alert("您的手机号不存在")
                        return false;
                    } else {
                        alert("发送失败请重试")
                        return false;
                    }
                }
        );
    });


    $('.order-details').click(function () {
        $(this).siblings('.order-table').slideToggle();
    });
    $('.check-box input').click(function () {

        var paymoney = $(this).siblings("input[name='paymoney']").val();//支付额显示
        if ($(this).is(':checked')) {
            $(this).parents('tr').addClass('c-e72525');
            $("#summoney").html((parseFloat($("#summoney").html()) + parseFloat(paymoney)).toFixed(2));
            console.log($("#summoney").html());
            $("#sumMoneyUnPay").html($("#summoney").html());
        } else {
            $(this).parents('tr').removeClass('c-e72525');
            $("#summoney").html((parseFloat($("#summoney").html()) - parseFloat(paymoney)).toFixed(2));
            console.log($("#summoney").html());
            $("#sumMoneyUnPay").html($("#summoney").html());
        }
    });

    //逾期弹框
    $("td[name='beyondInfo']").click(function () {
        var repayid = $(this).attr("data-value");
        //查询指定的还款计划
        $.ajax({
            type: 'post',
            url: '/order/beyondRepay',
            data: {
                repayid: repayid
            },
            success: function (data) {
                if (data.status == 'success') {
                    $("#beyond_period").html(data.beyond_period);
                    $("#beyond_date").html(data.beyond_date);
                    $("#beyond_money").html(data.beyond_money);
                    $("#beyond_day").html(data.beyond_day);
                    $("#beyond_overduemoney").html(data.beyond_overduemoney);
                    $(".beyond-pay").show();
                } else {
                    alert("系统繁忙，稍后再试！");
                }
            }
        });
    });

    //关闭
    $(".close-ico").click(function () {
        $(".choose-pay").hide();
        $(".beyond-pay").hide();
    });

    $("#close-beyond-pay").click(function () {
        $(".choose-pay").hide();
        $(".beyond-pay").hide();
    });

    //选择支付渠道
    $(".operate-btn").click(function () {
        var summoney = $("#summoney").html();
        if(summoney == 0){
            alert("未选中待支付账单");
        }else{
            $(".choose-pay").show();
        }
    });

    //支付操作
    $("#pay_btn").click(function () {

        //按钮点击判断
        if ($("#btnclickflag").val() == "true") {
            $("#btnclickflag").val("false");
        } else {
//      alert("等待响应");
            return;
        }

        var repayids = "";//还款计划id
        var paymoneys = 0;//支付总额

        $('.check-box input').each(function () {
            var repayid = $(this).val();
            var paymoney = $(this).siblings("input[name='paymoney']").val();
            if ($(this).is(':checked')) {
                repayids = repayids + repayid + ",";
                paymoneys = (parseFloat(paymoneys) + parseFloat(paymoney)).toFixed(2);
            }
        });

        repayids = repayids.substring(0, repayids.length - 1);

        var payType = $("#payType").val();

        if ($.trim(repayids) == '') {
            alert("请选择需要手动还款的记录！");
            return;
        }

        var smsCode = $("#smsCode").val();
        var phone = $("#phone").val();
        if (smsCode == undefined || $.trim(smsCode) == '') {
            alert("验证码不能为空！");
            return false;
        }

        //验证码通过，可进行支付
        $.ajax({
            type: 'post',
            url: '/userinfo/validateSms',
            data: {
                phone: phone,
                code: smsCode
            },
            success: function (data) {
                if (data.status == "1") {
                    var chkRadioPay = $('input:radio[name="pay"]:checked').val();
                    if (chkRadioPay == '0') {//微信支付
                        weixinPayClick(repayids);
                    } else if (chkRadioPay == '1') {//连连支付
//      alert("连连支付入口，尚未开启!");
                        llPayClick(repayids);
                    }
                } else {
                    alert("验证码错误，请重新输入！");
                }
            }
        });

    });

</script>


<!-- 连连支付 -->
<script type="text/javascript">
    //连连支付还款
    function llPayClick(repayids) {
        var userid = $("#userid").val();
        $.ajax({
            type: 'post',
            url: '/order/cUserManualPayToLL',
            data: {
                trepayids: repayids,
                userid:userid
            },
            success: function (data) {
                if (data.status == "1") {
                    $("#btnclickflag").val("true");
                    alert("您已成功向银行发起还款申请,请耐心等待");
                    location.href = "/order/orderlist";
                } else if (data.status == "2") {
                    alert("登录失效，请重新登录");
                    $("#btnclickflag").val("true");
                } else if (data.status == "3") {
                    alert("手动扣款失败，请稍后再试");
                    $("#btnclickflag").val("true");
                } else {
                    alert("系统繁忙，稍后再试");
                    $("#btnclickflag").val("true");
                }
            }
        });
    }
</script>

<!-- 微信支付  引入微信接口js-->
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
     * 微信支付点击
     */
    function weixinPayClick(repayids) {
        $.ajax({
            type: 'post',
            url: '/order/wxpayConfig',
            data: {
                trepayids: repayids
            },
            success: function (data) {
//        alert(data.status);
                $("#btnclickflag").val("true");
                if (data.status == '1') {
                    h5invokeweixinpay(data.timestamp, data.nonceStr, data.packages, data.paySign, repayids, "", "");
                } else {
                    alert("weixin config failed");
                }
            }
        });
    }


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
//        alertObj(res);
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
//                alert("修改repay状态成功");
                            location.href = "/order/orderlist";
                        } else if (data.status == "0") {
                            //支付成功，修改记录失败，可记录失败的还款记录，手工处理。
                            alert("支付成功，服务器异常，更改还款记录失败");
                        } else if (data.status == "2") {
                            alert("登录失效，请重新登录");
                        } else {
                            alert("系统繁忙，稍后再试");
                        }
                    }
                });
            },
            cancel: function (res) {
//        alert("cancel");
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