//保存芝麻xinyong

function saveCredit() {

    var userid = $("#userid").val();
    var limitType = $("#limitType").val();
    var limit = $("#limit").val();
    if (isBlank(limit) || isNaN(limit)) {
        alert("信用分必须是数字！");
        return;
    }

    var creditImg = $("#creditImg").val();
    if (isBlank(creditImg)) {
        alert("未选择信用分截图");
        return;
    }

    $("#creditform").submit();

}