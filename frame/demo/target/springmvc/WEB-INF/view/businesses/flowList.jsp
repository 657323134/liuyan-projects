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
<body class="flow-list">
<div class="weui-toptips weui-toptips_warn">错误提示</div>

<header>
    <a class="back-btn" href="/buser/myIncome.do"></a>

    <div class="title">资金流水</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="weui-cells" id="content">
        <%--<c:forEach var="bean" items="${pageBean}">--%>
        <%--<a href="/baccountinfo/toAccountInfoDetail.do?flowId=${bean.id}">--%>
        <%--<div class="weui-cell">--%>
        <%--<div class="weui-cell__bd">--%>
        <%--<p>${bean.explan}<br><span>${bean.time}</span></p>--%>
        <%--</div>--%>
        <%--<div class="weui-cell__ft">--%>

        <%--<c:if test="${bean.income>0}">--%>
        <%--+ ${bean.income}--%>
        <%--</c:if>--%>
        <%--<c:if test="${bean.expenditure>0}">--%>
        <%--- ${bean.expenditure}--%>
        <%--</c:if>--%>
        <%--<br><span >余额 ${bean.money}元</span>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</a>--%>
        <%--</c:forEach>--%>
    </div>
</div>

</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script>
    var page = 1;
    var totalPage = 0;
    $(function () {
        loadFlowList(page);
    });

    function loadFlowList(page) {
        if (totalPage != 0 && page > totalPage) {
            return false;
        }
        //获取产品列表
        $.ajax({
            type: 'post',
            url: '/baccountinfo/toAccountInfoPageData.do',
            data: {
                start: page,
            },
            success: function (data) {
                if (data) {
                    var list = data.pageBean;
                    var html = "";
                    totalPage = data.page.totalPages;
                    for (var i = 0; i < list.length; i++) {
                        html += '<a class="a-item" href="/baccountinfo/toAccountInfoDetail.do?flowId=' + list[i].id + '">';
                        html += ' <div class="weui-cell">';
                        html += '<div class="weui-cell__bd">';
                        html += ' <p>' + list[i].explan + '<br><span>' + list[i].time + '</span></p>';
                        html += '</div>';
                        html += '<div class="weui-cell__ft">';
                        if (list[i].income > 0) {
                            html += '+ ' + list[i].income.toFixed(3).substring(0, list[i].income.toFixed(3).indexOf('.') + 3);
                        } else {
                            html += '- ' + list[i].expenditure.toFixed(3).substring(0, list[i].expenditure.toFixed(3).indexOf('.') + 3);
                        }
                        html += ' <br><span >余额 ' + list[i].money.toFixed(3).substring(0, list[i].money.toFixed(3).indexOf('.') + 3) + '元</span>';
                        html += '</div>';
                        html += '</div>';
                        html += '</a>';
                    }
                    $("#content").append(html);
                }

                //返回数据
            }
        });
    }

    $(window).scroll(function () {
        if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
            page++;
            loadFlowList(page);
        }
    });
</script>
</html>