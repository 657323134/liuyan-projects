<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<script type="text/javascript" src="${bashPath}/js/admin/jquery.form.js"></script>
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
    当前位置<b class="tip"></b>
        门店详情

</div>
<form id="editForm" action="saveAgentUser">
    <input name="userType" value="0" type="hidden"/>
    <input name="picIds" value="" type="hidden"/>
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
                <input name="name" type="text" nullmsg="请输入代理姓名" errorMsg="商户姓名长度为4-20位" value="${bUserModel.name}" readonly="readonly"/>
            </td>
            <td>手机号<font color="FF0000">*</font></td>
            <td>
                <input name="phone" type="text" datatype="s4-20" nullmsg="请输入手机号" errorMsg="手机号长度为11位" value="${bUserModel.phone}" readonly="readonly"/>
            </td>
            <td>流水分成比例(%)<font color="FF0000">*</font></td>
            <td>
                <input name="percentage" type="number" nullmsg="请输入代理商流水分成比例" errorMsg="代理商流水分成比例错误" value="${bUserModel.percentage}" readonly="readonly"/>
            </td>
            <td colspan="2"></td>
        </tr>

        <tr>
            <td>代理人姓名<font color="FF0000">*</font></td>
            <td>
                <input name="agentor" type="text" nullmsg="请输入代理人姓名" value="${agentInfo.agentor}" readonly="readonly"/>
            </td>
            <td>代理人身份证号<font color="FF0000">*</font></td>
            <td>
                <input name="agentorCardid" value="${agentInfo.agentor_cardid}" type="text" nullmsg="请输入代理人身份证号" readonly="readonly"/>
            </td>
            <td colspan="4"></td>
        </tr>
        <tr>
            <td>银行类型</td>
            <td>
                <select class="select" id="banktypeId" name="banktypeId" disabled="disabled">
                    <option value="0">请选择</option>
                    <c:forEach var="aBankType" items="${tBankType}">
                        <option value="${aBankType.id}"
                                <c:if test="${tUserBank.banktypeId == aBankType.id}">selected</c:if>>${aBankType.name}</option>
                    </c:forEach>
                </select>
            </td>
            <td>支行</td>
            <td>
                <input name="branch" value="${tUserBank.branch}" type="text" nullmsg="请准确输入银行支行信息" readonly="readonly"/>
            </td>
            <td>银行账号</td>
            <td>
                <input name="bankAccount" value="${tUserBank.bankAccount}" type="text" nullmsg="请输入银行账号" readonly="readonly"/>
            </td>

            <td>银行账号名</td>
            <td>
                <input name="accountName" value="${tUserBank.accountName}" type="text"
                       nullmsg="请输入银行账号名" readonly="readonly"/>
                </select>
            </td>
        </tr>
        <tr>
            <td>省</td>
            <td>
                <select class="select" id="province" name="province" disabled="disabled">
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
                <select class="select" id="city" name="city" disabled="disabled">
                    <c:forEach var="cityInfo" items="${citys}">
                        <option value="${cityInfo.id}"
                                <c:if test="${tUserBank.city == cityInfo.id}">selected</c:if>>${cityInfo.regionName}</option>
                    </c:forEach>
                </select>
            </td>
            <td colspan="4"></td>
        </tr>

        <tr>
            <td colspan="8"><strong>图片列表</strong></td>
        </tr>
        <tr>
            <td class="key" style="width: 100px;"><strong>身份证图片(正)：</strong></td>
            <td class="showImage1">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 1}">
                        <a href="${bUserPic.imgUrl}" target="_blank">
                            <img src="${bUserPic.imgUrl}" alt="${bUserPic.imgName}" style="width:80px;height: 50px;">
                        </a>
                    </c:if>
                </c:forEach>
            </td>
            <td class="key" style="width: 100px;"><strong>身份证图片(反)：</strong></td>
            <td class="showImage6">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 6}">
                        <a href="${bUserPic.imgUrl}" target="_blank">
                            <img src="${bUserPic.imgUrl}" alt="${bUserPic.imgName}" style="width:80px;height: 50px;">
                        </a>
                    </c:if>
                </c:forEach>
            </td>
            <td class="key" style="width: 100px;"><strong>营业执照：</strong></td>
            <td class="showImage2">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 2}">
                        <a href="${bUserPic.imgUrl}" target="_blank">
                            <img src="${bUserPic.imgUrl}" alt="${bUserPic.imgName}" style="width:80px;height: 50px;">
                        </a>
                    </c:if>
                </c:forEach>
            </td>
            <td colspan="2"></td>
        </tr>


        <tr>
            <td class="key" style="width: 100px;"><strong>对公账号复印件：</strong></td>
            <td class="showImage3">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 3}">
                        <a href="${bUserPic.imgUrl}" target="_blank">
                            <img src="${bUserPic.imgUrl}" alt="${bUserPic.imgName}" style="width:80px;height: 50px;">
                        </a>
                    </c:if>
                </c:forEach>
            </td>
            <td class="key" style="width: 100px;"><strong>合作协议：</strong></td>
            <td class="showImage4">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 4}">
                        <a href="${bUserPic.imgUrl}" target="_blank">
                            <img src="${bUserPic.imgUrl}" alt="${bUserPic.imgName}" style="width:80px;height: 50px;">
                        </a>
                    </c:if>
                </c:forEach>
            </td>
            <td colspan="4"></td>
        </tr>


        <c:if test="${userType==1}">
            <tr>
                <td class="key" style="width: 100px;"><strong>门头照片.工作照片.产品照片：</strong></td>
                <td colspan="3" class="showImage5">
                    <c:forEach items="${bUserPics}" var="bUserPic">
                        <c:if test="${bUserPic.imgType == 5}">
                            <a href="${bUserPic.imgUrl}" target="_blank">
                                <img src="${bUserPic.imgUrl}" alt="${bUserPic.imgName}"
                                     style="width:80px;height: 50px;">
                            </a>
                            <input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')">
                        </c:if>
                    </c:forEach>
                </td>
                <td colspan="6"></td>
            </tr>
        </c:if>
        </tbody>
    </table>
