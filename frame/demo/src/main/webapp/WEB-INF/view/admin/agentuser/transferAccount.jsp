<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>提现申请
</div>
<form id="editForm" action="transfeAccount">
    <input type="hidden" id="phone" value="${phone}"/>
    <table class="table table-striped table-bordered edit-table">
        <thead>
        <tr>
            <td colspan="6"><b>申请提现</b>
            </td>
        </tr>
        </thead>
        <td>
            帐户金额<font color="FF0000">*</font>
        </td>
        <td>
            <span style="font-size:14px;color:#ff0000">${bUserfundinfo.cashBalance}</span>
        </td>
        </tr>
        <tr>
            <td>转账金额<font color="FF0000">*</font>
            </td>
            <td>
                <input name="money" type="number" min="0" nullmsg="请输入转账金额" errorMsg="转账金额错误"/>
                <span></span>
            </td>
        </tr>

        <tr>
            <td>转入代理商账户手机号<font color="FF0000">*</font>
            </td>
            <td>
                <input name="targetPhone" type="text" datatype="s2-20" nullmsg="请准确输入代理商账号手机号" errorMsg="代理商账号手机号错误"/>
                <span></span>
            </td>
        </tr>

        <tr>
            <td>转入代理商账户名<font color="FF0000">*</font>
            </td>
            <td>
                <input name="targetAccountName" datatype="s2-20" type="text" nullmsg="请准确输入代理商账户名" errorMsg="代理商账户名错误"/>
                <span></span>
            </td>
        </tr>


        <tr>
            <td>验证码<font color="FF0000">*</font>
            </td>
            <td>
                <input name="vcode" type="text" nullmsg="请输入验证码" errorMsg="请输入验证码"/>
                <input class="btn btn-1 btn-send-sms" id="send-code" type="button" value="发送验证码"/>&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input class="btn btn-inverse" id="btnSave" type="button" value="提交"/>&nbsp;
                <span id="errorMsg" class="Validform_checktip"> </span></td>
        </tr>
    </table>
</form>

<script type="text/javascript">

    $("#send-code").click(function () {
        var phone = $("#phone").val();
        if (phone == null || phone == '') {
            alert("手机号不能为空!");
            return;
        }
        var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
        if (reg.test(phone) == false) {
            alert("手机号格式有误!");
            return;
        }
        var $this = $(this);
        $.ajax({
            type: 'post',
            url: '/userinfo/sendSms',
            data: {
                phone: phone
            },
            success: function (data) {
                if (data.status == "1") {
                    SendSmsCode.init($this);
                } else {
                    alert("系统繁忙，稍后再试！");
                }
            }
        });
    });

    var SendSmsCode = {
        smsobj: null,
        count: 120,
        start: function () {
            this.count = this.count - 1;
            if (this.count > 0) {
                this.smsobj.attr("value", this.count + "秒后重新获取");
                this.smsobj.attr("disabled", "true");
                var _this = this;
                setTimeout(function () {
                    _this.start();
                }, 1000);
            } else {
                this.smsobj.removeAttr("disabled");
                this.smsobj.attr("value", "获取验证码");
                this.count = 120;
            }
        },
        //初始化
        init: function (smsobj) {
            this.smsobj = smsobj;
            this.smsobj.attr("disabled", "true");
            this.start();
        }
    };

    var valiForm = $("#editForm").Validform({
        btnSubmit: "#btnSave",
        tiptype: function (msg, o, cssctl) {
            var objtip = $("#errorMsg");
//			cssctl(objtip, o.type);
            objtip.text(msg);
        },
        postonce: true,
        ajaxPost: true,
        callback: function (data) {
            if (data.status == 'y') {
                alert("转账成功,请刷新页面!");
                valiForm.resetForm();
                //window.location.reload();
            }
        }
    });
    $.Tipmsg.r = "";
</script>
<!--右边框架结束-->