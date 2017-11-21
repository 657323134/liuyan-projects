//对于android输入法遮住输入框的处理方法（hack）
// 由于遮罩层是position：fixed，对于安卓输入法弹起无法叠加窗口上，为不是挤压窗口高度，需将设为position：absolute，并将遮罩层高度设置为文档高度
var u = navigator.userAgent;
var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
if (isAndroid) {
    var windowHeight = $(document).height();
    $('.share .pop-up').css({position: "absolute", height: windowHeight + 'px'});
}

//    点击菜单图标显示或隐藏
function ejectMenu() {
    if ($("#head-menu").hasClass("menu-hide")) {
        $("#head-menu").show().removeClass("menu-hide");

    } else {
        $("#head-menu").hide().addClass("menu-hide");
    }
};
//
////轮播图轮播
function figure(){
    var mySwiper = new Swiper(".swiper-container", {
        direction: "horizontal", /*横向滑动*/
        loop: true, /*形成环路（即：可以从最后一张图跳转到第一张图*/
        pagination: ".swiper-pagination", /*分页器*/
        prevButton: ".swiper-button-prev", /*前进按钮*/
        nextButton: ".swiper-button-next", /*后退按钮*/
        autoplayDisableOnInteraction: false, /*切换图片后开启轮播*/
        paginationClickable: true,
        autoplay: 3000 /*每隔3秒自动播放*/
    });
}

//tab栏切换
function tabSwitch(_this, num) {
    var tag = document.getElementById("tab-title");
    var number = tag.getElementsByTagName("a");   //获取导航栏元素个数(getElementsByTagName是返回元素素组)
    var divNum = document.getElementsByClassName("eachDiv");   //获取导航元素对应的div个数
    for (var i = 0; i < number.length; i++) {    //number是一个数组，这里应该用number.length显示它的长度5
        number[i].className = " ";   //清除所有导航栏元素的特殊样式
        divNum[i].style.display = "none";   //其他所有div都隐藏
    }
    _this.className = "default-color";  //给当前导航栏元素添加样式
    var content = document.getElementById("l_no2_" + num);  //当前导航栏元素对应的div
    content.style.display = "block";  //显示当前导航栏元素对应的div部分
}

$('#popWindows').on("click","#receive",function (event) {
    event.stopPropagation();
    $('.pop-up').show();
    $('.open-red').show();
});

$("#popWindows").click(function(event){
    event.stopPropagation();
});
$("#goodsDetails").click(function(event){
    event.stopPropagation();
});

//打开小红包

$('#goodsDetails').on("click",".open-share",function () {
    if ($("#shareuserid").val() != null && $("#shareuserid").val() != '') {
        $('.pop-up').show();
        $('.share-box').show();
    } else {
        //需要登录
        $('.pop-up').show();
        $('.share-login').show();
    }
});
$('#goodsDetails').on("click",".shareText",function () {
    if ($("#shareuserid").val() != null && $("#shareuserid").val() != '') {
        $('.pop-up').show();
        $('.share-box').show();
    } else {
        //需要登录
        $('.pop-up').show();
        $('.share-login').show();
    }
});

$('#popWindows').on("click",".close-btn",function () {
    $('.pop-up').hide();
    $('.receive-red').hide();
});
$('#popWindows').on("click",".cancel-ico",function () {
    $('.pop-up').hide();
    $('.receive-red').hide();
});
$('#popWindows').on("click",".share-tip",function () {
    $('.pop-up').hide();
    $('.pop-up-box').hide();
});
$('#popWindows').on("click",".share-box .share-item a",function () {
    $('.share-box').hide();
    $('.share-tip').show();
});

/*$('.close-btn').click(function () {
    $('.pop-up').hide();
    $('.receive-red').hide();
});
$('.cancel-ico').click(function () {
    $('.pop-up').hide();
    $('.receive-red').hide();
});
$('.share-tip').click(function () {
    $('.pop-up').hide();
    $('.pop-up-box').hide();
});
$('.share-box .share-item a').click(function () {
    $('.share-box').hide();
    $('.share-tip').show();
});*/

