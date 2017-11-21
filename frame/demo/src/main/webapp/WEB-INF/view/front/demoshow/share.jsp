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
    <title>优卡分期</title>
    <link rel="stylesheet" href="/css/front/common.css">
    <link rel="stylesheet" href="/css/front/share.css">
    <link rel="stylesheet" href="/css/businesses/weui.min.css">
    <link rel="stylesheet" href="/js/plugins/swiper/swiper.min.css">

</head>

<body class="share">
<!-- 弹框 -->
<div class="pop-up">
    <!-- 领取红包 -->
    <c:if test="${not empty bActivitySharing}">
    <div class="pop-up-box receive-red">
        <span class="close-btn"></span>

            <div class="red-box">
                <div class="avator"><img src="/images/front/avator.png" alt=""/></div>
                <p>您的好友(${})邀请您0元领取一款酷炫产品，邀请好友还可以获得奖励喔，快来领取吧！</p>
                <button id="openBtn">领取</button>
            </div>
    </div>
    </c:if>
    <c:if test="${not empty bActivitySharing}">
    <!-- 打开红包 -->
    <div class="pop-up-box open-red">
        <span class="close-btn"></span>

        <div class="red-box <c:if test="${empty bActivitySharing.besharedRewardValue or bActivitySharing.besharedRewardValue == 0}">zero</c:if>">
            <strong>&nbsp;
            </strong>

            <!--提交表单-->
            <div class="input-box">
                <input id="phone" name="phone" type="text" placeholder="输入手机号领红包"/>

                <div class="code-box">
                    <input id="code" name="code" type="text" placeholder="输入验证码"/>
                    <input type="button" id="getCode" class="get-code" value="获取"/>
                </div>
                <button id="send">领取</button>
            </div>
            <!-- 领取完成-->
            <div class="received">
                <p>已经放入您的账户(<font id="sharedPhone">180***1234</font>)中，您可前往“个人账户-我的收益”中查看使用</p>
                <a class="btn" href="#" onclick="bonusRecord()">立即查看</a>
            </div>
        </div>
    </div>
    </c:if>
    <!-- 分享用户登录 -->
    <div class="pop-up-box share-login">
        <span class="close-btn"></span>

        <div class="red-box">
            <strong>我要分享</strong>
            <!--提交表单-->
            <div class="input-box">
                <input id="loginphone" name="loginphone" type="text" placeholder="输入手机号参与分享"/>

                <div class="code-box">
                    <input id="logincode" name="logincode" type="text" placeholder="输入验证码" />
                    <input type="button" id="logingetCode" class="get-code" value="获取" />
                </div>
                <button id="loginsend">立即分享</button>
            </div>
        </div>
    </div>

    <!-- 分享红包 -->
    <div class="pop-up-box share-box">
        <div class="title">
            <p>分享有礼</p>
            <a class="rule" href="/share/ruleDetails">规则详情</a>
        </div>
        <div class="intro">
            <span></span>

            <p>本商品参与分享好友共享现金红包奖励活动：
                分享好友友并安装成功后，您将获得${bActivitySharing.shareRewardValue}元现金奖励，
                同时,您的好友也可以参与分享有礼活动。
                <%--同时您的好友也将获得${bActivitySharing.besharedRewardValue}元现金奖励。--%>
            </p>
        </div>
        <!--在页面中加入文字式分享按钮 -->
        <div class="share-item clearfix">
            <p>分享给好友</p>
            <a  id="share-weibo" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
            <a  id="share-weixin" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
            <%--<a href="#" id="share-qzone" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>--%>
            <a  id="share-qq" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
        </div>
        <span class="cancel-ico">取消</span>
    </div>

    <!-- 分享指引 -->
    <div class="pop-up-box share-tip">
        <img width="100%" src="/images/front/share-wx.png"/>
    </div>
</div>

<!--产品图片-->
<div class="swiper-container banner">
    <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="${tGoods.goodsimage}"/></div>
    </div>
    <!-- 如果需要分页器 -->
    <div class="swiper-pagination"></div>

</div>
<!--产品详情-->
<div class="content">
    <div class="info">
        <div class="title">
                <div class="open-share"><span></span>分享有礼</div>
            <h3>${tGoods.goodsname}</h3>
            <strong>￥${tGoods.goodsprice}</strong>
        </div>
        <table cellspacing="0" cellpadding="0">
            <tr>
                <td>商品类目：</td>
                <td>
                    <c:choose>
                        <c:when test="${tGoods.typeId == 1}">汽车用品</c:when>
                        <c:when test="${tGoods.typeId == 2}">车联网产品</c:when>
                        <c:otherwise>
                            汽车用品
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <td>品牌名称：</td>
                <td>${tGoods.brandName}</td>
            </tr>
            <tr>
                <td>型号：</td>
                <td>${tGoods.goodsModel}</td>
            </tr>
            <tr>
                <td>品牌商：</td>
                <td>${bUser.name}</td>
            </tr>
        </table>
    </div>
    <ul class="guarantee">
        <li><i></i>七天包退</li>
        <li><i></i>品牌授权</li>
    </ul>
