<%@ page language="java" pageEncoding="UTF-8" %>
<!%
System.out.println("req_data_jsp---"+request.getAttribute("req_data"));
%>
<form id="periodizationAouth" action="https://wap.lianlianpay.com/signApply.htm" method="post">
    <input type="hidden" name="req_data" value='${req_data}'/>
</form>
<script language="javascript" type="text/javascript">
    window.onload = function () {
        document.getElementById("periodizationAouth").submit();
    }
</script>