//点击关注我们弹出二维码
$(".follow-btn").click(function(){
    $(".erWeiMa").show();
});
//关闭二维码弹框
$(".hide-btn").click(function(){
    $(".erWeiMa").hide();
});


//倒计时组件
var wait = 60;
function time(o) {
    if (wait == 0) {
        o.removeAttribute("disabled");
        o.value = "验证码";
        wait = 60;
    } else {
        o.setAttribute("disabled", true);
        o.value = wait + "s";
        wait--;
        setTimeout(function () {
            time(o)
        }, 1000);
    }
}

//门店分享第一个用户登录
$('#popWindows').on("click","#logingetCode",function () {
    var loginphone = $("#loginphone").val();
    if (loginphone == "") {
        alert("请输入手机号");
        return false;
    }
    if (!isTel(loginphone)) {
        alert("您的手机号输入有误请重新输入");
        return false;
    }
    $.post("/userinfo/sendSms",
        {phone: loginphone},
        function (msg) {
            if (msg.status == 1) {
                time(document.getElementById("logingetCode"));
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
});

//领取红包身份校验
$('#popWindows').on("click","#getCode",function () {
    var phone = $("#phone").val();
    if (phone == "") {
        alert("请输入手机号");
        return false;
    }
    if (!isTel(phone)) {
        alert("您的手机号输入有误请重新输入");
        return false;
    }
    $.post("/userinfo/sendSms",
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
});

//登录
$('#popWindows').on("click","#loginsend",function () {
    var loginphone = $("#loginphone").val();
    var openid = $("#openid").val();
    if (loginphone == "") {
        alert("请输入手机号");
        return false;
    }
    var logincode = $("#logincode").val();
    if (logincode == "") {
        alert("请输入验证码");
        return false;
    }
    //验证码校验
    $.post("/userinfo/validateSms.do",
        {phone: loginphone, code: logincode},
        function (msg) {
            if (msg.status == 1) {
                //用户校验
                $.post("/shared/verifycuser",
                    {phone: loginphone, openid: openid},
                    function (msg) {
                        if (msg.userid == 'phone-exception') {
                            alert("手机校验失败");
                        } else {
                            var userid = msg.userid;
                            window.location.href = "/html/view/front/share.html?userid=" + userid + "&goodsid=" + $("#goodsid").val() + "&bUserId=" + $("#bUserId").val();
                        }
                    });
            } else if (msg.status == 0) {
                alert("验证码不正确");
                return false;
            } else {
                alert("系统繁忙，请稍后再试");
                return false;
            }
        });
});

//电话号码正则
function isTel(tel) {
    var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
    return reg.test(tel);
}

//验证码校验，用户验证，领取红包
$('#popWindows').on("click","#send",function () {
    var phone = $("#phone").val();
    if (phone == "") {
        alert("请输入手机号");
        return false;
    }
    var code = $("#code").val();
    //验证码校验
    $.post("/userinfo/validateSms.do",
        {phone: phone, code: code},
        function (msg) {
            if (msg.status == 1) {
                $.post("/shared/verifycuser.do",
                    {phone: phone},
                    function (msg) {
                        if (msg.userid == 'phone-exception') {
                            alert("手机校验失败");
                        } else {
                            var userid = msg.userid;
                            var shareuserid = $("#shareuserid").val();
                            var goodsid = $("#goodsid").val();
                            $.post("/shared/getshare.do",
                                {userid: userid, goodsid: goodsid, shareuserid: shareuserid},
                                function (msg) {
                                    if (msg.status == 1) {
                                        $("#sharedPhone").html(msg.sharedphone);
                                        $(".receive-red").hide();
                                        $(".open-red").show();
                                        $(".input-box").hide();
                                        $(".received").show();
                                    } else if (msg.status == 2) {
                                        alert("您已经领取过了！！");
                                    } else if (msg.status == 3) {
                                        alert("不能领取自己的红包！！");
                                    } else if (msg.status == -1) {
                                        alert("领取失败！！");
                                    } else if (msg.status == 0) {
                                        alert("参数异常或用户不存在！");
                                    } else if (msg.status == 5) {
                                        alert("您是起始分享人,不能领取!");
                                    } else if (msg.status == 6) {
                                        alert("您已经领取过该商品,不能再领取!");
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

function bonusRecord() {
    window.location.href = "/userinfo/tologin";
}

//门店信息
(function(){
    var asb=window.location.href;
    var s=asb.indexOf("?");
    var urlId=asb.substring(s+1);

    $.ajax({
        url:"/share/loadShareConfig2?" + urlId +"&page=" + encodeURIComponent(asb),
        type: "get",
        dataType:"json",
        success:function(data){
            if(data.code== 200){
                if (data.data.weixin != null) {
                    alert(data.data.weixin);
                    window.location.href=data.data.weixin;
                }
                //门店信息
                var Store_informationText = template("Store_informationTpl",data);
                $("#store_text").html(Store_informationText);

                //商品详情图
                var detailDrawingText = template("detailDrawingTpl",data)
                $(".detailDrawing").html(detailDrawingText);

                //轮播图figureTpl
                var figureImg = template("figureTpl",data)
                $("#figureBox").html(figureImg);
                figure();


                //产品参数
                var categoryText= template("categoryTpl",data);
                $("#category").html(categoryText);

                //分享有礼text
                template.helper('getObject', function () {
                    return {jquery:$,toFixed:toFixed};
                });
                var infoText=template("infoTpl",data);
                $("#goodsDetails").html(infoText);

                //隐藏input
                var hiddenValues=template("hiddenTpl",data);
                $("#hiddenValues").html(hiddenValues);

                //领取红包弹框
                var popWindows=template("popTpl",data);
                $("#popWindows").html(popWindows);

                //微信分享
                wxConfig();
            }
        }
    });

    var index=0;
    $(".moreStores-btn").click(function(){
        index++;
        if($(".zhiYin").attr("name") == 1){
            index++;
            $(".zhiYin").attr("name",2)
        }
            $.ajax({
                type: 'GET',
                url: '/share/queryfacilitator?'+ urlId+'&'+"page="+index,
                dataType: 'json',
                success: function(data){
                    if(data.code==200){
                        var result=template("storeArr_textTpl",data);
                        $('.storeArr_text').append(result);

                        if(data.data.total==0){
                            $(".moreStores").css("display","none");
                        }
                    }
                },
                error: function(xhr, type){
                    alert('服务异常');
                }
            });

    })
})();

/**
 * 配置微信分享
 */
function wxConfig() {
    var appid = $("#appid").val();
    var times = $("#timestamp").val();
    var nonce = $("#nonceStr").val();
    var signa = $("#signature").val();

    //分享内容
    var sharetitle = $("#title").val();//"优卡分期专注汽车后市场消费分期服务平台，零元购机提前享受品质生活！";
    var sharedesc = $("#description").val();//"我剁手买了一款酷炫宝贝${tGoods.goodsname}，还可以使用优卡分期付款“零首付零利息零手续费”，提前享受品质生活，你也买一个吧。";
    var sharelink = $("#shareUrl").val();//分享逻辑链接
    var shareimgUrl = $("#imgUrl").val(); //"http://www.91youka.com/images/front/hongbao.jpg";

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
            'onMenuShareWeibo'
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
                    {userid: userid, goodsid: goodsid},
                    function (msg) {
                        console.log(msg.status);
                    }
                );
            }
        };

        wx.onMenuShareAppMessage(shareData);
        wx.onMenuShareTimeline(shareData);
        wx.onMenuShareQQ(shareData);
        wx.onMenuShareWeibo(shareData);
    });


/*    wx.onMenuShareAppMessage({
        title: sharetitle, // 分享标题
        desc: sharedesc, // 分享描述
        link: sharelink, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
        imgUrl: shareimgUrl, // 分享图标
        type: '', // 分享类型,music、video或link，不填默认为link
        dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
        success: function () {
            // 用户确认分享后执行的回调函数
            //分享成功写入统计数据
            $.post("/share/statistic.do",
                {userid: userid, goodsid: goodsid},
                function (msg) {
                    console.log(msg.status);
                }
            );
        },
        cancel: function () {
            // 用户取消分享后执行的回调函数
        }
    });*/
    wx.error(function (res) {
        alert(res.errMsg);
    });
}




