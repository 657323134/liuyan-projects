<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <title>绑定银行卡-优卡分期</title>
    <link rel="stylesheet" href="/css/businesses/weui.min.css">
    <link rel="stylesheet" href="/css/front/common.css">
    <style>
        .bind-card #bindBtn {
            width: 80%;
            margin: 30px auto;
            background: #ef2034;
        }
        /*.bind-card .weui-input{*/
        /*text-align: right ;*/
        /*}*/
    </style>
</head>
<body class="bind-card">
<div class="weui-toptips weui-toptips_warn">错误提示</div>

<header>
    <a class="back-btn" href="javascript:history.back()"></a>

    <div class="title">绑定银行卡</div>
    <div class="header-right"></div>
</header>

<div class="page__bd container">
    <div class="weui-cells__title">请绑定本人持有储蓄卡</div>
    <div class="weui-cells">

        <div class="weui-cell">
            <div class="weui-cell__hd">
            </div>
            <div class="weui-cell__bd">
                <p>绑定手机号</p>
            </div>
            <div class="weui-cell__ft">
                <p id="cellPhone">${cellPhone}</p>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd">
            </div>
            <div class="weui-cell__bd">
                <p>持卡人姓名</p>
            </div>
            <div class="weui-cell__ft">
                <c:if test="${realName==null}">
                    <input class="weui-input" type="text" id="realName" placeholder="请输入持卡人姓名">
                </c:if>
                <p id="realNames">${realName}</p>
                <input type="hidden" id ="ben" value="${ben}">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd">
            </div>
            <div class="weui-cell__bd">
                <p>身份证号</p>
            </div>
            <div class="weui-cell__ft">
                <c:if test="${cardid==null}">
                    <input class="weui-input" id="cardid" type="text" placeholder="请输入身份证号">
                </c:if>
                <p id="cardids">${cardid}</p>
                <%----%>
            </div>
        </div>

    </div>
    <div class="weui-cells">

        <div class="weui-cell">
            <div class="weui-cell__hd">
            </div>
            <div class="weui-cell__bd"><label class="weui-label">银行卡号</label></div>
            <div class="weui-cell__ft">
                <input class="weui-input" type="number" id="bankcar" pattern="[0-9]*" placeholder="请输入银行卡号">
            </div>
        </div>

        <div class="weui-cell weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd">

                <label for="" class="weui-label">选择银行</label>
            </div>
            <div class="weui-cell__bd">
                <select class="weui-select" id = "bankType"name="bankName">
                    <c:forEach var="bankType" items="${banktypeList}">
                        <option value="${bankType.bankcode}">${bankType.name}</option>
                    </c:forEach>
                    <%--<option value="3">农业银行</option>--%>
                </select>
            </div>
        </div>
    </div>
    <a class="weui-btn weui-btn_primary" id="bindBtn">绑定银行卡</a>
</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script>
    $('#bindBtn').click(function () {

        var realName  =  $("#realName").val();//姓名
        var realNames = $("#realNames").html();
        var cardid    =  $("#cardid").val();//身份证号
        var bankcar   =  $("#bankcar").val();//银行卡号
        var bankType  =  $("#bankType").val();//银行
        var cardids   =  $("#cardids").html();
        var cellPhone =  $("#cellPhone").val();
        var reg = /^(\d{16}|\d{19})$/;
        if(realNames==null || ""==realNames){
            if(realName==null ||""==realName){
                alert("请输入姓名");
                return;
            }
        }
        if(cardids==null ||""==cardids){
            if(cardid== null ||"" ==cardid){
                alert("请输入身份证号");
                return;
            }
            if(!checkIdcard(cardid)){
                alert("身份证号不正确，请重新填写");
                return;
            }
        }
        if(bankcar ==null || "" == bankcar){
            alert("请输入银卡卡号");
            return;
        }
        if (!luhmCheck(bankcar)) {
            alert("银行卡号不正确，请重新填写");
            return;
        }
        if(bankType ==null || ""== bankType){
            alert("请选择银行");
            return;
        }
        $.ajax({
            url:'/cuserAccountInfo/bindCar',
            type:'post',
            dataType:'json',
            data:{'realName':realName,'cardid':cardid,'bankcar':bankcar,'bankType':bankType},
            success:function(data){
                if(data.msg=="error"){
                    alert("银行卡与银行不匹配");
                    return false;
                }
                if(data.msg=="success"){
                    var ben = $('#ben').val();
                    if(ben=='1'){//管理银行卡页面
                        window.location.href="/cuserAccountInfo/manageCar";
                    }
                    if(ben=='2'){
                        window.location.href="/cuserAccountInfo/toWithdrawPage.do";
                    }
                }
                /*if(data.cs=="cs"){
                    alert("请输入正确的银行卡号");
                    return;
                }*/
                if(data.msg =='check' ){
                    alert("该身份证号已被注册");
                    return false;
                }
               /* if(data.lens =="lens"){
                    alert("对不起银行卡号不正确");
                    return false;
                }*/
                /*if(data.bot =="bot"){
                    alert("请勿重复绑定");
                    return false;
                }*/
                if(data.msg =='nokar'){
                    alert("银行与卡号不匹配");
                    return false;
                }


            }
        });
    })
    function checkIdcard(num){
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
    } <!--银行卡校验函数 -->
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
</script>
</html>
