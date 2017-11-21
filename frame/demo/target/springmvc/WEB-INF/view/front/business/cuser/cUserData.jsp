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
    <link rel="stylesheet" href="/css/front/common.css">
    <link rel="stylesheet" href="/css/front/style.css">
    <link rel="stylesheet" href="/css/front/swiper.3.1.2.min.css">
    <link rel="stylesheet" href="/css/front/city-picker.css">
</head>
<body class="bg-eee">
<div class="pop-up  area-pop" style="display: block;">
    <!--<div class="mask animate-fade-in"></div>-->
    <div class="pop-up-box app-guide">
        <h3>申请须知</h3>
        <ul>
            <li>1、申请人作为分期借款的主体，请填写本人真实有效的信息；</li>
            <li>2、请勿用他人的手机号和微信号申请分期；</li>
            <li>3、申请人需要准备真实有效的个人身份信息、工作信息及用于还款的本人储蓄卡；</li>
            <li>4、我们将对您的所有信息资料绝对保密。</li>
        </ul>
        <button id="iKnow">我知道了</button>
    </div>
    <div class="pop-up-box car-code-area">
        <h3>选择车牌区域</h3>
        <ul>
            <li>京</li>
            <li>沪</li>
            <li>浙</li>
            <li>苏</li>
            <li>粤</li>
            <li>鲁</li>
            <li>晋</li>
            <li>冀</li>
            <li>豫</li>
            <li>川</li>
            <li>渝</li>
            <li>辽</li>
            <li>吉</li>
            <li>黑</li>
            <li>皖</li>
            <li>鄂</li>
            <li>湘</li>
            <li>赣</li>
            <li>闽</li>
            <li>陕</li>
            <li>甘</li>
            <li>宁</li>
            <li>蒙</li>
            <li>津</li>
            <li>贵</li>
            <li>云</li>
            <li>桂</li>
            <li>琼</li>
            <li>青</li>
            <li>新</li>
            <li>藏</li>
        </ul>
    </div>
</div>
<header>
    <%--<a class="back-btn" href="index.html"></a>--%>
    <div></div>
    <div class="title">个人资料</div>
    <div class="header-right"></div>
