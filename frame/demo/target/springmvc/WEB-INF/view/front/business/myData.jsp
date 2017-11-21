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
<body class="bg-eee">
<header>
    <a class="back-btn" href="javascript:window.history.go(-1)"></a>

    <div class="title">完善个人资料</div>
    <div class="header-right"></div>
</header>
<div class="container my-data" style="position: relative;padding-bottom: 70px;">
    <div class="fast-login">已有账户，<span class="c-f47c2c" onclick="quicklogin()">点此快速登录</span></div>
    <form action="/userinfo/saveUserInfo" id="userform" enctype="multipart/form-data" method="post">
        <input type="hidden" value="${product_id}" name="product_id"/>
        <input type="hidden" value="1" name="xinyongtype"><!--芝麻信用还是微粒贷， 默认芝麻信用-->
        <div class="user-data">
            <div class="data-input">
                <div class="data-left">手机号码</div>
                <input type="text" name="phone" placeholder="请输入手机号码" size="11"/>
            </div>
            <div class="data-input">
                <div class="data-left">姓名</div>
                <input type="text" name="realname" placeholder="请输入姓名" size="11"/>
            </div>
            <div class="data-input">
                <div class="data-left">身份证</div>
                <input type="text" name="cardid" placeholder="请输入身份证号码" size="11"/>
            </div>
            <div class="user-photo">
                <p class="photo-text">请拍摄个人身份证正面和反面照截图并选择上传</p>

                <div class="user-upload">
                    <div class="upload-img">
                        <div class="reset-btn"></div>
                        <img id="img0" class="img-box" src="/css/images/front/default-img.png"/>
                        <input class="img-in" type="file" name="cardidimgA" onchange="imgChange(this);"/>

                        <div class="upload-btn">添加</div>
                        <div class="upload-name">身份证正面</div>
                    </div>
                    <div class="upload-img">
                        <div class="reset-btn"></div>
                        <img id="img1" class="img-box" src="/css/images/front/default-img.png"/>
                        <input class="img-in" type="file" name="cardidimgB" onchange="imgChange(this);"/>

                        <div class="upload-btn">添加</div>
                        <div class="upload-name">身份证反面</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="credit-data margin-top10">
            <div class="product-info margin-top10">
                <div class="info-left">选择信用评分</div>
                <div class="info-right"><span class="option-span active sesame-option">芝麻信用</span><span
                        class="option-span disabled">微粒贷</span></div>
            </div>
            <div class="sesame credit-box" style="display:block">
                <div class="credit-value">
                    <div class="credit-name">芝麻信用分</div>
                    <input type="text" name="alipaylimit" placeholder="请输入芝麻信用分"/>
                </div>
                <div class="credit-img">
                    <div class="credit-name">打开支付宝-点击右下角“我”-打开钱包-点击芝麻信用借钱-显示可借额度应不低于5K（预估）</div>
                    <div class="upload-img">
                        <div class="reset-btn"></div>
                        <img id="img2" class="img-box" src="/css/images/front/default-img.png"/>
                        <input class="img-in" type="file" name="alipayimg" onchange="imgChange(this);"/>

                        <div class="upload-btn">添加</div>
                    </div>
                </div>
            </div>
            <div class="wei-credit credit-box">
                <div class="credit-value">
                    <div class="credit-name">微粒贷借款额度</div>
                    <input type="text" name="weixinpaylimit" placeholder="请输入微粒贷借款额度"/>
                </div>
                <div class="credit-img">
                    <div class="credit-name">打开微信-点击右下角“我”-打开钱包-点击微粒贷借钱-显示可借额度应不低于5K（预估）</div>
                    <div class="upload-img">
                        <div class="reset-btn"></div>
                        <img id="img3" class="img-box" src="/css/images/front/default-img.png"/>
                        <input class="img-in" type="file" name="weixinpayimg" onchange="imgChange(this);"/>

                        <div class="upload-btn">添加</div>
                    </div>
                </div>
            </div>
        </div>
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
        <div class="submit-btn">提交资料</div>
    </form>
