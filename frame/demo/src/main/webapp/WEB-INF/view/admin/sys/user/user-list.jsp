<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>用户列表
</div>
<form id="searchForm" action="queryCUserList">
    <table class="table table-striped table-bordered search-table">
        <thead>
        <tr>
            <td colspan="10" class="auto-style2">&nbsp;请填写查询条件
                <input id="curPage" name="curPage" type="hidden" value="1"/>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>用户名</td>
            <td class="detail">
                <input id="userName" class="dinp" name="userName" type="text" value="${model.userName }"/>
            </td>
            <td>手机号码</td>
            <td>
                <input id="cellPhone" name="cellPhone" class="dinp" type="text" value="${model.cellPhone }"/>
            </td>
            <td>真实姓名</td>
            <td>
                <input id="realName" name="realName" class="dinp" type="text" value="${model.realName }"/>
            </td>
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
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">序号</td>
        <td class="auto-style1">状态</td>
        <td class="auto-style1">最新审核意见</td>
        <td class="auto-style1">审核人</td>
        <td class="auto-style1">用户名</td>
        <td class="auto-style1">真实姓名</td>
        <td class="auto-style1">性别</td>
        <td class="auto-style1" style="width: 100px;">手机号码</td>
        <td class="auto-style1" style="width: 120px;">创建时间</td>
        <td class="auto-style1">身份证号</td>
        <%--
                    <td class="auto-style1">车牌号</td>
        --%>
        <td class="auto-style1">操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
            <td><a>${bean.id } </a>
            </td>
            <td><a>
                <c:choose>
                    <c:when test="${bean.status == '' || bean.status == null}">资料待完善</c:when>
                    <c:when test="${bean.status == 1}">待审核</c:when>
                    <c:when test="${bean.status == 2}">审核通过</c:when>
                    <c:when test="${bean.status == 3}">审核不通过</c:when>
                    <c:when test="${bean.status == 4}">回退中</c:when>
                </c:choose>
            </a></td>
            <td>${bean.auditRemark}</td>
            <td>${bean.auditor}</td>
            <td>${bean.userName}</td>
            <td> ${bean.realName} </td>
            <td>
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

                    <%--<c:choose>
                        <c:when test="${bean.sex==1 }">男</c:when>
                        <c:when test="${bean.sex==2 }">女</c:when>
                        <c:otherwise>未知</c:otherwise>
                    </c:choose>--%>
            </td>
            <td>${bean.cellPhone}</td>
            <td>
                <fmt:formatDate value="${bean.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${bean.cardid}
            </td>
                <%--	<td>
                        ${bean.carnum}
                    </td>--%>
            <td>
                    <%--
                                        <input class="btn btn-inverse" type="button" value="修改" onclick="goUrl('updateCUserInfo?id=${bean.id}');" />&nbsp;
                    --%>
                <input class="btn btn-inverse" type="button" value="查看"
                       onclick="goUrl('queryCUserIndex?id=${bean.id}');"/>&nbsp;
                <input class="btn btn-inverse" type="button" value="签约信息"
                       onclick="querySignInfo('${bean.id}');"/>&nbsp;
                <input class="btn btn-inverse" type="button" value="审核"
                       onclick="goCheck('${bean.id}','${bean.status}');"/>&nbsp;
            </td>
        </tr>
    </c:forEach>
    <tr class="tr_pagenumber">
        <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit }"
                                    totalCount="${page.totalCount }"/></td>
    </tr>
    </tbody>
</table>
<script type="text/javascript">
    <!--
    $(function () {
        $(".isEnableCls").val('${model.isEnable}');
        $(".whereSource").val('${model.source}');
    });

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

    function querySignInfo(id) {
        openWindow("querySignInfo?userId=" + id, "签约信息", 800, 400);
    }
    function openWindow(url, name, iWidth, iHeight) {
        var url;                                 //转向网页的地址;
        var name;                           //网页名称，可为空;
        var iWidth;                          //弹出窗口的宽度;
        var iHeight;                        //弹出窗口的高度;
        var iTop = (window.screen.availHeight - 30 - iHeight) / 2;       //获得窗口的垂直位置;
        var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;           //获得窗口的水平位置;
        window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
    }

    //-->
</script>
<!--右边框架结束-->