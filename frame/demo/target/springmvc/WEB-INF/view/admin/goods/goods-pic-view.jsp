<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/base.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap-responsive.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/admin/admin-all.css"/>
<script type="text/javascript" src="${basePath}/js/admin/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${basePath}/js/lion-jquery.js"></script>
<title>
    商品图片
</title>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>
</div>
<form id="editForm" action="addTGoodsPic" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" id="id" value="${tgoods.id}"/>
    <table class="table table-striped table-bordered edit-table">
        <tbody>

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
<div>
    <table class="table table-striped table-bordered edit-table">
        <tr>
            <td colspan="5" style="text-align: center;"><strong>图片列表</strong>
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
                </td>
            </tr>
        </c:forEach>
    </table>
    <%--<span>已添加图片：</span>
    <c:forEach items="${tGoodsPics}" var="tgoodspic">
      <div>
        id:${tgoodspic.id}  ###  图片名：${tgoodspic.img_name}  ###  地址：${tgoodspic.img_url}  />
      </div>
    </c:forEach>--%>
</div>

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

    function goUrl(url) {
        window.location.href = url;
        return;
    }


</script>
<!--右边框架结束-->