</div>
<div class="pop-up">
    <div class="pop-box ">
        <div class="close-btn"></div>
        <div class="send-text" id="smstips"></div>
        <input class="code-in" type="text" placeholder="请输入短信验证码" id="code"/>

        <div class="confirm-btn">确认</div>
    </div>
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
                $("input[name='xinyongtype']").val(1);
                if ($(".sesame").css("display") == "none") {
                    $(".sesame").show();
                    $(".wei-credit").hide();
                }
            } else {
                $("input[name='xinyongtype']").val(2);
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

        var phone = $.trim($("input[name='phone']").val());
        var realname = $.trim($("input[name='realname']").val());
        var cardid = $.trim($("input[name='cardid']").val());


        if (phone == undefined || phone == null || phone == '') {
            alert("手机号不能为空！");
            return;
        }
        var reg = /^1\d{10}$/;  //定义正则表达式
        if (!reg.test(phone)) {
            alert("手机号格式错误！");
            return;
        }
        if (realname == undefined || realname == null || realname == '') {
            alert("真实姓名不能为空！");
            return;
        }
        if (checkChineseName(realname) != 0) {
            alert("请输入符合条件的中文姓名！");
            return;
        }
        if (cardid == undefined || cardid == null || cardid == '') {
            alert("身份证号不能为空！");
            return;
        }
        if (!checkIdcard(cardid)) {
            alert("请输入正确的身份证号！");
            return;
        }
        var cardidimgA = $("input[name='cardidimgA']").val();
        var cardidimgB = $("input[name='cardidimgB']").val();
        if (cardidimgA == null || cardidimgA == '') {
            alert("身份证正面不能为空！");
            return;
        }
        if (cardidimgB == null || cardidimgB == '') {
            alert("身份证反面不能为空！");
            return;
        }

        //芝麻和微粒貸  选填
        var alipaylimit = $.trim($("input[name='alipaylimit']").val());
        var alipayimg = $("input[name='alipayimg']").val();
        var weixinpaylimit = $.trim($("input[name='weixinpaylimit']").val());
        var weixinpayimg = $("input[name='weixinpayimg']").val();

        var a = true, b = true, c = true, d = true;
        if (alipaylimit == undefined || alipaylimit == null || alipaylimit == '') {
            a = false;
//			alert("芝麻信用借款额度不能为空！");
//			return;
        }
        if (weixinpaylimit == undefined || weixinpaylimit == null || weixinpaylimit == '') {
            b = false;
//			alert("微粒贷借款额度不能为空！");
//			return;
        }
        if (alipayimg == null || alipayimg == '') {
            c = false;
//			alert("芝麻信用截图不能为空！");
//			return;
        }
        if (weixinpayimg == null || weixinpayimg == '') {
            d = false;
//			alert("微粒贷截图不能为空！");
//			return;
        }

        if ((a == true && c == true) || (b == true && d == true)) {
        } else {
            alert("芝麻信用和微粒贷必须二选一!");
            return;
        }

        var carnum = $("input[name='carnum']").val();
        if (carnum == undefined || carnum == null || carnum == '') {
            alert("车牌号不能为空！");
            return;
        }
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


        //檢查手机号和身份证号不重复
        $.ajax({
            type: 'post',
            url: '/userinfo/checkoutAccount',
            data: {
                phone: phone, cardid: cardid
            },
            success: function (data) {
                if (data.existUser == "0") {
                    //发送验证码
                    $.ajax({
                        type: 'post',
                        url: '/userinfo/sendSms',
                        data: {
                            phone: phone
                        },
                        success: function (data) {
                            if (data.status == "1") {
                                $("#smstips").html("验证码已经发送到" + phone.substr(0, 3) + "****" + phone.substr(7) + "请注意查收");
                                $(".pop-up").show();
                                $(".pop-box").show();
                            } else {
                                alert("短信发送失败，请稍后再试！");
                            }
                        }
                    });
                } else if (data.existUser == "1") {
                    alert("手机号已被注册！");
                } else if (data.existUser == "2") {
                    alert("身份证号已被注册！");
                }
            }
        });

    });

    //确认按钮
    $(".confirm-btn").click(function () {
        $("#userform").submit();
    });
    $(".close-btn").click(function () {
        $(".pop-up").hide();
        $(".pop-box").hide();
    });

    function quicklogin() {
        location.href = "/userinfo/tologin";
    }

    //是否为中文
    function checkChinese(str) {
        var re = /[^\u4e00-\u9fa5]/;
        if (re.test(str)) return false;
        return true;
    }
    ;
    //是否为中文姓名
    function checkChineseName(v) {
        if (v == '') return 1;
        if (v.length < 2) {
            return 2;
        }
        var name = v.replace(/·/g, '');
        name = name.replace(/•/g, '');
        if (checkChinese(name))  return 0; else return 2;
    }
    ;

    //身份证号
    function checkIdcard(num) {
        num = num.toUpperCase();
        // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。
        if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))) {
            // alert('输入的身份证号长度不对，或者号码不符合规定！\n15位号码应全为数字，18位号码末位可以为数字或X。');
            $("#apply-tips").html("请输入正确的身份证号码！");
            return false;
        }
        // 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
        // 下面分别分析出生日期和校验位
        var len, re;
        len = num.length;
        if (len == 15) {
            re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
            var arrSplit = num.match(re);

            // 检查生日日期是否正确
            var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/'
                    + arrSplit[4]);
            var bGoodDay;
            bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2]))
                    && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3]))
                    && (dtmBirth.getDate() == Number(arrSplit[4]));
            if (!bGoodDay) {
                return false;
            } else {
                // 将15位身份证转成18位
                // 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
                var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,
                        8, 4, 2);
                var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4',
                        '3', '2');
                var nTemp = 0, i;
                num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);
                for (i = 0; i < 17; i++) {
                    nTemp += num.substr(i, 1) * arrInt[i];
                }
                num += arrCh[nTemp % 11];
                return true;
            }
        }
        if (len == 18) {
            re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
            var arrSplit = num.match(re);

            // 检查生日日期是否正确
            var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/"
                    + arrSplit[4]);
            var bGoodDay;
            bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2]))
                    && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3]))
                    && (dtmBirth.getDate() == Number(arrSplit[4]));
            if (!bGoodDay) {
                // alert(dtmBirth.getYear());
                // alert(arrSplit[2]);
                // alert('输入的身份证号里出生日期不对！');
                return false;
            } else {
                // 检验18位身份证的校验码是否正确。
                // 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
                var valnum;
                var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,
                        8, 4, 2);
                var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4',
                        '3', '2');
                var nTemp = 0, i;
                for (i = 0; i < 17; i++) {
                    nTemp += num.substr(i, 1) * arrInt[i];
                }
                valnum = arrCh[nTemp % 11];
                if (valnum != num.substr(17, 1)) {
                    // alert('18位身份证的校验码不正确！应该为：' + valnum);
                    return false;
                }
                return true;
            }
        }
        return false;
    }


</script>
</html>