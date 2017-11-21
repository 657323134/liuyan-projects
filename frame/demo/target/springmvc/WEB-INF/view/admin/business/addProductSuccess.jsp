<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<c:set var="url" value="${goUrl}"></c:set>
<c:if test="${url==''|| url==null}">
    <c:set var="url" value="productList"></c:set>
</c:if>
<input type="hidden" id="a" value="${url}">

<script type="text/javascript">

    //关闭父窗口
    window.opener.closeWin();

    window.opener.goUrl(document.getElementById("a").value);

</script>
