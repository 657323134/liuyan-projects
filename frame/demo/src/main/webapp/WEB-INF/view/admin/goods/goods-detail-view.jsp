<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap-responsive.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/admin-all.css"/>
<script type="text/javascript" src="${basePath}/js/admin/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${basePath}/js/lion-jquery.js"></script>
<title>
    商品详情
</title>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>商品详情
</div>
<form id="editForm" action="saveTGoods" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" id="id" value="${tgoods.id}"/>
    <input type="hidden" name="action" id="action" value="${action}">
    <table class="table table-striped table-bordered edit-table">
        <thead>
        <tr>
            <td colspan="4"><b>基本信息</b>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                商品名称<font color="FF0000">*</font>
            </td>
            <td>
                <input name="goodsname" id="goodsname" type="text" datatype="*2-10" nullmsg="商品名称"
                       errorMsg="商品名称长度为2-10位" value="${tgoods.goodsname}"/>
            </td>
            <td>
                商品价格<font color="FF0000">*</font>
            </td>
            <td>
                <input name="goodsprice" id="goodsprice" type="text" datatype="*2-20" nullmsg="请输入商品价格"
                       value="${tgoods.goodsprice}"/>
            </td>
        </tr>
        <tr>
            <td>
                商品图片<font color="FF0000">*</font>
            </td>
            <td>
                <input name="goodsimage" id="goodsimage" type="file"/>
            </td>
            <td>
                商品类别<font color="FF0000">*</font>
            </td>
            <td><select name="goodstype" id="goodstype">
                <option value="1"
                        <c:if test="${tgoods.goodstype == 1 }">selected="selected"</c:if>  >种类1
                </option>
                <option value="2"
                        <c:if test="${tgoods.goodstype == 2 }">selected="selected"</c:if>  >种类2
                </option>
                <option value="3"
                        <c:if test="${tgoods.goodstype == 3 }">selected="selected"</c:if>  >种类3
                </option>
            </select>
            </td>
        </tr>
        <tr>
            <td>
                商品描述<font color="FF0000">*</font>
            </td>
            <td>
                <textarea cols="10" rows="3" name="goodsremak" id="goodsremak">${tgoods.goodsremak}</textarea>
            </td>
            <td>
                首付金额<font color="FF0000">*</font>
            </td>
            <td>
                <input name="downpayment" id="downpayment" type="text" datatype="*2-20" nullmsg="请输入商品首付金额"
                       value="${tgoods.downpayment}"/>
            </td>
        </tr>
        <tr>
            <%--<td>--%>
            <%--商品详情图片(可多张)<font color="FF0000">*</font>--%>
            <%--</td>--%>
            <%--<td>--%>
            <%--<input name="goodsimagedetail" id="goodsimagedetail" type="file" />--%>
            <%--</td>--%>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="4">
                <input class="btn btn-inverse" id="btnBack" type="button"
                       onclick="goUrl('queryOrderGoodsListView?orderId=${orderId}')" value="返回"/>&nbsp;&nbsp;
                <span id="errorMsg" class="Validform_checktip"> </span></td>
        </tr>
        </tfoot>
    </table>
</form>
<script type="text/javascript">
    function goUrl(url) {
        window.location.href = url;
        return;
    }
</script>

<!--右边框架结束-->