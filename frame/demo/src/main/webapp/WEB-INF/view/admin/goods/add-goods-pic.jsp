<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>商品详情
</div>
<form id="editForm" action="addTGoodsPic" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" id="id" value="${tgoods.id}"/>
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
                商品名：
            </td>
            <td colspan="3">
             ${tgoods.goodsname}
            </td>
        </tr>
        <tr>
            <td colspan="4"><b>已添加图片：</b>
            </td>
        </tr>
        <c:forEach items="${tGoodsPics}" var="tgoodspic">
            <tr>
                <td class="key" style="width: 100px;"><strong>${tgoodspic.img_name}：</strong>
                </td>
                <td colspan="3">
                    <a href="${imageHost}${tgoodspic.img_url}" target="_blank">
                        <img src="${imageHost}${tgoodspic.img_url}" alt="${tgoodspic.img_name}"
                             style="width:80px;height: 50px;">
                    </a>
                    <input type="button" value="删除" onclick="goUrl('deleteTGoodsPic?id='+${tgoodspic.id})">
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td>
                商品图片<font color="FF0000">*</font>
            </td>
            <td>
                <input name="goodsimages" id="goodsimages" type="file" multiple/>
            </td>
            <td colspan="2"></td>
        </tr>

        <tr>
            <td colspan="4">
                <input class="btn btn-inverse" type="button" value="上传" onclick="uploadpic()"/>&nbsp;
                <input class="btn btn-inverse" id="btnBack" type="button" onclick="goUrl('queryTGoodsList')"
                       value="返回"/>&nbsp;&nbsp;
                <span id="errorMsg" class="Validform_checktip"> </span></td>
        </tr>
        </tbody>

    </table>
</form>

<script type="text/javascript">
    //提交上传图片
    function uploadpic() {

        var param = encodeURI(encodeURI('id=' + $("#id").val()));
        $.ajaxFileUpload({
            url: '/admin/addTGoodsPic?' + param, //用于文件上传的服务器端请求地址
            secureuri: false, //一般设置为false
            fileElementId: ['goodsimages'], //文件上传空间的id属性  <input type="file" id="file" name="file" />
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: 'json', //返回值类型 一般设置为json
            success: function (data, status) //服务器成功响应处理函数
            {
                var dataObj = eval("(" + data + ")");
//        alert(dataObj.status);
                if (dataObj.status == '1') {
                    goUrl('toAddTGoodsPic?id=' + $("#id").val());
                } else {
                    goUrl('toAddTGoodsPic?id=' + $("#id").val());
                }
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
//        alert("failed");
                goUrl('toAddTGoodsPic?id=' + $("#id").val());
                // alert(data.msg);
            }
        });


//      $("#editForm").submit();
    }


</script>
<!--右边框架结束-->