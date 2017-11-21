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
    <link rel="stylesheet" href="/css/front/common.css">
    <link rel="stylesheet" href="/css/front/style.css">
    <link rel="stylesheet" href="/css/front/swiper.3.1.2.min.css">
</head>
<body class="bg-eee">
<header>
    <a class="back-btn" href="javascript:window.history.go(-1)"></a>

    <div class="title">添加车辆</div>
    <div class="header-right"></div>
</header>
<div class="container my-data">
    <form action="/userinfo/carinfo" id="carform" enctype="multipart/form-data" method="post">
        <input type="hidden" name="userid" value="${userid}"/>

        <div class="user-data margin-top10">
            <p class="car-text">请填写用于购买产品的车辆信息</p>

            <div class="data-input">
                <div class="data-left">车牌号码</div>
                <input type="text" placeholder="请输入您的车牌号码" size="11" name="carnum"/>
            </div>
            <div class="user-photo">
                <p class="photo-text">请拍摄行驶证和车辆前脸照片截图并选择上传</p>

                <div class="user-upload">
                    <div class="upload-img">
                        <div class="reset-btn"></div>
                        <img class="img-box" src="/css/images/front/default-img.png"/>
                        <input class="img-in" type="file" name="carimgA" onchange="imgChange(this);"/>

                        <div class="upload-btn">添加</div>
                        <div class="upload-name">行驶证</div>
                    </div>
                    <div class="upload-img">
                        <div class="reset-btn"></div>
                        <img class="img-box" src="/css/images/front/default-img.png"/>
                        <input class="img-in" type="file" name="carimgB" onchange="imgChange(this);"/>

                        <div class="upload-btn">添加</div>
                        <div class="upload-name">车辆前脸照片</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="submit-btn">完成</div>
    </form>
</div>
</body>
<script src="/js/front/swiper.3.1.2.min.js"></script>
<script src="/js/front/jquery-1.8.3.min.js"></script>
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
    });

    function imgChange(obj) {
        if (obj.files && obj.files[0]) {
            var objUrl = getObjectURL(obj.files[0]);
            console.log("objUrl = " + objUrl);
            if (objUrl) {
                $(obj).siblings(".img-box").attr("src", objUrl);
                $(obj).siblings(".upload-btn").css("display", "none");
                $(obj).siblings(".reset-btn").css("display", "block");
                $(obj).siblings(".reset-btn").click(function () {
                    $(this).siblings(".img-box").attr("src", "img/default-img.png");
                    $(this).siblings(".upload-btn").css("display", "block");
                    $(this).css("display", "none");
                    var name = $(this).siblings(".img-in").attr("name");
                    $(this).siblings(".img-in").remove();
                    $(this).parent(".upload-img").append("<input class='img-in' type='file' name='" + name + "'  onchange='imgChange(this);'/>");
                });
            } else {
                //IE下，使用滤镜
                this.select();
                var imgSrc = document.selection.createRange().text;
                var localImagId = document.getElementById("sss");
                //图片异常的捕捉，防止用户修改后缀来伪造图片
                try {
                    preload.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = data;
                } catch (e) {
                    this._error("filter error");
                    return;
                }
                this.img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src=\"" + data + "\")";
            }
        }
    }

    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }


    $(".submit-btn").click(function () {
        var carnum = $("input[name='carnum']").val();
        if (carnum == undefined || carnum == null || carnum == '') {
            alert("车牌号不能为空！");
            return;
        }
        //图片必传
        var carimgA = $("input[name='carimgA']").val();
        var carimgB = $("input[name='carimgB']").val();
        if (carimgA == null || carimgA == '') {
            alert("行驶证图片不能为空！");
            return;
        }
        if (carimgB == null || carimgB == '') {
            alert("车辆前脸照片不能为空！");
            return;
        }
        $("#carform").submit();
    });

</script>
</html>