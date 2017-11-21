//是否为中文
function checkChinese(str) {
    var re = /[^\u4e00-\u9fa5]/;
    if (re.test(str)) return false;
    return true;
};
//是否为中文姓名
function checkChineseName(v) {
    if (v == '') return 1;
    if (v.length < 2) {
        return 2;
    }
    var name = v.replace(/·/g, '');
    name = name.replace(/•/g, '');
    if (checkChinese(name))  return 0; else return 2;
};

//判断是否为空
function isBlank(keyVal) {
    if (keyVal == undefined || keyVal == "" || keyVal == null) {
        return true;
    }
    return false;
}

//发送短信
function sendMessage(phone, object) {

    if (phone == null || phone == '') {
        alert("手机号不能为空!");
        return;
    }
    var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
    if (reg.test(phone) == false) {
        alert("手机号格式有误!");
        return;
    }
    var $this = object;
    $.ajax({
        type: 'post',
        url: '/userinfo/sendSms',
        data: {
            phone: phone
        },
        success: function (data) {
            if (data.status == "1") {
                SendSmsCode.init($this);
            } else if (data.status == '3') {
                alert("用户已存在！");
            } else {
                alert("系统繁忙，稍后再试！");
            }
        }
    });

}

var SendSmsCode = {
    smsobj: null,
    count: 120,
    start: function () {
        this.count = this.count - 1;
        if (this.count > 0) {
            this.smsobj.attr("value", this.count + "秒");
            this.smsobj.attr("disabled", "true");
            var _this = this;
            setTimeout(function () {
                _this.start();
            }, 1000);
        } else {
            this.smsobj.removeAttr("disabled");
            this.smsobj.attr("value", "获取");
            this.count = 120;
        }
    },
    //初始化
    init: function (smsobj) {
        this.smsobj = smsobj;
        this.smsobj.attr("disabled", "true");
        this.start();
    }
};


/**
 * 用户CUser字段存入session
 */
function saveCUserToSession(key1,key2, value) {
//    if(value==2){
//        $("#cEmergencyContact2").hide();//隐藏直系联系人
//        $("#cEmergencyContact3").hide();//隐藏其他联系人
//    }else {
//        $("#cEmergencyContact2").show();//隐藏直系联系人
//        $("#cEmergencyContact3").show();//隐藏其他联系人
//    }

    //保存
    $.ajax({
        url: '/cuser/saveCUserToSession?key1=' + key1 +"&key2="+ key2+ "&value=" + value,
        type: 'POST',
        dataType: 'json',
        data: {},
        contentType: 'application/json',
        success: function (msg) {

        }
    });
}
//紧急联系人存入sessio
/**
 * 用户CUser字段存入session
 */
function saveCEmergencyContactToSession(key, value) {
    //保存
    $.ajax({
        url: '/cuser/saveCEmergencyContactToSession?key=' + key + "&value=" + value,
        type: 'POST',
        dataType: 'json',
        data: {},
        contentType: 'application/json',
        success: function (msg) {
            console.log(msg);
        }
    });
}
function saveCEmergencyContactToSession2(key, value) {
    //保存
    $.ajax({
        url: '/cuser/saveCEmergencyContactToSession2?key=' + key + "&value=" + value,
        type: 'POST',
        dataType: 'json',
        data: {},
        contentType: 'application/json',
        success: function (msg) {
        }
    });
}

function saveCEmergencyContactToSession3(key, value) {
    //保存
    $.ajax({
        url: '/cuser/saveCEmergencyContactToSession3?key=' + key + "&value=" + value,
        type: 'POST',
        dataType: 'json',
        data: {},
        contentType: 'application/json',
        success: function (msg) {
            console.log(msg);
        }
    });
}


//车况信息存入cession
function saveCUserCarToSession(key2, value) {
    //保存
    $.ajax({
        url: '/cuser/saveCUserCarToSession?key=' + key + "&value=" + value,
        type: 'POST',
        dataType: 'json',
        data: {},
        contentType: 'application/json',
        success: function (msg) {
        }
    });
}
//银行卡信息缓存session
//车况信息存入cession
function saveUserBankToSession(key, value) {
    //保存
    $.ajax({
        url: '/cuser/saveUserBankToSession?key=' + key + "&value=" + value,
        type: 'POST',
        dataType: 'json',
        data: {},
        contentType: 'application/json',
        success: function (msg) {
            console.log(msg);
        }
    });
}


/***
 * 银行卡验证
 */
//bankno为银行卡号 banknoInfo为显示提示信息的DIV或其他控件
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

//身份证号
function checkIdcard(num) {
    num = num.toUpperCase();
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。
    if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))) {
        // alert('输入的身份证号长度不对，或者号码不符合规定！\n15位号码应全为数字，18位号码末位可以为数字或X。');
        return false;
    }
    // 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
    // 下面分别分析出生日期和校验位
    var len, re;
    len = num.length;
    if (len == 15) {
        re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
        var arrSplit = num.match(re);

        // 检查生日日期是否正确
        var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/'
            + arrSplit[4]);
        var bGoodDay;
        bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2]))
            && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3]))
            && (dtmBirth.getDate() == Number(arrSplit[4]));
        if (!bGoodDay) {
            return false;
        } else {
            // 将15位身份证转成18位
            // 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,
                8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4',
                '3', '2');
            var nTemp = 0, i;
            num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);
            for (i = 0; i < 17; i++) {
                nTemp += num.substr(i, 1) * arrInt[i];
            }
            num += arrCh[nTemp % 11];
            return true;
        }
    }
    if (len == 18) {
        re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
        var arrSplit = num.match(re);

        // 检查生日日期是否正确
        var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/"
            + arrSplit[4]);
        var bGoodDay;
        bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2]))
            && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3]))
            && (dtmBirth.getDate() == Number(arrSplit[4]));
        if (!bGoodDay) {
            // alert(dtmBirth.getYear());
            // alert(arrSplit[2]);
            // alert('输入的身份证号里出生日期不对！');
            return false;
        } else {
            // 检验18位身份证的校验码是否正确。
            // 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
            var valnum;
            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,
                8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4',
                '3', '2');
            var nTemp = 0, i;
            for (i = 0; i < 17; i++) {
                nTemp += num.substr(i, 1) * arrInt[i];
            }
            valnum = arrCh[nTemp % 11];
            if (valnum != num.substr(17, 1)) {
                // alert('18位身份证的校验码不正确！应该为：' + valnum);
                return false;
            }
            return true;
        }
    }
    return false;
}
/**
 * 回退修改信息提示
 * @param backModule
 */
function showTips(backModule) {
    var tips = $("#" + backModule).val();
    if (tips != null && tips != undefined && tips != "") {
        //提示信息中的内容
        $("#wait-ntp-idp").html("您填写的" + tips + "不符合标准，请修改后重新提交！");
        var popUp = {
            show : function(ele){
                $('.pop-up-wtg').show().children(ele).show();
            },
            hide : function (ele) {
                $('.pop-up-wtg').hide().children(ele).hide();
            }
        };
        popUp.show('.wait-ntp');
    }

}



