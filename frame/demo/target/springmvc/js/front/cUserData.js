//添加紧急联系人
$("#addEmergencyContact").click(function () {
    var count = parseInt($("#Contactcount").val()) + 1;
    if (count == 3) {
        $(this).hide();
    }
    $("#cEmergencyContact" + count).css("display", "block");
    $("#Contactcount").val(count);
});



//姓名
$("#realName").change(function () {
    saveCUserToSession($("#cellPhone").val(),"realName", $("#realName").val());
});
//身份证号
$("#cardid").change(function () {

    if (!checkIdcard($("#cardid").val())) {
        alert("身份证号不正确，请重新填写");
        return;
    }
    var marryStatus = $("#marryStatus").val();
    check(marryStatus);
    saveCUserToSession($("#cellPhone").val(),"cardid", $("#cardid").val());
});
function check(code){
    if(code==2){
        $("#cEmergencyContact1").show();
        $("#cEmergencyContact2").show();
        $("#cEmergencyContact3").hide();
    }
    if(code==1 ||code==3){
        $("#cEmergencyContact1").hide();
    }

}
//身份证号
$("#validityTime").change(function () {
    var marryStatus = $("#marryStatus").val();
    check(marryStatus);
    saveCUserToSession($("#cellPhone").val(),"validityTime", $("#validityTime").val());
});
//婚姻
$("#marryStatus").change(function () {
    var status = $("#marryStatus").val();
    if (status == 2) {
        $("#cEmergencyContact1").show();
        $("#cEmergencyContact2").show();
        $("#cEmergencyContact3").hide();

        $("#cEmergencyContact3Mask").hide();
    }
    if (status == 1) {
        $("#cEmergencyContact1").hide();
        $("#cEmergencyContact2").show();
        $("#cEmergencyContact3").show();

        $("#cEmergencyContact1Mask").hide();
    }
    if (status == 3 ) {
        $("#cEmergencyContact1").hide();
        $("#cEmergencyContact2").show();
        $("#cEmergencyContact3").show();

        $("#cEmergencyContact1Mask").hide();

    }
    saveCUserToSession($("#cellPhone").val(),"marryStatus", $("#marryStatus").val());
    console.info("这里执行了:"+$("#marryStatus").val());
    if($("#marryStatus").val()==2){
        saveCUserToSession($("#cellPhone").val(),"relation1",33);
    }
});
//行业
$("#industry").change(function () {
    var marryStatus = $("#marryStatus").val();
    check(marryStatus);
    saveCUserToSession($("#cellPhone").val(),"industry", $("#industry").val());
});
//单位
$("#companyName").change(function () {

    saveCUserToSession($("#cellPhone").val(),"companyName", $("#companyName").val());
});
//单位地址
$("#companyAddress").change(function () {
    saveCUserToSession($("#cellPhone").val(),"companyAddress", $("#city-picker3").val());
});
//单位详细地址
$("#companyArea").change(function () {
    saveCUserToSession($("#cellPhone").val(),"companyArea", $("#companyArea").val());
});
//座机电话
$("#landline").change(function () {
    saveCUserToSession($("#cellPhone").val(),"landline", $("#landline").val());
});
//工作年限
$("#workYear").change(function () {
    saveCUserToSession($("#cellPhone").val(),"workYear", $("#workYear").val());
});
//职位
$("#position").change(function () {
    saveCUserToSession($("#cellPhone").val(),"position", $("#position").val());
});
//月收入
$("#monthIncome").change(function () {
    saveCUserToSession($("#cellPhone").val(),"monthIncome", $("#monthIncome").val());
});

//紧急联系人
//姓名
$("#name1").change(function () {
    var marryStatus = $("#marryStatus").val();
    check(marryStatus);
    saveCUserToSession($("#cellPhone").val(),"name1", $("#name1").val());
});
//关系
$("#relation1").change(function () {
    var marryStatus = $("#marryStatus").val();
    check(marryStatus);
    saveCUserToSession($("#cellPhone").val(),"relation1", $("#relation1").val());
});
//电话
$("#phone1").change(function () {
    var marryStatus = $("#marryStatus").val();
    check(marryStatus);
    var phone1 = $("#phone1").val();
    var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
    if(reg.test(phone1) == false){
        alert("手机号不合法");
        $("#phone1").val(null);
        return;
    }
    var cellPhone = $("#cellPhone").val();
    if(phone1==cellPhone){
        alert("不能为本人电话");
        $("#phone1").val(null);
        return;
    }else {
        saveCUserToSession($("#cellPhone").val(),"phone1", $("#phone1").val());
    }
});

