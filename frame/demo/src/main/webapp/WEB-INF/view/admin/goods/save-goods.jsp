<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
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
            <td colspan="8"><b>基本信息</b>
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
            <td>
                商品类别<font color="FF0000">*</font>
            </td>
            <td><select name="typeId" id="typeId">
                <c:forEach items="${tGoodsTypes}" var="tGoodsType">
                    <option value="${tGoodsType.id}"
                            <c:if test="${tgoods.typeId == tGoodsType.id}">selected="selected"</c:if>  >${tGoodsType.typeName}</option>
                </c:forEach>
                <%--  <option value="1" <c:if test="${tgoods.typeId == 1 }">selected="selected"</c:if>  >种类1</option>
                  <option value="2" <c:if test="${tgoods.typeId == 2 }">selected="selected"</c:if>  >种类2</option>
                  <option value="3" <c:if test="${tgoods.typeId == 3 }">selected="selected"</c:if>  >种类3</option>--%>
            </select>
            </td>
            <td colspan="2">
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
                首付金额<font color="FF0000">*</font>
            </td>
            <td>
                <input name="downpayment" id="downpayment" type="text" datatype="*2-20" nullmsg="请输入商品首付金额"
                       value="${tgoods.downpayment}"/>
            </td>
            <td>
                分红金额<font color="FF0000">*</font>
            </td>
            <td>
                <input name="bonus" id="bonus" type="number" nullmsg="请输入商品分红金额" value="${tgoods.bonus}"/>
            </td>
            <td colspan="2">
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
                品牌名称<font color="FF0000">*</font>
            </td>
            <td>
                <input name="brandName" id="brandName" type="text" nullmsg="请输入品牌名称" value="${tgoods.brandName}"/>
            </td>
            <td colspan="4">
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
            <td colspan="8">
                <c:if test="${action != 'checkout'}">
                    <input class="btn btn-inverse" type="button" value="保存" onclick="checkParam()"/>&nbsp;
                </c:if>
                <input id="btnReset" class="btn btn-inverse" type="reset" value="重置"/>&nbsp;
                <input class="btn btn-inverse" id="btnBack" type="button" onclick="goUrl('queryTGoodsList')"
                       value="返回"/>&nbsp;&nbsp;
                <span id="errorMsg" class="Validform_checktip"> </span></td>
        </tr>
        </tfoot>
    </table>
</form>

<script type="text/javascript">
    <!--
    //表单提交
    //  var valiForm = $("#editForm").Validform({
    //    btnSubmit : "#btnSave",
    //    tiptype : function(msg, o, cssctl) {
    //      var objtip = $("#errorMsg");
    //      cssctl(objtip, o.type);
    //      objtip.text(msg);
    //    },
    //    postonce : true,
    //    ajaxPost : true,
    //    callback : function(data) {
    //      alert(data.info);
    //      if (data.status == 'y') {
    //        goUrl('queryTGoodsList');
    //      }
    //    }
    //  });
    //  $.Tipmsg.r = "";

    function checkParam() {
        var goodsname = $("#goodsname").val();
        var goodsprice = $("#goodsprice").val();
        var goodsremak = $("#goodsremak").val();
        if (goodsname == '') {
            alert("商品名不能为空！");
            return;
        }
        var reg = /^\d+(\.\d+)?$/;
        if (goodsprice == '' || !reg.test(goodsprice)) {
            alert("商品价格必须是数字！");
            return;
        }
        if (goodsremak == '') {
            alert("商品描述不能为空!");
            return;
        }
        ajaxAddGoods();
    }


    // 添加
    function ajaxAddGoods() {
        var param = encodeURI(encodeURI('id=' + $("#id").val() + '&action=' + $("#action").val() + '&goodsname=' + $("#goodsname").val() + '&goodsprice=' + $("#goodsprice").val() + '&goodsremak=' + $("#goodsremak").val() + '&goodstype=' + $("#goodstype  option:selected").val() + "&downpayment=" + $("#downpayment").val() + "&typeId=" + $("#typeId").val() + "&bonus=" + $("#bonus").val() + "&brandName=" + $("#brandName").val()));

        //单个文件上传
        $.ajaxFileUpload({
            url: '/admin/saveTGoods?' + param, //用于文件上传的服务器端请求地址
            secureuri: false, //一般设置为false
            fileElementId: ['goodsimage'], //文件上传空间的id属性  <input type="file" id="file" name="file" />
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: 'json', //返回值类型 一般设置为json
            success: function (data, status) //服务器成功响应处理函数
            {
                var dataObj = eval("(" + data + ")");
                if (dataObj.status == 'true') {
//        alert(dataObj.msg);
                    goUrl('queryTGoodsList');//跳转
                } else {
//        alert(dataObj.msg);
                    goUrl('queryTGoodsList');
                }
                // alert(data.msg);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
//      alert("failed");
                // goUrl('queryTGoodsList');
                // alert(data.msg);
            }
        });
    }

    //-->
</script>
<!--右边框架结束-->