</div>
<div class="product-details">
    <img src="/images/front/Rectangle%20Copy%208.jpg"/>
    <img src="/images/front/Rectangle%20Copy%208.jpg"/>
    <img src="/images/front/Rectangle%20Copy%208.jpg"/>
    <img src="/images/front/Rectangle%20Copy%208.jpg"/>
    <img src="/images/front/Rectangle%20Copy%208.jpg"/>
        <c:if test="${not empty tGoodsPics}">
            <c:forEach items="${tGoodsPics}" var="tGoodsPic">
                <div class="swiper-slide"><img src="${tGoodsPic.img_url}"/></div>
            </c:forEach>
        </c:if>
</div>

<input type="hidden"  id="goodsid" value="${tGoods.id}" />
<input type="hidden"  id="shareuserid" value="${shareuserid}" />

<div class="store-list">
    <div class="weui-loadmore weui-loadmore_line store-info">
        <span class="weui-loadmore__tips">门店信息</span>
    </div>
    <ul>
        <li>
            <h3><i></i>${cfacilitator.facilitator_name}</h3>
            <p>电话：${cfacilitator.failitator_phone}</p>
            <p>地址：${cfacilitator.facilitator_address}</p>
        </li>
    </ul>
</div>


</body>
<script src="/js/plugins/swiper/swiper.min.js"></script>
<script src="/js/jquery-1.8.3.min.js"></script>
<script>
    //对于android输入法遮住输入框的处理方法（hack）
    // 由于遮罩层是position：fixed，对于安卓输入法弹起无法叠加窗口上，为不是挤压窗口高度，需将设为position：absolute，并将遮罩层高度设置为文档高度
    var u = navigator.userAgent;
    var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
    if(isAndroid){
        var windowHeight = $(document).height();
        $('.share .pop-up').css({position:"absolute",height: windowHeight+'px'});
    }

    var mySwiper = new Swiper('.swiper-container', {
        direction: 'horizontal',
        loop: true,
        paginationClickable: true,
        // 如果需要分页器
        pagination: '.swiper-pagination',

    });


    $('#receive').click(function () {
        $('.pop-up').show();
		$('.open-red').show();
    });

    //打开小红包
    $('.open-share').click(function () {

        if($("#shareuserid").val() != null && $("#shareuserid").val() != ''){
            $('.pop-up').show();
            $('.share-box').show();
        }else{
            //需要登录
            $('.pop-up').show();
            $('.share-login').show();
        }

    })
    $('.close-btn').click(function () {
        $('.pop-up').hide();
        $('.receive-red').hide();
    })
    $('.cancel-ico').click(function () {
        $('.pop-up').hide();
        $('.receive-red').hide();
    })
    $('.share-tip').click(function () {
        $('.pop-up').hide();
        $('.pop-up-box').hide();
    })
    $('.share-box .share-item a').click(function () {
        $('.share-box').hide();
        $('.share-tip').show();
    })

    //倒计时组件
    var wait = 60;
    function time(o) {
        if (wait == 0) {
            o.removeAttribute("disabled");
            o.value = "验证码";
            wait = 60;
        } else {
            o.setAttribute("disabled", true);
            o.value = wait + "s";
            wait--;
            setTimeout(function () {
                time(o)
            }, 1000);
        }
    }

    //门店分享第一个用户登录
    $("#logingetCode").click(function () {
        var loginphone = $("#loginphone").val();
        if (loginphone == "") {
            alert("请输入手机号");
            return false;
        }
        if (!isTel(loginphone)) {
            alert("您的手机号输入有误请重新输入");
            return false;
        }
        $.post("/userinfo/sendSms",
            {phone: loginphone},
            function (msg) {
                if (msg.status == 1) {
                    time(document.getElementById("logingetCode"));
                    alert("已发送,请查看");
                } else if (msg.status == 3) {
                    alert("您的手机号不存在");
                    return false;
                } else {
                    alert("发送失败请重试");
                    return false;
                }
            }
        );

    });

    //领取红包身份校验
    $("#getCode").click(function () {
        var phone = $("#phone").val();
        if (phone == "") {
            alert("请输入手机号");
            return false;
        }
        if (!isTel(phone)) {
            alert("您的手机号输入有误请重新输入");
            return false;
        }
        $.post("/userinfo/sendSms",
            {phone: phone},
            function (msg) {
                if (msg.status == 1) {
                    time(document.getElementById("getCode"));
                    alert("已发送,请查看");
                } else if (msg.status == 3) {
                    alert("您的手机号不存在");
                    return false;
                } else {
                    alert("发送失败请重试");
                    return false;
                }
            }
        );

    });

    //登录
    $("#loginsend").click(function (){
        var loginphone = $("#loginphone").val();
        if (loginphone == "") {
            alert("请输入手机号");
            return false;
        }
        var logincode =  $("#logincode").val();
        if (logincode == "") {
            alert("请输入验证码");
            return false;
        }
        //验证码校验
        $.post("/userinfo/validateSms.do",
            {phone: loginphone,code:logincode},
            function (msg) {
                if (msg.status == 1) {
                    //用户校验
                    $.post("/shared/verifycuser",
                        {phone: loginphone},
                        function (msg) {
                            if (msg.userid == 'phone-exception') {
                                alert("手机校验失败");
                            } else {
                                var userid = msg.userid;
                                window.location.href="/share/loadShareConfig?userid="+userid+"&goodsid="+$("#goodsid").val();
                            }
                        });

                }else if (msg.status == 0) {
                    alert("验证码不正确");
                    return false;
                } else {
                    alert("系统繁忙，请稍后再试");
                    return false;
                }
            });


    });

    //电话号码正则
    function isTel(tel){
        var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
        return reg.test(tel);
    }

    //验证码校验，用户验证，领取红包
    $("#send").click(function(){
        var phone = $("#phone").val();
        if (phone == "") {
            alert("请输入手机号");
            return false;
        }
        var code =  $("#code").val();
        //验证码校验
        $.post("/userinfo/validateSms.do",
            {phone: phone,code:code},
            function (msg) {
                if (msg.status == 1) {
                    $.post("/shared/verifycuser.do",
                        {phone: phone},
                        function (msg) {
                            if (msg.userid == 'phone-exception') {
                                alert("手机校验失败");
                            } else {
                                var userid = msg.userid;
                                var shareuserid = $("#shareuserid").val();
                                var goodsid = $("#goodsid").val();
                                $.post("/shared/getshare.do",
                                    {userid:userid,goodsid:goodsid,shareuserid:shareuserid},
                                    function (msg) {
                                        if(msg.status == 1){
                                            $("#sharedPhone").html(msg.sharedphone);
                                            $(".receive-red").hide();
                                            $(".open-red").show();
                                            $(".input-box").hide();
                                            $(".received").show();
                                        }else if(msg.status == 2){
                                            alert("您已经领取过了！！");
                                        }else if(msg.status == 3){
                                            alert("不能领取自己的红包！！");
                                        }else if(msg.status == -1){
                                            alert("领取失败！！");
                                        }else if(msg.status == 0){
                                            alert("参数异常或用户不存在！");
                                        }else if(msg.status == 5){
                                            alert("您是起始分享人,不能领取!");
                                        }
                                    }
                                );
                            }
                        }
                    );

                } else if (msg.status == 0) {
                    alert("验证码不正确");
                    return false;
                } else {
                    alert("系统繁忙，请稍后再试");
                    return false;
                }
            }
        );


    });

    function bonusRecord(){
        window.location.href="/userinfo/tologin";
    }

