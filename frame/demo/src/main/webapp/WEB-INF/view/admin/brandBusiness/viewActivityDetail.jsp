<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>添加活动
</div>
<form id="editForm" action="saveActivitySharing">
    <table class="table table-striped table-bordered edit-table">
        <thead>
        <tr>
            <td colspan="2"><b>活动信息</b></td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>活动名称<font color="FF0000">*</font></td>
            <td>
                <input name="activityName" id="activityName" value="${bActivitySharing.activityName}" type="text" style="width: 200px;" nullmsg="请输入活动名称" errorMsg="请输入活动名称长度为4-20位" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <td>活动时间<font color="FF0000">*</font></td>
            <td><input name="beginTm" value="<fmt:formatDate value="${bActivitySharing.beginTm}" pattern="yyyy-MM-dd"/>" type="text" id="beginTm" nullmsg="请输入活动开始时间" errorMsg="密码长度为6-18位" readonly="readonly"/>
                -
                <input name="endTm" value="<fmt:formatDate value="${bActivitySharing.endTm}" pattern="yyyy-MM-dd"/>" type="text" id="endTm" nullmsg="请输入活动结束时间" errorMsg="密码长度为6-18位" readonly="readonly"/>
            </td>
        </tr>

        <tr>
            <td>活动商品<font color="FF0000">*</font></td>
            <td>
                <c:forEach items="${tGoodses}" var="tGoods">
                    <input name="tGoodsIds" type="checkbox" value="${tGoods.id}" checked="checked"/>${tGoods.goodsname}
                </c:forEach>
            </td>
        </tr>
        <tr>
            <td>分享者奖励金额</td>
            <td>
                <input name="shareRewardType" type="radio" value="1" id="shareRewardType"
                       checked="checked"/>现金奖励<br><br>
                <label>奖励金额:</label><input name="shareRewardValue" type="text"
                                           value="${bActivitySharing.shareRewardValue}元" readonly="readonly"/>

                <%--  <select class="select" id="shareRewardValue" name="shareRewardValue" >
                   <option value="" >奖励金额</option>
                  <option value="10"  <c:if test="${tUserBank.banktypeId == aBankType.id}">selected</c:if>>10元</option>
                   <option value="20" >20元</option>
                   <option value="50" >50元</option>
                   <option value="100" >100元</option>
                   <option value="other" >其他</option>--%>
                </select>
            </td>
        </tr>
        <tr>
            <td>被分享者奖励金额</td><td>
                <input name="beSharedRewardType" type="radio" value="1" id="beSharedRewardType" checked="checked"/>现金奖励
                <br><br>
                <label>奖励金额:</label><input name="beSharedRewardValue" type="text"
                                           value="${bActivitySharing.besharedRewardValue}元" readonly="readonly"/>
                <%-- <select class="select" id="beSharedRewardValue" name="beSharedRewardValue">
                   <option value="" >请选择奖励金额</option>
                   <option value="10" >10元</option>
                   <option value="20" >20元</option>
                   <option value="50" >50元</option>
                   <option value="100" >100元</option>
                   <option value="other" >其他</option>
                 </select>--%>
            </td>
        </tr>
        <tr>
            <td>限制还款期数</td>
            <td>
                <select class="select" id="payPeriods" name="payPeriods">
                    <option value="" <c:if test="${bActivitySharing.payPeriods==null}">selected="selected"</c:if>>不限制</option>
                    <option value="1" <c:if test="${bActivitySharing.payPeriods==1}">selected="selected"</c:if>>1期</option>
                    <option value="2" <c:if test="${bActivitySharing.payPeriods==2}">selected="selected"</c:if>>2期</option>
                    <option value="3" <c:if test="${bActivitySharing.payPeriods==3}">selected="selected"</c:if>>3期</option>
                    <option value="4" <c:if test="${bActivitySharing.payPeriods==4}">selected="selected"</c:if>>4期</option>
                    <option value="5" <c:if test="${bActivitySharing.payPeriods==5}">selected="selected"</c:if>>5期</option>
                    <option value="6" <c:if test="${bActivitySharing.payPeriods==6}">selected="selected"</c:if>>6期</option>
                    <option value="7" <c:if test="${bActivitySharing.payPeriods==7}">selected="selected"</c:if>>7期</option>
                    <option value="8" <c:if test="${bActivitySharing.payPeriods==8}">selected="selected"</c:if>>8期</option>
                    <option value="9" <c:if test="${bActivitySharing.payPeriods==9}">selected="selected"</c:if>>9期</option>
                    <option value="10" <c:if test="${bActivitySharing.payPeriods==10}">selected="selected"</c:if>>10期</option>
                    <option value="11" <c:if test="${bActivitySharing.payPeriods==11}">selected="selected"</c:if> >11期</option>
                    <option value="12" <c:if test="${bActivitySharing.payPeriods==12}">selected="selected"</c:if>>12期</option>
                </select>
            </td>
        </tr>


        <tr>
            <td>奖励兑换条件</td>
            <td>
                <select class="select" id="rewardExchangeType" name="rewardExchangeType">
                    <option value="">请选择奖励兑换条件</option>
                    <option value="1" <c:if test="${bActivitySharing.rewardExchangeType==1}">selected</c:if>>
                        限购买特定活动商品可兑换奖励
                    </option>
                    <option value="2" <c:if test="${bActivitySharing.rewardExchangeType==2}">selected</c:if>>
                        购买所有我的品牌产品均可兑换奖励
                    </option>
                </select>
            </td>
        </tr>

        <tr>
            <td>活动类型</td>
            <td>
                <select class="select" id="activityTypeCode" name="activityTypeCode">
                    <c:forEach items="${activityTypes}" var="activityType">
                        <option value="${activityType.activityCode}" <c:if test="${activityType.activityCode == bActivitySharing.activityTypeCode}">selected="selected"</c:if>>${activityType.activityName}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>


        </tbody>
        <tfoot>
        <tr>
            <td colspan="2">
                <input class="btn btn-inverse" id="btnBack" type="button" onclick="goUrl('${goUrl}')" value="返回"/>&nbsp;&nbsp;
                <span id="errorMsg" class="Validform_checktip"></span>
            </td>
        </tr>
        </tfoot>
    </table>
</form>

<script type="text/javascript">

</script>
<!--右边框架结束-->