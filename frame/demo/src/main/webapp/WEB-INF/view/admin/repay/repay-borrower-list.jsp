<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>还款列表
</div>
<form id="searchForm" action="queryTRepayBorrowerList">
    <table class="table table-bordered table-condensed">
        <thead>
        <tr>
            <td colspan="10" class="auto-style2">&nbsp;请填写查询条件
                <input id="curPage" name="curPage" type="hidden" value="1"/>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>订单号</td>
            <td class="detail">
                <input id="order_num" name="order_num" type="text" value="${param.order_num}"/>
            </td>
            <td>用户名</td>
            <td>
                <input id="username" name="username" type="text" value="${param.username}"/>
            </td>
            <%--<td>还款状态</td>
            <td colspan="5">
                <select name="repayStatus" id="repayStatus" class="repayStatusCls">
                    <option value="">--请选择--</option>
                    <option value="1"
                            <c:if test="${param.repayStatus == 1}">selected</c:if> >未还款
                    </option>
                    <option value="2"
                            <c:if test="${param.repayStatus == 2}">selected</c:if> >已还款
                    </option>
                </select>
            </td>--%>
        </tr>
        <tr>
            <td colspan="10" align="right">
                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>&nbsp;
                <input class="btn btn-inverse" onclick="exportForm('exportTRepayBorrowerList')" type="button"
                       value="导出"/>
            </td>
        </tr>
        </tbody>
    </table>
</form>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">订单号</td>
        <td class="auto-style1">用户名</td>
        <td class="auto-style1">还款本金</td>
        <td class="auto-style1">最近一期还款时间</td>
        <%--<td class="auto-style1">实际还款时间</td>--%>
        <%--<td class="auto-style1">还款状态</td>--%>
        <td class="auto-style1">期数</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
            <td><a onclick="orderDetails('${bean.order_num}');" >${bean.order_num } </a></td>
            <td>${bean.realName}</td>
            <td>${bean.orderMoney}</td>
            <td>${bean.realRepayTime}</td>
            <%--<td>${bean.realRepayTime}</td>--%>
            <%--<td>
                <c:choose>
                    <c:when test="${bean.repayStatus==1}">未还款</c:when>
                    <c:when test="${bean.repayStatus==2}">已还款</c:when>
                </c:choose>
            </td>--%>
            <td>
                    ${bean.periodization}
                <%--<c:choose>
                    <c:when test="${bean.numOfPeriods == 0}">
                        首付
                    </c:when>
                    <c:otherwise>
                        ${bean.peroids}
                    </c:otherwise>
                </c:choose>--%>
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
    function orderDetails(id) {
        openWindow("queryOrderBorrowerList?orderId=" + id, "还款详情", 1100, 800);
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