//晋级联系人2
$("#name2").change(function () {
    saveCUserToSession($("#cellPhone").val(),"name2", $("#name2").val());
});
//关系
$("#relation2").change(function () {

    saveCUserToSession($("#cellPhone").val(),"relation2", $("#relation2").val());
});
//电话
$("#phone2").change(function () {
    var phone2 = $("#phone2").val();
    var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
    if(reg.test(phone2) == false){
        alert("手机号不合法");
        $("#phone2").val(null);
        return;
    }
    var cellPhone = $("#cellPhone").val();
    if(phone2==cellPhone){
        alert("不能为本人电话");
        $("#phone2").val(null);
        return;
    }else {
        saveCUserToSession($("#cellPhone").val(),"phone2", $("#phone2").val());
    }
});
//晋级联系人3
$("#name3").change(function () {
    saveCUserToSession($("#cellPhone").val(),"name1", $("#name3").val());
});
//关系
$("#relation3").change(function () {
    saveCUserToSession($("#cellPhone").val(),"relation1", $("#relation3").val());
});
//电话
$("#phone3").change(function () {
    var phone3 = $("#phone3").val();
    var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
    if(reg.test(phone3) == false){
        alert("手机号不合法");
        $("#phone3").val(null);
        return;
    }
    var cellPhone = $("#cellPhone").val();
    if(phone3==cellPhone){
        alert("不能为本人电话");
        $("#phone3").val(null);
        return;
    }else {
        saveCUserToSession($("#cellPhone").val(),"phone1", $("#phone3").val());
    }
});

//车况信息
$("#car_model").change(function () {
    var marryStatus = $("#marryStatus").val();
    check(marryStatus);
    var cellPhone = $("#cellPhone").val();
    saveCUserToSession(cellPhone,"car_model", $("#car_model").val());
});
$("#car_num").change(function () {
    var marryStatus = $("#marryStatus").val();
    check(marryStatus);
    var carNum = $(this).val().toUpperCase(); //转为大写
    $(this).val(carNum);
    if(carNum.length>6 || carNum.length<5){
        alert("请填写正确的车牌号码");
        return;
    }

    var carNum = $("#carCodeArea").html() + carNum;

    var cellPhone = $("#cellPhone").val();
    var car= removeSpaces(carNum);
    saveCUserToSession(cellPhone,"car_num", car);

});
$("#car_date").change(function () {
    var marryStatus = $("#marryStatus").val();
    check(marryStatus);
    var cellPhone = $("#cellPhone").val();
    saveCUserToSession(cellPhone,"car_date", $("#car_date").val());
});
$("#car_price").change(function () {
    var marryStatus = $("#marryStatus").val();
    check(marryStatus);
    var cellPhone = $("#cellPhone").val();
    saveCUserToSession(cellPhone,"car_price", $("#car_price").val());

});
//银行卡信息
$("#bank").change(function () {
    var cellPhone = $("#cellPhone").val();
    saveCUserToSession(cellPhone,"banktypeId", $("#bank").val());
});
$("#bankcard").change(function () {
    if (!luhmCheck($("#bankcard").val())) {
        alert("银行卡号不正确，请重新填写");
        return;
    }
   // saveUserBankToSession("bankAccount", $("#bankcard").val());
    var cellPhone = $("#cellPhone").val();
    saveCUserToSession(cellPhone,"bankAccount", $("#bankcard").val());
});



