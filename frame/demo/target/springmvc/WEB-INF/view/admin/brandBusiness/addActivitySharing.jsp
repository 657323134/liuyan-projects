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
            <td colspan="10"><b>活动信息</b>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>活动名称<font color="FF0000">*</font>
            </td>
            <td><input name="activityName" id="activityName" value="" type="text" style="width: 200px;"
                       nullmsg="请输入活动名称" errorMsg="请输入活动名称长度为4-20位"/>
            </td>
            <td colspan="10"></td>
        </tr>
        <tr>
            <td>活动时间<font color="FF0000">*</font>
            </td>
            <td><input name="beginTm" value="" type="date" id="beginTm"
                       nullmsg="请输入活动开始时间" errorMsg="密码长度为6-18位"/>
                -
                <input name="endTm" value="" type="date" id="endTm"
                       nullmsg="请输入活动结束时间" errorMsg="密码长度为6-18位"/>
            </td>
            <td colspan="10">
            </td>
        </tr>

        <tr>
            <td>活动商品<font color="FF0000">*</font>
            </td>
            <td>
                <c:forEach items="${tGoodses}" var="tGoods">
                    <input name="tGoodsIds" type="checkbox" value="${tGoods.id}"/>${tGoods.goodsname}
                </c:forEach>
            </td>
            <td colspan="10">
            </td>
        </tr>
        <tr>
            <td>
                分享者奖励金额
            </td>
            <td>
                <input name="shareRewardType" type="radio" value="1" id="shareRewardType"
                       checked="checked"/>现金奖励<br><br>
                <select class="select" id="shareRewardValue" name="shareRewardValue" onchange="changeShareRewardType()">
                    <option value="">请选择奖励金额</option>
                    <option value="10">10元</option>
                    <option value="20">20元</option>
                    <option value="50">50元</option>
                    <option value="100">100元</option>
                    <option value="other">其他</option>
                </select>
                <input name="inputReward_1" id="inputReward_1" value="" type="NUMBER" style="display: none" nullmsg="请输入分享者奖励金额"/>
            </td>
        </tr>
        <tr>
            <td>被分享者奖励金额</td>
            <td>
                <input name="beSharedRewardType" type="radio" value="1" id="beSharedRewardType" checked="checked"/>现金奖励
                <br><br>
                <select class="select" id="beSharedRewardValue" name="beSharedRewardValue" onchange="changeBeSharedRewardType()">
                    <option value="">请选择奖励金额</option>
                    <option value="10">10元</option>
                    <option value="20">20元</option>
                    <option value="50">50元</option>
                    <option value="100">100元</option>
                    <option value="other">其他</option>
                </select>
                <input name="inputReward_2" id="inputReward_2" value="" type="NUMBER" style="display: none" nullmsg="请输入被分享者奖励金额"/>
            </td>
            <td colspan="10">
            </td>
        </tr>
        <tr>
            <td>奖励兑换条件</td>
            <td>
                <select class="select" id="rewardExchangeType" name="rewardExchangeType">
                    <option value="">请选择奖励兑换条件</option>
                    <option value="1">限购买特定活动商品可兑换奖励</option>
                    <option value="2">购买所有我的品牌产品均可兑换奖励</option>
                </select>
            </td>
            <td colspan="10">
            </td>
        </tr>
        <tr>
            <td>限制还款期数</td>
            <td>
                <select class="select" id="payPeriods" name="payPeriods">
                    <option value="">不限制</option>
                    <option value="1">1期</option>
                    <option value="2">2期</option>
                    <option value="3">3期</option>
                    <option value="4">4期</option>
                    <option value="5">5期</option>
                    <option value="6">6期</option>
                    <option value="7">7期</option>
                    <option value="8">8期</option>
                    <option value="9">9期</option>
                    <option value="10">10期</option>
                    <option value="11">11期</option>
                    <option value="12">12期</option>
                </select>
            </td>
            <td colspan="10">
            </td>
        </tr>


        <tr>
            <td>活动类型</td>
            <td>
                <select class="select" id="activityTypeCode" name="activityTypeCode">
                    <c:forEach items="${activityTypes}" var="activityType">
                        <option value="${activityType.activityCode}">${activityType.activityName}</option>
                    </c:forEach>
                </select>
            </td>
            <td colspan="10">
            </td>
        </tr>

        </tbody>
        <tfoot>
        <tr>
            <td colspan="6"><input class="btn btn-inverse" id="btnSave"
                                   type="button" value="创建" onclick="saveActivity()"/>&nbsp;<input id="btnReset"
                                                                                                   class="btn btn-inverse"
                                                                                                   type="reset"
                                                                                                   value="重置"/>&nbsp;<input
                    class="btn btn-inverse" id="btnBack" type="button"
                    onclick="goUrl('${goUrl}')" value="返回"/>&nbsp;&nbsp;<span
                    id="errorMsg" class="Validform_checktip"> </span></td>
        </tr>
        </tfoot>
    </table>
