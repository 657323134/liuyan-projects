<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<body class="upload-product">
<header>
    <a class="back-btn" href="/buser/toTGoodsPage.do"></a>

    <div class="title">上传商品</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">

    <!--上传商品图片-->
    <div class="upload-box">
        <div class="weui-uploader__bd">
            <ul class="weui-uploader__files" id="uploaderFiles">
                <c:forEach var="pic" items="${tGoodsPics}">
                    <li class="weui-uploader__file"
                        style="background-image:url(${imgUrl}${pic.img_url})"><%--<div class="reset-btn"></div>--%></li>
                </c:forEach>
            </ul>
            <div class="weui-uploader__input-box inputs">
                <c:if test="${empty goodDetail}">
                    <input id="uploaderInput" name="imageFiles" class="weui-uploader__input" onchange="change(this)"
                           type="file" accept="image/*" multiple/>
                </c:if>
            </div>
        </div>
    </div>
    <div class="weui-cells weui-cells_form">
        <div class="weui-cell weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd">
                <label for="" class="weui-label">商品类型</label>
            </div>
            <div class="weui-cell__bd">
                <select class="weui-select" name="select2" id="goodsType"
                        <c:if test="${not empty goodDetail}">disabled="disabled"</c:if>>
                    <c:forEach items="${goodsTypes}" var="type">
                        <option value="${type.id}"
                                <c:if test="${goodDetail.typeId==type.id}">selected="selected"</c:if>>${type.typeName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="weui-cell login-type flex">
            <div class="weui-cell__hd"><label class="weui-label">商品品牌</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" name="brandName"
                       <c:if test="${not empty goodDetail}">value="${goodDetail.brandName}" readonly="readonly"</c:if>
                       type="text" placeholder="请输入商品品牌"/>
            </div>
        </div>

        <div class="weui-cell login-type flex">
            <div class="weui-cell__hd"><label class="weui-label">商品型号</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" name="goodsname"
                       <c:if test="${not empty goodDetail}">value="${goodDetail.goodsname}" readonly="readonly"</c:if>
                       type="text" placeholder="请输入商品型号"/>
            </div>
        </div>
        <%--<div class="weui-cell login-type flex">--%>
        <%--<div class="weui-cell__hd"><label class="weui-label">商品识别码</label></div>--%>
        <%--<div class="weui-cell__bd">--%>
        <%--<input class="weui-input" type="text" placeholder="请输入商品识别码"/>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div class="weui-cell login-type flex">--%>
        <%--<div class="weui-cell__hd"><label class="weui-label">商品价格</label></div>--%>
        <%--<div class="weui-cell__bd">--%>
        <%--<input class="weui-input" name="goodsprice" <c:if test="${not empty goodDetail}">value="${goodDetail.goodsprice}" readonly="readonly"</c:if> type="number" placeholder="请输入商品价格"/>--%>
        <%--</div>--%>
        <%--</div>--%>

        <div class="weui-cell login-type flex">
            <div class="weui-cell__hd"><label class="weui-label">商品描述</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="text" name="goodsremak"
                       <c:if test="${not empty goodDetail}">value="${goodDetail.goodsremak}" readonly="readonly"</c:if>
                       placeholder="请输入商品描述"/>
            </div>
        </div>
    </div>
    <div class="weui-toptips weui-toptips_warn">错误提示</div>
</div>

<c:if test="${empty goodDetail}">
    <button class="add-product-btn" id="productSubmit">提交审核</button>
</c:if>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/weui.min.js"></script>
<script src="/js/front/ajaxfileupload.js"></script>
<c:if test="${not empty goodDetail}">
    <button class="add-product-btn">提交审核</button>
</c:if>
</body>
<script>
    var imageUrls = "";
    $(function () {
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

        var tmpl = '<li class="weui-uploader__file" style="background-image:url(#url#)"><div class="reset-btn"></div></li>',
                $gallery = $("#gallery"), $galleryImg = $("#galleryImg"),
                $uploaderInput = $("#uploaderInput"),
                $uploaderFiles = $("#uploaderFiles")
                ;

        $("#productSubmit").click(function () {
            var goodsTypeId = $("#goodsType option:selected").attr('value');
            var brandName = $("input[name='brandName']").val();
            var goodsname = $("input[name='goodsname']").val();
            var goodsprice = $("input[name='goodsprice']").val();
            var goodsremak = $("input[name='goodsremak']").val();
            var data = {
                goodsTypeId: goodsTypeId,
                brandName: brandName,
                goodsname: goodsname,
                goodsprice: goodsprice,
                goodsremak: goodsremak,
                imageUrls: imageUrls
            };
            if (imageUrls == "") {
                $(".weui-toptips").css("display", "block").html("请上传图片");
                return false;
            }
            if (brandName.trim() == "" || brandName == null) {
                $(".weui-toptips").css("display", "block").html("品牌名不能为空");
                return false;
            }
            if (goodsname.trim() == "" || goodsname == null) {
                $(".weui-toptips").css("display", "block").html("商品型号不能为空");
                return false;
            }
//            if(goodsprice.trim()==""||goodsprice==null){
//                $(".weui-toptips").css("display","block").html("商品价格不能为空") ;
//                return false ;
//            }
            if (goodsremak.trim() == "" || goodsremak == null) {
                $(".weui-toptips").css("display", "block").html("商品描述不能为空");
                return false;
            }
            $.post(
                    "/buser/addOrUpdateProduct.do",
                    data,
                    function (info) {
                        if (info == 2) {
                            location.href = "/buser/toTGoodsPage.do";
                        }
                    }
            );


        });
    });
    function change(obj) {
        var tmpl = '<li class="weui-uploader__file" style="background-image:url(#url#)"><div class="reset-btn"></div></li>',
                $gallery = $("#gallery"), $galleryImg = $("#galleryImg"),
                $uploaderInput = $("#uploaderInput"),
                $uploaderFiles = $("#uploaderFiles")
                ;
        var src, url = window.URL || window.webkitURL || window.mozURL, files = obj.files;
        for (var i = 0, len = files.length; i < len; ++i) {
            var file = files[i];

            if (url) {
                src = url.createObjectURL(file);
            } else {
                src = obj.result;
            }

            $uploaderFiles.append($(tmpl.replace('#url#', src)));
            $uploaderFiles.find('li:last').children('.reset-btn').click(function () {
                $(this).parents('li').remove();
            });

        }
        $.ajaxFileUpload({
            url: '/buser/ajaxfileupload',
            secureuri: false,
            fileElementId: 'uploaderInput',//file标签的id
            dataType: 'json',//返回数据的类型
            data: {},//一同上传的数据
            success: function (data, status) {
                if (data) {
                    imageUrls += data.url + ",";
                    $("#uploaderInput").remove();
                    $(".inputs").append('<input id="uploaderInput"  name="imageFiles" onchange="change(this)" class="weui-uploader__input"  type="file" accept="image/*" multiple/>');
                }
            },
            error: function (data, status, e) {
                layer.alert(e);
            }
        });
    }
</script>
</html>