function saveCUserInfo(ifBack) {

    var userid = $("#userid").val();
    //基本信息
    var realName = $("#realName").val();
    if (isBlank(realName)) {
        alert("真实姓名不能为空");
        return false;
    }
    if (checkChineseName(realName) != 0) {
        alert("请输入符合条件的中文姓名！");
        return false;
    }
    var cardid = $("#cardid").val();
    if (isBlank(cardid)) {
        alert("身份证号不能为空");
        return false;
    }
    if (!checkIdcard(cardid)) {
        alert("身份证号不正确，请重新填写");
        return false;
    }
    var validityTime = $("#validityTime").val();
    if (isBlank(validityTime)) {
        alert("身份证有效时间不能为空");
        return false;
    }
    var marryStatus = $("#marryStatus").val();
    if (marryStatus == 0) {
        alert("婚姻状态不能为空！");
        return false;
    }

    //紧急联系人  第一联系人  夫妻
    if ($("#cEmergencyContact1").css("display") == 'block') {
        var name1 = $("#name1").val();
        if (isBlank(name1)) {
            alert("配偶联系人姓名不能为空");
            return false;
        }
        var relation1 = $("#relation1").val();
        if (isBlank(relation1) || relation1 == 0) {
            alert("配偶联系人关系不能为空");
            return false;
        }
        var phone1 = $("#phone1").val();
        if (isBlank(phone1) || phone1 == null || phone1 == '') {
            alert("配偶联系人电话不能为空");
            return false;
        }
        var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
        if(reg.test(phone1) == false){
            alert("手机号不合法");
            $("#phone1").val(null);
            return false;
        }
    };

    //第二联系人
    if ($("#cEmergencyContact2").css("display") == 'block') {
        var name2 = $("#name2").val();
        if (isBlank(name2)) {
            alert("直系联系人姓名不能为空");
            return false;
        }
        var relation2 = $("#relation2").val();
        if (isBlank(relation2) || relation2 == 0) {
            alert("直系联系人关系不能为空");
            return false;
        }
        var phone2 = $("#phone2").val();
        if (isBlank(phone2) || phone2 == null || phone2 == '') {
            alert("直系联系人电话不能为空");
            return false;
        }
        var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
        if(reg.test(phone2) == false){
            alert("手机号不合法");
            $("#phone2").val(null);
            return false;
        }
    };

    //第三联系人
    if ($("#cEmergencyContact3").css("display") == 'block') {
        var name3 = $("#name3").val();
        if (isBlank(name3)) {
            alert("其他联系人姓名不能为空");
            return false;
        }
        var relation3 = $("#relation3").val();
        if (isBlank(relation3) || relation3 == 0) {
            alert("其他联系人关系不能为空");
            return false;
        }
        var phone3 = $("#phone3").val();
        if (isBlank(phone3) || phone3 == null || phone3 == '') {
            alert("其他联系人电话不能为空");
            return false;
        }
        var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
        if(reg.test(phone3) == false){
            alert("手机号不合法");
            $("#phone3").val(null);
            return false;
        }
    };

    //判断三个电话不能相同
    var setPhone = new Set();
    setPhone.add(phone2);
    if ($("#cEmergencyContact1").css("display") == 'block') {
        setPhone.add(phone1);
    } else {
        setPhone.add(phone3);
    }
    if (setPhone.size < 2) {
        alert("联系人的联系方式不能相同");
        return false;
    }

    if(phone1==phone2 || phone2==phone3 || phone1==phone3){
        alert("联系人的联系方式不能相同");
        return false;
    }
    var cellPhone = $("#cellPhone").val();
    if (phone1==cellPhone || phone2==cellPhone || phone3==cellPhone) {
        alert("联系人电话不能为本人电话");
        return false;
    }

    if(name1==name2 || name2==name3 || name1==name3){
        alert("联系人姓名不能相同");
        return false;
    }

    //车况信息
    var car_model = $("#car_model").val();
    if (isBlank(car_model)) {
        alert("品牌型号不能为空");
        return false;
    }
    var car_num = $("#car_num").val();
    if (isBlank(car_num)) {
        alert("车牌号不能为空");
        return false;
    }
    if(car_num.length>6 || car_num.length<5){
        alert("请输入正确的车牌号");
        return false;
    }
   var car_date = $("#car_date").val();
    if (isBlank(car_date)) {
        alert("购买日期不能为空");
        return false;
    }
    var car_price = $("#car_price").val();
    if (isBlank(car_price) || car_price == 0) {
        alert("车辆价格不能为空");
        return false;
    }
    if (isNaN(car_price)) {
        alert("车辆价格必须为数字");
        return false;
    }
    if (!ifBack) {
        var cardidImgA = $("#cardidImgA").val();
        if(cardidImgA==null || cardidImgA==""){
            alert("请上传身份证正面照");
            return false;
        }
        var cardidImgB = $("#cardidImgB").val();
        if(cardidImgB==null ||cardidImgB==''){
            alert("请上传身份证反面照");
            return false;
        }
        var carImgA = $("#carImgA").val();
        if(carImgA==null ||carImgA==''){
            alert("请上传驾驶证副本照");
            return false;
        }
    }

    var code = $("#carCodeArea").html();
    if(code!=null || code !=''){
        var carNum =$("#car_num").val().toLocaleUpperCase();
        var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？\\s]");
        if(pattern.test(carNum)){
            alert("车牌号不能包含特殊字符以及空格");
            return false;
        }
    }

    //校验手机
    $.ajax({
        url: '/cuser/userDataCheck',
        type: 'POST',
        data: {
            userid: userid,
            cardid: cardid,
            carNum:$("#car_num").val()

            //bankcard: bankcard
        },
        beforeSend:function () {
            //点击下一步之后禁止连续点击
            $("#id-next-btn").css("background","#AF5D62").removeAttr("onclick");
            $("#loading-imgBox").show();
        },
        success: function (msg) {
            console.log(msg);
            if (msg.status == 'success') {
                $("#cuserform").submit();
                $("#loading-imgBox").hide();
            } else {
                alert(msg.errmsg);
                $("#id-next-btn").css("background","#EF2034").attr("onclick","saveCUserInfo()");
                $("#loading-imgBox").hide();
            }
        },
        error: function(){
                $("#id-next-btn").css("background","#EF2034").attr("onclick","saveCUserInfo()");
                $("#loading-imgBox").hide();
        }
    });

}

