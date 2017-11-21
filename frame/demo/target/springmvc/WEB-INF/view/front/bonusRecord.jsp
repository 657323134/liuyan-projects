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
    <title>奖励记录-优卡分期</title>
    <link rel="stylesheet" href="/css/front/common.css">
    <link rel="stylesheet" href="/css/businesses/weui.min.css">
    <link rel="stylesheet" href="/css/front/bonusRecord.css">
</head>
<body class="bonus-record">
<!-- 弹框 -->
<div class="pop-up">
    <!-- 奖励详情 -->
    <div class="pop-up-box bonus-details">
        <span class="close-btn"></span>

        <h3 class="title">奖励详情</h3>

        <div class="bonus-num">
            <h2 id="get-money">50元</h2>

            <div class="weui-loadmore weui-loadmore_line last-order-title">
                <span class="weui-loadmore__tips" id="tipsStatus">对方未完成购买</span>
            </div>
        </div>

        <ul class="bonus-info">
            <li>
                <span class="person">分享人</span>

                <div class="avator"><img src="/images/front/avator.png" alt=""/></div>
                <span class="name personphone">180*****1234</span>
            </li>
            <li>
                <span class="product">分享商品</span>

                <div class="avator"><img class="productimage" src="/images/front/avator.png" alt=""/></div>
                <span class="name  productname">4G夜视镜A...</span>
            </li>
        </ul>
        <button class="btn" id="openBtn">继续分享</button>
        <button class="btn grey-btn" id="grey-btn" style="display: none">活动已结束</button>
    </div>

    <!-- 购买说明 -->
    <div class="pop-up-box buy-desc">
        <span class="close-btn"></span>

        <h3 class="title">购买说明</h3>

        <div class="desc">
            <div class="avator"><img src="/images/front/avator.png" alt=""/></div>
            <span class="name">4G夜视镜A...</span>

            <p>说明：前往指定门店完成分期购买上述商品，订单审核通过后即可获得现金奖励！</p>
        </div>
        <button class="i-know">我知道了</button>
    </div>
</div>

