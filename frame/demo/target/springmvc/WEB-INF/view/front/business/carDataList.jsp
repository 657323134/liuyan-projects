<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
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
    <a class="back-btn" href="javascript:window.history.go(-1)"></a>

    <div class="title">选择车牌号</div>
    <div class="header-right"></div>
</header>

<div class="container">
    <!--    <div class="search-box">
                <input type="text" class="search-in"/>
                <div class="search-icon">搜索</div>
            </div>-->
    <ul class="service-list">
        <%--<a href="/userinfo/tocarinfo" style=" display: block; height: 30px;line-height: 30px;color: #fff;width: 75px;text-align: center;position: absolute;top:5px;right:3%;background:#f47c2c;border-radius: 6px;">添加车牌号</a>--%>

        <c:forEach items="${cUserCarList}" var="cUserCar">
            <li value="${cUserCar.id}">${cUserCar.car_num}</li>
        </c:forEach>

        <%--<li class="checked">喜卡车联南山一店</li>--%>
        <%--<li>喜卡车联南山二店</li>--%>
    </ul>
    <div class="done-btn">添加车辆</div>

</div>
<input type="hidden" id="product_id" value="${tGoods.id}"/>
</body>
<script src="/js/front/jquery-1.8.3.min.js"></script>
<script>
    $(function () {
        $(".service-list li").click(function () {
            if (!$(this).hasClass("checked")) {
                $(this).attr("style", "color:#cccccc;");
                $(this).addClass("checked").siblings("li").removeClass("checked");
                var cusercarid = $(this).val();
                var cusercarnum = $(this).html();
                var product_id = $("#product_id").val();
                //更新车牌号到用户表ajax
                $.ajax({
                    type: 'post',
                    url: '/userinfo/updateUserCar',
                    data: {
                        cusercarnum: cusercarnum, cusercarid: cusercarid
                    },
                    success: function (data) {
                        if (data.status == "1") {
                            //跳转
                            location.href = "/order/product?product_id=" + product_id;
                        } else {
                            alert(data);
                        }
                    }
                });
            }
        });
    });

    $(".done-btn").click(function () {
        location.href = "/userinfo/tocarinfo";
    });


</script>
</html>