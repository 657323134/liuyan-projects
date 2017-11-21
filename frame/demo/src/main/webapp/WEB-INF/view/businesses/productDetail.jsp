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
    <link rel="stylesheet" href="/js/plugins/swiper/swiper.min.css">
</head>
<body class="share">
<header>
<a class="back-btn" href="javascript:history.back()"></a>
  <div class="title">商品详情</div>
  <div class="header-right"></div>
</header>
<!-- 弹框 -->
<%--
<div class="pop-up">
  <!-- 领取红包 -->
  <div class="pop-up-box receive-red">
    <span class="close-btn"></span>

    <div class="red-box">
      <div class="avator"><img src="/images/b3_img2.png" alt=""/></div>
      <p>您的好友(180****1234)分享一款酷炫产品尊镜K6给您，还赠送您一个现金红包，快来领取吧！</p>
      <button id="openBtn">领取</button>
    </div>
  </div>
  <!-- 打开红包 -->
  <div class="pop-up-box open-red">
    <span class="close-btn"></span>

    <div class="red-box">
      <strong>￥50</strong>
      <!--提交表单-->
      <div class="input-box">
        <input id="phone" name="phone" type="text" placeholder="输入手机号领红包"/>

        <div class="code-box">
          <input id="code" name="code" type="text" placeholder="输入验证码"/>
          <span id="getCode" class="get-code">验证码</span>
        </div>
        <button id="send">领取</button>
      </div>
      <!-- 领取完成-->
      <div class="received">
        <p>已经放入您的账户(180***1234)中，您可前往“个人账户-我的收益”中查看使用</p>
        <a class="btn" href="#">立即查看</a>
      </div>
    </div>
  </div>
  <!-- 分享红包 -->
  <div class="pop-up-box share-box">
    <div class="title">
      <p>分享有礼</p>
      <a class="rule" href="">规则详情</a>
    </div>
    <div class="intro">
      <span></span>

      <p>本商品参与分享好友共享现金红包奖励活动：
        分享好友购买成功后，您将获得${bActivitySharing.shareRewardValue}元现金奖励，
        同时您的好友也将获得${bActivitySharing.besharedRewardValue}元现金奖励。</p>
    </div>
    <!--在页面中加入文字式分享按钮 -->
    <div class="share-item clearfix">
      <p>分享给好友</p>
      <a  id="share-weibo" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
      <a  id="share-weixin" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
      &lt;%&ndash;<a href="#" id="share-qzone" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>&ndash;%&gt;
      <a  id="share-qq" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
    </div>
    <span class="cancel-ico">取消</span>
  </div>

  <!-- 分享指引 -->
  <div class="pop-up-box share-tip">
    <img width="100%" src="/images/front/share-wx.png"/>
  </div>
</div>
--%>

<!--领取提示-->
<%--<div class="tip">--%>
<%--<div class="avator"><img src="/images/businesses/1.png" alt="头像"/></div>--%>
<%--<button id="receive">领取</button>--%>
<%--<p>您的好友分享一款酷炫产品尊镜K6给您，--%>
<%--还赠送您一个现金红包，快来领取吧！</p>--%>
<%--</div>--%>
<!--产品图片-->
<div class="swiper-container banner container">
    <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="${tGoods.goodsimage}"/></div>
    </div>
    <!-- 如果需要分页器 -->
    <div class="swiper-pagination"></div>

    <!-- 如果需要导航按钮 -->
    <%--<div class="swiper-button-prev"></div>--%>
    <%--<div class="swiper-button-next"></div>--%>

    <!-- 如果需要滚动条 -->
    <%--<div class="swiper-scrollbar"></div>--%>