<header>
    <a class="back-btn" href="/userinfo/personCenter.do"></a>

    <div class="title">奖励记录</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="weui-tab">
        <div class="weui-navbar">
            <div class="weui-navbar__item weui-bar__item_on" id="share">
                发出的分享
            </div>
            <div class="weui-navbar__item" id="beShared">
                收到的分享
            </div>
        </div>
            <div class="weui-tab__panel" id="content">
                <div class="weui-panel__bd bonus-list">
                    <c:if test="${type==0}">
                        <c:if test="${empty pageBean}">
                            <img class="blank" style="display: none;" src="/images/front/bonus-blank.svg" alt="暂无分享"/>
                        </c:if>
                        <!--空白提示-->
                        <c:forEach items="${pageBean}" var="shareRelation">
                            <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg"
                               data-type="0"
                               data-id="${shareRelation.id}"
                               data-status="${shareRelation.status}"
                               data-goodsid="${shareRelation.goodsId}"
                               data-inviteid="${shareRelation.inviteid}"
                               data-invitedid="${shareRelation.invitedid}"
                               data-orderid="${shareRelation.share_order_id}"
                               data-isvalid="${shareRelation.isValid}" >
                                <div class="weui-media-box__hd">
                                    <span class="red-icon"></span>
                                </div>
                                <div class="weui-media-box__bd">

                                        <h4 class="weui-media-box__title">
                                            <span>分享好友红包</span>
                                            <span id="shareRelation${shareRelation.id}">
                                            <c:choose>
                                                <c:when test="${shareRelation.inviteBonus>0.0}">
                                                    ${shareRelation.inviteBonus}元
                                                </c:when>
                                                <c:otherwise>
                                                    &nbsp;
                                                </c:otherwise>
                                            </c:choose>
                                            </span>
                                        </h4>
                                        <p class="weui-media-box__desc">
                                            <span>${shareRelation.createTime}</span>
                                            <span id="shareRelation${shareRelation.id}Status">
                                                  <c:choose>
                                                      <c:when test="${shareRelation.isValid ==1}">
                                                          <c:if test="${shareRelation.status ==1}">
                                                              未完成授信
                                                          </c:if>
                                                          <c:if test="${shareRelation.status ==2}">
                                                              未完成购买
                                                          </c:if>
                                                          <c:if test="${shareRelation.status ==3}">
                                                              奖励兑换中
                                                          </c:if>
                                                          <c:if test="${shareRelation.status ==4}">
                                                              已兑换
                                                          </c:if>
                                                      </c:when>
                                                      <c:when test="${shareRelation.isValid ==0}">
                                                          已失效
                                                      </c:when>
                                                  </c:choose>
                                            </span>
                                        </p>
                                </div>
                            </a>
                        </c:forEach>
                    </c:if>
            </div>

            <div class="weui-panel__bd bonus-list">
                <c:if test="${type==1}">
                    <c:forEach items="${pageBean}" var="shareRelation">
                        <a class="weui-media-box weui-media-box_appmsg"
                             data-type="1"
                             data-id="${shareRelation.id}"
                             data-status="${shareRelation.status}"
                             data-goodsid="${shareRelation.goodsId}"
                             data-inviteid="${shareRelation.inviteid}"
                             data-invitedid="${shareRelation.invitedid}"
                             data-orderid="${shareRelation.share_order_id}"
                             data-isvalid="${shareRelation.isValid}" >
                            <div class="weui-media-box__hd">
                                <span class="red-icon"></span>
                            </div>
                            <div class="weui-media-box__bd">
                                <h4 class="weui-media-box__title">
                                    <span>分享好友红包</span>
                                    <span id="shareRelation${shareRelation.id}">
                                    <c:choose>
                                        <c:when test="${shareRelation.invitedBonus>0.0}">
                                            ${shareRelation.invitedBonus}元
                                        </c:when>
                                        <c:otherwise>
                                            &nbsp;
                                        </c:otherwise>
                                    </c:choose>
                                    </span>
                                </h4>
                                <p class="weui-media-box__desc" >
                                    <span>${shareRelation.createTime}</span>
                                            <span id="shareRelation${shareRelation.id}Status">
                                                <c:choose>
                                                    <c:when test="${shareRelation.isValid ==1}">
                                                            <c:if test="${shareRelation.status ==1}">
                                                                    未完成授信
                                                             </c:if>
                                                             <c:if test="${shareRelation.status ==2}">
                                                                    未完成购买
                                                             </c:if>
                                                             <c:if test="${shareRelation.status ==3}">
                                                                    奖励兑换中
                                                              </c:if>
                                                              <c:if test="${shareRelation.status ==4}">
                                                                   已兑换
                                                              </c:if>
                                                    </c:when>
                                                    <c:when test="${shareRelation.isValid ==0}">
                                                              已失效
                                                    </c:when>

                                                </c:choose>
                                            </span>
                                </p>
                            </div>
                        </a>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </div>
</div>
<form id="shareInfo">
    <input type="hidden" id="type" name="type" value="${type}">
</form>
</body>

<script src="/js/jquery-1.8.3.min.js"></script>
<script>
    var type = 0;
    var page = 1;
    var title = 0;
    var totalPage = 0;

    $(document).ready(function(){
        var index = ${type};
//        if(type == 0){
//            $("#share").addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
//        }else{
//            $("#beShared").addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
//        }
        $('.weui-navbar .weui-navbar__item').eq(index).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        $('.weui-tab__panel .bonus-list').eq(index).show().siblings().hide();
    });


    $(function () {

        //Tab切换
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            var index = $('.weui-navbar .weui-navbar__item').index($(this));
            $("#type").val(index);
            $('.weui-tab__panel .bonus-list').eq(index).show().siblings().hide();

            $("#shareInfo").submit();
//			if(type==index){
//				return false ;
//			}
//			type = index ;
//			$("#content").html("") ;
//			page = 1 ;
//			totalPage = 0 ;
//			productList(type,page,title);
        });

        //产品列表初始化
