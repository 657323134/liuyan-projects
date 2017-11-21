<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<%
%>

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
    <link rel="stylesheet" href="/css/businesses/weui.min.css">
    <link rel="stylesheet" href="/css/front/style.css">
    <link rel="stylesheet" href="/css/front/swiper.3.1.2.min.css">
</head>

<!--签约失败提示-->
<c:if test="${not empty resultMsg}">
    <script type="text/javascript">
        var resultMsg = '${resultMsg}';
        alert(resultMsg);
    </script>
</c:if>

<body class="identify">
<div class="pop-up">
    <%--分期还款计划表--%>
    <div class="pop-up-box return-plan">
        <span class="close-btn"></span>

        <h3>分期还款计划表</h3>

        <div class="table-box">
            <table class="identify-info" cellpadding="0" cellspacing="0" width="100%">
                <thead>
                <tr>
                    <td>期数</td>
                    <td>每期金额</td>
                    <td>每期时间</td>
                </tr>
                </thead>
                <tbody id="repaylist">
                </tbody>
            </table>
        </div>
    </div>
    <%--分享有礼奖励兑换规则--%>
    <div class="pop-up-box share-rule">
        <span class="close-btn"></span>
        <h3>分享有礼奖励兑换规则</h3>
        <div class="rule-text">
            <p>1.分享双方通过“分享有礼”获得奖励后，被分享者产生购买后双方奖励方才可兑换至账户。</p>
            <p>2.被分享者购买时系统自动匹配相应分享奖励记录完成分享购买。</p>
        </div>
        <%--<a class="next-btn" href="">查看我收到的分享</a>--%>
    </div>
</div>

<header>
    <a class="back-btn" href="/userinfo/personCenter"></a>
    <div class="title">商户识别</div>
    <div class="header-right"></div>
</header>
<div class="container show-data by-stage">
    <!--商户识别-->
    <div class="input-box ">
        <div class="scan" onclick="scanQRCode()"><span></span>点击扫描商户二维码</div>
        <p class="scan-tip" id="msgT">扫描商户二维码，自动识别产品信息</p>

        <div class="orders-info choose-info" id="ordersinfo" style="display: none">
            <h3>已选择产品</h3>
            <div class="table-info">
                <table class="identify-info" cellpadding="0" cellspacing="0" width="100%" style="line-height: 20px"
                       id="goodsinfo">
                </table>
            </div>
        </div>
    </div>
    <div class="orders-info pay-info" style="display: none">
        <h3>支付信息</h3>

        <div class="table-info">
            <table class="identify-info" cellpadding="0" cellspacing="0" width="100%" style="line-height: 30px">
                <tr>
                    <td>选择期数：</td>
                    <td id="periods">10</td>
                </tr>
                <tr>
                    <td>首付金额：</td>
                    <td id="firstMoney">¥3000.00</td>
                </tr>
                <tr>
                    <td>每期还款：</td>
                    <td><span id="returnPlan" style="color: blue">查看还款计划表</span></td>
                </tr>
                <tr id="activityInfo">
                    <td>活动信息：</td>
                    <td><span id="showRule" style="color: blue">兑换次被分享奖励</span></td>
                </tr>
                <tr>
                    <td rowspan="2">

                    </td>
                </tr>
            </table>
            <div class="audit" id="agreediv">
                <c:if test="${tUserBank.noAgree==null ||tUserBank.noAgree==''}">
                    <label for="agree" class="agree">
                        <input id="agree" type="checkbox" class="agree-checkbox">
                    <span class="agree-text">同意使用银行卡（尾号${bankCard}）代扣还款</a>
                    </span>
                    </label>
                </c:if>
                <input type="hidden" id="checkAgree" value="${tUserBank.noAgree}"/>
            </div>
        </div>
    </div>
    <a class="next-btn grey" id="nextstep">下一步</a>
    <input type="hidden" id ="chePais" />
