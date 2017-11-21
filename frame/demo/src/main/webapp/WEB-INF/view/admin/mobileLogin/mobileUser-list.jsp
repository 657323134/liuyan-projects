<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <title>优卡分期</title>

    <link rel="stylesheet" href="${basePath}/css/admin//bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/mobileAdmin-all.css"/>
    <script type="text/javascript" src="${basePath}/js/admin/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/lion-jquery.js"></script>
    <script type="text/javascript" src="${basePath}/js/admin/jquery-ui-1.8.22.custom.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/admin/index.js"></script>
    <script type="text/javascript" src="${basePath}/js/layer.min.js"></script>

</head>
<body>
<div id="mainContent">
<div>
    <h3 style="text-align: center">用户列表</h3>
</div>
<!--右边框架开始-->
<form id="searchForm" action="queryCUserList">
    <table class="table table-striped table-bordered search-table">

        <tbody>
        <td class="auto-style" colspan="2">&nbsp;请填写查询条件
            <input id="curPage" name="curPage" type="hidden" value="1"/>
        </td>
        <tr>
            <td>真实姓名</td>
            <td>
                <input id="realName" name="realName" class="dinp" type="text" value="${model.realName }"/>
            </td>
        </tr>
        <tr>
            <td>手机号码</td>
            <td>
                <input id="cellPhone" name="cellPhone" class="dinp" type="text" value="${model.cellPhone }"/>
            </td>
        </tr>
        <tr>
            <td>审核状态</td>
            <td colspan="5">
                <select name="auditStatus" id="auditStatus" class="repayStatusCls">
                    <option value="">--请选择--</option>
                    <option value="1" <c:if test="${model.auditStatus == 1}">selected</c:if>>待审核</option>
                    <option value="2" <c:if test="${model.auditStatus == 2}">selected</c:if>>审核通过</option>
                    <option value="3" <c:if test="${model.auditStatus == 3}">selected</c:if>>审核不通过</option>
                    <option value="4" <c:if test="${model.auditStatus == 4}">selected</c:if>>回退中</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="10" align="right">
                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>
            </td>
        </tr>
        </tbody>
    </table>
</form>

    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <div class="data-trst">
            <div class="data-trst-z">
                <tr><strong>序号:</strong>&nbsp<a>${bean.id}</a></tr>
                <span class="zhunag-t"><strong>状态:</strong>&nbsp<a>
                <c:choose>
                    <c:when test="${bean.status == '' || bean.status == null}">资料待完善</c:when>
                    <c:when test="${bean.status == 1}"><span style="color: black; background-color: yellow; font-size: 16px">待审核</span></c:when>
                    <c:when test="${bean.status == 2}"><span style="color: green">审核通过</span></c:when>
                    <c:when test="${bean.status == 3}"><span style="color: red">审核不通过</span></c:when>
                    <c:when test="${bean.status == 4}">回退中</c:when>
                </c:choose>
                </a></span>
            </div>
            <div class="data-trst-x">
                <tr><strong>真实姓名:</strong>&nbsp${bean.realName}</tr>
                <span class="xing-b"><strong>性别:</strong>&nbsp
                <c:choose>
                    <c:when test="${bean.cardid != null && fn:length(bean.cardid) >= 18}">
                        <c:if test="${fn:substring(bean.cardid, 16, 17)%2==1}">
                            男
                        </c:if>
                        <c:if test="${fn:substring(bean.cardid, 16, 17)%2==0}">
                            女
                        </c:if>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                 </c:choose>
                </span>
            </div>

            <tr><strong>手机号:</strong>&nbsp${bean.cellPhone}</tr><br/>
            <tr><strong>创建时间:</strong>&nbsp
                <fmt:formatDate value="${bean.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </tr><br/>
            <tr><strong>身份证号:</strong>&nbsp
                    ${bean.cardid}
            </tr>
            <br/>
            <div style="padding-left: 55%">
                <input class="btn btn-inverse data-btn1" type="button" value="查看"
                       onclick="goUrl('queryCUserIndex?id=${bean.id}');"/>&nbsp;
                <input class="btn btn-inverse data-btn2" type="button" value="审核"
                       onclick="goCheck('${bean.id}','${bean.status}');"/>&nbsp;
            </div>

        </div>
    </c:forEach>

        <div class="tr_pagenumber">
            <div><my:pager curPage="${page.page }" pageSize="${page.limit }"
                          totalCount="${page.totalCount }"/></div>
        </div>


</div>
</body>

<script type="text/javascript">

    $(function () {
        $(".isEnableCls").val('${model.isEnable}');
        $(".whereSource").val('${model.source}');
    });


    function goUrl(url) {
        window.location.href = url;
    }

    function goCheck(id, status) {
        if (status == '' || status == null) {
            layer.alert('用户资料待补充，暂不能审核');
            return;
        }
        if (status != '1') {
            layer.alert('用户已经被审核，不能重复审核');
            return;
        }
        goUrl('checkCUserIndex?id=' + id);
    }


    function turnPage(curPage) {
        $("#curPage").val(curPage);
        queryForm();
    }
    function queryForm() {
        var url = $("#searchForm").attr("action");
        var arrays = $("#searchForm").serializeArray();
        $.lionPost(url, arrays, function (data) {
            $("#mainContent").html(data);
        });
    }
    function resetForm() {
        var url = $("#searchForm").attr("action");
        var arrays = null;
        $.lionPost(url, arrays, function (data) {
            $("#mainContent").html(data);
        });
    }

</script>
<!--右边框架结束-->
</html>