<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="/css/businesses/weui.min.css">
    <link rel="stylesheet" href="/css/businesses/style.css">
</head>
<body class="info-center">
<div class="weui-toptips weui-toptips_warn">错误提示</div>

<header>
    <a class="back-btn" href="index.html"></a>

    <div class="title">信息中心</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="weui-panel">
        <div class="weui-panel__bd">
            <div class="weui-media-box weui-media-box_text">
                <h4 class="weui-media-box__title">优卡分期贷款量破亿啦</h4>

                <p class="weui-media-box__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
                <ul class="weui-media-box__info">
                    <!--<li class="weui-media-box__info__meta">文字来源</li>-->
                    <li class="weui-media-box__info__meta">2016-10-11 12:12:00
                    </li>
                    <!--<li class="weui-media-box__info__meta weui-media-box__info__meta_extra">其它信息</li>-->
                </ul>
            </div>
            <div class="weui-media-box weui-media-box_text">
                <h4 class="weui-media-box__title">优卡分期贷款量破亿啦</h4>

                <p class="weui-media-box__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
                <ul class="weui-media-box__info">
                    <!--<li class="weui-media-box__info__meta">文字来源</li>-->
                    <li class="weui-media-box__info__meta">2016-10-11 12:12:00
                    </li>
                    <!--<li class="weui-media-box__info__meta weui-media-box__info__meta_extra">其它信息</li>-->
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
<script src="js/jquery-1.8.3.min.js"></script>
<script>
    $(function () {
        $(".weui-media-box__title").click(function () {
            $(this).siblings(".weui-media-box__desc").slideToggle();
        });
    });
</script>
</html>