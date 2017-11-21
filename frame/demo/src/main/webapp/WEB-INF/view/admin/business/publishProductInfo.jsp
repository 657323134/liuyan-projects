<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${basePath}/js/plugins/fancybox/jquery.fancybox.min.css"/>
<script type="text/javascript" src="${basePath}/js/plugins/fancybox/jquery.fancybox.min.js"/>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>发布商品
</div>
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
                   errorMsg="商品名称长度最多为64位" value="${tGoods.goodsname}" readonly/> 0/64
        </td>
    </tr>
    <tr>
        <td>商品类目<font color="FF0000">*</font>
        </td>
        <td><select name="typeId" id="typeId">
            <c:forEach items="${tGoodsTypes}" var="tGoodsType">
                <option value="${tGoodsType.id}"
                        <c:if test="${tGoods.typeId == tGoodsType.id}">selected="selected"</c:if>  >${tGoodsType.typeName}</option>
            </c:forEach>
        </select>
        </td>
    </tr>
    <tr>
        <td>品牌<font color="FF0000">*</font>
        </td>
        <td><input name="brandName" id="brandName" type="text" datatype="s4-20" nullmsg="请输入品牌"
                   value="${tGoods.brandName}" readonly/>
        </td>
    </tr>
    <tr>
        <td>型号<font color="FF0000">*</font>
        </td>
        <td><input name="goodsModel" id="goodsModel" type="text" datatype="s4-20" nullmsg="请输入型号"
                   value="${tGoods.goodsModel}" readonly/>
        </td>
    </tr>
    <tr>
        <td>商品描述<font color="FF0000">*</font>
        </td>
        <td>
            <textarea cols="10" rows="3" name="goodsremak" id="goodsremak" readonly>${tGoods.goodsremak}</textarea>
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
                   datatype="s4-20" nullmsg="请输入零售价" value="${tGoods.goodsprice}" readonly/>
        </td>
    </tr>
    <tr>
        <td>设置分红<font color="FF0000">*</font>
        </td>
        <td><select name="bonusType" id="bonusType">
            <c:if test="${tGoods.bonusType == 1}">
                <option value="1">单级分红设置</option>
            </c:if>
            <c:if test="${tGoods.bonusType == 2}">
                <option value="2">多级分红设置</option>
            </c:if>
        </select>
        </td>
    </tr>
    <c:forEach items="${tGoodsPics}" var="tGoodsPic">
        <tr>
            <td>
                <c:choose>
                    <c:when test="${tGoodsPic.img_name == 'thumbnail'}">商品缩略图</c:when>
                    <c:when test="${tGoodsPic.img_name == 'goodsimage1'}">商品视图1</c:when>
                    <c:when test="${tGoodsPic.img_name == 'goodsimage2'}">商品视图2</c:when>
                    <c:when test="${tGoodsPic.img_name == 'goodsimage3'}">商品视图3</c:when>
                    <c:when test="${tGoodsPic.img_name == 'goodsimage4'}">商品视图4</c:when>
                    <c:when test="${tGoodsPic.img_name == 'detailImg'}">商品详细图</c:when>
                </c:choose>
            </td>
            <td>
                <a class="group" rel="group1" data-fancybox="gallery" data-caption="商品视图" href="${tGoodsPic.img_url}">
                    <img src="${tGoodsPic.img_url}"/>
                </a>
            </td>
        </tr>
    </c:forEach>

    <!--分享链接-->
    <tr>
        <td>
            <span>商品链接</span>
        </td>
        <td>
            <span>${shareUrl}</span>
        </td>
    </tr>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="6">
            <%--<input class="btn btn-inverse" id="btnSave"  type="button" value="保存" />&nbsp;--%>
            <input class="btn btn-1" id="btnBack" type="button"
                   onclick="goUrl('productList');" value="返回"/>&nbsp;&nbsp;<span
                id="errorMsg" class="Validform_checktip"> </span></td>
    </tr>
    </tfoot>
</table>
<!--右边框架结束-->