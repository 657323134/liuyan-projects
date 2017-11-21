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
    <link rel="stylesheet" href="/css/front/style.css">
    <link rel="stylesheet" href="/css/front/swiper.3.1.2.min.css">
    <link rel="stylesheet" type="text/css" href="/css/jquery.fancybox.css">
</head>
<body class="bg-eee">
<header>
    <a class="back-btn" href="javascript:window.history.go(-1)"></a>

    <div class="title">个人资料</div>
    <div class="header-right"></div>
</header>
<div class="container show-data">
    <div class="data-list margin-top10">
        <div class="data-left">手机号码</div>
        <div class="data-right"><p class="data-details"><span style="float: left;"
                                                              id="phonenum">${user.cellPhone}</span></p></div>
        <!--<span class="c-f47c2c" style="float: right;" id="updatephone">更换</span>-->
    </div>
    <div class="data-list">
        <div class="data-left">姓名</div>
        <div class="data-right"><p class="data-details">${user.realName}</p></div>
    </div>
    <div class="data-list with-img">
        <div class="data-left">身份证</div>
        <div class="data-right">
            <p class="data-details">${user.cardid}</p>
            <ul class="img-list">
                <c:forEach items="${cUserPicList}" var="cuserpic">
                    <%--<li><img src="/css/images/front/data-img.png"/></li>--%>
                    <%--<li><img src="/imgs${cuserpic.img_url}"/></li>--%>
                    <li>
                        <a class="fancybox" href="/imgs${cuserpic.img_url}" data-fancybox-group="gallery"
                           title="${cuserpic.img_name}">
                            <img src="/imgs${cuserpic.img_url}" alt="${cuserpic.img_name}"/>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="data-list with-img margin-top10">
        <div class="data-left">信用评分</div>
        <div class="data-right">
            <p class="data-details">
                <c:choose>
                    <c:when test="${not empty user.alipaylimit  and  user.alipaylimit >=0 }">芝麻信用（<fmt:formatNumber
                            type="number" value="${user.alipaylimit}" pattern="0"/>）</c:when>
                    <c:when test="${not empty user.weixinpaylimit and user.weixinpaylimit >=0 }">微粒贷（<fmt:formatNumber
                            type="number" value="${user.weixinpaylimit}" pattern="0"/>）</c:when>
                </c:choose>
            </p>
            <ul class="img-list">
                <c:forEach items="${xinyongList}" var="xinyong">
                    <%--<li><img src="/css/images/front/data-img.png"/></li>--%>
                    <%--<li><img src="/imgs${xinyong.img_url}"/></li>--%>
                    <li>
                        <a class="fancybox" href="/imgs${xinyong.img_url}" data-fancybox-group="gallery"
                           title="${xinyong.img_name}">
                            <img src="/imgs${xinyong.img_url}" alt="${xinyong.img_name}"/>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="data-list with-img margin-top10">
        <div class="data-left">车辆信息</div>
        <div class="data-right">
            <div class="info-right">
                <c:set var="i" value="0"></c:set>
                <c:forEach items="${cUserCarList}" var="cusercar">
                    <span class='option-span <c:if test="${i == 0}">active</c:if> <c:if test="${i != 0}">disabled</c:if>  '
                          index="${i}">${cusercar.car_num}</span>
                    <c:set var="i" value="${i+1}"></c:set>
                </c:forEach>
            </div>
            <c:set var="j" value="0"></c:set>
            <c:forEach items="${cUserCarList}" var="cusercar">
                <c:set var="j" value="${j+1}"></c:set>
                <ul class="img-list car-info-list car-info-list${j}"
                    <c:if test="${j != 1}">style="display: none;"</c:if>>
                    <c:forEach items="${cusercar.carpics}" var="carpic">
                        <%--<li><img src="/css/images/front/data-img.png"/></li>--%>
                        <%--<li><img src="/imgs${carpic.img_url}"/></li>--%>
                        <li>
                            <a class="fancybox" href="/imgs${carpic.img_url}" data-fancybox-group="gallery"
                               title="${carpic.img_name}">
                                <img src="/imgs${carpic.img_url}" alt="${carpic.img_name}"/>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </c:forEach>
        </div>
    </div>
</div>
</body>
<script src="/js/front/swiper.3.1.2.min.js"></script>
<script src="/js/front/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/js/jquery.fancybox.pack.js"></script>
<script>
    $(function () {
        $(".option-span").click(function () {
            if ($(this).hasClass("disabled")) {
                $(this).removeClass("disabled").addClass("active");
                $(this).siblings(".option-span").removeClass("active").addClass("disabled");
                var index = $(this).attr("index");
                $(".data-list").find(".car-info-list").eq(index).show().siblings(".car-info-list").hide();
            }

            /*if($(this).hasClass("sesame-option")){
             if($(".sesame").css("display") == "none"){
             $(".sesame").show();
             $(".wei-credit").hide();
             }
             }else{
             if($(".wei-credit").css("display") == "none"){
             $(".sesame").hide();
             $(".wei-credit").show();
             }
             }*/
        });

        //更换手机号

        $('.fancybox').fancybox({
            prevEffect: 'fade',
            nextEffect: 'fade',
            overlayOpacity: 0.3,
            overlayColor: '#666'
        });

    });
</script>
</html>