</form>

<script type="text/javascript">
    <!--
    //  var valiForm = $("#editForm").Validform({
    //    btnSubmit : "#btnSave",
    //    tiptype : function(msg, o, cssctl) {
    //      var objtip = $("#errorMsg");
    //      cssctl(objtip, o.type);
    //      objtip.text(msg);
    //    },
    //    postonce : true,
    //    ajaxPost : true,
    //    callback : function(data) {
    //      if (data.status == 'y') {
    //        //valiForm.resetForm();
    //        goUrl('marketActivityList')
    //      }
    //    }
    //  });
    //  $.Tipmsg.r = "";
    //-->

    function saveActivity() {
        var activityName = $("#activityName").val();
        var beginTm = $("#beginTm").val();
        var endTm = $("#endTm").val();
        var shareRewardType = $("#shareRewardType").val();
        var shareRewardValue = $("#shareRewardValue").val();
        var besharedRewardType = $("#beSharedRewardType").val();
        var besharedRewardValue = $("#beSharedRewardValue").val();
        var rewardExchangeType = $("#rewardExchangeType").val();
        var activityTypeCode = $("#activityTypeCode").val();
        var payPeriods = $("#payPeriods").val();
        if(payPeriods == ''){
            payPeriods = null;
        }
        if(shareRewardValue == 'other'){
            shareRewardValue = $("#inputReward_1").val();
        }

        if(besharedRewardValue == 'other'){
            besharedRewardValue = $("#inputReward_2").val();
        }

        if(shareRewardValue == null || shareRewardValue== ''){
            alert("请输入分享者奖励金额");
            return false;
        }

        if(besharedRewardValue == null || besharedRewardValue== ''){
            alert("请输入被分享者奖励金额");
            return false;
        }
        var arrchecked = document.getElementsByName('tGoodsIds');
        var tgoodsids = '';
        for (var i = 0; i < arrchecked.length; i++) {
            if (arrchecked[i].checked) {
                tgoodsids += arrchecked[i].value + ',';
            }
        }
        $.ajax({
            type: 'post',
            url: 'saveActivitySharing',
            data: {
                activityName: activityName,
                beginTm: beginTm,
                endTm: endTm,
                shareRewardType: shareRewardType,
                shareRewardValue: shareRewardValue,
                besharedRewardType: besharedRewardType,
                besharedRewardValue: besharedRewardValue,
                rewardExchangeType: rewardExchangeType,
                goodsId: tgoodsids,
                activityTypeCode:activityTypeCode,
                payPeriods:payPeriods
            },
            success: function (msg) {
                if (msg.status == 'y') {
                    goUrl('marketActivityList')
                } else {
                    alert("错误信息:" + msg.info);
                }
            }
        });
    }

    function changeShareRewardType(){
        var shareRewardValue = $("#shareRewardValue").val();
        if(shareRewardValue == 'other'){
            $("#inputReward_1").show();
        }else{
            $("#inputReward_1").hide();
        }

    }


    function changeBeSharedRewardType(){
        var shareRewardValue = $("#beSharedRewardValue").val();
        if(shareRewardValue == 'other'){
            $("#inputReward_2").show();
        }else{
            $("#inputReward_2").hide();
        }

    }

</script>
<!--右边框架结束-->