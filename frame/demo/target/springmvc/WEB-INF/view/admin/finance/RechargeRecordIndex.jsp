<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>充值详细
</div>
<div class="detail">
    <table class="table table-striped table-bordered table-condensed">
        <tr>
            <td class="key"><strong>姓名：</strong>
            </td>
            <td>

                ${recharge.realName }
            </td>
            <td class="key"><strong>手机号码：</strong>
            </td>
            <td>${recharge.cellPhone }</td>
        </tr>
        <tr>
            <td class="key"><strong>充值金额：</strong>
            </td>
            <td>${recharge.rechargeAmount }</td>
            <td class="key"><strong>到账金额：</strong>
            </td>
            <td>
                ${recharge.rechargeRealAmount }
            </td>
        </tr>
        <tr>
            <td class="key"><strong>充值费用：</strong>
            </td>
            <td>${recharge.feeAmount }
            </td>
            <td class="key"><strong>充值时间：</strong>
            </td>
            <td>
                <fmt:formatDate value="${recharge.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
        </tr>
        <tr>
            <td class="key"><strong>充值结果：</strong>
            </td>
            <td>
                <c:choose>
                    <c:when test="${recharge.result==0 }">失败</c:when>
                    <c:when test="${recharge.result==1 }">成功</c:when>
                </c:choose>
            </td>
            <td class="key"><strong>充值完成时间：</strong>
            </td>
            <td>
                <fmt:formatDate value="${recharge.finishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
        </tr>

        <tr>
            <td class="key"><strong>订单时间：</strong>
            </td>
            <td>
                <fmt:formatDate value="${recharge.ordDate}" pattern="yyyy-MM-dd"/>
            </td>
            <td class="key"><strong>订单号：</strong>
            </td>
            <td>
                ${recharge.ordId}
            </td>
        </tr>
        <tr>
            <td class="key"><strong>第三方订单号：</strong>
            </td>
            <td>
                ${recharge.thirdOrdId}
            </td>
            <td class="key"><strong>充值银行：</strong>
            </td>
            <td>
                ${recharge.bankName}
            </td>
        </tr>
        <tfoot>
        <tr>
            <td colspan="4"><input class="btn btn-inverse" id="btnBack"
                                   type="button" onclick="goUrl('queryTRechargeList')" value="返回"/></td>
        </tr>
        </tfoot>
    </table>
</div>
<!--右边框架结束-->
