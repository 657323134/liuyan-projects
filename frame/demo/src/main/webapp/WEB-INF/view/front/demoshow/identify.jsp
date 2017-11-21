<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=utf-8" %>
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
    <link rel="stylesheet" href="/css/front/style.css">
    <link rel="stylesheet" href="/css/front/swiper.3.1.2.min.css">
</head>
<body class="bg-eee identify">
<div class="pop-up">
    <div class="pop-up-box return-plan">
        <span class="close-btn"></span>

        <h3>分期还款计划表</h3>

        <div class="table-box">
            <table class="identify-info" cellpadding="0" cellspacing="0" width="100%" style="line-height: 30px">
                <thead>
                <tr>
                    <td>期数</td>
                    <td>每期金额</td>
                    <td>每期时间</td>
                </tr>
                </thead>
                <tbody id="repaylist">
                <tr>
                    <td>1/12期</td>
                    <td>¥250.00</td>
                    <td>2017-02-01</td>
                </tr>
                <tr>
                    <td>2/12期</td>
                    <td>¥250.00</td>
                    <td>2017-03-01</td>
                </tr>
                <tr>
                    <td>3/12期</td>
                    <td>¥250.00</td>
                    <td>2017-04-01</td>
                </tr>
                <tr>
                    <td>4/12期</td>
                    <td>¥250.00</td>
                    <td>2017-05-01</td>
                </tr>
                <tr>
                    <td>5/12期</td>
                    <td>¥250.00</td>
                    <td>2017-06-01</td>
                </tr>
                <tr>
                    <td>6/12期</td>
                    <td>¥250.00</td>
                    <td>2017-07-01</td>
                </tr>
                <tr>
                    <td>7/12期</td>
                    <td>¥250.00</td>
                    <td>2017-08-01</td>
                </tr>
                <tr>
                    <td>8/12期</td>
                    <td>¥250.00</td>
                    <td>2017-09-01</td>
                </tr>
                <tr>
                    <td>9/12期</td>
                    <td>¥250.00</td>
                    <td>2017-10-01</td>
                </tr>
                <tr>
                    <td>10/12期</td>
                    <td>¥250.00</td>
                    <td>2017-11-01</td>
                </tr>
                <tr>
                    <td>11/12期</td>
                    <td>¥250.00</td>
                    <td>2017-12-01</td>
                </tr>
                <tr>
                    <td>12/12期</td>
                    <td>¥250.00</td>
                    <td>2018-01-01</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<header>
    <a class="back-btn" href="/order/personCenter"></a>
    <div class="title">商户识别</div>
    <div class="header-right"></div>
