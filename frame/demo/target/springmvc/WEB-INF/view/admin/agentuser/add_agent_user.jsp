<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<head>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/admin-all.css"/>
    <link rel="stylesheet" type="text/css" href="/css/validform.css"/>
    <link type="text/css" rel="stylesheet" href="/js/plugins/jBox/Skins/Blue/jbox.css"/>

    <script type="text/javascript" src="/js/admin/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="/js/lion-jquery.js"></script>
    <script type="text/javascript"
            src="/js/admin/jquery-ui-1.8.22.custom.min.js"></script>
    <%--<script type="text/javascript" src="/js/admin/index.js"></script>--%>
    <script type="text/javascript" src="/js/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript" src="/js/admin/jquery.form.js"></script>

</head>
<style>
    .shop {
        display: none;
    }
</style>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>添加下级代理商
</div>
<form id="editForm" action="saveAgentUser">
    <input name="userType" value="0" type="hidden"/>
    <input name="picIds" value="" type="hidden"/>
    <table class="table table-striped table-bordered edit-table">
        <thead>
        <tr>
            <td colspan="10"><b>基本信息</b>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>代理商名<font color="FF0000">*</font>
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
            <td colspan="4"></td>
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
            <td>流水分成比例(%)<font color="FF0000">*</font>
            </td>
            <td><input name="percentage" value="" type="number" min="0" max="${percentage}"
                       nullmsg="请输入代理商流水分成比例" style="width:150px" errorMsg="代理商流水分成比例错误"/>&nbsp;&nbsp;&nbsp;<span style="color: red">%</span>
            </td>
            <td>拥有分成比例(%)<font color="FF0000">*</font>
            </td>
            <td>
                ${percentage}
            </td>
            <td colspan="4">
            </td>

        </tr>
        <tr>
            <td>法人姓名<font color="FF0000">*</font>
            </td>
            <td><input name="corporateName" value="" type="text" nullmsg="请输入法人姓名"/>
            </td>
            <td>法人身份证号<font color="FF0000">*</font>
            </td>
            <td><input name="corporateCardid" value="" type="text" nullmsg="请输入法人身份证号"
                    />
            </td>
            <td>法人手机号<font color="FF0000">*</font>
            </td>
            <td><input name="corporatePhone" value="" type="text" nullmsg="请输入法人手机号"/>
            </td>
            <td>结算时间（天）<font color="FF0000">*</font>
            </td>
            <td><input name="settlementPeriod" value="" type="number" min ="1"
                       nullmsg="请输入结算时间" errorMsg="输入结算时间错误" datatype="s1-3"/>&nbsp;&nbsp;&nbsp;<span style="color: red">天</span>

            </td>
            <td colspan="4">
            </td>
        </tr>
        <tr>
            <td>代理人姓名<font color="FF0000">*</font>
            </td>
            <td><input name="agentor" value="" type="text" nullmsg="请输入代理人姓名"/>
            </td>
            <td>代理人身份证号<font color="FF0000">*</font>
            </td>
            <td><input name="agentorCardid" value="" type="text" nullmsg="请输入代理人身份证号"
                    />
            </td>
            <td colspan="6">
            </td>
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
            <td colspan="2">
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
            <td>是否开通门店:</td>
            <td>
                <select class="select shopClass" name="openShop" id = "selectKt" onchange="selectShop()">
                    <option value="1">否</option>
                    <option value="2">是</option>
                </select>
            </td>
            <td colspan="4">
            </td>
        </tr>
        <tr class="shop">
            <td>门店名称<font color="FF0000">*</font>:
            </td>
            <td>
                <input name="facilitator_name" value="" type="text"
                       nullmsg="请准确输入门店名称" errorMsg="请输入门店名称"/>
            </td>
            <td>门店地址<font color="FF0000">*</font>:</td>
            <td>
                <input name="facilitator_address" value="" type="text"
                       nullmsg="请准确输入门店地址" errorMsg="请输入门店地址"/>
                </select>
            </td>
            <td>店长姓名<font color="FF0000">*</font>:</td>
            <td>
                <input name="failitator_contacts" value="" type="text"
                       nullmsg="请输入店长姓名" errorMsg="请输入店长姓名"/>
                </select>
            </td>

            <td>门店联系电话<font color="FF0000">*</font>:</td>
            <td>
                <input name="failitator_phone" value="" type="text"
                       nullmsg="请输入门店联系电话" errorMsg="请输入门店联系电话"/>
                </select>
            </td>
            <td colspan="4">
            </td>
        </tr>

        <tr  class="shop">
            <td>服务费(%)<font color="FF0000">*</font>:</td>
            <td>
                <input name="shopServiceFeePercentage" value="" type="text"
                       nullmsg="请输入门店服务费" errorMsg="请输入门店服务费"/>&nbsp;&nbsp;&nbsp;<span style="color: red">%</span>
                </select>
            </td>
        </tr>
        <tr class="shop">
            <td>结算时间（天）<font color="FF0000">*</font>
            </td>
            <td><input name="shopSettlementPeriod" value="" type="number" min="1" id = "shopSettlement"
                       nullmsg="请输入结算时间" errorMsg="输入结算时间错误" datatype="s1-3"/>&nbsp;&nbsp;&nbsp;<span style="color: red">天</span>

            </td>
            <td colspan="10">
            </td>
        </tr>
        <tr>
            <td class="key" style="width: 100px;"><strong>身份证图片(正)：</strong>
            </td>
            <td colspan="2">
                <form id="imgForm11" enctype="multipart/form-data" style="display: none;">

                </form>

                <form id="imgForm1" enctype="multipart/form-data">
                    <input type="file" multiple="multiple" name="userimagesCardId" id="userimagesCardId">
                    <input type="button" value="上传" onclick="upload(1)" style="width: 70px;">
                </form>
            </td>

            <td class="key" style="width: 100px;"><strong>身份证图片(反)：</strong>
            </td>
            <td colspan="2">

                <form id="imgForm6" enctype="multipart/form-data">
                    <input type="file" multiple="multiple" name="userimagesCardIdBack" id="userimagesCardIdBack">
                    <input type="button" value="上传" onclick="upload(6)" style="width: 70px;">
                </form>
            </td>


            <td class="key" style="width: 100px;"><strong>营业执照：</strong>
            </td>
            <td colspan="2">
                <form id="imgForm2" enctype="multipart/form-data">
                    <input type="file" multiple="multiple" name="userimagesLicence" id="userimagesLicence">
                    <input type="button" value="上传" onclick="upload(2)" style="width: 70px;">
                </form>
            </td>
        </tr>
        <%--<tr >--%>

        <%--<td colspan="6"></td>--%>
        <%--</tr>--%>

        <tr>
            <td class="key" style="width: 100px;"><strong>对公账号复印件：</strong>
            </td>
            <td colspan="3">
                <form id="imgForm3" enctype="multipart/form-data">
                    <input type="file" multiple="multiple" name="userimagesAccount" id="userimagesAccount">
                    <input type="button" value="上传" onclick="upload(3)" style="width: 70px;">
                </form>
            </td>

            <td class="key" style="width: 100px;"><strong>合作协议：</strong>
            </td>
            <td colspan="3">
                <form id="imgForm4" enctype="multipart/form-data">
                    <input type="file" multiple="multiple" name="userimagesProtocal" id="userimagesProtocal">
                    <input type="button" value="上传" onclick="upload(4)" style="width: 70px;">
                </form>
            </td>
        </tr>
        <%--<tr >--%>

        <%--<td colspan="6"></td>--%>
        <%--</tr>--%>

        <tr class="shop">
            <td class="key shop" style="width: 100px;"><strong>门头照片.工作照片.产品照片：</strong>
            </td>
            <td colspan="3" class="shop">
                <form id="imgForm5" enctype="multipart/form-data">
                    <input type="file" multiple="multiple" name="businessStore" id="businessStore">
                    <input type="button" value="上传" onclick="upload(5)" style="width: 70px;">
                </form>
            </td>
            <td colspan="6" class="shop"></td>
        </tr>

        <tr>
            <td colspan="10" style="text-align: center;"><strong>图片列表</strong>
            </td>
        </tr>
        <tr>
            <td class="key" style="width: 100px;"><strong>身份证图片(正)：</strong>
            </td>
            <td colspan="2" class="showImage1">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 1}">
                        <a href="${imgUrl}${bUserPic.imgUrl}" target="_blank">
                            <img src="${imgUrl}${bUserPic.imgUrl}" alt="${bUserPic.imgName}"
                                 style="width:80px;height: 50px;">
                        </a>
                        <input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')">
                    </c:if>
                </c:forEach>
            </td>

            <td class="key" style="width: 100px;"><strong>身份证图片(反)：</strong>
            </td>
            <td colspan="2" class="showImage6">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 6}">
                        <a href="${imgUrl}${bUserPic.imgUrl}" target="_blank">
                            <img src="${imgUrl}${bUserPic.imgUrl}" alt="${bUserPic.imgName}"
                                 style="width:80px;height: 50px;">
                        </a>
                        <input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')">
                    </c:if>
                </c:forEach>
            </td>

            <td class="key" style="width: 100px;"><strong>营业执照：</strong>
            </td>
            <td colspan="2" class="showImage2">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 2}">
                        <a href="${imgUrl}${bUserPic.imgUrl}" target="_blank">
                            <img src="${imgUrl}${bUserPic.imgUrl}" alt="${bUserPic.imgName}"
                                 style="width:80px;height: 50px;">
                        </a>
                        <input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')">
                    </c:if>
                </c:forEach>
            </td>
        </tr>

        <tr>
            <td class="key" style="width: 100px;"><strong>对公账号复印件：</strong>
            </td>
            <td colspan="3" class="showImage3">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 3}">
                        <a href="${imgUrl}${bUserPic.imgUrl}" target="_blank">
                            <img src="${imgUrl}${bUserPic.imgUrl}" alt="${bUserPic.imgName}"
                                 style="width:80px;height: 50px;">
                        </a>
                        <input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')">
                    </c:if>
                </c:forEach>
            </td>

            <td class="key" style="width: 100px;"><strong>合作协议：</strong>
            </td>
            <td colspan="3" class="showImage4">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 4}">
                        <a href="${imgUrl}${bUserPic.imgUrl}" target="_blank">
                            <img src="${imgUrl}${bUserPic.imgUrl}" alt="${bUserPic.imgName}"
                                 style="width:80px;height: 50px;">
                        </a>
                        <input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')">
                    </c:if>
                </c:forEach>
            </td>
        </tr>

        <tr class="shop">
            <td class="key" style="width: 100px;"><strong>门头照片.工作照片.产品照片：</strong>
            </td>
            <td colspan="3" class="showImage5">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 5}">
                        <a href="${imgUrl}${bUserPic.imgUrl}" target="_blank">
                            <img src="${imgUrl}${bUserPic.imgUrl}" alt="${bUserPic.imgName}"
                                 style="width:80px;height: 50px;">
                        </a>
                        <input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')">
                    </c:if>
                </c:forEach>
            </td>
            <td colspan="6"></td>
        </tr>

        <%--<tr class="shop">--%>
        <%--<td class="key" colspan="10" style="text-align: center;"><strong>添加门店</strong>--%>
        <%--</td>--%>
        <%--</tr>--%>


        </tbody>
        <tfoot>
        <tr>
            <td colspan="6">

                <c:choose>
                    <c:when test="${empty addId}">
                        <input class="btn btn-inverse" id="btnSave"
                               type="button" value="添加"/>&nbsp;<input id="btnReset"
                        class="btn btn-inverse" type="reset" value="重置" />&nbsp;

                        <input
                                class="btn btn-inverse" id="btnBack" type="button"
                                onclick="goUrl('queryAgentUserList')" value="返回"/>

                    </c:when>
                    <c:otherwise>
                        <input class="btn btn-inverse" id="btnSave"
                               type="button" value="添加"/>

                        &nbsp;<input id="btnReset"
                        class="btn btn-inverse" type="reset" value="重置" />&nbsp;

                        <input class="btn btn-inverse" id="btnBack" type="button"
                               onclick="window.opener.closeWin(null,null)" value="返回"/>

                    </c:otherwise>

                </c:choose>
                <input type="hidden" value="${addId}" name="addId">
                &nbsp;&nbsp;<span
                    id="errorMsg" class="Validform_checktip"> </span></td>

        </tr>
        </tfoot>
    </table>