//		productList(type,page,title);
    });

    $('.bonus-list a').click(function () {
        var type = $(this).data('type');
        var status = $(this).data('status');
        var goodsid = $(this).data('goodsid');
        var inviteid = $(this).data('inviteid');
        var invitedid = $(this).data('invitedid');
        var orderid = $(this).data('orderid');
        var id = $(this).data('id');
        var isvalid= $(this).data('isvalid');
//        alert(isvalid);
//        alert(type+"-"+status+"-"+goodsid+"-"+inviteid+"-"+invitedid+"-"+orderid);
        //发出的分享
        if (type == '0') {
            $.post("/share/sharedetail",
                    {goodsid: goodsid,userid:invitedid},
                    function (msg) {
                        $('.bonus-details .person').html("被分享人");
                        if(msg.cUser == ''){
                            $('.bonus-details .personphone').html("无此用户");
                        }else{
                            $('.bonus-details .personphone').html(msg.cUser.cellPhone);
                        }

                        $('.bonus-details .productname').html(msg.tGoods.goodsname);
                        $('.bonus-details .productimage').attr("src",msg.tGoods.goodsimage);
                        $("#get-money").html($("#shareRelation"+id).html());
                        $("#tipsStatus").html($("#shareRelation"+id+"Status").html());
                        if(isvalid == 0){
                            $("#openBtn").css("display","none");
                            $("#grey-btn").css("display","block");
                            $("#grey-btn").html("已失效");
                        }else if(msg.expire == true){
                            $("#openBtn").css("display","none");
                            $("#grey-btn").css("display","block");
                        }else{
                            $("#openBtn").css("display","block");
                            $("#grey-btn").css("display","none");
                            $('#openBtn').on('click', function () {
                                //分享页面
//                                window.location.href="/share/loadShareConfig?orderid="+orderid+"&userid="+invitedid+"&goodsid="+goodsid;
                                window.location.href="/share/checkUserAgent?orderid="+orderid+"&userid="+inviteid+"&goodsid="+goodsid;
                            });
                        }
                    }
            );

        } else {//收到的分享
            $.post("/share/sharedetail",
                    {goodsid: goodsid,userid:inviteid},
                    function (msg) {
                        $('.bonus-details .person').html("分享人");
                        if(msg.cUser == ''){
                            $('.bonus-details .personphone').html("无此用户");
                        }else{
                            $('.bonus-details .personphone').html(msg.cUser.cellPhone);
                        }
                        $('.bonus-details .productname').html(msg.tGoods.goodsname);
                        $('.bonus-details .productimage').attr("src",msg.tGoods.goodsimage);
                        $("#get-money").html($("#shareRelation"+id).html());
                        $("#tipsStatus").html($("#shareRelation"+id+"Status").html());
                        if(isvalid == 0){
                            $("#openBtn").css("display","none");
                            $("#grey-btn").css("display","block");
                            $("#grey-btn").html("已失效");
                        }else if(msg.expire == true){

                            $("#openBtn").css("display","none");
                            $("#grey-btn").css("display","block");
                        }else{
                            $("#openBtn").css("display","block");
                            $("#grey-btn").css("display","none");
                            $('#openBtn').on('click', function () {
                                //分享页面
//                                window.location.href="/share/loadShareConfig?orderid="+orderid+"&userid="+inviteid+"&goodsid="+goodsid;
                                window.location.href="/share/checkUserAgent?orderid="+orderid+"&userid="+inviteid+"&goodsid="+goodsid;
                            });
                        }
                    }
            );
        }

        $('.pop-up').show();
        $('.bonus-details').show();
    });
    $('.close-btn').click(function () {
        $('.pop-up').hide();
        $('.pop-up-box').hide();
    })
    $('.i-know').click(function () {
        $('.pop-up').hide();
        $('.pop-up-box').hide();
    })

</script>
</html>