</header>
<div class="container show-data by-stage">
    <!--步骤条-->
    <div class="steps-bar">
        <div class="sui-steps-round steps-round-auto steps-5">
            <div class="finished">
                <div class="wrap">
                    <div class="round">1</div>
                    <div class="bar"></div>
                </div>
                <label>提交资料</label>
            </div>
            <div class="finished">
                <div class="wrap">
                    <div class="round">2</div>
                    <div class="bar"></div>
                </div>
                <label>芝麻信用</label>
            </div>
            <div class="finished">
                <div class="wrap">
                    <div class="round">3</div>
                    <div class="bar"></div>
                </div>
                <label>等待审核</label>
            </div>
            <div class="current">
                <div class="wrap">
                    <div class="round">4</div>
                    <div class="bar"></div>
                </div>
                <label>商户识别</label>
            </div>
            <div class="todo last">
                <div class="wrap">
                    <div class="round">5</div>
                </div>
                <label>申请成功</label>
            </div>
        </div>
    </div>
    <!--商户识别-->
    <div class="input-box ">
        <div class="scan" onclick="scanQRCode()"><span></span>点击扫描商户二维码</div>
        <p class="scan-tip">扫描商户二维码，自动识别产品信息</p>

        <div class="orders-info choose-info" id="ordersinfo">
            <h3>已选择产品</h3>

            <div class="table-info">
                <table class="identify-info" cellpadding="0" cellspacing="0" width="100%" style="line-height: 30px"
                       id="goodsinfo">
                    <tr>
                        <td>尊镜K6</td>
                        <td>¥3000.00</td>
                    </tr>
                    <tr>
                        <td>金融方案:三零分期</td>
                        <td>X1</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="orders-info pay-info">
            <h3>支付信息</h3>

            <div class="table-info">
                <table class="identify-info" cellpadding="0" cellspacing="0" width="100%" style="line-height: 30px">
                    <tr>
                        <td>选择期数：</td>
                        <td id="periods">12</td>
                    </tr>
                    <tr>
                        <td>首付金额：</td>
                        <td id="firstMoney">¥0.00</td>
                    </tr>
                    <tr>
                        <td>每期还款：</td>
                        <td><span id="returnPlan" style="color: blue">查看还款计划表</span></td>
                    </tr>
                    <tr>
                        <td rowspan="2">

                        </td>
                    </tr>
                </table>
                <div class="audit" id="agreediv">
                    <label for="agree" class="agree">
                        <input id="agree" type="checkbox" class="agree-checkbox">
                    <span class="agree-text">同意使用银行卡（尾号6424）代扣还款</a>
                    </span>
                    </label>
                </div>
            </div>
        </div>
        <a class="next-btn" href="/demoshow/registerSuccess.htm">下一步</a>
    </div>
    <span id="tips"></span>
</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script>
    $(function () {

        //还款计划弹框
        $("#returnPlan").click(function () {
            $('.pop-up').show().find('.return-plan').show();
        })

        $(".close-btn").click(function () {
            $('.pop-up').hide().find('.pop-up-box').hide();
        })


        $(".option-span").click(function () {
            if ($(this).hasClass("disabled")) {
                $(this).removeClass("disabled").addClass("active");
                $(this).siblings(".option-span").removeClass("active").addClass("disabled");
            }
            if ($(this).hasClass("sesame-option")) {
                if ($(".sesame").css("display") == "none") {
                    $(".sesame").show();
                    $(".wei-credit").hide();
                }
            } else {
                if ($(".wei-credit").css("display") == "none") {
                    $(".sesame").hide();
                    $(".wei-credit").show();
                }
            }
        });
    });


</script>
<script src="//res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
    //web投资成功后，微信扫描二维码，跳转到这个页面，弹出提示窗口，分享领红包
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

    function scanQRCode() {
        wx.scanQRCode({
            needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
            scanType: ["qrCode", "barCode"], // 可以指定扫二维码还是一维码，默认二者都有
            success: function (res) {
                var url = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
                $.ajax({
                    type: "POST",
                    url: url,
                    cache: false,
                    success: function (data, textStatus) {

                        if (data.msg == 'true') {
                            var businessName = data.businessName;
                            var goodsName = data.goodsName;
                            var goodsPrice = data.goodsPrice;
                            var periods = data.periods;
                            var tempIds = data.tempIds;
                            var firstMoney = data.firstMoney;
                            $("#businessName").html(businessName);
                            $("#goodsName").html(goodsName);
                            $("#goodsPrice").html(goodsPrice);
                            $("#periods").html(periods);
                            $("#firstMoney").html(firstMoney);
//              $("#tips").html(businessName+"-"+goodsName+"-"+goodsPrice+"-"+periods+"-预订单id"+tempIds);

                            $("#ordersinfo").css("display", "block");
                            $("#agreediv").css("display", "block");

                            $("#nextstep").removeClass("grey");

                            $("#nextstep").click(function () {

                                if ($("#agree").is(':checked') == false) {
                                    alert("请先同意代扣还款");
                                    return;
                                }
                                location.href = "/cuser/createOrder.htm?tempIds=" + tempIds;
                            });

                        } else {
                            $("#tips").html("二维码失效，请重新扫描！");
                        }
                    }
                });

            }
        });
    }
</script>
</html>