<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>退款申请
</div>
<form id="searchForm" action="tkSettlement">
    <table class="table table-striped table-bordered search-table">
        <thead>
        <tr>
            <td colspan="10" class="auto-style2">&nbsp;请填写查询条件
                <input id="curPage" name="curPage" type="hidden" value="1"/>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>门店：</td>
            <td class="detail">
                <input id="orderNum" class="dinp" name="orderNum" type="text" value="${model.orderNum }"/>
            </td>
            <td>办单员姓名：</td>
            <td>
                <input id="bUserName" name="bUserName" class="dinp" type="text" value="${model.bUserName}"/>
            </td>
            <td>客户姓名：</td>
            <td>
                <input id="userPhone" name="userPhone" class="dinp" type="text" value="${model.userRealName}"/>
            </td>
            <td>贷款合同编号:</td>
            <td>
                <input id="userRealName" name="userRealName" class="dinp" type="text" value="${model.loanProtocalNo}"/>
            </td>
        </tr>
        <tr>
            <td colspan="10" align="right">
                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>
            </td>
        </tr>
        </tbody>
    </table>
</form>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">序号</td>
        <td class="auto-style1">订单号</td>
        <td class="auto-style1">订单日期</td>
        <td class="auto-style1">门店名称</td>
        <td class="auto-style1">办单员姓名</td>
        <td class="auto-style1">客户姓名</td>
        <td class="auto-style1">客户手机号</td>
        <td class="auto-style1">订单金额</td>
        <td class="auto-style1">首付款</td>
        <td class="auto-style1">贷款金额</td>
        <td class="auto-style1">贷款期数</td>
        <td class="auto-style1">订单状态</td>
        <td class="auto-style1">操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <c:set var="datacount"
               value="${datacount+1}"/>
        <tr>
            <td>${datacount}</td>
            <td>${bean.order_num}</td>
            <td><fmt:formatDate value="${bean.order_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${bean.facilitatorName}</td>
            <td>${bean.bname}</td>
            <td>${bean.realName}</td>
            <td>${bean.cellphone}</td>
            <td>${bean.order_money}</td>
            <td><fmt:formatNumber value="${bean.firstMoney}"/></td>
            <td><fmt:formatNumber value="${bean.order_money - bean.firstMoney}"/></td>
            <td>${bean.periodization}</td>
            <td>
                <c:choose>
                    <c:when test="${bean.cancel_order_status==1}">
                        退款中
                    </c:when>
                    <c:when test="${bean.cancel_order_status==2}">
                        退款成功
                    </c:when>
                    <c:when test="${bean.cancel_order_status==3}">
                        退款失败
                    </c:when>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${bean.cancel_order_status==1}">
                        <input class="btn btn-inverse" type="button" value="结算"
                               onclick="goCheck('settlementCancelOrderStatus','${bean.id}','2','${bean.status}');"/>&nbsp;
                        <input class="btn btn-inverse" type="button" value="不通过"
                               onclick="goCheck('settlementCancelOrderStatus','${bean.id}','3','${bean.status}');"/>&nbsp;
                    </c:when>
                    <%-- <c:when test="${bean.cancel_order_status==2}">
                       <input class="btn btn-inverse" type="button" value="查看" />&nbsp;
                     </c:when>
                     <c:when test="${bean.cancel_order_status==3}">
                       <input class="btn btn-inverse" type="button" value="查看" />&nbsp;
                     </c:when>--%>
                </c:choose>

            </td>
        </tr>
    </c:forEach>
    <tr class="tr_pagenumber">
        <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit }"
                                    totalCount="${page.totalCount }"/></td>
    </tr>
    </tbody>
</table>
<script type="text/javascript">


    function goCheck(url, id, cancelStatus, status) {

        $.ajax({
            type: 'post',
            url: url,
            data: {
                orderId: id,
                status: status,
                cancelStatus: cancelStatus
            },
            success: function (msg) {
                if (msg.status == 1) {
                    var params = $("#searchForm").serialize();
                    goUrl("tkSettlement?" + params);
                    //$("#mainContent").html($("#searchForm").submit());
                } else {
                    layer.alert(msg.info);
                }
            }
        });

    }


    function openWindow(url, name, iWidth, iHeight) {
        var url;                                 //转向网页的地址;
        var name;                           //网页名称，可为空;
        var iWidth;                          //弹出窗口的宽度;
        var iHeight;                        //弹出窗口的高度;
        var iTop = (window.screen.availHeight - 30 - iHeight) / 2;       //获得窗口的垂直位置;
        var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;           //获得窗口的水平位置;
        window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
    }
</script>
<!--右边框架结束-->