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
<div class="area-pop" style="display: block;">

    <div class="pop-up-box car-code-area">
        <h3>选择车牌区域</h3>
        <ul>
            <c:forEach items="${tUserInfoConfigs6}" var="tUserInfoNames">
                <li>${tUserInfoNames.configName}</li>
            </c:forEach>
        </ul>

    </div>
</div>
<header>
    <%--<a class="back-btn" href="index.html"></a>--%>
    <div class="title">个人资料</div>
    <div class="header-right"></div>
</header>
<div class="container show-data by-stage">
    <!--步骤条-->

    <div class="steps-bar">
        <div class="sui-steps-round steps-round-auto steps-3">
            <div class="current">
                <div class="wrap">
                    <div class="round">1</div>
                    <div class="bar"></div>
                </div>
                <label>基本信息</label>
            </div>
            <div class="todo">
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
    <!--基本信息-->
    <form action="/cuser/modifyBaseInfo" id="cuserform" enctype="multipart/form-data" method="post">
        <!--图片隐藏域-->
        <div class="hidden-file" style="display: none">
            <input class="img-in" name="cardidImgA" type="file" id="cardidImgA" onchange="userImgChange(this);"
                   style="visibility:hidden"/>
            <input class="img-in" name="cardidImgB" type="file" id="cardidImgB" onchange="userImgChange(this);"
                   style="visibility:hidden"/>
            <input class="img-in" name="carImgA" type="file" id="carImgA" onchange="userImgChange(this);"
                   style="visibility:hidden"/>
            <input class="img-in" name="carImgB" type="file" id="carImgB" onchange="userImgChange(this);"
                   style="visibility:hidden"/>
            <input class="img-in" name="bankImgA" type="file" id="bankImgA" onchange="userImgChange(this);"
                   style="visibility:hidden"/>
        </div>

        <c:forEach items="${columnsMap}" var="entry">
            <input id="backModule${entry.key}" value="${entry.value}" hidden="hidden"/>
        </c:forEach>
        <%--基本信息--%>
        <%--基本信息遮罩层--%>
        <div id="baseInfoMask" class="maskStyle">
        </div>
        <div id="baseInfo" class="input-box user-data">

            <h2 class="title">基本信息</h2>
            <c:if test="${fn:contains(moduleInfos, 1)}">
                <span onclick="showTips('backModule1')" class="span-yz" id="ntp-ico"><img src="/images/front/adopt-wtg.png" class="adopt-img">未通过</span>

            </c:if>

            <c:if test="${!fn:contains(moduleInfos, 1)}">
                <span class="span-yz"><img src="/images/front/adopt-tg.png" class="adopt-img">验证通过</span>
            </c:if>

            <div class="data-input">
                <div class="data-left">姓名</div>
                <input type="text" placeholder="请输入姓名" name="realName" id="realName"
                       value="${cUser.realName}"/>
            </div>
            <div class="data-input">
                <div class="data-left">身份证</div>
                <input type="text" placeholder="请输入身份证号码" name="cardid" id="cardid" value="${cUser.cardid}"/>
            </div>
            <div class="data-input">
                <div class="data-left">有效期至</div>
                <input type="date" placeholder="请输入身份证有效期" name="validityTime" id="validityTime"
                       value="${validityTime}"/>
            </div>
            <div class="data-input">
                <div class="data-left">婚姻状态</div>

                <select name="marryStatus" id="marryStatus2">
                    <option value="0">请选择</option>
                    <option value="1" <c:if test="${cUser.marryStatus == 1}">selected</c:if>>${tUserInfoConfigs5[0].configName}</option>
                    <option value="2" <c:if test="${cUser.marryStatus == 2}">selected</c:if>>${tUserInfoConfigs5[1].configName}</option>
                    <option value="3" <c:if test="${cUser.marryStatus == 3}">selected</c:if>>${tUserInfoConfigs5[2].configName}</option>
                </select>
            </div>
            <div class="user-photo">
                <p class="photo-text">请拍摄个人身份证正面和反面照截图并选择上传</p>

                <div class="user-upload">
                    <div class="upload-img">
                        <input type="hidden" class="imgName" value="cardidImgA"/><!--file对象名-->

                        <c:forEach items="${cUser.userCardPics}" var="userCardPics">
                            <c:if test="${userCardPics.img_name=='cardidImgA'}">
                                <img id="cardidImgA-img" class="img-box"
                                     <c:if test="${not empty userCardPics.img_url }">src="${userCardPics.img_url}" </c:if>
                                     <c:if test="${empty userCardPics.img_url }">src="/images/businesses/white.svg" </c:if>/>
                                <div class="upload-btn" id="addcaridA"
                                     <c:if test="${not empty userCardPics.img_url }">style="display: none" </c:if> >添加
                                </div>
                            </c:if>
                        </c:forEach>
                        <div class="upload-name" id="shenFenz">身份证正面</div>

                    </div>
                    <div class="upload-img">
                        <input type="hidden" class="imgName" value="cardidImgB"/><!--file对象名-->
                        <c:forEach items="${cUser.userCardPics}" var="userCardPics">
                            <c:if test="${userCardPics.img_name=='cardidImgB'}">
                                <img id="cardidImgB-img" class="img-box"
                                     <c:if test="${not empty userCardPics.img_url }">src="${userCardPics.img_url}" </c:if>
                                     <c:if test="${empty userCardPics.img_url }">src="/images/businesses/white.svg" </c:if>/>

                                <div class="upload-btn" id="addcardidB"
                                     <c:if test="${not empty userCardPics.img_url }">style="display: none" </c:if>>添加
                                </div>
                            </c:if>
                        </c:forEach>

                        <div class="upload-name" id="shenFenf">身份证反面</div>
                    </div>
                </div>
            </div>
        </div>

        <!--车况信息-->
        <%--车况信息遮罩层--%>
        <div id="carInfoMask" class="maskStyle">
        </div>
        <div id="carInfo" class="input-box user-data">
            <h2 class="title">车况信息</h2>
            <c:if test="${fn:contains(moduleInfos, 2)}">
                <span onclick="showTips('backModule2')" class="span-yz" id="ntp-ico"><img src="/images/front/adopt-wtg.png" class="adopt-img">未通过</span>
            </c:if>

            <c:if test="${!fn:contains(moduleInfos, 2)}">
                <span class="span-yz"><img src="/images/front/adopt-tg.png" class="adopt-img">验证通过</span>
            </c:if>
            <div class="data-input">
                <div class="data-left">品牌型号</div>
                <input type="text" placeholder="请输入品牌型号" name="car_model" id="car_model" value="${cUserCar.car_model}"/>
            </div>
            <div class="data-input">
                <div class="data-left">车牌号码</div>
                <span id="carCodeArea">
        <c:choose>
            <c:when test="${not empty fn:substring(cUserCar.car_num, 0, 2)}">
                ${fn:substring(cUserCar.car_num, 0, 2)}
            </c:when>
            <c:otherwise>
                粤B
            </c:otherwise>
        </c:choose>
      </span>
                <c:choose>
                    <c:when test="${not empty fn:substring(cUserCar.car_num, 0, 2)}">
                        <input type="hidden" name="carCodeArea" value="${fn:substring(cUserCar.car_num, 0, 2)}"
                               id="carCodeAreaHidden"/>
                    </c:when>
                    <c:otherwise>
                        <input type="hidden" name="carCodeArea" value="粤B" id="carCodeAreaHidden"/>
                    </c:otherwise>
                </c:choose>
                <input type="text" placeholder="请输入车牌号" size="11" name="car_num" id="car_num" style="width: 56%;"
                       value="${fn:substring(cUserCar.car_num, 2, fn:length(cUserCar.car_num))}"
                       style="text-transform: uppercase" onkeydown="this.value = this.value.toUpperCase();"/>
            </div>
            <div class="data-input">
                <div class="data-left">购买日期</div>
                <input type="month" placeholder="请输入购买日期" max="6" name="car_date" id="car_date"
                       value="${cUserCar.car_date}"/>
            </div>
            <div class="data-input">
                <div class="data-left">购买价格</div>
                <select class="select" id="car_price" name="car_price">
                    <option value="0">请选择</option>
                    <option value="1" <c:if test="${cUserCar.car_price == 1}">selected</c:if>>5万-10万</option>
                    <option value="2" <c:if test="${cUserCar.car_price == 2}">selected</c:if>>10万-15万</option>
                    <option value="3" <c:if test="${cUserCar.car_price == 3}">selected</c:if>>15万-20万</option>
                    <option value="4" <c:if test="${cUserCar.car_price == 4}">selected</c:if>>20万以上</option>
                </select>
            </div>
            <div class="whether-mortgage">
                <label for="weuiAgree" class="weui-agree">
                    <input type="checkbox" class="weui-agree__checkbox" id="is_dy_chk"/>
                    <input type="hidden" id="is_dy" name="is_dy" value="${cUserCar.is_dy}"/>
                    <span class="weui-agree__text">是否抵押</span>
                </label>
                <label for="weuiAgree" class="weui-agree">
                    <input type="checkbox" class="weui-agree__checkbox" id="is_aj_chk"/>
                    <input type="hidden" id="is_aj" name="is_aj" value="${cUserCar.is_aj}"/>
                    <span class="weui-agree__text">是否按揭</span>

                </label>
            </div>
            <div class="user-photo">
                <div class="user-upload">
                    <div class="upload-img">
                        <input type="hidden" class="imgName" value="carImgA"/><!--file对象名-->

                        <c:forEach items="${cUser.userCarPics}" var="userCarPics">
                            <c:if test="${userCarPics.img_name=='carImgA'}">

                                <img id="carImgA-img" class="img-box"
                                     <c:if test="${not empty userCarPics.img_url }">src="${userCarPics.img_url}" </c:if>
                                     <c:if test="${empty userCarPics.img_url }">src="/images/businesses/white.svg" </c:if> />

                                <div class="upload-btn" <c:if test="${not empty userCarPics.img_url }">style="display: none" </c:if>>添加
                                </div>
                            </c:if>
                        </c:forEach>
                        <div class="upload-name" id="xingsz">机动车行驶证正副本照片</div>
                    </div>
                </div>
            </div>
        </div>

        <!--紧急联系人-->
        <%--配偶联系人遮罩层--%>
        <div id="cEmergencyContact1Mask" class="maskStyle"
             <c:if test="${cUser.marryStatus != 2}">style="display:none"</c:if>>
        </div>
        <div class="input-box user-data" id="cEmergencyContact1"
             <c:if test="${cUser.marryStatus != 2}">style="display:none"</c:if>>
            <h2 class="title">配偶联系信息</h2>
            <span id="cEmergencyContact1Tip">
                <c:if test="${fn:contains(moduleInfos, 3)}">
                    <span onclick="showTips('backModule3')" class="span-yz" id="ntp-ico"><img src="/images/front/adopt-wtg.png" class="adopt-img">未通过</span>
                </c:if>

                <c:if test="${!fn:contains(moduleInfos, 3)}">
                    <span class="span-yz"><img src="/images/front/adopt-tg.png" class="adopt-img">验证通过</span>
                </c:if>
            </span>

            <div class="data-input">
                <div class="data-left">关系</div>
                <select class="select" id="relation1" name="relation1">
                    <option value="33">夫妻</option>
                </select>
            </div>
            <div class="data-input">
                <div class="data-left">姓名</div>
                <input type="text" placeholder="请输入姓名" id="name1" name="name1" value="${cEmergencyContact1.name}"/>
            </div>
            <div class="data-input">
                <div class="data-left">联系电话</div>
                <input type="text" placeholder="请输入联系电话" id="phone1" name="phone1" oninput="this.value=this.value.replace(/-/g,'')" value="${cEmergencyContact1.phone}"/><span
                    class="c-f47c2c" style="float: right;">更换</span>
            </div>
        </div>

        <%--直系联系人遮罩层--%>
        <div id="cEmergencyContact2Mask" class="maskStyle">
        </div>
        <div class="input-box user-data" id="cEmergencyContact2">
            <h2 class="title">直系联系人信息</h2>
            <c:if test="${cUser.marryStatus == 2}">
                <c:if test="${fn:contains(moduleInfos, 4)}">
                    <span onclick="showTips('backModule4')" class="span-yz" id="ntp-ico"><img src="/images/front/adopt-wtg.png" class="adopt-img">未通过</span>
                </c:if>

                <c:if test="${!fn:contains(moduleInfos, 4)}">
                    <span class="span-yz"><img src="/images/front/adopt-tg.png" class="adopt-img">验证通过</span>
                </c:if>
            </c:if>
            <c:if test="${cUser.marryStatus != 2}">
                <c:if test="${fn:contains(moduleInfos, 3)}">
                    <span onclick="showTips('backModule3')" class="span-yz" id="ntp-ico"><img src="/images/front/adopt-wtg.png" class="adopt-img">未通过</span>
                </c:if>

                <c:if test="${!fn:contains(moduleInfos, 3)}">
                    <span class="span-yz"><img src="/images/front/adopt-tg.png" class="adopt-img">验证通过</span>
                </c:if>
            </c:if>

            <div class="data-input">
                <div class="data-left">关系</div>
                <select class="select" id="relation2" name="relation2">
                    <option value="0">请选择</option>
                    <option value="34" <c:if test="${cEmergencyContact2.relation == 34}">selected</c:if>>父母</option>
                    <option value="35" <c:if test="${cEmergencyContact2.relation == 35}">selected</c:if>>子女</option>
                    <option value="36" <c:if test="${cEmergencyContact2.relation == 36}">selected</c:if>>哥哥</option>
                    <option value="37" <c:if test="${cEmergencyContact2.relation == 37}">selected</c:if>>弟弟</option>
                    <option value="38" <c:if test="${cEmergencyContact2.relation == 38}">selected</c:if>>姐姐</option>
                    <option value="39" <c:if test="${cEmergencyContact2.relation == 39}">selected</c:if>>妹妹</option>
                    <option value="40" <c:if test="${cEmergencyContact2.relation == 40}">selected</c:if>>爷爷</option>
                    <option value="41" <c:if test="${cEmergencyContact2.relation == 41}">selected</c:if>>奶奶</option>
                </select>
            </div>
            <div class="data-input">
                <div class="data-left">姓名</div>
                <input type="text" placeholder="请输入姓名" id="name2" name="name2" value="${cEmergencyContact2.name}"/>
            </div>
            <div class="data-input">
                <div class="data-left">联系电话</div>
                <input type="text" placeholder="请输入联系电话" id="phone2" name="phone2" oninput="this.value=this.value.replace(/-/g,'')" value="${cEmergencyContact2.phone}"/><span
                    class="c-f47c2c" style="float: right;">更换</span>
            </div>
        </div>


        <%--其他联系人遮罩层--%>
        <div id="cEmergencyContact3Mask" class="maskStyle"
             <c:if test="${cUser.marryStatus==2}">style="display:none"</c:if>>
        </div>
        <div class="input-box user-data" id="cEmergencyContact3"
             <c:if test="${cUser.marryStatus==2}">style="display:none"</c:if>>
            <h2 class="title">其他联系人信息</h2>
            <span id="cEmergencyContact3Tip">
                <c:if test="${fn:contains(moduleInfos, 4)}">
                    <span onclick="showTips('backModule4')" class="span-yz" id="ntp-ico"><img src="/images/front/adopt-wtg.png" class="adopt-img">未通过</span>
                </c:if>

                <c:if test="${!fn:contains(moduleInfos, 4)}">
                    <span class="span-yz"><img src="/images/front/adopt-tg.png" class="adopt-img">验证通过</span>
                </c:if>
            </span>

            <div class="data-input">
                <div class="data-left">关系</div>
                <select class="select" id="relation3" name="relation3">
                    <option value="0">请选择</option>
                    <option value="34" <c:if test="${cEmergencyContact3.relation == 34}">selected</c:if>>父母</option>
                    <option value="35" <c:if test="${cEmergencyContact3.relation == 35}">selected</c:if>>子女</option>
                    <option value="36" <c:if test="${cEmergencyContact3.relation == 36}">selected</c:if>>哥哥</option>
                    <option value="37" <c:if test="${cEmergencyContact3.relation == 37}">selected</c:if>>弟弟</option>
                    <option value="38" <c:if test="${cEmergencyContact3.relation == 38}">selected</c:if>>姐姐</option>
                    <option value="39" <c:if test="${cEmergencyContact3.relation == 39}">selected</c:if>>妹妹</option>
                    <option value="40" <c:if test="${cEmergencyContact3.relation == 40}">selected</c:if>>爷爷</option>
                    <option value="41" <c:if test="${cEmergencyContact3.relation == 41}">selected</c:if>>奶奶</option>
                    <option value="42" <c:if test="${cEmergencyContact3.relation == 42}">selected</c:if>>旁系亲属</option>
                    <option value="43" <c:if test="${cEmergencyContact3.relation == 43}">selected</c:if>>朋友同事</option>
                </select>
            </div>
            <div class="data-input">
                <div class="data-left">姓名</div>
                <input type="text" placeholder="请输入姓名" id="name3" name="name3" value="${cEmergencyContact3.name}"/>
            </div>
            <input type="hidden" id="cellPhone" value="${cUser.cellPhone}"/>
            <div class="data-input">
                <div class="data-left">联系电话</div>
                <input type="text" placeholder="请输入联系电话" id="phone3" name="phone3" oninput="this.value=this.value.replace(/-/g,'')" value="${cEmergencyContact3.phone}"/><span
                    class="c-f47c2c" style="float: right;">更换</span>
            </div>
        </div>
        <div class="input-box user-data">
            <h2 class="title">芝麻信用授权</h2>
            <div style="line-height: 30px; font-size: 14px;">
                您将跳转到芝麻信用授权页面，请同意授权，系统将根据您的芝麻信用信息快速审核。
            </div>
        </div>
        <div class="loading-img" id="loading-imgBox">
            <div class="loading-img-box">
                <img src="/images/front/loading.gif"/>
            </div>
        </div>
        <a class="next-btn" id="id-next-btn" onclick="saveCUserInfo(true)">下一步</a>
        <input type="hidden" id="userid" name="userid" value="${cUser.id}"/>
    </form>