</header>
<div class="container show-data by-stage">
    <!--步骤条-->
    <div class="steps-bar">
        <div class="sui-steps-round steps-round-auto steps-5">
            <div class="current">
                <div class="wrap">
                    <div class="round">1</div>
                    <div class="bar"></div>
                </div>
                <label>提交资料</label>
            </div>
            <div class="todo">
                <div class="wrap">
                    <div class="round">2</div>
                    <div class="bar"></div>
                </div>
                <label>芝麻信用</label>
            </div>
            <div class="todo">
                <div class="wrap">
                    <div class="round">3</div>
                    <div class="bar"></div>
                </div>
                <label>等待审核</label>
            </div>
            <div class="todo">
                <div class="wrap">
                    <div class="round">4</div>
                    <div class="bar"></div>
                </div>
                <label>商户识别</label>
            </div>
            <div class="todo last">
                <div class="wrap">
                    <div class="round">5</div>
                </div>
                <label>申请成功</label>
            </div>
        </div>
    </div>


    <!--基本信息-->
    <form action="/cuser/saveCUserInfo" id="cuserform" enctype="multipart/form-data" method="post">

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
            <%--<input class="img-in" name="bankImgB" type="file" id="bankImgB"  onchange="userImgChange(this);" style="visibility:hidden"/>--%>
        </div>

        <div class="input-box user-data">
            <h2 class="title">基本信息</h2>
            <%--<div class="data-input">--%>
            <%--<div class="data-left">手机号码</div>--%>
            <%--<input id="send-code" class="right-ele right-ele-btn" type="text" value="获取" readOnly="true" />--%>
            <%--<input  class="w-44" type="text" placeholder="请输入手机号码" size="11" id="cellPhone" name="cellPhone" value="${cUser.cellPhone}"/>--%>
            <%--</div>--%>
            <%--<div class="data-input">--%>
            <%--<div class="data-left">验证码</div>--%>
            <%--<input type="text" placeholder="请输入验证码" name="validateCode" id="validateCode" value="${cUser.validateCode}"/>--%>
            <%--</div>--%>
            <div class="data-input">
                <div class="data-left">姓名</div>
                <input class="w-54" type="text" placeholder="请输入姓名" name="realName" id="realName"
                       value="${cUser.realName}"/>
            </div>
            <div class="data-input">
                <div class="data-left">身份证</div>
                <input type="text" placeholder="请输入身份证号码" name="cardid" id="cardid" value="${cUser.cardid}"/>
            </div>
            <div class="data-input">
                <div class="data-left">有效期至</div>
                <input type="date" placeholder="请输入身份证有效期" name="validityTime" id="validityTime"
                       value="${cUser.validityTime}"/>
            </div>
            <div class="data-input">
                <div class="data-left">婚姻状态</div>
                <select name="marryStatus" id="marryStatus">
                    <option value="0">请选择</option>
                    <option value="1" <c:if test="${cUser.marryStatus == 1}">selected</c:if>>未婚</option>
                    <option value="2" <c:if test="${cUser.marryStatus == 2}">selected</c:if>>已婚</option>
                    <option value="3" <c:if test="${cUser.marryStatus == 3}">selected</c:if>>离异</option>
                </select>
            </div>
            <div class="user-photo">
                <p class="photo-text">请拍摄个人身份证正面和反面照截图并选择上传</p>

                <div class="user-upload">
                    <div class="upload-img">
                        <input type="hidden" class="imgName" value="cardidImgA"/><!--file对象名-->
                        <%--<div class="reset-btn"></div>--%>
                        <img id="cardidImgA-img" class="img-box"
                             <c:if test="${not empty cardidImgA }">src="${cardidImgA}" </c:if>
                             <c:if test="${empty cardidImgA }">src="/images/front/default-img.png" </c:if>/>

                        <div class="upload-btn" id="addcaridA"
                             <c:if test="${not empty cardidImgA }">style="display: none" </c:if> >添加
                        </div>
                        <div class="upload-name">身份证正面</div>
                    </div>
                    <div class="upload-img">
                        <input type="hidden" class="imgName" value="cardidImgB"/><!--file对象名-->
                        <%--<div class="reset-btn"></div>--%>
                        <img id="cardidImgB-img" class="img-box"
                             <c:if test="${not empty cardidImgB }">src="${cardidImgB}" </c:if>
                             <c:if test="${empty cardidImgB }">src="/images/front/default-img.png" </c:if>/>

                        <div class="upload-btn" id="addcardidB"
                             <c:if test="${not empty cardidImgB }">style="display: none" </c:if>>添加
                        </div>
                        <div class="upload-name">身份证反面</div>
                    </div>
                </div>
            </div>
        </div>
        <!--工作信息-->
        <div class="input-box user-data">
            <h2 class="title">工作信息</h2>

            <div class="data-input">
                <div class="data-left">所属行业</div>
                <select class="select" id="industry" name="industry">
                    <option value="0">请选择</option>
                    <c:forEach var="tUserInfoConfig1" items="${tUserInfoConfigs1}">
                        <option value="${tUserInfoConfig1.id}"
                                <c:if test="${cUser.industry == tUserInfoConfig1.id}">selected</c:if>>${tUserInfoConfig1.configName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="data-input">
                <div class="data-left">单位名称</div>
                <input type="text" placeholder="请输入公司名" name="companyName" id="companyName"
                       value="${cUser.companyName}"/>
            </div>
            <div class="data-input address-select">
                <div class="data-left">单位地址</div>
                <input id="city-picker3" class="form-control" readonly type="text" value="" data-toggle="city-picker"
                       name="companyAddress" data-value="${cUser.companyAddress}">
            </div>
            <div class="data-input">
                <input type="text" placeholder="请输入详细地址" id="companyArea" name="companyArea"
                       value="${cUser.companyArea}"/>
            </div>
            <div class="data-input">
                <div class="data-left">联系方式</div>
                <input type="text" placeholder="请填写公司联系方式" size="11" name="landline" id="landline"
                       value="${cUser.landline}"/>
            </div>
            <div class="data-input">
                <div class="data-left">工作年限</div>
                <select class="select" id="workYear" name="workYear">
                    <option value="0">请选择</option>
                    <c:forEach var="tUserInfoConfig3" items="${tUserInfoConfigs3}">
                        <option value="${tUserInfoConfig3.id}"
                                <c:if test="${cUser.workYear == tUserInfoConfig3.id}">selected</c:if>>${tUserInfoConfig3.configName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="data-input">
                <div class="data-left">职位</div>
                <select class="select" id="position" name="position">
                    <option value="0">请选择</option>
                    <c:forEach var="tUserInfoConfig2" items="${tUserInfoConfigs2}">
                        <option value="${tUserInfoConfig2.id}"
                                <c:if test="${cUser.position == tUserInfoConfig2.id}">selected</c:if>>${tUserInfoConfig2.configName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="data-input">
                <div class="data-left">月收入</div>
                <select class="select" id="monthIncome" name="monthIncome">
                    <option value="0">请选择</option>
                    <option value="1" <c:if test="${cUser.monthIncome == 1}">selected</c:if>>6k以下</option>
                    <option value="2" <c:if test="${cUser.monthIncome == 2}">selected</c:if>>6k-10k</option>
                    <option value="3" <c:if test="${cUser.monthIncome == 3}">selected</c:if>>10k-20k</option>
                    <option value="4" <c:if test="${cUser.monthIncome == 4}">selected</c:if>>20k-40k</option>
                    <option value="5" <c:if test="${cUser.monthIncome == 5}">selected</c:if>>40k以上</option>
                </select>
            </div>
        </div>
        <!--紧急联系人-->
        <div class="input-box user-data" id="cEmergencyContact1"
             <c:if test="${cUser.marryStatus != 2}">style="display:none"</c:if>>
            <h2 class="title">配偶联系信息</h2>

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
                <input type="text" placeholder="请输入联系电话" id="phone1" name="phone1" value="${cEmergencyContact1.phone}"/><span
                    class="c-f47c2c" style="float: right;">更换</span>
            </div>


        </div>
        <div class="input-box user-data" id="cEmergencyContact2">
            <h2 class="title">直系联系人信息</h2>

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
                <input type="text" placeholder="请输入联系电话" id="phone2" name="phone2" value="${cEmergencyContact2.phone}"/><span
                    class="c-f47c2c" style="float: right;">更换</span>
            </div>

        </div>

        <div class="input-box user-data" id="cEmergencyContact3">
            <h2 class="title">其他联系人信息</h2>

            <div class="data-input">
                <div class="data-left">关系</div>
                <select class="select" id="relation3" name="relation3">
                    <option value="0">请选择</option>
                    <option value="34" <c:if test="${cEmergencyContact2.relation == 34}">selected</c:if>>父母</option>
                    <option value="35" <c:if test="${cEmergencyContact2.relation == 35}">selected</c:if>>子女</option>
                    <option value="36" <c:if test="${cEmergencyContact2.relation == 36}">selected</c:if>>哥哥</option>
                    <option value="37" <c:if test="${cEmergencyContact2.relation == 37}">selected</c:if>>弟弟</option>
                    <option value="38" <c:if test="${cEmergencyContact2.relation == 38}">selected</c:if>>姐姐</option>
                    <option value="39" <c:if test="${cEmergencyContact2.relation == 39}">selected</c:if>>妹妹</option>
                    <option value="40" <c:if test="${cEmergencyContact2.relation == 40}">selected</c:if>>爷爷</option>
                    <option value="41" <c:if test="${cEmergencyContact2.relation == 41}">selected</c:if>>奶奶</option>
                    <option value="42" <c:if test="${cEmergencyContact2.relation == 42}">selected</c:if>>旁系亲属</option>
                    <option value="43" <c:if test="${cEmergencyContact2.relation == 43}">selected</c:if>>朋友同事</option>
                    <%--<c:forEach var="tUserInfoConfig4" items="${tUserInfoConfigs4}">--%>
                    <%--<option value="${tUserInfoConfig4.id}" <c:if test="${cEmergencyContact3.relation == tUserInfoConfig4.id}">selected</c:if>>${tUserInfoConfig4.configName}</option>--%>
                    <%--</c:forEach>--%>
                </select>
            </div>
            <div class="data-input">
                <div class="data-left">姓名</div>
                <input type="text" placeholder="请输入姓名" id="name3" name="name3" value="${cEmergencyContact3.name}"/>
            </div>
            <div class="data-input">
                <div class="data-left">联系电话</div>
                <input type="text" placeholder="请输入联系电话" id="phone3" name="phone3" value="${cEmergencyContact3.phone}"/><span
                    class="c-f47c2c" style="float: right;">更换</span>
            </div>


        </div>

        <!--车况信息-->
        <div class="input-box user-data">
            <h2 class="title">车况信息</h2>

            <div class="data-input">
                <div class="data-left">品牌型号</div>
                <input type="text" placeholder="请输入品牌型号" name="car_model" id="car_model" value="${cUserCar.car_model}"/>
            </div>
            <div class="data-input">
                <div class="data-left">车牌号码</div>
      <span id="carCodeArea">
        <c:choose>
            <c:when test="${not empty fn:substring(cUserCar.car_num, 0, 1)}">
                ${fn:substring(cUserCar.car_num, 0, 1)}
            </c:when>
            <c:otherwise>
                粤
            </c:otherwise>
        </c:choose>
      </span>
                <c:choose>
                    <c:when test="${not empty fn:substring(cUserCar.car_num, 0, 1)}">
                        <input type="hidden" name="carCodeArea" value="${fn:substring(cUserCar.car_num, 0, 1)}"
                               id="carCodeAreaHidden"/>
                    </c:when>
                    <c:otherwise>
                        <input type="hidden" name="carCodeArea" value="粤" id="carCodeAreaHidden"/>
                    </c:otherwise>
                </c:choose>

                <input type="text" placeholder="请输入车牌号" size="11" name="car_num" id="car_num" style="width: 60%;"
                       value="${fn:substring(cUserCar.car_num, 1, fn:length(cUserCar.car_num))}"
                       style="text-transform: uppercase"/>
            </div>
            <div class="data-input">
                <div class="data-left">购买日期</div>
                <input type="month" placeholder="请输入购买日期" max="6" name="car_date" id="car_date"
                       value="${cUserCar.car_date}"/>万元
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
                万元
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
                        <%--<div class="reset-btn"></div>--%>
                        <img id="carImgA-img" class="img-box"
                             <c:if test="${not empty carImgA }">src="${carImgA}" </c:if>
                             <c:if test="${empty carImgA }">src="/images/front/default-img.png" </c:if> />

                        <div class="upload-btn" <c:if test="${not empty carImgA }">style="display: none" </c:if>>添加
                        </div>
                        <div class="upload-name">机动车行驶证正副本照片</div>
                    </div>
                    <div class="upload-img">
                        <input type="hidden" class="imgName" value="carImgB"/><!--file对象名-->
                        <%--<div class="reset-btn"></div>--%>
                        <img id="carImgB-img" class="img-box"
                             <c:if test="${not empty carImgB }">src="${carImgB}" </c:if>
                             <c:if test="${empty carImgB }">src="/images/front/default-img.png" </c:if>/>

                        <div class="upload-btn" <c:if test="${not empty carImgB }">style="display: none" </c:if>>添加
                        </div>
                        <div class="upload-name">本人与车辆合照</div>
                    </div>
                </div>
            </div>
        </div>
        <!--银行卡-->
        <div class="input-box user-data">
            <h2 class="title">储蓄卡信息</h2>
            <span>还款代扣时使用</span>

            <div class="data-input">
                <div class="data-left">选择银行</div>
                <select class="select" id="bank" name="bank">
                    <option value="0">请选择</option>
                    <c:forEach var="aBankType" items="${tBankType}">
                        <c:if test="${aBankType.name != '其他银行'}">
                            <option value="${aBankType.id}"
                                    <c:if test="${tUserBank.banktypeId == aBankType.id}">selected</c:if>>${aBankType.name}
                            </option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="data-input">
                <div class="data-left">储蓄卡号</div>
                <input type="text" placeholder="请绑定本人储蓄卡" name="bankcard" id="bankcard"
                       value="${tUserBank.bankAccount}"/>
            </div>
            <%--<div class="data-input">--%>
            <%--<div class="data-left">手机号</div>--%>
            <%--<span class="right-ele right-ele-btn">获取</span>--%>
            <%--<input  class="w-44" type="text" placeholder="请填写银行预留手机号" size="11"/>--%>
            <%--<!--<input type="text" placeholder="请填写银行预留手机号"/>-->--%>
            <%--</div>--%>
            <%--<div class="data-input">--%>
            <%--<div class="data-left">验证码</div><input type="text" placeholder="请输入验证码" size="11"/>--%>
            <%--</div>--%>
            <div class="user-photo">
                <p class="photo-text">请拍摄本人储蓄卡正面照片并上传</p>

                <div class="user-upload">
                    <div class="upload-img">
                        <input type="hidden" class="imgName" value="bankImgA"/><!--file对象名-->
                        <%--<div class="reset-btn"></div>--%>
                        <img id="bankImgA-img" class="img-box"
                             <c:if test="${not empty bankImgA }">src="${bankImgA}" </c:if>
                             <c:if test="${empty bankImgA }">src="/images/front/default-img.png" </c:if>/>

                        <div class="upload-btn" <c:if test="${not empty bankImgA }">style="display: none" </c:if>>添加
                        </div>
                        <div class="upload-name">储蓄卡正面照片</div>
                    </div>
                    <%--<div class="upload-img">--%>
                    <%--<input type="hidden" class="imgName" value="bankImgB"/><!--file对象名-->--%>
                    <%--&lt;%&ndash;<div class="reset-btn"></div>&ndash;%&gt;--%>
                    <%--<img id="bankImgB-img" class="img-box" <c:if test="${not empty bankImgB }">src="${bankImgB}" </c:if>  <c:if test="${empty bankImgB }">src="/images/front/default-img.png" </c:if>/>--%>
                    <%--<div class="upload-btn"  <c:if test="${not empty bankImgB }">style="display: none" </c:if>>添加</div>--%>
                    <%--<div class="upload-name">银行卡反面</div>--%>
                    <%--</div>--%>
                </div>
            </div>
        </div>

        <!--芝麻信用授权-->
        <div class="input-box user-data">
            <h2 class="title">芝麻信用授权</h2>

            <div style="line-height: 30px; font-size: 14px;">
                您将跳转到芝麻信用授权页面，请同意授权，系统将根据您的芝麻信用信息快速审核。
            </div>
        </div>

        <a class="next-btn"  onclick="saveCUserInfo()">下一步</a>
        <input type="hidden" id="userid" name="userid" value="${cUser.id}"/>
    </form>
</div>

<div class="pop-up imgTips">
    <!--<div class="mask animate-fade-in"></div>-->
    <div class="picker animate-slide-up">
        <div class="top-bar">
            <h3>图片上传示例</h3>
            <a href="javascript:;" data-action="cancel" class="action" id="imgCancel">取消</a>
            <!--<a href="javascript:;" data-action="select" class="weui-picker__action" id="weui-picker-confirm">确定</a>-->
        </div>
        <div class="content">
            <img src="/images/front/single-project-img.png" alt="" id="imgExample"/>

            <div class="tip">
                <h5>示例说明：</h5>

                <div id="txtExplain">
                    <%--<p>1. 打开支付宝应用进入“我的”页面，点击头像进入“个人中心”，点击进入“个人主页”</p>--%>
                    <%--<p>2.点击显示更多将芝麻信用显示出来截取当前屏幕，上传截图即可，如左图显示。</p>--%>
                    <%--<p>注意：截取屏必须同时显示真实姓名和芝麻信用信息</p>--%>
                </div>
            </div>
            <div class="upload-pic">
                <div class="btn" onclick="javascript:openFile('cardidImgA')">立即上传</div>
            </div>
            <input type="hidden" id="imgType"/>
        </div>
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

        //用户输入要求弹框
        $('#iKnow').click(function () {
            $('.pop-up').hide();
            $('.pop-up-box').hide();
        })


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


//    $('#reset').click(function () {
//      $citypicker3.citypicker('reset');//重设
//    });
//
//    $('#destroy').click(function () {
//      $citypicker3.citypicker('destroy'); //销毁
//    });

        //车牌区域选择弹框
        $('#carCodeArea').click(function () {
            $('.area-pop').show().find('.car-code-area').show();
        })

        $('.car-code-area li').click(function () {
            $('#carCodeArea').html($(this).html());
            $('#carCodeAreaHidden').val($(this).html());
            $('.pop-up').hide().find('.pop-up-box').hide();

        })


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
    });
</script>
</html>