</div>
<!--产品详情-->
<div class="content">
    <div class="info">
        <div class="title">
            <c:if test="${bActivitySharing.id != null}">
                <div class="open-share"><span></span>分享有礼</div>
            </c:if>
            <%--  <h3>${tGoods.goodsname}</h3>--%>
            <h3>${tGoods.goodsname}</h3>
            <span style="color: red"><h3>￥${tGoods.goodsprice}</h3></span>
            <%--<strong>￥2980.00</strong>--%>
            <%--<p>销售分红：<span>￥1000.00</span></p>--%>

        </div>
        <table cellspacing="0" cellpadding="0">
            <tr>
                <td>商品类目：</td>
                <td><c:choose>
                    <c:when test="${tGoods.typeId == 1}">汽车用品</c:when>
                    <c:when test="${tGoods.typeId == 2}">车联网产品</c:when>
                    <c:otherwise>
                        汽车用品
                    </c:otherwise>
                </c:choose></td>
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
        <li><i></i>一年包换</li>
        <li><i></i>品牌授权</li>
    </ul>
</div>
<div class="product-details">
    <%--<img src="/images/front/Rectangle%20Copy%208.jpg"/>--%>
    <c:if test="${not empty tGoodsPics}">
        <c:forEach items="${tGoodsPics}" var="tGoodsPic">
            <div class="swiper-slide"><img src="${tGoodsPic.img_url}"/></div>
        </c:forEach>
    </c:if>
</div>
<div class="bottom-operate">
  <c:if test="${bActivitySharing.id != null}">
      <a class="join-act" href="/border/activityOrder?goodsId=${tGoods.id}&activityId=${bActivitySharing.id}">
           参与活动
      </a>

      <a class="go-buy" href="/border/buyNow?goodsId=${tGoods.id}">
           立即购买
      </a>
  </c:if>

  <c:if test="${bActivitySharing.id == null}">
    <a class="go-buy" href="/border/buyNow?goodsId=${tGoods.id}" style=" width: 100%;">
      立即购买
    </a>
  </c:if>
</div>
</body>
<script src="/js/plugins/swiper/swiper.min.js"></script>
<script src="/js/jquery-1.8.3.min.js"></script>
<script>
    var mySwiper = new Swiper('.swiper-container', {
        direction: 'horizontal',
        loop: true,
        paginationClickable: true,

        // 如果需要分页器
        pagination: '.swiper-pagination',

        // 如果需要前进后退按钮
//		nextButton: '.swiper-button-next',
//		prevButton: '.swiper-button-prev',

        // 如果需要滚动条
//		scrollbar: '.swiper-scrollbar',
    })

    $('#receive').click(function () {
        $('.pop-up').show();
        $('.open-red').show();
//		$('.receive-red').show();
    })
    $('.open-share').click(function () {
        $('.pop-up').show();
//		$('.open-red').show();
//		$('.receive-red').show();
        $('.share-box').show();
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

    $(function () {
//		倒计时
        var wait = 60;

        function time(o) {
            if (wait == 0) {
                o.removeAttribute("disabled");
                o.value = "验证码";
                o.innerHTML = "验证码";
                wait = 60;
            } else {
                o.setAttribute("disabled", true);
                o.value = wait + "s";
                o.innerHTML = +wait + "s";
                wait--;
                setTimeout(function () {
                    time(o)
                }, 1000);
            }
        }

//		获取验证码
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
            $.post("/buser/sendSms.do",
                    {phone: phone},
                    function (msg) {
                        if (msg.status == 1) {
                            alert("已发送,请查看");
                            time(document.getElementById("getCode"));
                        } else if (msg.status == 3) {
                            alert("您的手机号不存在");
                            return false;
                        } else {
                            alert("发送失败请重试");
                            return false;
                        }
                    }
            );

    })
  })


</script>


<!-- 引入微信接口js-->
<script src="//res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
    var appid = '${appid}';
    var times = '${timestamp}';
    var nonce = '${nonceStr}';
    var signa = '${signature}';

    var goodsid = '${goodsid}';

    //分享内容
    var sharedesc = "你分享我送钱，666元大奖！";
    var sharetitle = "你分享我送钱，666元大奖！";
    var sharelink = '${shareUrl}';//分享逻辑链接
    var shareimgUrl = "http://www.91youka.com/images/front/hongbao.jpg";

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
            'chooseWXPay',
            'openProductSpecificView',
            'addCard',
            'chooseCard',
            'openCard'
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
                alert(res);
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