</form>
<script type="text/javascript">

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
            if (data.status == -3) {
                $("#errorMsg").text("代理商名已存在");
            } else if (data.status == -1) {
                $("#errorMsg").text("手机号已注册，请更换手机号");
            } else if (data.status == -2) {
                $("#errorMsg").text("不能超过上级分成比例");
            } else if (data.status > 0 && data.status != 'n') {
                if ($("input[name='addId']").val() != "") {
                    window.opener.closeWin(data.status, $("input[name='name']").val())
                } else {
                    goUrl('queryAgentUserList?userId=' + data.status)
                }
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
    function selectShop() {
        var value = $(".shopClass").val();
        if (value == 2) {
            $(".shop").css("display", "table-row");
        } else {
            $(".shop").css("display", "none");
        }
    }
    function upload(type) {
        var formId;
        if (type == 1) {
            formId = 'imgForm1';
            if ($("#userimagesCardId").val() == null || $("#userimagesCardId").val() == '') {
                alert("请选择上传的身份证正面图片");
                return false;
            }
        } else if (type == 6) {
            formId = 'imgForm6';
            if ($("#userimagesCardIdBack").val() == null || $("#userimagesCardIdBack").val() == '') {
                alert("请选择上传的身份证背面图片");
                return false;
            }
        } else if (type == 2) {
            formId = 'imgForm2';
            if ($("#userimagesLicence").val() == null || $("#userimagesLicence").val() == '') {
                alert("请选择上传的营业执照图片");
                return false;
            }

        } else if (type == 3) {
            formId = 'imgForm3';
            if ($("#userimagesAccount").val() == null || $("#userimagesAccount").val() == '') {
                alert("请选择上传的对公账号图片");
                return false;
            }
        } else if (type == 5) {
            formId = 'imgForm5';
            if ($("#businessStore").val() == null || $("#businessStore").val() == '') {
                alert("请选择上传的门头照片.工作照片.产品照片");
                return false;
            }
        } else {
            formId = 'imgForm4';
            if ($("#userimagesProtocal").val() == null || $("#userimagesProtocal").val() == '') {
                alert("请选择上传的合作协议图片");
                return false;
            }
        }
        $("#" + formId).ajaxSubmit({
            url: 'uploadBUserImages1',
            type: 'post',
            data: {
                type: type
            },
            success: function (data) {
                if (data.result == 1) {
                    var sPicIds = $("input[name='picIds']").val();
                    sPicIds += data.picIds + "-" + type + ",";
                    $("input[name='picIds']").val(sPicIds);
                    var picIds = data.picIds.split(",");
                    var imgUrls = data.imgUrls.split(",");
                    var index = picIds.length;
                    var html = "";
                    for (var i = 0; i < index; i++) {
                        if (imgUrls[i] != "") {
                            html += '<a href="' + '${imgUrl}' + imgUrls[i] + '" target="_blank" class="picture' + picIds[i] + '">';
                            html += '<img src="' + '${imgUrl}' + imgUrls[i] + '" style="width:80px;height: 50px;">';
                            html += '</a>';
                            html += '<input type="button" value="删除" class="picture' + picIds[i] + '" onclick="deleteImage(' + picIds[i] + ','+type+')">';
                        }
                    }
                    $(".showImage" + type).append(html);
                }
            }
        });
    }

    function deleteImage(id,type) {
        $.ajax({
            type: 'post',
            url: "deleteBUserImages",
            data: {
                id: id
            },
            success: function (msg) {
                if (msg == '1') {
                    //var params =  $("#searchForm").serialize();
                    //$("#mainContent").html($("#searchForm").submit());
//				goUrl('editImages?id='+ userId)
                    $(".picture" + id).remove();
                    //开通门店bug修改
                    var subIds = id+"-"+type+",";
                    var ids = $("input[name='picIds']").val();
                    var upImgInputIds =ids.replace(subIds,"");
                    $("input[name='picIds']").val(upImgInputIds);
                } else {
                    layer.alert("删除图片失败");
                }
            }
        });
    }
    //-->
</script>

