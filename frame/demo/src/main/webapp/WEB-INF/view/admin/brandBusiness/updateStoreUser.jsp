<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>修改门店
</div>
<form id="editForm" action="saveBrandStore">
    <input type="hidden" value="${brandId}" name="brandId"/>
    <table class="table table-striped table-bordered edit-table">
        <tbody>
        <tr>
            <td colspan="8"><b>门店信息</b>
            </td>
        <tr>
            <td>门店名称<font color="FF0000">*</font></td>
            <td>
                <input name="facilitator_name" value="${cFacilitator.facilitator_name}" type="text" nullmsg="请输入门店名称"/>
            </td>
            <td>门店地址<font color="FF0000">*</font></td>
            <td>
                <input name="facilitator_address" value="${cFacilitator.facilitator_address}" type="text" nullmsg="请输入门店地址"/>
            </td>
            <td>门店联系人<font color="FF0000">*</font></td>
            <td>
                <input name="failitator_contacts" value="${cFacilitator.failitator_contacts}" type="text" nullmsg="请输入门店联系人"/>
            </td>

            <td>门店电话<font color="FF0000">*</font></td>
            <td>
                <input name="failitator_phone" value="${cFacilitator.failitator_phone}" type="text" nullmsg="请输入门店电话"/>
            </td>
        </tr>
        <tr>
            <td colspan="8"><b>银行卡信息</b></td>
        </tr>
        <tr>
            <td>银行卡账户类型<font color="FF0000"></font>
            </td>
            <td>
                <select class="select" id="accountType" name="bankAccountType">
                    <option value="0">请选择</option>
                    <option value="private">个人账号</option>
                    <option value="public">企业账号</option>
                </select>
            </td>
            <td colspan="10">
            </td>
        </tr>
        <tr>
            <td>银行类型</td>
            <td>
                <select class="select" id="banktypeId" name="banktypeId">
                    <option value="0">请选择</option>
                    <c:forEach var="aBankType" items="${tBankType}">
                        <option value="${aBankType.id}"
                                <c:if test="${tUserBank.banktypeId == aBankType.id}">selected</c:if>>${aBankType.name}</option>
                    </c:forEach>
                </select>
            </td>
            <td>支行</td>
            <td>
                <input name="branch" value="${tUserBank.branch}" type="text" nullmsg="请准确输入银行支行信息"/>
            </td>
            <td>银行账号</td>
            <td>
                <input name="bankAccount" value="${tUserBank.bankAccount}" type="text" nullmsg="请输入银行账号"/>
            </td>

            <td>银行账号名</td>
            <td>
                <input name="accountName" value="${tUserBank.accountName}" type="text" nullmsg="请输入银行账号名"/>
            </td>
        </tr>
        <tr>
            <td>省</td>
            <td>
                <select class="select" id="province" name="province">
                    <option value="0">请选择</option>
                    <c:forEach var="provinceMap" items="${provinces}">
                        <c:set var="key" value="${provinceMap.key}"></c:set>
                        <c:set var="province" value="${provinceMap.value}"></c:set>
                        <option value="${province.id}"
                                <c:if test="${tUserBank.province == province.id}">selected</c:if>>${province.regionName}</option>
                    </c:forEach>
                </select>
            </td>
            <td>市</td>
            <td>
                <select class="select" id="city" name="city">
                    <c:forEach var="cityInfo" items="${citys}">
                        <option value="${cityInfo.id}"
                                <c:if test="${tUserBank.city == cityInfo.id}">selected</c:if>>${cityInfo.regionName}</option>
                    </c:forEach>
                </select>
            </td>
            <td colspan="4"></td>
        </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="8">
                    <input class="btn btn-inverse" id="btnSave" type="button" value="保存"/>&nbsp;
                    <input id="btnReset" class="btn btn-inverse" type="reset" value="重置"/>&nbsp;
                    <input class="btn btn-inverse" id="btnBack" type="button" onclick="goUrl('${goUrl}')" value="返回"/>&nbsp;&nbsp;
                    <span id="errorMsg" class="Validform_checktip"> </span>
                </td>
                <input type="hidden" id="goBack" value="${goUrl}"/>
            </tr>
        </tfoot>
    </table>
</form>

<script type="text/javascript">
    <!--
    var valiForm = $("#editForm").Validform({
        btnSubmit: "#btnSave",
        tiptype: function (msg, o, cssctl) {
            var objtip = $("#errorMsg");
            cssctl(objtip, o.type);
            objtip.text(msg);
        },
        postonce: true,
        ajaxPost: true,
        beforeCheck:function(curform){
            var accountTypeVal = $("#accountType").val();
            if (accountTypeVal == "0") {
                alert("请选择银行卡账户类型");
                return false;
            }
        },
        callback: function (data) {
            alert(data.info);
            if (data.status == 'y') {
                goUrl($("#goBack").val());
            }
        }
    });
    $.Tipmsg.r = "";

    $("#province").change(function () {
        $.ajax({
            url: "getCityList",
            data: {
                provinceId: $(this).val()
            }
        }).success(function (data) {
            if (data.length > 1) {
                $("#city").css("display", "");
                $("#city").empty();
                for (var i = 0; i < data.length; i++) {
                    $("#city").append("<option value='" + data[i].id + "'>" + data[i].regionName + "</option>");
                }
            } else {
                $("#city").css("display", "");
            }
        });
    });

    //-->
</script>
<!--右边框架结束-->