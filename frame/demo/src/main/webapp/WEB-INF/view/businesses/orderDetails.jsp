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
<body class="order-details">
<c:set value="false" var="flag"/>
<div class="weui-toptips weui-toptips_warn">错误提示</div>

<header>
    <a class="back-btn" href="/border/toBUserOrderRecordPage.do"></a>

    <div class="title">订单详情</div>
    <div class="header-right"></div>
</header>

<!--步骤条-->
<div class="steps-bar container">
    <div class="ui-steps-round steps-round-auto steps-4">
        <div class="finished select">
            <div class="wrap">
                <div class="round">1</div>
                <div class="bar"></div>
            </div>
            <label>创建订单</label>
        </div>
        <div class="finished <c:if test='${bOrder.status>=0}'>select</c:if> ">
            <div class="wrap">
                <div class="round">2</div>
                <div class="bar"></div>
            </div>
            <label>待上传凭证</label>
        </div>
        <div class="current <c:if test='${bOrder.status==1||bOrder.status==2 ||bOrder.status==3}'>select</c:if>">
            <div class="wrap">
                <div class="round">3</div>
                <div class="bar"></div>
            </div>
            <label>待审核</label>
        </div>
        <div class="todo last <c:if test='${bOrder.status==3}'>select</c:if>">
            <div class="wrap">
                <div class="round">4</div>
                <div class="bar"></div>
            </div>
            <label>已结算</label>
        </div>
    </div>
</div>
<!--订单信息-->
<div class="page__bd">
    <div class="order-list">
        <div class="weui-form-preview">
            <div class="weui-form-preview__hd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">订单号：${bOrder.order_num}</label>
                    <%--<em class="weui-form-preview__value">${bOrder.order_date}</em>--%>
                </div>
            </div>
            <div class="weui-form-preview__bd">
                <c:set value="0" var="count"/>
                <c:set value="0.00" var="totalMoney"/>
                <c:forEach items="${bOrder.goods}" var="good">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">${good.goodsname}</label>
                        <span class="weui-form-preview__value">￥${good.goodsprice} <br>x ${good.goodsNums}</span>
                    </div>
                    <c:set value="${count + good.goodsNums}" var="count"/>
                    <c:set value="${totalMoney + (good.goodsprice*good.goodsNums)}" var="totalMoney"/>
                </c:forEach>
            </div>
            <div class="weui-form-preview__ft">
                <span class="total-info">共<i>${count}</i>件商品 合计：<strong>¥${totalMoney}</strong></span>
            </div>
        </div>
    </div>
</div>
</div>
<!--分期信息-->
<div class="page__bd stages-info">
    <c:set value="0.00" var="money"/>
    <c:set value="0.00" var="firstMoney"/>
    <c:set value="0" var="totalPeriods"/>

    <c:forEach items="${repays}" var="repay" varStatus="i">
        <c:if test="${i.count==1}">
            <c:set value="${firstMoney + repay.capitalAmount}" var="firstMoney"/>
        </c:if>
        <c:set value="${totalPeriods + 1}" var="totalPeriods"/>
        <c:set value="${money + repay.capitalAmount}" var="money"/>
        <c:if test="${repay.repayStatus==2}">
            <c:set value="true" var="flag"/>
        </c:if>
    </c:forEach>
    <div class="weui-cells__title">分期信息</div>
    <div class="weui-cells">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <p>首付金额</p>
            </div>
            <div class="weui-cell__ft">￥<fmt:formatNumber value="${bOrder.firstMoney}" pattern="0.00"/></div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <p>贷款金额</p>
            </div>
            <div class="weui-cell__ft">￥<fmt:formatNumber value="${bOrder.order_money}" pattern="0.00"/></div>
        </div>

        <div class="weui-cell">
            <div class="weui-cell__bd">
                <p>贷款期数</p>
            </div>
            <div class="weui-cell__ft"><span></span>${firstMoney}X${totalPeriods}期</div>
        </div>
    </div>
</div>
<!--上传凭证-->

<div class="page__bd upload-doc">
    <div class="weui-cells__title">上传凭证</div>
    <div class="weui-cells">
        <div class="upload-img" style="width:45%;">
            <div class="reset-btn"></div>
            <c:if test="${order!=null}">
            <img id="img5" class="img-box" src="http://static.vpfinance.cn${order[0].img_url}"/>
            </c:if>
            <c:if test="${order==null}">
                <img id="img5" class="img-box" src="${order[0].img_url}"/>
            </c:if>
            <c:if test="${bOrder.status==0 && bOrder.cancelOrderStatus!=2}">
                <input type="file" name="picUrls0" class="img-in" id="up_img_0" multiple/>
                <div class="upload-btn"></div>
            </c:if>
            <div class="upload-name">上传消费凭证</div>
        </div>
        <div class="upload-img" style="width:45%;">
            <div class="reset-btn"></div>
            <c:if test="${order!=null}">
            <img id="img5" class="img-box" src="http://static.vpfinance.cn${order[1].img_url}"/>
            </c:if>
            <c:if test="${order==null}">
                <img id="img5" class="img-box" src="${order[1].img_url}"/>
            </c:if>

            <c:if test="${bOrder.status==0 && bOrder.cancelOrderStatus!=2}">
                <input type="file" name="picUrls1" class="img-in" id="up_img_1" multiple/>
                <div class="upload-btn"></div>
            </c:if>
            <div class="upload-name">请上传车牌号为<span style="color: #ef2034">${car_Num}</span><br>的车辆正面照片</div>
        </div>
    </div>
