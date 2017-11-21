<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>修改品牌商
</div>
<form id="editForm" action="addBrandUser">
    <input type="hidden" value="${bUserModel.id}" name="id"/>
    <input type="hidden" value="${bUserModel.parent_id}" name="parent_id"/>
    <input type="hidden" value="${bUserModel.create_time}" name="create_time"/>
    <input type="hidden" value="${bUserModel.update_time}" name="update_time"/>
    <input type="hidden" value="${bUserModel.isDeleted}" name="isDeleted"/>
    <input type="hidden" value="${bUserModel.percentage}" name="percentage"/>
    <input type="hidden" value="${bUserModel.userType}" name="userType"/>
    <input type="hidden" value="${agentInfo.status}" name="status"/>
    <input type="hidden" value="${agentInfo.begin_tm}" name="begin_tm"/>
    <input type="hidden" value="${agentInfo.end_tm}" name="end_tm"/>
    <input type="hidden" value="${agentInfo.insert_tm}" name="insert_tm"/>
    <input type="hidden" value="${agentInfo.update_tm}" name="update_tm"/>
    <input type="hidden" value="${agentInfo.user_type}" name="user_type"/>
    <input type="hidden" value="${bUserModel.password}" name="password"/>
    <table class="table table-striped table-bordered edit-table">
        <thead>
        <tr>
            <td colspan="8"><b>基本信息</b></td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>代理商名<font color="FF0000">*</font></td>
            <td>
                <input name="name" value="${bUserModel.name}" type="text" nullmsg="请输入代理姓名" errorMsg="商户姓名长度为4-20位"/>
            </td>
            <td>手机号<font color="FF0000">*</font></td>
            <td>
                <input name="phone" value="${bUserModel.phone}" type="text" datatype="s4-20" nullmsg="请输入手机号" errorMsg="手机号长度为11位"/>
            </td>
            <td>是否可用<font color="FF0000">*</font></td>
            <td>
                <select name="isEnable">
                    <option value="0">是</option>
                    <option value="1">否</option>
                </select>
            </td>
            <td colspan="2"></td>
        </tr>

        <tr>
            <td>法人姓名<font color="FF0000">*</font></td>
            <td>
                <input name="corporateName" value="${agentInfo.corporate_name}" type="text" datatype="s2-10" nullmsg="请输入法人姓名" errorMsg="请输入法人姓名"/>
            </td>
            <td>法人身份证号<font color="FF0000">*</font></td>
            <td>
                <input name="corporateCardid" value="${agentInfo.corporate_cardid}" type="text" datatype="s1-20" nullmsg="请输入法人身份证号" errorMsg="请输入法人身份证号"/>
            </td>
            <td>法人手机号<font color="FF0000">*</font></td>
            <td>
                <input name="corporatePhone" value="${agentInfo.corporate_phone}" type="text" datatype="s1-20" nullmsg="请输入法人手机号" errorMsg="请输入法人手机号"/>
            </td>
            <td>营业执照号<font color="FF0000">*</font></td>
            <td>
                <input name="licenseNo" value="${agentInfo.license_no}" type="text" nullmsg="请输入营业执照号" datatype="s1-20"/>
            </td>
        </tr>

        <tr>
            <td>服务费(%)<font color="FF0000">*</font></td>
            <td>
                <input name="serviceFeePercentage" value="${bUserModel.serviceFeePercentage}" type="number" nullmsg="请输入品牌商服务费比例" errorMsg="请输入品牌商服务费比例" />
            </td>

            <td>流水分成比例(%)<font color="FF0000">*</font></td>
            <td>
                <input name="percentage" value="${bUserModel.percentage}" type="number" datatype="s1-4" nullmsg="请输入代理商默认分成比例" errorMsg="代理商默认分成比例错误"/>
            </td>

            <td>结算时间（天）<font color="FF0000">*</font></td>
            <td>
                <input name="settlementPeriod" value="${bUserModel.settlementPeriod}" type="number" nullmsg="请输入结算时间" errorMsg="输入结算时间错误" datatype="s1-3"/>
            </td>
            <td colspan="2"></td>
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
                <input class="btn btn-inverse" id="btnBack" type="button" onclick="goUrl('queryBrandUserList')" value="返回"/>&nbsp;&nbsp;                  <span id="errorMsg" class="Validform_checktip"> </span>
            </td>
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
        callback: function (data) {
            alert(data.info);
            if (data.status == 'y') {
                goUrl("queryBrandUserList");
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