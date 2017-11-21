<%@ page language="java" pageEncoding="UTF-8" %>
<!%
System.out.println(request.getAttribute("req_data"));
%>
<form id="periodizationFirstMoneyPay" action="https://wap.lianlianpay.com/installment.htm" method="post">
    <input type="hidden" name="req_data" value='${req_data}'/>
</form>
<script language="javascript" type="text/javascript">
    window.onload = function () {
        document.getElementById("periodizationFirstMoneyPay").submit();
    }
</script>