</form>
<table class="table table-striped table-bordered table-hover" id="top">

    <thead>
    <tr>
        <td colspan="10"><b>代理产品</b>
        </td>
    </tr>
    </thead>
    <tr class="tr_detail">
        <td class="auto-style1">产品名称</td>
        <td class="auto-style1">型号</td>
        <td class="auto-style1">授权时间</td>
        <td class="auto-style1">分红金额</td>
        <td class="auto-style1">总销量</td>
        <td class="auto-style1">本月销量</td>
        <td class="auto-style1">总退货</td>
        <td class="auto-style1">本月退货</td>
        <td class="auto-style1">操作</td>
    </tr>

    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
            <td> ${bean.goodsname } </td>
            <td> ${bean.goodsModel}</td>
            <td> ${bean.granttm }</td>
            <td>${bean.settlementMoney}</td>
            <td>${bean.totalNum}</td>
            <td>${bean.currentMonthNum}</td>
            <td>${bean.withdrawTotalNum}</td>
            <td>${bean.withdrawCurrentMonthNum}</td>
            <td>

                    <%--<input class="btn btn-inverse" type="button" value="代理详情" onclick="goUrl('updateAgentUserIndex?id=${bean.id}');" />&nbsp;--%>

            </td>
        </tr>
    </c:forEach>
    <tr class="tr_pagenumber">
        <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit }"
                                    totalCount="${page.totalCount }"/></td>
    </tr>
    <tr>
        <td colspan="20">
            <c:choose>
                <c:when test="${empty addId}">
                    <input class="btn btn-inverse" id="btnBack"
                           type="button" onclick="goUrl('${goUrl}')" value="返回"/>
                </c:when>
                <c:otherwise>
                    <input class="btn btn-inverse" id="btnBack"
                           type="button" onclick="window.opener.closeWin(null,null)" value="返回"/>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
    </tbody>

</table>

<script type="text/javascript">

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
                alert("请选择上传的身份证图片");
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
                    sPicIds += data.picIds + ",";
                    $("input[name='picIds']").val(sPicIds);
                    var picIds = data.picIds.split(",");
                    var imgUrls = data.imgUrls.split(",");
                    var index = picIds.length;
                    var html = "";
                    for (var i = 0; i < index; i++) {
                        if (imgUrls[i] != "") {
                            html += '<a href="' + imgUrls[i] + '" target="_blank" class="picture' + picIds[i] + '">';
                            html += '<img src="' + imgUrls[i] + '" style="width:80px;height: 50px;">';
                            html += '</a>';
                            html += '<input type="button" value="删除" class="picture' + picIds[i] + '" onclick="deleteImage(' + picIds[i] + ')">';
                        }
                    }
                    $(".showImage" + type).append(html);
                }
            }
        });
    }

    function deleteImage(id) {
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
                } else {
                    layer.alert("删除图片失败");
                }
            }
        });
    }
    //-->
</script>
<!--右边框架结束-->