function checkWorkInfo(){
    //工作信息
    var industry = $("#industry").val();
    if (industry == -1 || industry == undefined) {
        alert("请选择所属行业");
        return false;
    }
    var companyName = $("#companyName").val();
    if($('#danName').css("display") == 'block'){
        if (isBlank(companyName)){
            alert("公司名不能为空");
            return false;
        }
    }
    var companyAddress = $("#city-picker3").val();
    console.log(companyAddress);
    if (isBlank(companyAddress)) {
        alert("单位地址不能为空");
        return false;
    }
    var companyArea = $("#companyArea").val();
    if (isBlank(companyArea)) {
        alert("详细地址不能为空");
        return false;
    }
    var landline = $("#landline").val();
    if (isBlank(landline)) {
        alert("公司联系电话不能为空");
        return false;
    }
    var cellPhone = $("#cellPhone").val();
    if(cellPhone == landline){
        alert("公司联系电话不能为本人电话");
        return false;
    }
    var workYear = $("#workYear").val();
    if (workYear == 0) {
        alert("工作年限不能为空！");
        return false;
    }
    var position = $("#position").val();
    if (position == 0) {
        alert("职位不能为空！");
        return false;
    }
    var monthIncome = $("#monthIncome").val();
    if (monthIncome == 0) {
        alert("月收入不能为空！");
        return false;
    }
    $('#workInfo').submit();
}

function checkBankCard(){
    var bank = $("#bank").val();
    var daikou= $("#daikou").val();
    if (bank == 0) {
        alert("银行不能为空！");
        return false;
    }
    var bankcard = $("#bankcard").val();
    if (isBlank(bankcard)) {
        alert("银行卡号不能为空");
        return false;
    }
    var isPass = 0;
    if (!luhmCheck(bankcard)) {
        alert("银行卡号不正确，请重新填写");
        isPass =1;
        return false;
    }
    if(!$('#daikou').attr('checked')){
        alert("请先选择代扣");
        return false;
    }
    if($("#Msg").val()=='证件号有误'){
        alert("对不起您的证件号不正确");
        return false;
    }
    var banks= removeSpaces(bank);
    var bankcard = removeSpaces(bankcard);
    $.ajax({
        url:'/cuser/saveCar',
        data:{
            'bank':banks,
            'bankcard':bankcard
        },
        dataType:'JSON',
        type:'POST',
        beforeSend:function () {
            //点击下一步之后禁止连续点击
            $("#nextStep-btn").css("background","#AF5D62").removeAttr("onclick");
        },
        success:function(data){
            if(data!=null){
                /*签约*/
                if(data.sq=='sq'){
                    var user_id = data.user_id;
                    var acct_name = data.acct_name;
                    var card_no = data.card_no;
                    var id_no = data.id_no;
                    var cellPhone = data.cellPhone;
                    var createTime = data.createTime;
                    window.location.href="/PeriodizationPay/firstPay?acct_name="+acct_name+"&user_id="+user_id+"&card_no="+card_no+"&id_no="+id_no+"&cellPhone="+cellPhone+"&createTime="+createTime
                }
                if(data.msg=="tiaozhuan"){
                    window.location.href="/cuser/credit.htm"
                }
                if(data.error=="error"){
                    alert("银行卡与银行不匹配");
                    return;
                }
                if(data.card_tye=="error"){
                    alert("对不起，当前不支持信用卡");
                    return;
                }
                if(data.login=='login'){
                    window.location.href="/cuser/register.htm";
                }
            }
            $("#nextStep-btn").css("background","#EF2034").attr("onclick","checkBankCard()");
        },
        error: function(){
            $("#nextStep-btn").css("background","#EF2034").attr("onclick","checkBankCard()");
        }
    });

}