</div>
<span id="tips"></span>
<input type="hidden" id="isBeyond" value="false"/>
</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script>
    $(function () {

        //还款计划弹框
        $("#returnPlan").click(function () {
            $('.pop-up').show().find('.return-plan').show();
        })
        //分享规则弹框
        $("#showRule").click(function () {
            $('.pop-up').show().find('.share-rule').show();
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
        $.ajax({
            url:"/userinfo/getCarNum",
            type:"POST",
            async: false,
            success:function(data){
                if(data.msg=='shixiao'){
                    alert("请重新登录，登录超时了");
                    window.location.href="/cuser/register.htm"
                }
                if(data.msg=="success"){
                    if(data.carnum!=null){
                        $("#chePais").val(data.carnum);
                    }
                }
            }
        });
        wx.scanQRCode({
            needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
            scanType: ["qrCode", "barCode"], // 可以指定扫二维码还是一维码，默认二者都有
            success: function (res) {
                var url = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
//                alert(url);//border/getOrderTmepData
                $.ajax({
                    type: "POST",
                    url: url,
                    cache: false,
                    success: function (data, textStatus) {
                        if (data.msg == 'true') {
                            var chePai = $("#chePais").val();
                            var carNum = data.carNum;
                            if(chePai!=null){
                                if(carNum!=chePai){
                                    $("#msgT").html("您的车辆信息与实际不符，请确认无误后重新下单！");
                                    return;
                                }
                            }else{}
                            $("#msgT").html("扫描商户二维码，自动识别产品信息");
                            var businessName = data.businessName;
                            var goodsName = data.goodsName;
                            var goodsPrice = data.goodsPrice;
                            var periods = data.periods;
                            var tempIds = data.tempIds;
                            var firstMoney = data.firstMoney;
                            var rewardCount = data.rewardCount;
                            $("#businessName").html(businessName);
                            $("#goodsName").html(goodsName);
                            $("#goodsPrice").html(goodsPrice);
                            $("#periods").html(periods);
                            $("#firstMoney").html(firstMoney);
//              $("#tips").html(businessName+"-"+goodsName+"-"+goodsPrice+"-"+periods+"-预订单id"+tempIds);
                            if(parseInt(rewardCount)<= 0){
                                $("#activityInfo").remove();
                            }else {
                                $("#showRule").html("兑换" + rewardCount + "次被分享奖励");
                            }
                            $(".orders-info").css("display", "block");
                            $("#agreediv").css("display", "block");
                            $("#nextstep").removeClass("grey");

                            $("#nextstep").click(function () {
                                var checks =$("#checkAgree").val();
                                if(checks==null || checks==""){
                                    if ($("#agree").is(':checked') == false) {
                                        alert("请先同意代扣还款");
                                        return;
                                    }
                                }
                                if ($("#isBeyond").val() == 'true') {
                                    alert("您的分期额度已超过限额8000元,请您及时还款！");
                                    return;
                                }
                                if(chePai!=null){

                                    location.href = "/cuser/bankSign.htm?tempIds=" + tempIds+"&orderCarNum="+chePai;
                                }
                            });

                            //获取订单详细信息
                            $.ajax({
                                type: "POST",
                                url: "/cuser/getTempOrderInfo?tempIds=" + tempIds,
                                cache: false,
                                success: function (data, textStatus) {
                                    var obj = data.period;
                                    var objlist = data.priceList;
                                    var goodsCoount = data.goodsCount;
                                    var goodsList = data.goodsList;
                                    var isBeyond = data.isBeyond;
//                                    alert("xxx"+$("#isBeyond").val())
                                    $("#isBeyond").val(isBeyond);
                                    //            alert(obj);
                                    //            alert(objlist);
                                    //订单数据
                                    var goodsinfo = "";
                                    for (var i = 0; i < goodsCoount; i++) {
                                        goodsinfo += "<tr><td rowspan='2' class='avator'><img src='"+data.imgServer +''+ goodsList[i].goodsimage+"' alt=''/></td><td>" + goodsList[i].goodname +"</td>";
                                        goodsinfo += "<td>¥" + goodsList[i].goodprice + "</td></tr>";
                                        goodsinfo += "<tr><td>金融方案:" + goodsList[i].platTypes + "</td>";
                                        goodsinfo += "<td>X" + goodsList[i].goodnum + "</td></tr>";
                                    }
                                    $("#goodsinfo").html(goodsinfo);

                                    //订单列表数据
                                    var repayList = "";
                                    for (var i = 0; i < obj; i++) {
                                        repayList += "<tr><td>" + objlist[i].terms + "</td>";
                                        repayList += "<td>" + objlist[i].money + "元</td>";
                                        repayList += "<td>" + objlist[i].datetime + "</td></tr>";
                                    }
                                    $("#repaylist").html(repayList);
                                }
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