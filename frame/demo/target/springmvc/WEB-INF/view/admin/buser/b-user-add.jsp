<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>添加商户
</div>
<form id="editForm" action="addBUser">
    <table class="table table-striped table-bordered edit-table">
        <thead>
        <tr>
            <td colspan="6"><b>基本信息</b>
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
            <td colspan="2">
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
                    onclick="goUrl('queryBUserList')" value="返回"/>&nbsp;&nbsp;<span
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
        callback: function (data) {
            alert(data.info);
            if (data.status == 'y') {
                valiForm.resetForm();
            }
        }
    });
    $.Tipmsg.r = "";
    //-->
</script>
<!--右边框架结束-->