function luhmCheck(bankno) {
    if (bankno.length == 20) {
        return true;
    }

    var lastNum = bankno.substr(bankno.length - 1, 1);//取出最后一位（与luhm进行比较）

    var first15Num = bankno.substr(0, bankno.length - 1);//前15或18位
    var newArr = new Array();
    for (var i = first15Num.length - 1; i > -1; i--) {    //前15或18位倒序存进数组
        newArr.push(first15Num.substr(i, 1));
    }
    var arrJiShu = new Array();  //奇数位*2的积 <9
    var arrJiShu2 = new Array(); //奇数位*2的积 >9

    var arrOuShu = new Array();  //偶数位数组
    for (var j = 0; j < newArr.length; j++) {
        if ((j + 1) % 2 == 1) {//奇数位
            if (parseInt(newArr[j]) * 2 < 9)
                arrJiShu.push(parseInt(newArr[j]) * 2);
            else
                arrJiShu2.push(parseInt(newArr[j]) * 2);
        }
        else //偶数位
            arrOuShu.push(newArr[j]);
    }

    var jishu_child1 = new Array();//奇数位*2 >9 的分割之后的数组个位数
    var jishu_child2 = new Array();//奇数位*2 >9 的分割之后的数组十位数
    for (var h = 0; h < arrJiShu2.length; h++) {
        jishu_child1.push(parseInt(arrJiShu2[h]) % 10);
        jishu_child2.push(parseInt(arrJiShu2[h]) / 10);
    }

    var sumJiShu = 0; //奇数位*2 < 9 的数组之和
    var sumOuShu = 0; //偶数位数组之和
    var sumJiShuChild1 = 0; //奇数位*2 >9 的分割之后的数组个位数之和
    var sumJiShuChild2 = 0; //奇数位*2 >9 的分割之后的数组十位数之和
    var sumTotal = 0;
    for (var m = 0; m < arrJiShu.length; m++) {
        sumJiShu = sumJiShu + parseInt(arrJiShu[m]);
    }

    for (var n = 0; n < arrOuShu.length; n++) {
        sumOuShu = sumOuShu + parseInt(arrOuShu[n]);
    }

    for (var p = 0; p < jishu_child1.length; p++) {
        sumJiShuChild1 = sumJiShuChild1 + parseInt(jishu_child1[p]);
        sumJiShuChild2 = sumJiShuChild2 + parseInt(jishu_child2[p]);
    }
    //计算总和
    sumTotal = parseInt(sumJiShu) + parseInt(sumOuShu) + parseInt(sumJiShuChild1) + parseInt(sumJiShuChild2);

    //计算Luhm值
    var k = parseInt(sumTotal) % 10 == 0 ? 10 : parseInt(sumTotal) % 10;
    var luhm = 10 - k;

    if (bankno.length >= 15) {
        if (lastNum == luhm) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

function removeSpaces(date){
    var text=date.replace(/\s/ig,'');

    return text;
}

//审核回退不通过信息提示
function noPassColumns(backColumns,marryStatus) {
    var backColumns=backColumns.slice("backColumns.length","-1");
    var backColumnsArray=backColumns.split(",");

    for (var i= 0;i<backColumnsArray.length;i++) {
        if(backColumnsArray[i]){
            $("[name='"+backColumnsArray[i]+"']").css("color","red");
            $("[name='"+backColumnsArray[i]+"']").parent().css("borderColor","red");

             //判断已婚或未婚
            if (marryStatus==2) { // 已婚  emergencyContactName0", "relation0", "contactPhone0", "emergencyContactName1", "relation1", "contactPhone1",
                if ("emergencyContactName0" == backColumnsArray[i]) {
                    $("[name='name1']").css("color","red");
                    $("[name='name1']").parent().css("borderColor","red");
                }else if("contactPhone0" == backColumnsArray[i]){
                    $("[name='phone1']").css("color","red");
                    $("[name='phone1']").parent().css("borderColor","red");
                }else if("relation0" == backColumnsArray[i]) {
                    $("[name='relation1']").css("color","red");
                    $("[name='relation1']").parent().css("borderColor","red");
                }else if ("emergencyContactName1" == backColumnsArray[i]) {
                    $("[name='name2']").css("color","red");
                    $("[name='name2']").parent().css("borderColor","red");
                }else if("contactPhone1" == backColumnsArray[i]){
                    $("[name='phone2']").css("color","red");
                    $("[name='phone2']").parent().css("borderColor","red");
                }else if("relation1" == backColumnsArray[i]) {
                    $("[name='relation2']").css("color","red");
                    $("[name='relation2']").parent().css("borderColor","red");
                }
            } else {
                if ("emergencyContactName0" == backColumnsArray[i]) {
                    $("[name='name2']").css("color","red");
                    $("[name='name2']").parent().css("borderColor","red");
                } if("contactPhone0" == backColumnsArray[i]){
                    $("[name='phone2']").css("color","red");
                    $("[name='phone2']").parent().css("borderColor","red");
                }else if("relation0" == backColumnsArray[i]) {
                    $("[name='relation2']").css("color","red");
                    $("[name='relation2']").parent().css("borderColor","red");
                }else if ("emergencyContactName1" == backColumnsArray[i]) {
                    $("[name='name3']").css("color","red");
                    $("[name='name3']").parent().css("borderColor","red");
                }else if("contactPhone1" == backColumnsArray[i]){
                    $("[name='phone3']").css("color","red");
                    $("[name='phone3']").parent().css("borderColor","red");
                }else if("relation1" == backColumnsArray[i]) {
                    $("[name='relation3']").css("color","red");
                    $("[name='relation3']").parent().css("borderColor","red");
                }

            }
            //判断是否按揭抵押
            if(backColumnsArray[i]=="is_dy"){
                $("[name='is_dy']").next().css("color","red");
            }else if(backColumnsArray[i]=="is_aj"){
                $("[name='is_aj']").next().css("color","red");
            }


            //判断身份证正反面
            if(backColumnsArray[i]=="cardidImgA"){
               $("[id='shenFenz']").css("color","red");
            }else if(backColumnsArray[i]=="cardidImgB"){
                $("[id='shenFenf']").css("color","red");
            }

            //判断行驶证正反面
            if(backColumnsArray[i]=="carImgA"){
                $("[id='xingsz']").css("color","red");
            }

            //判断所属行业
            if(backColumnsArray[i]=="industryName"){
                $("[name='industry']").css("color","red");
                $("[name='industry']").parent().css("borderColor","red");
            }


            //判断工作年限
            if(backColumnsArray[i]=="workYearName"){
                $("[name='workYear']").css("color","red");
                $("[name='workYear']").parent().css("borderColor","red");
            }

            //判断工作类别
            if(backColumnsArray[i]=="positionName"){
                $("[name='position']").css("color","red");
                $("[name='position']").parent().css("borderColor","red");
            }

            //判断单位地址 companyAddress
            if(backColumnsArray[i]=="companyArea"){
                $("[name='companyArea']").css("color","red");
                $("[name='companyArea']").parent().css("borderColor","red");
                $("[name='companyAddress']").css("color","red");
                $("[name='companyAddress']").parent().css("borderColor","red");
            }

            //判断银行
            if(backColumnsArray[i]=="bankname"){
                $("[name='bank']").css("color","red");
                $("[name='bank']").parent().css("borderColor","red");
            }

            //判断银行卡
            if(backColumnsArray[i]=="bankAccount"){
                $("[name='bankcard']").css("color","red");
                $("[name='bankcard']").parent().css("borderColor","red");
            }

        }
    }
}


