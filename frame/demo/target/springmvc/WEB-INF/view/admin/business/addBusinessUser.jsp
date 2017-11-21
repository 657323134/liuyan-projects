<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>添加商户
</div>

<form id="editForm" action="addBusinessUser">
    <table class="table table-striped table-bordered edit-table">
        <thead>
        <tr>
            <td colspan="10"><b>基本信息</b>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>商户姓名<font color="FF0000">*</font>
            </td>
            <td><input name="name" value="" type="text"
                       datatype="s4-20" nullmsg="请输入商户姓名" errorMsg="商户姓名长度为4-20位"/>
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
            <td colspan="3">
            </td>
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
            <td colspan="5">
            </td>
        </tr>

        <tr>
            <td colspan="10"><b>门店信息</b>
            </td>
        </tr>
        </tr>
        <tr>
            <td>门店名称<font color="FF0000">*</font>
            </td>
            <td><input name="facilitator_name" value="" type="text"
                       nullmsg="请输入门店名称"/>
            </td>
            <td>门店地址<font color="FF0000">*</font>
            </td>
            <td><input name="facilitator_address" value="" type="text"
                       nullmsg="请输入门店地址"/>
            </td>

            <td>门店联系人<font color="FF0000">*</font>
            </td>
            <td><input name="failitator_contacts" value="" type="text"
                       nullmsg="请输入门店联系人"/>
            </td>

            <td>门店电话<font color="FF0000">*</font>
            </td>
            <td><input name="failitator_phone" value="" type="text"
                       nullmsg="请输入门店电话"/>
            </td>
            <%--
                        <td colspan="4">
            --%>
            </td>

        </tr>
        <tr>
            <td colspan="10"><b>银行卡信息</b>
            </td>
        </tr>

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
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="6"><input class="btn btn-inverse" id="btnSave"
                                   type="button" value="添加"/>&nbsp;<input id="btnReset"
                                                                          class="btn btn-inverse" type="reset"
                                                                          value="重置"/>&nbsp;<input
                    class="btn btn-inverse" id="btnBack" type="button"
                    onclick="goUrl('queryBUserBusinessList')" value="返回"/>&nbsp;&nbsp;<span
                    id="errorMsg" class="Validform_checktip"> </span></td>
        </tr>
        </tfoot>
    </table>
</form>

<!--右边框架结束-->
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
                goUrl('queryBUserBusinessList');
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