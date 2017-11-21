<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/comm/taglib.jsp"%>
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

<input type="hidden" id="orderid" value="${border.id}"/>
<input type="hidden" id="userid" value="${cUser.id}"/>
<input type="hidden" id="goodsid" value="${tGoods.id}"/>

<input type="hidden" id="invitedid" value="0"/>

<!-- 弹框 -->
<div class="pop-up">
	<!-- 领取红包 -->
	<div class="pop-up-box receive-red">
		<span class="close-btn"></span>
		<div class="red-box">
			<div class="avator"><img src="/images/front/avator.png" alt=""/></div>
			<p>您的好友${cUser.cellPhone.replace(cUser.cellPhone,cUser.cellPhone.replace(cUser.cellPhone.substring(3,7),"****"))}分享一款酷炫产品尊镜K6给您，还赠送您一个现金红包，快来领取吧！</p>
			<button id="openBtn" class="verifyGetBtn">领取</button>
		</div>
	</div>
	<!-- 打开红包 -->
	<div class="pop-up-box open-red">
		<span class="close-btn"></span>
		<div class="red-box">
			<strong>￥${bActivitySharing.besharedRewardValue}</strong>
			<!--提交表单-->
			<div class="input-box">
				<input id="phone" name="phone" type="text" placeholder="输入手机号领红包"/>
				<div class="code-box">
					<input id="code" name="code" type="text" placeholder="输入验证码"/>
					<span id="getCode" class="get-code">获取</span>
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


	<!-- 分享红包 -->
	<div class="pop-up-box share-box">
		<div class="title">
			<p>分享有礼</p>
			<a class="rule" href="/demoshow/ruleDetails">规则详情</a>
		</div>
		<div class="intro">
			<span></span>

			<p>本商品参与分享好友共享现金红包奖励活动：
				分享好友购买成功后，您将获得${bActivitySharing.shareRewardValue}元现金奖励，
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

<!--领取提示-->
<div class="tip">
	<div class="avator"><img src="/images/front/avator.png" alt="头像"/></div>
	<button class="openReceiveBtn">领取</button>
	<p>您的好友分享一款酷炫产品尊镜K6给您，
		还赠送您一个现金红包，快来领取吧！</p>
</div>
<!--产品图片-->
<div class="swiper-container banner">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src="${tGoods.goodsimage}"/></div>
		<c:if test="${not empty tGoodsPics}">
			<c:forEach items="${tGoodsPics}" var="tGoodsPic">
				<div class="swiper-slide"><img src="${tGoodsPic.img_url}"/></div>
			</c:forEach>
		</c:if>
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
			<c:if test="${not empty bActivitySharing}">
				<div class="open-share"><span></span>分享有礼</div>
			</c:if>
			<h3>${tGoods.goodsname}</h3>
			<%--<strong>￥2980.00</strong>--%>
			<%--<p>销售分红：<span>￥1000.00</span></p>--%>

		</div>
		<table cellspacing="0" cellpadding="0" >
			<tr><td>商品类目：</td><td>
				<c:choose>
					<c:when test="${tGoods.typeId == 1}">汽车用品</c:when>
					<c:when test="${tGoods.typeId == 2}">车联网产品</c:when>
					<c:otherwise>
						汽车用品
					</c:otherwise>
				</c:choose>
			</td></tr>
			<tr><td>品牌名称：</td><td>${tGoods.brandName}</td></tr>
			<tr><td>型号：</td><td>${tGoods.goodsModel}</td></tr>
			<tr><td>品牌商：</td><td>${bUser.name}</td></tr>
		</table>
	</div>
	<ul class="guarantee">
		<li><i></i>一年包换</li>
		<li><i></i>品牌授权</li>
	</ul>
</div>

</body>

<script src="/js/plugins/swiper/swiper.min.js"></script>
<script src="/js/jquery-1.8.3.min.js"></script>
<script>
	var mySwiper = new Swiper ('.swiper-container', {
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
	});

	var isShow = '${isShow}';
	//默认加载
	showReceiveRed();

	//领取红包提示
	function showReceiveRed(){
		if(isShow == 'true'){
			$('.pop-up').show();
			$('.receive-red').show();
		}
	}

	//点击领取
	$(".openReceiveBtn").click(function(){
		showReceiveRed();
	});

	$('.open-share').click(function(){
		$('.pop-up').show();
//		$('.open-red').show();
//		$('.receive-red').show();
		$('.share-box').show();
	})
	$('.close-btn').click(function(){
		$('.pop-up').hide();
		$('.receive-red').hide();
		$(".open-red").hide();
	})
	$('.cancel-ico').click(function(){
		$('.pop-up').hide();
		$('.pop-up-box').hide();
//		$(".open-red").hide();
//		$('.share-box').hide();
	});
	$('.share-tip').click(function () {
		$('.pop-up').hide();
		$('.pop-up-box').hide();
	})
	$('.share-box .share-item a').click(function () {
		$('.share-box').hide();
		$('.share-tip').show();
	})


	$(function() {
//		倒计时
		var wait = 60;
		function time(o) {
			if (wait == 0) {
				o.removeAttribute("disabled");
//				o.value = "领取";
				o.innerHTML = "领取";
				wait = 60;
			} else {
				o.setAttribute("disabled", true);
//				o.value = wait + "s";
				o.innerHTML = + wait + "s";
				wait--;
				setTimeout(function () {
					time(o)
				}, 1000);
			}
		}


		function isTel(tel){
			var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
			return reg.test(tel);
		}
//		获取验证码
		$("#getCode").click(function() {
			var phone = $("#phone").val();
			if (phone == "") {
				alert("请输入手机号");
				return false;
			}
			if (!isTel(phone)) {
				alert("您的手机号输入有误请重新输入");
				return false;
			}
			$.post("/userinfo/sendSms.do",
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

		})
	});

	//领取红包
	$(".verifyGetBtn").click(function(){
		$('.receive-red').hide();
		$(".open-red").show();
	});

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
										$("#invitedid").val(userid);
										var shareuserid = $("#userid").val();
										var orderid = $("#orderid").val();
										var goodsid = $("#goodsid").val();
										$.post("/shared/getshare.do",
												{orderid: orderid,userid:userid,goodsid:goodsid,shareuserid:shareuserid},
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
													}else{
														alert("系统繁忙，请稍后再试！");
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
		var userid = $("#invitedid").val();
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

	var userid = '${userid}';
	var goodsid = '${goodsid}';

	//分享内容
	var sharetitle = "优卡分期专注汽车后市场消费分期服务平台，零元购机提前享受品质生活！";
	var sharedesc = "我剁手买了一款酷炫宝贝${tGoods.goodsname}，还可以使用优卡分期付款“零首付零利息零手续费”，提前享受品质生活，你也买一个吧。";
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
