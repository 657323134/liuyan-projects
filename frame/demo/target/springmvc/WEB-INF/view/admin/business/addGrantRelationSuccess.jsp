<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<script type="text/javascript">

    //关闭父窗口
    window.opener.closeWin();
    window.opener.goUrl("toGrantTGoods?goodsid=${goodsid}");

</script>
