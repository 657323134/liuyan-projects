<%--
  Created by IntelliJ IDEA.
  User: vp
  Date: 2017/8/2
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
    <input type="hidden" id="goodsid" value="${goodsid}"/>
    <input type="hidden" id="userid" value="${userid}"/>
    <input type="hidden" id="buserid" value="${buserid}"/>
</body>
<script type="text/javascript">
    window.onload=function(){

        var asb=window.location.href;
        var host=asb.indexOf("/share");
        var url = asb.substr(0,host);

        var buserid = document.getElementById("buserid").value;
        var goodsid = document.getElementById("goodsid").value;
        var userid = document.getElementById("userid").value;
        window.location.href = url + "/html/view/front/shared.html?buserid=" + buserid+"&goodsid="+goodsid + "&userid=" + userid;
    }
</script>
</html>
