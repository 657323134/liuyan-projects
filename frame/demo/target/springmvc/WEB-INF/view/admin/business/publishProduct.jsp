<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<head>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/admin-all.css"/>
    <link rel="stylesheet" type="text/css" href="/css/validform.css"/>
    <link type="text/css" rel="stylesheet" href="/js/plugins/jBox/Skins/Blue/jbox.css"/>
</head>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>发布商品
</div>
<form id="addProduct" action="addProduct" method="post" enctype="multipart/form-data">
    <input type="hidden" value="${bUserModel.id}" name="id"/>
    <input type="hidden" value="${bUserModel.parent_id}" name="parent_id"/>
    <input type="hidden" value="${bUserModel.create_time}" name="create_time"/>
    <input type="hidden" value="${bUserModel.update_time}" name="update_time"/>
    <input type="hidden" value="${bUserModel.isDeleted}" name="isDeleted"/>
    <input type="hidden" value="${bUserModel.percentage}" name="percentage"/>
    <input type="hidden" value="${bUserModel.userType}" name="userType"/>
    <input type="hidden" value="${optType}" name="optType">
    <table class="table table-striped table-bordered edit-table">
        <thead>
        <tr>
            <td colspan="10"><b>产品信息</b>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>商品名称<font color="FF0000">*</font>
            </td>
            <td><input name="goodsname" id="goodsname" type="text" datatype="s4-20" nullmsg="请输入商品名称"
                       errorMsg="商品名称长度最多为64位"/> 0/64
            </td>
        </tr>
        <tr>
            <td>商品类目<font color="FF0000">*</font>
            </td>
            <td><select name="typeId" id="typeId">
                <c:forEach items="${tGoodsTypes}" var="tGoodsType">
                    <option value="${tGoodsType.id}"
                            <c:if test="${tgoods.typeId == tGoodsType.id}">selected="selected"</c:if>  >${tGoodsType.typeName}</option>
                </c:forEach>
            </select>
            </td>
        </tr>
        <tr>
            <td>品牌<font color="FF0000">*</font>
            </td>
            <td><input name="brandName" id="brandName" type="text" datatype="s4-20" nullmsg="请输入品牌"/>
            </td>
        </tr>
        <tr>
            <td>型号<font color="FF0000">*</font>
            </td>
            <td><input name="goodsModel" id="goodsModel" type="text" datatype="s4-20" nullmsg="请输入型号"/>
            </td>
        </tr>
        <tr>
            <td>商品缩略图<font color="FF0000">*</font>
            </td>
            <td>
                <input name="thumbnail" id="thumbnail" type="file"/>
            </td>
        </tr>
        <tr>
            <td>商品视图<font color="FF0000">*</font>
            </td>
            <td>
                <input name="goodsimage1" id="goodsimage1" type="file"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input name="goodsimage2" id="goodsimage2" type="file"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input name="goodsimage3" id="goodsimage3" type="file"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input name="goodsimage4" id="goodsimage4" type="file"/>
            </td>
        </tr>
        <tr>
            <td>商品描述<font color="FF0000">*</font>
            </td>
            <td>
                <textarea cols="10" rows="3" name="goodsremak" id="goodsremak">${tgoods.goodsremak}</textarea>
            </td>
        </tr>
        <tr>
            <td>商品详细图<font color="FF0000">*</font>
            </td>
            <td>
                <input name="detailImg" id="detailImg" type="file"/>
            </td>
        </tr>
        <tr>
            <td colspan="10"><b>销售信息</b>
            </td>
        </tr>
        <tr>
            <td>零售价<font color="FF0000">*</font>
            </td>
            <td>
                <input name="goodsprice" id="goodsprice" type="text"
                       datatype="s4-20" nullmsg="请输入零售价"/>
            </td>
        </tr>
        <%--<tr>--%>
        <%--<td>设置分红<font color="FF0000">*</font>--%>
        <%--</td>--%>
        <%--<td>--%>
        <%--<select name="bonusType" id="bonusType">--%>
        <%--<option value="1"  >单级分红设置</option>--%>
        <%--<option value="2"  >多级分红设置</option>--%>
        <%--</select>--%>
        <%--</td>--%>
        <%--</tr>--%>
        <tr>
            <td>选择金融方案<font color="FF0000">*</font>
            </td>
            <td><select name="planId" id="planId">
                <option value="" selected="selected">不限制</option>
                <c:forEach items="${tFinancialPlans}" var="tFinancialPlan">
                    <option value="${tFinancialPlan.id}"
                            <c:if test="${tgoods.planId == tFinancialPlan.id}">selected="selected"</c:if>  >${tFinancialPlan.name}</option>
                </c:forEach>
            </select>
            </td>
        </tr>

        <c:if test="${optType=='admin'}">
            <tr>
                <td>选择品牌商<font color="FF0000">*</font>
                </td>
                <td><select name="brandUserId" id="brandUserId">
                    <c:forEach items="${brandUsers}" var="brandUser">
                        <option value="${brandUser.id}"
                                <c:if test="${tgoods.bUserId == brandUser.id}">selected="selected"</c:if>  >${brandUser.name}</option>
                    </c:forEach>
                </select>
                </td>
            </tr>
        </c:if>


        </tbody>
        <tfoot>
        <tr>
            <td colspan="6">
                <input class="btn btn-inverse" id="btnSave" type="button" value="保存"/>&nbsp;
                <input class="btn btn-inverse" id="btnBack" type="button"
                       onclick="window.opener.goUrl('${goUrl}');window.opener.closeWin()" value="返回"/>&nbsp;&nbsp;<span
                    id="errorMsg" class="Validform_checktip"> </span></td>
        </tr>
        </tfoot>
    </table>
</form>
<script type="text/javascript" src="/js/admin/jquery-1.7.2.js"></script>
<script type="text/javascript">
    $("#btnSave").click(function () {
        var goodsname = $("#goodsname").val();
        var brandName = $("#brandName").val();
        var goodsModel = $("#goodsModel").val();
        var goodsremak = $("#goodsremak").val();
        var goodsprice = $("#goodsprice").val();
        if (isBlank(goodsname)) {
            alert("商品名不能为空");
            return;
        }
        if (isBlank(brandName)) {
            alert("品牌名不能为空");
            return;
        }
        if (isBlank(goodsModel)) {
            alert("型号不能为空");
            return;
        }
        if (isBlank(goodsremak)) {
            alert("商品描述不能为空");
            return;
        }
        if (isBlank(goodsprice)) {
            alert("商品价格不能为空");
            return;
        }

        $("#addProduct").submit();
    });

    function isBlank(str) {
        if (str == null || str == '' || str == undefined) {
            return true;
        }
        return false;
    }
</script>
<!--右边框架结束-->