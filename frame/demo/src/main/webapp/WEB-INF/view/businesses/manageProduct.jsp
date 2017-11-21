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
    <%--<link rel="stylesheet" href="/css/front/share.css">--%>
    <style>
        .share-goods{
            color: #ef2034;
        }

        .pop-up {
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            background: rgba(0, 0, 0, .6);
            z-index: 9999;
            display: none;
        }

        .pop-up-box {
            display: none;
        }
        .pop-up-box .close-btn {
            width: 24px;
            height: 24px;
            background: url("/images/front/close-icon.png") #ccc no-repeat center;
            background-size: 14px;
            position: absolute;
            top: 8px;
            right: 8px;
            border-radius: 100%;
            display: block;
        }
        .share-link {
            width: 90%;
            margin: 30% auto;
            position: relative;
            background: #fff;
            border-radius: 5px;
        }
        .share-link h3 {
            text-align: center;
            line-height: 50px;
            border-bottom: 1px solid #eee;
            font-weight: normal;
        }
        .share-link p{
            font-size: 12px;
            color: #666;
            line-height: 20px;
            margin: 15px 0px;
            text-align: center;
        }
        .share-link #bar{
            font-size: 14px;
            line-height: 20px;
            display: block;
            padding: 0.5em;
            color: #333;
            background: #f8f8f8;
            -webkit-text-size-adjust: none;
            margin: 10px 0;
            text-align: left;
        }
        .share-link .share-text{
            width: 90%;
            margin: 20px auto;
            overflow: hidden;
        }
        .share-link strong{
            font-weight: normal;
        }
        .btn {
            width: 80%;
            height: 40px;
            font-size: 16px;
            margin: 20px auto 10px auto;
            line-height: 40px;
            background: #ef2034;
            color: #fff;
            text-align: center;
            border: none;
            display: block;
            border-radius: 5px;
        }
        #copyTip{
            color:#fff;
            display: none;
            font-size: 14px;
            position: relative;
            background: rgba(0,0,0,0.8);
            width:120px;
            height: 30px;
            line-height: 30px;
            border-radius: 3px;
            margin: 0 auto;
            text-align: center;
        }
        #copyTip::before {
            position: absolute;
            z-index: 1000001;
            /*display: none;*/
            width: 0;
            height: 0;
            color: rgba(0,0,0,0.8);
            pointer-events: none;
            content: "";
            border: 5px solid transparent;
            /*opacity: 0;*/
            top: auto;
            right: 50%;
            top: -10px;
            margin-right: -5px;
            border-bottom-color: rgba(0,0,0,0.8);
        }
    </style>
</head>
<body class="manage-product">
<input type="hidden" id="sysPath" value="<%=request.getScheme()+"://"+ request.getServerName()%>">
<input type="hidden" id="sysPort" value="<%=request.getServerPort()%>">
<input type="hidden" id="contextPath" value="<%= request.getContextPath()%>">
<div class="weui-toptips weui-toptips_warn">错误提示</div>
<!-- 弹框 -->
<div class="pop-up">
    <!-- 分享链接 -->
    <div class="pop-up-box share-link">
        <h3>生成客户端链接</h3>
        <span class="close-btn"></span>
        <div class="share-text">
            <strong id="cpGoodsName">尊镜K6</strong>
            <p id="bar"></p>
            <button class="btn" type="button" data-clipboard-demo="" data-clipboard-action="copy" data-clipboard-target="#bar">
                复制链接
            </button>
            <div id="copyTip">已复制</div>
            <p>将上面链接复制分享给微信等社交渠道即可使用！</p>

        </div>
    </div>
</div>

<header>
    <a class="back-btn" href="/buser/toBUserSettingPage.do"></a>
    <div class="title">管理产品</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="weui-tab">
        <div class="weui-navbar">
            <input type="hidden" id="userType" value="${buser.userType}"/>
            <div class="weui-navbar__item weui-bar__item_on">
                我的专区
            </div>
            <div class="weui-navbar__item">
                品牌专区
            </div>
        </div>
        <div class="weui-tab__panel">
            <div class="product-list">
                <div class="weui-panel weui-panel_access" id="content">

                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/weui.min.js"></script>
