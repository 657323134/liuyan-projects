<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>提现列表
</div>
<form id="searchForm" action="queryBUserBusinessWithdrawList">
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
            <td>用户名</td>
            <td class="detail">
                <input id="bUserName" class="dinp" name="bUserName" type="text"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>&nbsp;
                <input class="btn btn-inverse" onclick="goUrl('businessUserWithdrawIndex')" type="button" value="申请提现"/>&nbsp;
            </td>
        </tr>
        </tbody>
    </table>
</form>

<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">编号</td>
        <td class="auto-style1">提现申请人</td>
        <td class="auto-style1">申请提现数目</td>
        <td class="auto-style1">手续费</td>
        <td class="auto-style1">可用余额</td>
        <td class="auto-style1">审核状态</td>
        <td class="auto-style1">审核结果</td>
        <td class="auto-style1">申请时间</td>
        <td class="auto-style1">审核时间</td>
        <td class="auto-style1">支付结果</td>
        <td class="auto-style1">审核人</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
            <td>${bean.id}</td>
            <td>${bean.bUserName}</td>
            <td>${bean.applyNum}</td>
            <td>${bean.fee}</td>
            <td>${bean.realApplyNum}</td>
            <td>
                <c:choose>
                    <c:when test="${bean.status==0 }"><font color='red'>未审核</font></c:when>
                    <c:when test="${bean.status==1 }"><font color='green'>已审核</font></c:when>
                    <c:otherwise>未知</c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${bean.result==0 }"><font color='red'>不通过</font></c:when>
                    <c:when test="${bean.result==1 }"><font color='green'>通过</font></c:when>
                    <c:when test="${bean.result==2 }"><font color='blue'>提现中</font></c:when>
                    <c:when test="${bean.result==3 }"><font color='#2f4f4f'>已提现</font></c:when>
                    <c:otherwise>未知</c:otherwise>
                </c:choose>
            </td>
            <td>${bean.applyTime}</td>
            <td>${bean.answerTime}</td>
            <td>
                <c:choose>
                    <c:when test="${bean.cashPay==0 }"><font color='red'>未支付</font></c:when>
                    <c:when test="${bean.cashPay==1 }"><font color='green'>已支付</font></c:when>
                    <c:otherwise>未知</c:otherwise>
                </c:choose>
            </td>
            <td>${bean.auditor}</td>
        </tr>
    </c:forEach>
    <tr class="tr_pagenumber">
        <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit }"
                                    totalCount="${page.totalCount }"/></td>
    </tr>
    </tbody>
</table>
<script type="text/javascript">
</script>
<!--右边框架结束-->