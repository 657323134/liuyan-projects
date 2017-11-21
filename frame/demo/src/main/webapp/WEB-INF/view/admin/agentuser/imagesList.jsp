<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<script type="text/javascript" src="${bashPath}/js/admin/jquery.form.js"></script>

<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>详细信息
</div>
<div class="detail">
    <input type="hidden" value="${userId}" id="userId">

    <table class="table table-striped table-bordered edit-table">
        <thead>
            <tr>
                <td class="key" colspan="4" style="text-align: center;"><strong>图片编辑</strong></td>
            </tr>
        </thead>
        <tr>
            <td class="key"><strong>身份证图片(正/反)：</strong>
            </td>
            <td colspan="3">
                <form id="imgForm1" enctype="multipart/form-data">
                    <input type="file" multiple="multiple" name="userimagesCardId" id="userimagesCardId">
                    <input type="button" value="上传" onclick="upload(1)" style="width: 70px;">
                </form>
            </td>
        </tr>
        <tr>
            <td class="key"><strong>营业执照：</strong>
            </td>
            <td colspan="3">
                <form id="imgForm2" enctype="multipart/form-data">
                    <input type="file" multiple="multiple" name="userimagesLicence" id="userimagesLicence">
                    <input type="button" value="上传" onclick="upload(2)" style="width: 70px;">
                </form>
            </td>
        </tr>

        <tr>
            <td class="key"><strong>对公账号复印件：</strong>
            </td>
            <td colspan="3">
                <form id="imgForm3" enctype="multipart/form-data">
                    <input type="file" multiple="multiple" name="userimagesAccount" id="userimagesAccount">
                    <input type="button" value="上传" onclick="upload(3)" style="width: 70px;">
                </form>
            </td>
        </tr>
        <tr>
            <td class="key"><strong>合作协议：</strong>
            </td>
            <td colspan="3">
                <form id="imgForm4" enctype="multipart/form-data">
                    <input type="file" multiple="multiple" name="userimagesProtocal" id="userimagesProtocal">
                    <input type="button" value="上传" onclick="upload(4)" style="width: 70px;">
                </form>
            </td>
        </tr>

        <td class="key"><strong>门头照片.工作照片.产品照片：</strong>
        </td>
        <td colspan="3">
            <form id="imgForm5" enctype="multipart/form-data">
                <input type="file" multiple="multiple" name="businessStore" id="businessStore">
                <input type="button" value="上传" onclick="upload(5)" style="width: 70px;">
            </form>
        </td>


        <tr>
            <td colspan="4" style="text-align: center;"><strong>图片列表</strong></td>
        </tr>
        <tr>
            <td class="key"><strong>身份证图片(正/反)：</strong>
            </td>
            <td colspan="3">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 1}">
                        <a href="${bUserPic.imgUrl}" target="_blank">
                            <img src="${bUserPic.imgUrl}" alt="${bUserPic.imgName}" style="width:80px;height: 50px;">
                        </a>
                        <input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')">
                    </c:if>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <td class="key"><strong>营业执照：</strong>
            </td>
            <td colspan="3">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 2}">
                        <a href="${bUserPic.imgUrl}" target="_blank">
                            <img src="${bUserPic.imgUrl}" alt="${bUserPic.imgName}" style="width:80px;height: 50px;">
                        </a>
                        <input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')">
                    </c:if>
                </c:forEach>
            </td>
        </tr>

        <tr>
            <td class="key"><strong>对公账号复印件：</strong>
            </td>
            <td colspan="3">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 3}">
                        <a href="${bUserPic.imgUrl}" target="_blank">
                            <img src="${bUserPic.imgUrl}" alt="${bUserPic.imgName}" style="width:80px;height: 50px;">
                        </a>
                        <input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')">
                    </c:if>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <td class="key"><strong>合作协议：</strong>
            </td>
            <td colspan="3">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 4}">
                        <a href="${bUserPic.imgUrl}" target="_blank">
                            <img src="${bUserPic.imgUrl}" alt="${bUserPic.imgName}" style="width:80px;height: 50px;">
                        </a>
                        <input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')">
                    </c:if>
                </c:forEach>
            </td>
        </tr>

        <tr>
            <td class="key"><strong>门头照片.工作照片.产品照片：</strong>
            </td>
            <td colspan="3">
                <c:forEach items="${bUserPics}" var="bUserPic">
                    <c:if test="${bUserPic.imgType == 5}">
                        <a href="${bUserPic.imgUrl}" target="_blank">
                            <img src="${bUserPic.imgUrl}" alt="${bUserPic.imgName}" style="width:80px;height: 50px;">
                        </a>
                        <input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')">
                    </c:if>
                </c:forEach>
            </td>
        </tr>

        <tfoot>
        <tr>
            <td colspan="4">
                <input class="btn btn-inverse" id="btnBack" type="button" onclick="goUrl('${returnUrl}')" value="返回"/>
                <input type="hidden" value="${returnUrl}" id="returnUrl">
            </td>
        </tr>
        </tfoot>
        <%--<c:forEach items="${bUserPics}" var="bUserPic" >--%>
        <%--<tr>--%>
        <%--<td class="key"><strong>${bUserPic.imgName}</strong>--%>
        <%--</td>--%>

        <%--<td colspan="3"><img src="${bUserPic.imgUrl}"></td>--%>
        <%--<td><input type="button" value="删除" onclick="deleteImage('${bUserPic.id}')"></td>--%>
        <%--</tr>--%>
        <%--</c:forEach>--%>

    </table>
</div>
<!--右边框架结束-->
<script type="text/javascript">
    function deleteImage(id) {
        var userId = $("#userId").val();
        $.ajax({
            type: 'post',
            url: "deleteBUserImages",
            data: {
                userId: userId,
                id: id,
                url: $("#returnUrl").val()
            },
            success: function (msg) {
                if (msg == '1') {
                    //var params =  $("#searchForm").serialize();
                    //$("#mainContent").html($("#searchForm").submit());
                    if ($("#returnUrl").val() == '' || $("#returnUrl").val() == null) {
                        goUrl('editImages?id=' + userId);
                    } else {
                        goUrl('editImages?id=' + userId + '&url=' + $("#returnUrl").val());
                    }
                } else {
                    alert("删除失败");
                }
            }
        });
    }

    function upload(type) {

        var userId = $("#userId").val();
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
            url: 'uploadBUserImages',
            type: 'post',
            data: {
                userId: userId,
                type: type
            },
            success: function (data) {
                if (data.result == 1) {
                    if ($("#returnUrl").val() == '' || $("#returnUrl").val() == null) {
                        goUrl('editImages?id=' + userId);
                    } else {
                        goUrl('editImages?id=' + userId + '&url=' + $("#returnUrl").val());
                    }
                }
            }
        });
    }

    function checkFileIsNull(obj) {


    }


</script>