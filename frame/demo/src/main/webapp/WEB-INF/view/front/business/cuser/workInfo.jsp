<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <title>优卡分期</title>
    <link rel="stylesheet" href="/css/businesses/weui.min.css">
    <link rel="stylesheet" href="/css/front/common.css">
    <link rel="stylesheet" href="/css/front/style.css">
    <link rel="stylesheet" href="/css/front/city-picker.css">
</head>
<body class="bg-eee">
<header>
    <%--<a class="back-btn" href="index.html"></a>--%>
    <div></div>
    <div class="title">个人资料</div>
    <div class="header-right"></div>
</header>
<div class="container show-data by-stage">
    <!--步骤条-->
    <div class="steps-bar">
        <div class="sui-steps-round steps-round-auto steps-3">
            <div class="finished">
                <div class="wrap">
                    <div class="round">1</div>
                    <div class="bar"></div>
                </div>
                <label>基本信息</label>
            </div>
            <div class="current">
                <div class="wrap">
                    <div class="round">2</div>
                    <div class="bar"></div>
                </div>
                <label>工作信息</label>
            </div>
            <div class="todo last">
                <div class="wrap">
                    <div class="round">3</div>
                </div>
                <label>绑定银行卡</label>
            </div>
        </div>
    </div>
    <c:forEach items="${columnsMap}" var="entry">
        <input id="backModule${entry.key}" value="${entry.value}" hidden="hidden" />
    </c:forEach>
    <!--基本信息-->
    <form action="/cuser/saveWrokInfo" id="workInfo" enctype="multipart/form-data" method="post">
        <!--工作信息-->
        <%--工作信息遮罩层--%>
        <c:if test="${status==4 && !fn:contains(moduleInfos, 5)}">
            <div id="workInfoMask" class="maskStyle">
            </div>
        </c:if>
        <div id="workInfoDiv" class="input-box user-data">
            <h2 class="title">工作信息</h2>
            <c:if test="${jump!=null && status!=4}">
                <a href="/cuser/jumpCar" style="float: right;line-height: 50px;color: #0042BD;">跳过>></a>
            </c:if>
            <c:if test="${status==4}">
                <c:if test="${fn:contains(moduleInfos, 5)}">
                    <span onclick="showTips('backModule5')" class="span-yz" id="ntp-ico"><img src="/images/front/adopt-wtg.png" class="adopt-img">未通过</span>
                </c:if>

                <c:if test="${!fn:contains(moduleInfos, 5)}">
                    <span class="span-yz"><img src="/images/front/adopt-tg.png" class="adopt-img">验证通过</span>
                </c:if>
            </c:if>
            <div class="data-input">
                <div class="data-left">所属行业</div>
                <select class="select" id="industry" name="industry">
                    <option value="-1"  >请选择</option>
                    <c:forEach var="tUserInfoConfig1" items="${tUserInfoConfigs1}">
                        <option value="${tUserInfoConfig1.id}"
                       <%-- <c:if test="${industry == tUserInfoConfig1.id && industry!=0}">selected</c:if>>${tUserInfoConfig1.configName}</option>--%>
                        <c:if test="${industry == tUserInfoConfig1.id}">selected</c:if>>${tUserInfoConfig1.configName}</option>

                    </c:forEach>
                </select>
            </div>
            <div class="data-input" id="danName" style="display: block">
                <div class="data-left">单位名称</div>
                <input type="text" placeholder="请输入公司全称，如是自雇人士可选填" name="companyName" id="companyName" value="${companyName}"/>
                <input type="hidden" id="cellPhone" value="${cUser.cellPhone}"/>
            </div>
            <div class="zigu">
                <span class="weui-agree__text zigu-rensi">我是自雇人士</span>
                <input type="checkbox" class="weui-agree__checkbox zigu-inp" id="ziguchk"/>
                <input type="hidden" id="zigu" name="source" value="${source}"/>

            </div>
            <div class="data-input address-select">
                <div class="data-left">单位地址</div>
                <input id="city-picker3" class="form-control" readonly type="text" value="" data-toggle="city-picker"
                       name="companyAddress" data-value="${companyAddress}">
            </div>
            <div class="data-input">
                <input type="text" placeholder="请输入详细地址" id="companyArea" name="companyArea"
                       value="${companyArea}"/>
            </div>
            <div class="data-input">
                <div class="data-left">联系方式</div>
                <input type="text" placeholder="请填写公司联系方式" size="11" name="landline" id="landline"
                       value="${landline}"/>
            </div>
            <div class="data-input">
                <div class="data-left">工作年限</div>
                <select class="select" id="workYear" name="workYear">
                    <option value="0">请选择</option>
                    <c:forEach var="tUserInfoConfig3" items="${tUserInfoConfigs3}">
                        <option value="${tUserInfoConfig3.id}"
                        <c:if test="${workYear == tUserInfoConfig3.id}">selected</c:if>>${tUserInfoConfig3.configName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="data-input" style="display: block">
                <div class="data-left">岗位类别</div>
                <select class="select" id="position" name="position">
                    <option value="0">请选择</option>
                    <c:forEach var="tUserInfoConfig2" items="${tUserInfoConfigs2}">
                        <option value="${tUserInfoConfig2.id}"
                        <c:if test="${position == tUserInfoConfig2.id}">selected</c:if>>${tUserInfoConfig2.configName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="data-input">
                <div class="data-left">月收入</div>
                <select class="select" id="monthIncome" name="monthIncome">
                    <option value="0">请选择</option>
                    <option value="1" <c:if test="${monthIncome == 1}">selected</c:if>>6k以下</option>
                    <option value="2" <c:if test="${monthIncome == 2}">selected</c:if>>6k-10k</option>
                    <option value="3" <c:if test="${monthIncome == 3}">selected</c:if>>10k-20k</option>
                    <option value="4" <c:if test="${monthIncome == 4}">selected</c:if>>20k-40k</option>
                    <option value="5" <c:if test="${monthIncome == 5}">selected</c:if>>40k以上</option>
                </select>
            </div>
        </div>

        <a class="next-btn" onclick="checkWorkInfo()">下一步</a>
        <input type="hidden" id="userid" name="userid" value="${cUser.id}"/>
    </form>
</div>

<%--资料验证不通过信息提示--%>
<div class="pop-up pop-up-wtg">
    <div class="pop-up-box wait-ntp">
        <figure>
            <a href="javascript:;" class="wait-img" id="wait-ntp-ai"></a>
            <div class="wait-ntp-box">
                <span class="wait-span">验证未通过</span>
            </div>
            <p class="wait-p2" id="wait-ntp-idp"></p>
        </figure>
        <a href="javascript:;" class="weui-btn weui-btn_plain-primary xiugai-a">我知道了</a>
    </div>
</div>

</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/front/cuser_common.js?v=1"></script>
<script src="/js/front/cUserData.js?v=1"></script>
<script src="/js/front/fileHandle.js?v=1"></script>
<script src="/js/front/city-picker.data.js"></script>
<script src="/js/front/city-picker.js"></script>

<script>
    $(function () {

        //地址选择
        'use strict';
        var $citypicker3 = $('#city-picker3');
        var option;
        var address = $citypicker3.data('value');
        if (address == null || address == '' || address == undefined) {
            option = {};
        } else {
            var addresssplit = address.split('/');
            option = {
                province: addresssplit[0],
                city: addresssplit[1],
                district: addresssplit[2]
            }
        }
        $citypicker3.citypicker(option);
        $citypicker3.val(address);
        if (address == null || address == '' || address == undefined) {
            $citypicker3.siblings('.city-picker-span').find('.placeholder').html("省/市区/城市");
        } else {
            $citypicker3.siblings('.city-picker-span').find('.placeholder').css('color', '#666').html(address);
        }

        $(".option-span").click(function () {
            if ($(this).hasClass("disabled")) {
                $(this).removeClass("disabled").addClass("active");
                $(this).siblings(".option-span").removeClass("active").addClass("disabled");
            }
            if ($(this).hasClass("sesame-option")) {
                if ($(".sesame").css("display") == "none") {
                    $(".sesame").show();
                    $(".wei-credit").hide();
                }
            } else {
                if ($(".wei-credit").css("display") == "none") {
                    $(".sesame").hide();
                    $(".wei-credit").show();
                }
            }
        });


        //抵押按揭checkbox

        var zigu = $("#zigu").val();
        if (zigu == '2') {
            $("#ziguchk").attr("checked", true);
            $("#danName").attr("style","display:none");
        } else {
            $("#chk").attr("checked", false);
        }


        $("#ziguchk").click(function () {
            if($('#ziguchk').is(':checked')){//选中状态

                $("#danName").attr("style","display:none");
                $("#zigu").val(2);
            }
            if(!$('#ziguchk').is(':checked')){
                $("#danName").attr("style","display:block");
                $("#zigu").val(0);
            }

        });

        $("#workInfoMask").css("height", $("#workInfoDiv").height());
        $("#workInfoMask").css("width", $("#workInfoDiv").width());


        //弹框方法
        var popUp = {
            show : function(ele){
                $('.pop-up-wtg').show().children(ele).show();
            },
            hide : function (ele) {
                $('.pop-up-wtg').hide().children(ele).hide();
            }
        };

        //关闭未通过提示
        $("#wait-ntp-ai").click(function(){
            popUp.hide('.wait-ntp');
        });

        $(".xiugai-a").click(function(){
            popUp.hide('.wait-ntp');
        });


        //审核未通过改变文字颜色提示
        var backColumns = "${backColumns}";
        noPassColumns(backColumns);

    });

</script>
</html>