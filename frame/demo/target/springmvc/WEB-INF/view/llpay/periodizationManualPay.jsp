<%@ page language="java" pageEncoding="UTF-8" %>
<!%
System.out.println(request.getAttribute("req_data"));
%>
<form id="periodizationManualPay" action="https://repaymentapi.lianlianpay.com/bankcardrepayment.htm" method="post">
    <input type="hidden" name="req_data" value='${req_data}'/>
</form>
<script language="javascript" type="text/javascript">
    window.onload = function () {
        document.getElementById("periodizationManualPay").submit();
    }
</script>
