<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<script type="text/javascript">

    //关闭父窗口
    window.opener.closeWin();

    var bonusType = '${bonusType}';
    window.opener.goUrl("productList");
    if (bonusType == '2') {
        window.opener.viewDialog('grantTGoodsListMuti?goodsid=${goodsid}', '多级分红设置');
    }

</script>