</div>
<c:if test="${bOrder.status>0}">
    <!--商户结算-->
    <div class="page__bd settle">
        <div class="weui-cells__title">商户结算</div>
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>订单状态</p>
                </div>
                <div class="weui-cell__ft">
                    <c:if test="${bOrder.cancelOrderStatus==1}">
                        退款中
                    </c:if>
                    <c:if test="${bOrder.cancelOrderStatus==2}">
                        <c:if test="${bOrder.status<2}">
                            已取消
                        </c:if>
                        <c:if test="${bOrder.status>=2}">
                            已退款
                        </c:if>
                    </c:if>
                    <c:if test="${bOrder.cancelOrderStatus==0}">
                        <c:if test="${bOrder.status==0}">
                            上传凭证
                        </c:if>
                        <c:if test="${bOrder.status==1 }">
                            等待审核
                        </c:if>
                        <c:if test="${bOrder.status==2}">
                            结算中
                        </c:if>
                        <c:if test="${bOrder.status==3}">
                            已结算
                        </c:if>
                        <c:if test="${bOrder.status==4}">
                            已失效
                        </c:if>
                    </c:if>

                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>审核截止时间</p>
                </div>
                <div class="weui-cell__ft">${bOrder.dead_date}</div>
            </div>
        </div>
    </div>
</c:if>


<!--商户结算-->
<div class="page__bd settle">
    <div class="weui-cells__title">售后服务</div>
    <div class="weui-cells">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <c:choose>
                    <c:when test="${bOrder.cancelOrderStatus==2&&bOrder.status>=2}">
                        <a href="javascript:;" class="ui-btn_primary refund-btn">
                            已退款
                        </a>
                    </c:when>
                    <c:when test="${(bOrder.cancelOrderStatus==2&&bOrder.status<2) }">
                        <a href="javascript:;" class="ui-btn_primary refund-btn">
                            已取消
                        </a>
                    </c:when>
                    <c:when test="${ (bOrder.cancelOrderStatus==1)}">
                        <a href="javascript:;" class="ui-btn_primary refund-btn">
                            退款中
                        </a>
                    </c:when>

                    <c:when test="${(empty cancleFlag || cancleFlag) && bOrder.cancelOrderStatus==0}">
                        <a href="javascript:;" class="ui-btn_primary refund-btn" id="cancelOrder">
                            申请退款
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:;" class="ui-btn_primary refund-btn">
                            退款关闭
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

</body>
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/weui.min.js"></script>
<script src="/js/front/ajaxfileupload.js"></script>
<script>
    $(function () {
        var statusIndex = 0;
        //上传图片
        $(".img-in").on('change',function () {
            if (this.files && this.files[0]) {

                var objUrl = getObjectURL(this.files[0]);
                if (objUrl) {
                    $(this).siblings(".img-box").attr("src", objUrl);
                    $(this).siblings(".upload-btn").css("display", "none");
                    $(this).siblings(".reset-btn").css("display", "block");
                    $(this).siblings(".reset-btn").click(function () {
                        $(this).siblings(".img-box").attr("src", "/images/businesses/white.svg");
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
                var dangId= this.id;
                var type;
                if(dangId=="up_img_0"){
                    type=1;
                }
                if(dangId=="up_img_1"){
                    type=2;
                }
                $.ajaxFileUpload({
                    url: '/border/ajaxfileupload?type='+type+'&orderId=' +${bOrder.id},
                    secureuri: false,
                    fileElementId: dangId,//file标签的id
                    dataType: 'json',//返回数据的类型
                    data: {},//一同上传的数据
                    success: function (data) {
                        alert("上传成功");
                        statusIndex++;
                        var orderId = data.backOrderId;
                        if(statusIndex==2){
                            statusIndex=0;
                            var backOrderId = data.backOrderId;
                            window.location.href="/border/toOrderDetailPage?orderId="+backOrderId;
                        }
                    },
                    error: function (data, status, e) {
                        layer.alert(e);
                    }
                });

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

        $("#cancelOrder").click(function () {
            var orderStatus = ${bOrder.status};
            var repayStatus = ${repayStatus};
            if (orderStatus == 3) {
                location.href = "/border/toCancelOrderPage.do?orderId=${bOrder.id}";
            } else if (repayStatus == 2 &&${empty cancelFlag || cancelFlag}) {
                location.href = "/border/toCancelOrderPage.do?orderId=${bOrder.id}";
            } else {
                if (confirm("确定要取消订单吗？")) {
                    $.post(
                            "/border/updateOrderStatus.do",
                            {orderId:${bOrder.id}},
                            function (data) {
                                if (data == "1") {
                                    alert("申请成功！");
                                    location.href = "/border/toOrderDetailPage?orderId=${bOrder.id}";
                                } else if (data == "2") {
                                    location.href = "/border/toCancelOrderPage.do?orderId=${bOrder.id}";
                                } else {
                                    alert("请重试或者联系客服人员");
                                }
                            }
                    );
                }
            }
        });
    });
</script>
</html>