<script src="/js/clipboard.min.js"></script>
<script>
    var type = 0;
    var page = 1;
    var totalPage = 0;
    $(function () {

        $('.cancel-ico').click(function(){
            $('.pop-up').hide();
            $('.pop-up-box').hide();
        });

        $('.close-btn').click(function () {
            $('.pop-up').hide();
            $('#copyTip').hide();
        })

        //复制链接
        //判断是否支持复制功能
//        alert(Clipboard.isSupported());
        // alert(document.execCommand('copy', false, null));
        if(Clipboard.isSupported()) {
            var clipboard = new Clipboard('.btn');
            clipboard.on('success', function (e) {
                $('#copyTip').show();
                setTimeout(function () {
                    $('#copyTip').hide();
                }, 3000)
                e.clearSelection();
            });

            clipboard.on('error', function (e) {
                console.error('Action:', e.action);
                console.error('Trigger:', e.trigger);
            });
        }else{
            $('.btn').hide();
            $('#bar').click(function () {
                if (document.selection) {
                    var range = document.body.createTextRange();
                    range.moveToElementText(document.getElementById('bar'));
                    range.select();
                } else if (window.getSelection) {
                    window.getSelection().removeAllRanges();
                    var range = document.createRange();
                    range.selectNode(document.getElementById('bar'));
//                    window.getSelection().getRangeAt(0);
                    window.getSelection().addRange(range);
                } else{
                    alert("分享商品，请手动选择链接！")
                }
            })
        }


        //Tab切换
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            var index = $('.weui-navbar .weui-navbar__item').index($(this));

            if (type == index) {
                return false;
            }
            type = index;
            $("#content").html("");
            page = 1;
            totalPage = 0;
            productList(type, page);
        });
        //产品列表初始化
        productList(type, page);

        function productList(type, page) {
            var userType = $('#userType').val();
            if (totalPage != 0 && page > totalPage) {
                return false;
            }
            var platformType = type == 0 ? 2 : 1;
            var html = "";
            if (platformType == 2 && page <=1) {
                if(userType!=2){
                    html += '<div class="weui-panel__hd"><a href="/buser/toTGoodsDetail.do">上传产品</a></div>';
                }
            }
            //获取产品列表
            $.ajax({
                type: 'post',
                url: '/buser/toTGoodsPageData.do',
                data: {
                    platformType: platformType,
                    start: page,
                },
                success: function (data) {
                    console.log(data);
                    if (data) {
                        var list = data.pageBean;
                        totalPage = data.page.totalPages;
                        for (var i = 0; i < list.length; i++) {
                            html += '<div class="weui-panel__bd">';
                            html += '<div class="weui-media-box weui-media-box_appmsg">';
                            if (list[i].platformType == 2) {
                                html += '<a href="/buser/toTGoodsDetail.do?id=' + list[i].id + '" >';
//

                            } else {
//                                html += '<a href="/buser/toBrandTGoodsDetail.do?id=' + list[i].id + '" >';
                                html += '<a href="/html/view/businesses/productDetail.html?id=' + list[i].id;
                                if (list[i].salesBonus == "undefined" || list[i].salesBonus == undefined) {
                                    html += '&fenhong=0' + '" >';
                                } else {
                                    html += '&fenhong=' +list[i].salesBonus + '" >'
                                }
                            }
                            html += '<div class="weui-media-box__hd">';
                            html += '<img class="weui-media-box__thumb" src="' + data.imgUrl + list[i].goodsimage + '" alt="">';
                            html += ' </div>';
                            html += '<div class="weui-media-box__bd">';
                            html += '<h4 class="weui-media-box__title" style="font-size: 14px;">' + list[i].brandName + '／' + list[i].goodsname + '</h4>';

//                            ((totalPrice)/$(".periods").val()).toFixed(3).substring(0,((totalPrice)/$(".periods").val()).toFixed(3).indexOf('.')+3)
                            if (list[i].platformType == 2) {
//                                html += '<p class="weui-media-box__desc">售价：¥' + list[i].goodsprice.toFixed(3).substring(0,list[i].goodsprice.toFixed(3).indexOf('.')+3) + '</p>';
                            } else {
                                html += '<p class="weui-media-box__desc">售价：¥' + list[i].goodsprice.toFixed(3).substring(0, list[i].goodsprice.toFixed(3).indexOf('.') + 3) + '</p>';
                                if (data.type != 1 && list[i].platformType == 1) {
                                    html += '<p class="weui-media-box__desc">销售分红：¥' + list[i].salesBonus.toFixed(3).substring(0, list[i].salesBonus.toFixed(3).indexOf('.') + 3) + '</p>';
                                }
                                if (list[i].planName != null && list[i].planName != "" && list[i].planName != "undefined") {
                                    html += '<p class="weui-media-box__desc">金融方案：' + list[i].planName + '</p>';
                                }

//                                html += '<p class="weui-media-box__desc"><span>售价：¥' + list[i].goodsprice.toFixed(3).substring(0,list[i].goodsprice.toFixed(3).indexOf('.')+3) + '&nbsp;&nbsp;</span><span> 分红：¥' + list[i].bonus.toFixed(3).substring(0,list[i].bonus.toFixed(3).indexOf('.')+3)+ '</span></p>';
                            }
                            html += '<p class="weui-media-box__desc">类型：' + list[i].goodTypeName + '</p>';
                            html += '</div>';
                            html += ' </a>';
                            if(list[i].platformType == 1){
                                /*  html += ' <input type="button" value="分享" onclick="toShare()"/>';*/
                                html += '<div class="weui-btn weui-btn_mini share-goods" data-id="'+list[i].id+'" data-name= "'+list[i].goodsname+'">分享商品</div>';
                            }
                            if (list[i].platformType == 2) {
                                html += '<div class="weui-media-box__ft">';
                                html += ' <span class="delete" onclick="deleteProduct(' + list[i].id + ')"></span>';
                                if (list[i].goodstype == 2) {
                                    html += ' <p class="weui-media-box__desc">审核中</p>';
                                } else {
                                    html += ' <p class="weui-media-box__desc">审核通过</p>';
                                }
                                html += '</div>';
                            }
                            html += '</div>';
                            html += ' </div>';
                        }
                        $("#content").append(html).find('.share-goods').on('click',function shareGoods(){
                            $('.pop-up').show();
                            var id = $(this).data('id');
                            var goodsname =  $(this).data('name');
                            $('#cpGoodsName').text(goodsname);
                            var url = "";
                            var sysPath = $('#sysPath').val();
                            var sysPort = $('#sysPort').val();
                            var contextPath = $('#contextPath').val();
                            url = sysPath
                            if(sysPort != "80" && sysPort != "443"){
                                url = url + ":" + sysPort;
                            }
                            if(contextPath != "" && contextPath!=null){
                                url = url + "/" + contextPath + "/";
                            }else{
                                url = url + "/";
                            }

                            // 分享的goodsid和门店信息
                            $('#bar').text(url + "share/checkUserAgent?buserid=" + ${buser.id} + "&goodsid=" + id);
                            $(document).on('click touchstart', '#bar', function(e) {
                                window.location.href=url + "share/checkUserAgent?buserid=" + ${buser.id} + "&goodsid=" + id;
                            });
                            <%--$('#bar').text(url + "html/view/front/share.html?goodsid=" + id + "&bUserId=" + ${buser.id});--%>
                            /*
                             $('#bar').text("linkshare?goodsId=" + id);
                             */
                            $('.share-link').show();
                        });
                    }
                }
            });
        }

        /*滚动条到底部时自己加载新的内容*/
        $(window).scroll(function () {
            if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
                //console.log("加载新数据");
                page++;
                productList(type, page);
            }
        });
    });
    function deleteProduct(id) {
        if (confirm("确定删除吗？") == true) {
            $.post(
                    "/buser/deleteProduct",
                    {id: id},
                    function (data) {
                        if (data) {
                            location.href = "/buser/toTGoodsPage.do";
                        }
                    }
            );
        } else {
            return false;
        }
    }
    function toShare(){
        alert("1111");
    }

</script>
</html>