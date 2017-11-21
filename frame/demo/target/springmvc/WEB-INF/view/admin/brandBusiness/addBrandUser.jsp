<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>添加品牌商
</div>
<form id="editForm" action="addBrandUser">
    <table class="table table-striped table-bordered edit-table">
        <thead>
        <tr>
            <td colspan="10"><b>基本信息</b>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>品牌商账户名<font color="FF0000">*</font>
            </td>
            <td><input name="name" value="" type="text"
                       nullmsg="请输入代理姓名" errorMsg="商户姓名长度为4-20位"/>
            </td>
            <td>手机号<font color="FF0000">*</font>
            </td>
            <td><input name="phone" value="" type="text"
                       datatype="s4-20" nullmsg="请输入手机号" errorMsg="手机号长度为11位"/>
            </td>
            <td>是否可用<font color="FF0000">*</font>
            </td>
            <td><select name="isEnable">
                <option value="0">是</option>
                <option value="1">否</option>
            </select>
            </td>
            <td colspan="10"></td>
        </tr>
        <tr>
            <td>密 码<font color="FF0000">*</font>
            </td>
            <td><input name="password" value="" type="password" datatype="*6-18"
                       nullmsg="请输入密码" errorMsg="密码长度为6-18位"/>
            </td>
            <td>确认密码<font color="FF0000">*</font>
            </td>
            <td><input name="confirmPwd" value="" type="password"
                       datatype="*" recheck="password" nullmsg="请输入确认密码" errorMsg="两次输入的密码不一致"/>
            </td>
            <td>服务费(%)<font color="FF0000">*</font>
            </td>
            <td><input name="serviceFeePercentage" value="" type="number" min="0"
                       nullmsg="请输入品牌商服务费比例" errorMsg="请输入品牌商服务费比例" datatype="s1-3"/>&nbsp;&nbsp;&nbsp;<span style="color: red">%</span>

            </td>
            <td>流水分成比例(%)<font color="FF0000">*</font>
            </td>
            <td><input name="percentage" value="" type="number" min="0"
                       nullmsg="请输入品牌商默认分成比例" errorMsg="品牌商默认分成比例错误" datatype="s1-3"/>&nbsp;&nbsp;&nbsp;<span style="color: red">%</span>

            </td>
            <td colspan="10">
            </td>
        </tr>
        <tr>
            <td>结算时间（天）<font color="FF0000">*</font>
            </td>
            <td><input name="settlementPeriod" value="" type="number" min="1"
                       nullmsg="请输入结算时间" errorMsg="输入结算时间错误" datatype="s1-3"/>&nbsp;&nbsp;&nbsp;<span style="color:red">天</span>

            </td>
            <td colspan="10">
            </td>
        </tr>
        <tr>
            <td>银行卡账户类型<font color="FF0000"></font>
            </td>
            <td>
                <select class="select" id="accountType" name="bankAccountType" datatype="*" nullmsg="请选择！" errormsg="请选择！" >
                    <option value="0">请选择</option>
                    <option value="private">个人账号</option>
                    <option value="public">企业账号</option>
                </select>
            </td>
            <td colspan="10">
            </td>
        </tr>
        <tr>
            <td>法人姓名<font color="FF0000">*</font>
            </td>
            <td><input name="corporateName" value="" type="text" nullmsg="请输入法人姓名" datatype="s1-10"/>
            </td>
            <td>法人身份证号<font color="FF0000">*</font>
            </td>
            <td><input name="corporateCardid" value="" type="text" nullmsg="请输入法人身份证号"
                       datatype="s1-20"/>
            </td>
            <td>法人手机号<font color="FF0000">*</font>
            </td>
            <td><input name="corporatePhone" value="" type="text" nullmsg="请输入法人手机号"
                       datatype="s1-20"/>
            </td>
            <td>营业执照号<font color="FF0000">*</font>
            </td>
            <td><input name="licenseNo" value="" type="text" nullmsg="请输入营业执照号"
                       datatype="s1-20"/>
            </td>
            <td colspan="10">
            </td>
        </tr>


        <%--<tr>--%>
        <%--<td>代理人姓名<font color="FF0000">*</font>--%>
        <%--</td>--%>
        <%--<td><input name="agentor" value="" type="text" nullmsg="请输入代理人姓名" />--%>
        <%--</td>--%>
        <%--<td>代理人身份证号<font color="FF0000">*</font>--%>
        <%--</td>--%>
        <%--<td><input name="agentorCardid" value="" type="text"  nullmsg="请输入代理人身份证号"/>--%>
        <%--</td>--%>
        <%--<td>代理商级别<font color="FF0000">*</font>--%>
        <%--</td>--%>
        <%--<td><input name="agentLevel" value="" type="number"   nullmsg="请输入代理商级别"--%>
        <%--/>--%>
        <%--</td>--%>
        <%--<td colspan="10">--%>
        <%--</td>--%>
        <%--</tr>--%>


        <%--<tr>--%>
        <%--<td>代理区域<font color="FF0000">*</font>--%>
        <%--</td>--%>
        <%--<td><input name="area" value="" type="text" nullmsg="请输入代理区域"--%>
        <%--/>--%>
        <%--</td>--%>

        <%--&lt;%&ndash;	<td>代理商名称<font color="FF0000">*</font>--%>
        <%--</td>--%>
        <%--<td><input name="agentName" value="" type="text"--%>
        <%--/>--%>
        <%--</td>&ndash;%&gt;--%>
        <%--<td colspan="10">--%>
        <%--</td>--%>
        <%--</tr>--%>

        <tr>
            <td>银行类型
            </td>
            <td><select class="select" id="banktypeId" name="banktypeId">
                <option value="0">请选择</option>
                <c:forEach var="aBankType" items="${tBankType}">
                    <option value="${aBankType.id}"
                            <c:if test="${tUserBank.banktypeId == aBankType.id}">selected</c:if>>${aBankType.name}</option>
                </c:forEach>
            </select>
            </td>
            <td>支行</td>
            <td>
                <input name="branch" value="" type="text"
                       nullmsg="请准确输入银行支行信息"/>
                </select>
            </td>
            <td>银行账号</td>
            <td>
                <input name="bankAccount" value="" type="text"
                       nullmsg="请输入银行账号"/>
                </select>
            </td>

            <td>银行账号名</td>
            <td>
                <input name="accountName" value="" type="text"
                       nullmsg="请输入银行账号名"/>
                </select>
            </td>
        </tr>
        <tr>
            <td>省</td>
            <td><select class="select" id="province" name="province">
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
                <select class="select" id="city" name="city"></select>
            </td>
            <td colspan="10">
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="6"><input class="btn btn-inverse" id="btnSave"
                                   type="button" value="添加"/>&nbsp;<input id="btnReset"
                                                                          class="btn btn-inverse" type="reset"
                                                                          value="重置"/>&nbsp;<input
                    class="btn btn-inverse" id="btnBack" type="button"
                    onclick="goUrl('queryBrandUserList')" value="返回"/>&nbsp;&nbsp;<span
                    id="errorMsg" class="Validform_checktip"> </span></td>
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
            if (data.status == 'y') {
                //valiForm.resetForm();
                goUrl('queryBrandUserList')
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