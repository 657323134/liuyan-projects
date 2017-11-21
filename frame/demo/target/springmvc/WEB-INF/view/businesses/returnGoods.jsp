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
<body class="return-goods">
<div class="weui-toptips weui-toptips_warn">错误提示</div>

<header>
    <a class="back-btn" href="/border/toOrderDetailPage.do?orderId=${bOrder.id}"></a>

    <div class="title">退货</div>
    <div class="header-right"></div>
</header>

<!--步骤条-->
<div class="steps-bar container">
    <div class="ui-steps-round steps-round-auto steps-3">
        <div class="finished select">
            <div class="wrap">
                <div class="round">1</div>
                <div class="bar"></div>
            </div>
            <label>申请退货</label>
        </div>
        <div class="finished <c:if test='${bOrder.cancelOrderStatus==1}'>select</c:if>">
            <div class="wrap">
                <div class="round">2</div>
                <div class="bar"></div>
            </div>
            <label>等待审核</label>
        </div>
        <div class="current <c:if test='${bOrder.cancelOrderStatus>1}'>select</c:if>">
            <div class="wrap">
                <div class="round">3</div>
                <div class="bar"></div>
            </div>
            <label>已处理</label>
        </div>
    </div>
</div>
<!--退货填写信息-->
<c:if test="${empty orderBack}">
    <form action="/border/cancelOrder.do" id="goodsForm" enctype="multipart/form-data" method="post">
        <div class="input-box">
            <div class="page__bd">
                <div class="weui-cells__title">退货信息</div>
                <div class="weui-cells weui-cells_form">
                    <div class="weui-cell weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd">
                            <label for="" class="weui-label">退货原因：</label>
                        </div>
                        <div class="weui-cell__bd">
                            <select class="weui-select" name="type">
                                <option value="1">产品质量问题</option>
                                <option value="2">选错产品</option>
                            </select>
                        </div>
                    </div>
                    <div class="weui-cell textarea problem">
                        <div class="weui-cell__hd">
                            <label for="" class="weui-label">问题描述：</label>
                        </div>
                        <div class="weui-cell__bd">
                            <textarea class="weui-textarea" name="remark" id="remark" placeholder="请填写问题描述......"
                                      rows="3"></textarea>
                            <!--<div class="weui-textarea-counter"><span>0</span>/200</div>-->
                            <input type="hidden" name="orderId" value="${bOrder.id}"/>
                        </div>
                    </div>
                </div>
            </div>

            <!--上传凭证-->
            <div class="page__bd upload-doc">
                <div class="weui-cells__title">上传图片（最多3张）</div>
                <div class="weui-cells">
                    <div class="weui-cell__hd">
                        <div class="upload-img">
                            <div class="reset-btn"></div>
                            <img id="img1" class="img-box" src=""/>
                            <input class="img-in" name="img1" type="file" multiple/>

                            <div class="upload-btn"></div>
                        </div>
                    </div>
                    <div class="weui-cell__bd">
                        <div class="upload-img">
                            <div class="reset-btn"></div>
                            <img id="img2" class="img-box" src=""/>
                            <input class="img-in" name="img2" type="file" multiple/>

                            <div class="upload-btn"></div>
                        </div>
                    </div>
                    <div class="weui-cell__ft">
                        <div class="upload-img">
                            <div class="reset-btn"></div>
                            <img id="img3" class="img-box" src=""/>
                            <input class="img-in" name="img3" type="file" multiple/>

                            <div class="upload-btn"></div>
                        </div>
                    </div>
                </div>

                <a href="javascript:;" class="weui-btn ui-btn_primary" id="returnSubmit">提 交</a>
            </div>
        </div>
    </form>
</c:if>

<!--退货状态信息-->
<c:if test="${not empty orderBack}">
    <div class="return-info">
        <div class="page__bd">
            <div class="weui-cells__title">退货信息</div>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label for="" class="weui-label">退货原因：</label>
                    </div>
                    <div class="weui-cell__bd">
                        产品质量问题
                    </div>
                </div>

                <div class="weui-cell problem">
                    <div class="weui-cell__hd">
                        <label for="" class="weui-label">问题描述：</label>
                    </div>
                    <div class="weui-cell__bd">
                            ${orderBack.remark}
                    </div>
                </div>
                <div class="weui-cell">
                    <c:forEach var="pic" items="${orderPics}">
                        <div class="upload-img">
                            <img id="img5" class="img-box" src="${imgUrl}${pic.img_url}"/>
                        </div>
                    </c:forEach>
                        <%--<div class="upload-img">--%>
                        <%--<img id="img4" class="img-box" src=""/>--%>
                        <%--</div>--%>

                        <%--<div class="upload-img">--%>
                        <%--<img id="img6" class="img-box" src=""/>--%>
                        <%--</div>--%>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label for="" class="weui-label">处理状态：</label>
                    </div>
                    <div class="weui-cell__bd">
                        <c:if test="${bOrder.cancelOrderStatus==1}">
                            待审核
                        </c:if>
                        <c:if test="${bOrder.cancelOrderStatus==2}">
                            已处理
                        </c:if>
                        <c:if test="${bOrder.cancelOrderStatus==3}">
                            审核不通过
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>
<%--<p class="page__desc">退货审核通过后，会在下一笔（或多笔）订单结算退货金额</p>--%>
</body>
<script src="/js/jquery-1.7.2.min.js"></script>
<%--<script src="/js/weui.min.js"></script>--%>
<script>
    $(function () {
        //上传图片
        $(".img-in").change(function () {
            if (this.files && this.files[0]) {
                var objUrl = getObjectURL(this.files[0]);
                if (objUrl) {
                    $(this).siblings(".img-box").attr("src", objUrl);
                    $(this).siblings(".upload-btn").css("display", "none");
                    $(this).siblings(".reset-btn").css("display", "block");
                    $(this).siblings(".reset-btn").click(function () {
                        $(this).siblings(".img-box").attr("src", "");
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

        $("#returnSubmit").click(function () {
            var remark = $("#remark").val();
            if (remark == null || remark.trim() == "") {
                alert("问题描述不能为空");
                return false;
            }
            $("#goodsForm").submit();
        });

    });
</script>
</html>