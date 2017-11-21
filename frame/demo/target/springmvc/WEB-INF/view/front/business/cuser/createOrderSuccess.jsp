<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/view/comm/taglib.jsp"%>
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
<body class="apply-success">
<header>
  <%--<a class="back-btn" href="index.html"></a>--%>
    <div></div>
  <div class="title">申请成功</div>
  <div class="header-right"></div>
</header>
<div class="container show-data by-stage">
  <!--步骤条-->
  <!--
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
  -->
  <!--签名成功提示-->
  <c:if test="${status == 'success'}">
    <div class="input-box draw-success" style="display: block">
      <figure>
        <img src="/images/front/success.svg" width="80" height="80" alt="签名成功"/>
        <p class="contract-tip">恭喜您的优卡白条分期成功</p>
        <p>提前拥有心仪产品，享受品质生活</p>
      </figure>

      <c:if test="${not empty tGoodses}">
        <div class="loadmore">
          <span class="loadmore-tips">分享有礼</span>
        </div>
      </c:if>

      <!--分享好友-->
      <ul class="share-pro">
        <c:forEach items="${tGoodses}" var="tGoods">
        <li>
          <div class="pro-img">
            <%--<img src="/images/b3_img2.png"/>--%>
            <img src="${imgServer}${tGoods.goodsimage}" />
          </div>
          <span>您购买的商品${tGoods.goodsname}推荐好友成功可获得现金红包</span>
          <%--<a class="link" href="/share/loadShareConfig?orderid=${orderid}&userid=${userid}&goodsid=${tGoods.id}">分享好友</a>--%>
          <a class="link" href="/share/checkUserAgent?orderid=${orderid}&userid=${userid}&goodsid=${tGoods.id}">分享好友</a>
        </li>
        </c:forEach>
      </ul>
    </div>
  </c:if>

  <c:if test="${status == 'failed'}">
    <div class="input-box draw-success" style="display: block">
      <figure>
        <img src="/images/front/false.svg" width="80" height="80" alt="分期失败"/>
        <p class="contract-tip">您绑定的银行卡账户余额不足，扣款失败，请确保足够金额后再分期购买</p>
      </figure>
    </div>
  </c:if>

  <a class="next-btn" id="drawSubmit"
     <c:choose>
       <c:when test="${status == 'success'}">
          href="/userinfo/personCenter.do"
       </c:when>
       <c:when test="${status == 'failed'}">
         href="/cuser/identify.htm"
       </c:when>
     </c:choose>
          >确定</a>
</div>

</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/drawSignature.js"></script>
</html>