</div>
<div class="pop-up imgTips">
    <div class="picker animate-slide-up">
        <div class="top-bar">
            <h3>图片上传示例</h3>
            <a href="javascript:;" data-action="cancel" class="action" id="imgCancel">取消</a>
        </div>
        <div class="content">
            <img src="/images/front/single-project-img.png" alt="" id="imgExample"/>
            <div class="tip">
                <h5>示例说明：</h5>
                <div id="txtExplain">
                </div>
            </div>
            <div class="upload-pic">
                <div class="btn" onclick="javascript:openFile('cardidImgA')">立即上传</div>
            </div>
            <input type="hidden" id="imgType"/>
        </div>
    </div>
</div>

  <%--资料验证不通过信息提示--%>
<div class="pop-up pop-up-wtg">
    <div class="pop-up-box wait-ntp">
        <figure>
            <a href="javascript:;" class="wait-img" id="wait-ntp-ai"></a>
            <%--<img src="/images/front/wait-w.png" class="wait-img2"/>--%>
            <div class="wait-ntp-box">
                <%--<span class="wait-span"><img src="/images/front/wait-x2.png" class="wait-span-imgx"/>验证未通过</span>--%>
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
<script src="/js/weui.min.js"></script>
<script>
    $(function () {
        //用户输入要求弹框
//        $('#iKnow').click(function () {
//            $('.pop-up').hide();
//            $('.pop-up-box').hide();
//        });

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

        //车牌区号
        $('#carCodeArea').on('click', function () {
            var area = $(this);
            var areaAlias = ["京", "沪", "浙", "苏", "粤", "鲁", "晋", "冀", "豫", "川", "渝", "辽", "吉", "黑", "皖", "鄂", "湘", "赣", "闽", "陕", "甘", "宁", "蒙", "津", "贵", "云", "桂", "琼", "青", "新", "藏"];
            var areaWord = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
            var areaWordList = [];
            for (i in areaWord){
                var label = {
                    label: areaWord[i],
                    value: areaWord[i]
                };
                areaWordList.push(label);
            }
            var codeArea = [];
            for (i in areaAlias){
                var label = {
                    label: areaAlias[i],
                    value: areaAlias[i],
                    children: areaWordList
                }
                codeArea.push(label);
            }
            weui.picker(codeArea, {
                className: 'custom-classname',
                defaultValue: [1, 3],
                onChange: function (result) {
                },
                onConfirm: function (result) {
                    area.html(result.join(""));

                    $('#carCodeAreaHidden').val(area.html());
                },
                id: 'doubleLinePicker'
            });
        });
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
        var is_dy = $("#is_dy").val();
        var is_aj = $("#is_aj").val();
        if (is_dy == '1') {
            $("#is_dy_chk").attr("checked", true);
        } else {
            $("#is_dy_chk").attr("checked", false);
        }
        if (is_aj == '1'){
            $("#is_aj_chk").attr("checked", true);
        } else {
            $("#is_aj_chk").attr("checked", false);
        }
        $("#is_dy_chk").click(function () {
            if ($("#is_dy_chk").is(':checked') == true) {
                $("#is_dy").val(1);
            } else {
                $("#is_dy").val(0);
            }
        });
        $("#is_aj_chk").click(function () {
            if ($("#is_aj_chk").is(':checked') == true) {
                $("#is_aj").val(1);
            } else {
                $("#is_aj").val(0);
            }
        });

        $("#baseInfoMask").css("height", $("#baseInfo").height());
        $("#baseInfoMask").css("width", $("#baseInfo").width());

        $("#carInfoMask").css("height", $("#carInfo").height());
        $("#carInfoMask").css("width", $("#carInfo").width());

        $("#cEmergencyContact1Mask").css("height", $("#cEmergencyContact1").height());
        $("#cEmergencyContact1Mask").css("width", $("#cEmergencyContact1").width());

        $("#cEmergencyContact2Mask").css("height", $("#cEmergencyContact2").height());
        $("#cEmergencyContact2Mask").css("width", $("#cEmergencyContact2").width());

        $("#cEmergencyContact3Mask").css("height", $("#cEmergencyContact3").height());
        $("#cEmergencyContact3Mask").css("width", $("#cEmergencyContact3").width());

        var status = $("#marryStatus2").val();
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
        // 判断审核未通过的模块
        hideMask();

        if (${zmError!=null && zmError}) {
            alert("获取芝麻信用分失败,请稍后重试！");
        }

        //审核未通过改变文字颜色提示
        var backColumns = "${backColumns}";
        var marryStatus = ${cUser.marryStatus};
        noPassColumns(backColumns , marryStatus);
    });

    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

    // 判断需要修改的模块，隐藏遮罩层
    function hideMask () {
        var moduleInfos =  ${moduleInfos};
        var dbMarryStatus = ${cUser.marryStatus};
        for (var i in moduleInfos) {
            switch (moduleInfos[i]) {
                case 1:
                    $("#baseInfoMask").css('display', 'none');
                    break;
                case 2:
                    $("#carInfoMask").css('display', 'none');
                    break;
                case 3:
                    if (dbMarryStatus==2) {
                        $("#cEmergencyContact1Mask").css('display', 'none');
                    } else{
                        $("#cEmergencyContact2Mask").css('display', 'none');
                    }
                    break;
                case 4:
                    if (dbMarryStatus==2) {
                        $("#cEmergencyContact2Mask").css('display', 'none');
                    } else{
                        $("#cEmergencyContact3Mask").css('display', 'none');
                    }
                    break;
            }
        }
    }
    $("#marryStatus2").change(function () {
        var status = $("#marryStatus2").val();
        var dbMarryStatus = ${cUser.marryStatus};
        if (status == 2) {
            $("#cEmergencyContact1").show();
            $("#cEmergencyContact2").show();
            $("#cEmergencyContact3").hide();
            if (dbMarryStatus == 2) {
                $("#cEmergencyContact1Mask").show();
                $("#cEmergencyContact1Tip").show();
            } else {
                $("#cEmergencyContact1Mask").hide();
                $("#cEmergencyContact1Tip").hide();
            }
            $("#cEmergencyContact2Mask").show();
            $("#cEmergencyContact3Mask").hide();
        } else {
            $("#cEmergencyContact1").hide();
            $("#cEmergencyContact2").show();
            $("#cEmergencyContact3").show();

            if (dbMarryStatus == 2) {
                $("#cEmergencyContact3Mask").hide();
                $("#cEmergencyContact3Tip").hide();
            } else {
                $("#cEmergencyContact3Mask").show();
                $("#cEmergencyContact3Tip").show();
            }
            $("#cEmergencyContact1Mask").hide();
            $("#cEmergencyContact2Mask").show();

        }
        hideMask();
    })

</script>
</html>