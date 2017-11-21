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
<body class="bg-eee">
<header>
    <%--<a class="back-btn" href="index.html"></a>--%>
    <div></div>
    <div class="title">申请成功</div>
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
            <div class="finished">
                <div class="wrap">
                    <div class="round">4</div>
                    <div class="bar"></div>
                </div>
                <label>商户识别</label>
            </div>
            <div class="current last">
                <div class="wrap">
                    <div class="round">5</div>
                </div>
                <label>申请成功</label>
            </div>
        </div>
    </div>
    <c:if test="${status != 'success' and  status != 'failed'}">
        <!--商户识别-->
        <div class="input-box contract">
            <div class="contract-text" style="width: 100%; overflow-x: hidden;">
                <iframe src="/userinfo/returnContract?userId=${cUser.id}&orderId=${order_id}" id="hetong"
                        name="contract" width="100%" height="300" scrolling="auto" frameborder="0"></iframe>
            </div>
        </div>

        <div class="input-box contract-draw">
            <p class="contract-tip" id="contractTip">请绘制您的正楷签名</p>

            <form action="/cuser/createOrder" method="post" id="createOrder">
                <img id="signatureImg" src="" alt="签名" name="signature"/>
                <input type="hidden" value="" name="orderjsignature">
            </form>
        </div>
    </c:if>
    <!--签名成功提示-->
    <c:if test="${status == 'success'}">
        <div class="input-box draw-success" style="display: block">
            <figure>
                <img src="/images/front/success.svg" width="80" height="80" alt="签名成功"/>

                <p class="contract-tip">恭喜您的优卡白条分期成功</p>
            </figure>
                <%--<img src="" alt="ad"/>--%>
                <%--AD：感谢使用优卡分期<br>--%>
                <%--零首付零利息，奴家这就跟你回家～--%>
        </div>
    </c:if>

    <c:if test="${status == 'failed'}">
        <div class="input-box draw-success" style="display: block">
            <figure>
                <img src="/images/front/false.svg" width="80" height="80" alt="分期失败"/>

                <p class="contract-tip">您绑定的银行卡账户余额不足，扣款失败，请确保足够金额后再分期购买</p>
            </figure>
                <%--<img src="" alt="ad"/>--%>
                <%--AD：感谢使用优卡分期<br>--%>
                <%--零首付零利息，奴家这就跟你回家～--%>
        </div>
    </c:if>
    <a class="next-btn" href="/demoshow/success.htm">确定</a>

</div>
<!--弹出框-->
<div class="pop-up" id="popUp">

    <!--电子签名-->
    <div class="pop-up-box signature animate-slide-up vertical" id="signature">
        <div class="top-bar">
            <h3>请你绘制正楷签名</h3>
            <a href="javascript:;" data-action="cancel" class="action">取消</a>
        </div>
        <%--<div class="content cleanHtml">--%>
        <!--<div id="signatureBox">-->
        <canvas id="myCanvas"></canvas>
        <!--</div>-->
        <%--</div>--%>
        <div class="draw-btn">
            <span class="btn" onclick="crossScreen();">切换横屏</span>
            <span class="btn" onclick="clean();">重签</span>
            <span class="btn" onclick="save();">确定</span>
        </div>
    </div>

    <!--付款信息-->
    <div class="pop-up-box return-plan">
        <input type="hidden" id="platType4" value="${platType4}"/><!--是否南京分期${platType4}-->
        <span class="close-btn"></span>

        <h3>付款信息</h3>

        <div class="table-box">
            <table class="identify-info" cellpadding="0" cellspacing="0" width="100%" style="line-height: 30px">
                <thead>
                </thead>
                <tbody id="repaylist">
                <tr>
                    <td>支付金额</td>
                    <td>${repay_money_decimal}</td>
                </tr>
                <tr>
                    <td>付款项</td>
                    <td>一期首付</td>
                </tr>
                <tr>
                    <td>支付方式</td>
                    <td>银行卡代扣</td>
                </tr>
                <tr>
                    <td>门店名称</td>
                    <td>${facilitator_name}</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input class="next-btn" type="button" value="立即支付" onclick="submitCreateOrderForm()"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/drawSignature.js?v=2"></script>
<script src="/js/front/ajaxfileupload.js"></script>
<script>
    $(function () {
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

        $(".action").click(function () {
            $('.pop-up').hide();
            $('.signature').hide();
        });
        $(".close-btn").click(function () {
            $('.pop-up').hide();
            $('.pop-up-box').hide();
        });
        $(".contract-draw").click(function () {
            $('.pop-up').show();
            $('.signature').show()
            $('.return-plan').css("display", "none");
        });
    });

    //创建订单
    function createOrder() {
        var sign = $("input[name='orderjsignature']").val();
        if (sign == null || sign == '' || sign == undefined) {
            alert("签名不能为空！");
            return;
        }

        var platType4 = $("#platType4").val();
        <%--var repay_money_decimal= '${repay_money_decimal}';--%>
        <%--var facilitator_name= '${facilitator_name}';--%>
//    alert(repay_money_decimal+"--"+facilitator_name);
        if (platType4 == 'true') {//是一期首付方案
            $('.pop-up').css("display", "block");
            $('.signature').css("display", "none");
            $('.return-plan').css("display", "block");
            return;
        }
        submitCreateOrderForm();
    }
    //提交表单
    function submitCreateOrderForm() {
        $("#createOrder").submit();
    }

</script>
</html>