</script>


<!-- 引入微信接口js-->
<script src="//res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
    var appid = '${appid}';
    var times = '${timestamp}';
    var nonce = '${nonceStr}';
    var signa = '${signature}';

    //分享内容
    var sharetitle= '${title}';//"优卡分期专注汽车后市场消费分期服务平台，零元购机提前享受品质生活！";
    var sharedesc = '${description}';//"我剁手买了一款酷炫宝贝${tGoods.goodsname}，还可以使用优卡分期付款“零首付零利息零手续费”，提前享受品质生活，你也买一个吧。";
    var sharelink = '${shareUrl}';//分享逻辑链接
    var shareimgUrl = '${imgUrl}'; //"http://www.91youka.com/images/front/hongbao.jpg";

    wx.config({
        debug: false,
        appId: appid,
        timestamp: times,
        nonceStr: nonce,
        signature: signa,
        jsApiList: [
            'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo'
        ]
    });


    //右上角分享
    wx.ready(function () {
        var shareData = {
            title: sharetitle,
            desc: sharedesc,
            link: sharelink,
            imgUrl: shareimgUrl,
            trigger: function (res) {
            },
            success: function (res) {
                //分享成功写入统计数据
                $.post("/share/statistic.do",
                        {userid: userid,goodsid:goodsid},
                        function (msg) {
                        }
                );
            }
        };

        wx.onMenuShareAppMessage(shareData);
        wx.onMenuShareTimeline(shareData);
        wx.onMenuShareQQ(shareData);
        wx.onMenuShareWeibo(shareData);
    });
    wx.error(function (res) {
        alert(res.errMsg);
    });


</script>


</html>
