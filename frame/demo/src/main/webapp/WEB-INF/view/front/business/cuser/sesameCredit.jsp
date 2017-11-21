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
<body class="sesame">
<header>
    <%--<a class="back-btn" href="index.html"></a>--%>
    <div></div>
    <div class="title">芝麻信用</div>
    <div class="header-right"></div>
</header>
<form action="/cuser/saveCredit" id="creditform" enctype="multipart/form-data" method="post">
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
                <div class="current">
                    <div class="wrap">
                        <div class="round">2</div>
                        <div class="bar"></div>
                    </div>
                    <label>芝麻信用</label>
                </div>
                <div class="todo">
                    <div class="wrap">
                        <div class="round">3</div>
                        <div class="bar"></div>
                    </div>
                    <label>等待审核</label>
                </div>
                <div class="todo">
                    <div class="wrap">
                        <div class="round">4</div>
                        <div class="bar"></div>
                    </div>
                    <label>商户识别</label>
                </div>
                <div class="todo last">
                    <div class="wrap">
                        <div class="round">5</div>
                    </div>
                    <label>申请成功</label>
                </div>
            </div>
        </div>

        <!--芝麻信用-->
        <div class="input-box user-data">
            <h2 class="title">芝麻信用</h2>

            <div class="data-input">
                <div class="data-left">信用凭证</div>
                <select name="limitType" id="limitType">
                    <option value="2">芝麻信用分</option>
                    <%--<option value="2">微粒贷信用分</option>--%>
                    <%--<option value="3">蚂蚁借呗信用分</option>--%>
                </select>
            </div>
            <div class="data-input">
                <div class="data-left">信用分</div>
                <input type="text" placeholder="请输入信用分值" name="limit" id="limit"/>
            </div>
            <div class="user-photo">
                <!--<p class="photo-text">请拍摄个人身份证和行驶证正面照截图并选择上传</p>-->
                <div class="user-upload">
                    <div class="upload-img">
                        <div class="reset-btn"></div>
                        <img id="img1" class="img-box" src="/images/front/default-img.png"/>
                        <!--<input class="img-in" type="file" multiple/>-->
                        <div class="upload-btn">添加</div>
                        <div class="upload-name">芝麻信用分截图</div>
                    </div>
                </div>
            </div>
        </div>

        <a class="next-btn" onclick="saveCredit()">下一步</a>

    </div>
    <div class="pop-up">
        <!--<div class="mask animate-fade-in"></div>-->
        <div class="picker animate-slide-up">
            <div class="top-bar">
                <h3>图片上传示例</h3>
                <a href="javascript:;" data-action="cancel" class="action">取消</a>
                <!--<a href="javascript:;" data-action="select" class="weui-picker__action" id="weui-picker-confirm">确定</a>-->
            </div>
            <div class="content">
                <img src="/images/front/zhima-sample.jpg" alt=""/>

                <div class="tip">
                    <h5>示例说明：</h5>

                    <p>1. 打开支付宝应用进入“我的”页面，点击头像进入“个人中心”，点击进入“个人主页”</p>

                    <p>2.点击显示更多将芝麻信用显示出来截取当前屏幕，上传截图即可，如左图显示。</p>

                    <p>注意：截取屏必须同时显示真实姓名和芝麻信用信息</p>
                </div>
                <div class="upload-pic">
                    <input class="img-in" type="file" name="creditImg" id="creditImg"/>

                    <div class="btn">立即上传</div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="userid" name="userid" value="${cUser.id}">
</form>
</body>

<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/front/cuser_common.js"></script>
<script src="/js/front/cUserCredit.js"></script>

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
            $(".img-box").attr("src", "images/front/default-img.png");
            $('.pop-up').css("display", "none");
        });
        $(".upload-btn").click(function () {
            $('.pop-up').css("display", "block");
        });
        $(".img-in").change(function () {
            if (this.files && this.files[0]) {

                if (!/\.(gif|jpg|jpeg|png|bmp)$/i.test(this.files[0].name)) {
                    alert("请选择图片类型上传");
                    return;
                }

                var objUrl = getObjectURL(this.files[0]);
                console.log("objUrl = " + objUrl);
                if (objUrl) {
                    $(".img-box").attr("src", objUrl);
                    $(".upload-btn").css("display", "none");
                    $(".reset-btn").css("display", "block");
                    $(".reset-btn").click(function () {
                        $(this).siblings(".img-box").attr("src", "images/front/default-img.png");
                        $(this).siblings(".upload-btn").css("display", "block");
                        $(this).css("display", "none");
                        $(".img-in").val('');
                    });
                    //$("#img0").attr("src", objUrl);
                    //$("#file0").click(function(e) {
                    //$("#img0").attr("src", objUrl);
                    //});

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
            $('.pop-up').css("display", "none");
        });
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
    });

    //选项改变，文案改变
    $("#limitType").change(function () {
        var value = $('#limitType option:selected').val();
        if (value == 1) {
            $(".upload-name").html("微粒贷信用分截图");
        } else if (value == 2) {
            $(".upload-name").html("芝麻信用分截图");
        } else if (value == 3) {
            $(".upload-name").html("蚂蚁借呗信用分截图");
        }
    });

</script>
</html>