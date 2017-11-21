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
<body class="index">
<!--用户信息-->
<div class="tip">
    <span class="close-btn"></span>

    <p>温馨提示：请各商户操作人员协助客户填写整齐清晰正楷签名，否则将视为无效订单，不予结算。</p>
</div>

<section id="headerMain">
    <a class="setting" href="/buser/toBUserSettingPage.do">
        <img src="/images/businesses/setting.svg"/>
    </a>
    <a class="message" href="">
        <img src="/images/businesses/message.svg"/>
    </a>
    <!--<img id="headerMain_bk" src="images/businesses/bk.png">-->
    <div id="headerMain_portrait">
        <img src="/images/businesses/1.png">
        <!--<img src="images/businesses/24.png">-->
        <span id="tagMark">
            <c:if test="${buser.userType==1}">店主</c:if>
             <c:if test="${buser.userType==2}">员工</c:if>
        </span>
    </div>
    <p id="buserName">${buser.name}</p>

    <p id="storeName"><span></span>${cFacilitator.facilitator_name}</p>
    <!--<span id="alertTagMark">个性标签</span>-->

    <!--订单信息-->
    <div class="weui-flex user-data">
        <div class="weui-flex__item">
            <div class="placeholder">
                <a href="/border/toBUserOrderRecordPage.do?timeType=1">
                    <h3>${empty page.totalCount?0:page.totalCount}</h3>

                    <p>本月订单</p>
                </a>
            </div>
        </div>
        <div class="weui-flex__item">
            <div class="placeholder">
                <a href="/buser/myIncome.do">
                    <c:if test="${buser.userType==1}">
                        <h3>${myAccount}</h3>

                        <p>我的收入</p>
                    </c:if>
                </a>
                <a href="/border/toBUserOrderRecordPage.do?timeType=2">
                    <c:if test="${buser.userType==2}">
                        <h3>${empty orderCountToday?0:orderCountToday}</h3>

                        <p>今日订单</p>
                    </c:if>
                </a>
            </div>
        </div>
    </div>
</section>

<div class="weui-flex user-operation">
    <div class="weui-flex__item">
        <a href="/border/toBUserAddOrderPage.do">
        <%--<a href="/borderoptimize/toBUserAddOrderPage.do">--%>
            <div class="placeholder">
                <img src="/images/businesses/shop.svg">

                <p>添加订单</p>
            </div>
        </a>
    </div>
    <div class="weui-flex__item">
        <a href="/border/toBUserOrderRecordPage.do">
            <div class="placeholder">
                <img src="/images/businesses/zheng.svg">

                <p>上传消费凭证</p>
            </div>
        </a>
    </div>

    <div class="weui-flex__item">
        <div class="placeholder">
            <img src="/images/businesses/book.svg">

            <p>店铺学堂</p>
        </div>
    </div>
</div>
<div class="weui-loadmore weui-loadmore_line last-order-title">
    <span class="weui-loadmore__tips">最近订单</span>
</div>
<c:forEach items="${pageBean}" var="bean" varStatus="st">
    <div class="page__bd order-list">
        <div class="weui-form-preview">
            <div class="weui-form-preview__hd">
                <a href="/border/toOrderDetailPage?orderId=${bean.id}">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">订单号：${bean.order_num}</label>
                        <%--<em class="weui-form-preview__value">${bean.order_date}</em>--%>
                    </div>
                </a>
            </div>

            <div class="weui-form-preview__bd">
                <c:set value="0" var="count"/>
                <c:set value="0.00" var="totalMoney"/>
                <c:forEach items="${bean.goods}" var="good">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">${good.goodsname}</label>
                        <span class="weui-form-preview__value">￥${good.goodsprice} <br>x ${good.goodsNums}</span>
                    </div>
                    <c:set value="${count + good.goodsNums}" var="count"/>
                    <c:set value="${totalMoney + (good.goodsprice*good.goodsNums)}" var="totalMoney"/>
                </c:forEach>
            </div>
            <div class="weui-form-preview__ft">
                    <%--<c:if test="${bean.status==0}">--%>
                    <%--<a href="/border/toOrderDetailPage?orderId=${bean.id}" class="weui-btn weui-btn_mini weui-btn_default">上传凭证</a>--%>
                    <%--</c:if>--%>
                <c:if test="${bean.cancelOrderStatus==1}">
                    <a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: gainsboro;">退款中</a>
                </c:if>
                <c:if test="${bean.cancelOrderStatus==2}">
                    <c:if test="${bean.status<2}">
                        <a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: gainsboro;">已取消</a>
                    </c:if>
                    <c:if test="${bean.status>=2}">
                        <a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: gainsboro;">已退款</a>
                    </c:if>
                </c:if>
                <c:if test="${bean.cancelOrderStatus==0}">
                    <c:if test="${bean.status==0}">
                        <a href="/border/toOrderDetailPage?orderId=${bean.id}"
                           class="weui-btn weui-btn_mini weui-btn_default">上传凭证</a>
                    </c:if>
                    <c:if test="${bean.status==1}">
                        <a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: red;">审核中</a>
                    </c:if>
                    <c:if test="${bean.status==2}">
                        <a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: red;">结算中</a>
                    </c:if>
                    <c:if test="${bean.status==3}">
                        <a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: gainsboro;">已结算</a>
                    </c:if>
                    <c:if test="${bean.status==4}">
                        <a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: gainsboro;">已失效</a>
                    </c:if>
                </c:if>


                    <%--<c:if test="${bean.status==1}">--%>
                    <%--<a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: red;">审核中</a>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${bean.status==2}">--%>
                    <%--<a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: red;">结算中</a>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${bean.status==3}">--%>
                    <%--<a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: gainsboro;">已结算</a>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${bean.status==4}">--%>
                    <%--<a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: gainsboro;">已失效</a>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${bean.status==6}">--%>
                    <%--<a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: gainsboro;">退款中</a>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${bean.status==7}">--%>
                    <%--<c:if test="${bean.cancelOrderStatus==0}">--%>
                    <%--<a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: gainsboro;">已取消</a>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${bean.cancelOrderStatus>0}">--%>
                    <%--<a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: gainsboro;">已退款</a>--%>
                    <%--</c:if>--%>

                    <%--</c:if>--%>
                    <%--<a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_default">上传凭证</a>--%>
                    <%--<a href="javascript:;" class="weui-btn_mini weui-btn_default" style="color: gainsboro;">审核中</a>--%>
                <!--<a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:"></a>-->
                <span class="total-info">共<i>${count}</i>件商品 合计：<strong>¥${totalMoney}</strong></span>
            </div>
        </div>
    </div>
</c:forEach>
<a class="all-order" href="/border/toBUserOrderRecordPage.do">查看所有订单</a>

<script>
    var close = document.querySelectorAll('.close-btn')[0];
    close.addEventListener('click', function () {
        document.querySelectorAll('.tip')[0].style.display = 'none';
    })
</script>
</body>
</html>