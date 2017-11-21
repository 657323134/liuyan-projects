<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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

    <link rel="stylesheet" type="text/css" href="${basePath}/js/plugins/fancybox/jquery.fancybox.min.css"/>
    <link rel="stylesheet" href="${basePath}/css/admin//bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/admin/admin-all.css"/>
    <link rel="stylesheet" href="${basePath}/css/admin/mobileUser-datail.css"/>
    <script type="text/javascript" src="${basePath}/js/admin/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/plugins/fancybox/jquery.fancybox.min.js"/>
    <script type="text/javascript" src="${basePath}/js/lion-jquery.js"></script>
    <script type="text/javascript" src="${basePath}/js/admin/jquery-ui-1.8.22.custom.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/admin/index.js"></script>
    <script type="text/javascript" src="${basePath}/js/layer.min.js"></script>


</head>
<body>
<!--右边框架开始-->
<%--<div class="crumbs">--%>
    <%--当前位置<b class="tip"></b>用户详细信息--%>
<%--</div>--%>

<%--基本信息--%>
<div class="detail">
    <input type="hidden" id="userid" value="${cUserModel.id}">
    <%--<div class="table table-striped table-bordered edit-table">--%>
      <div class="detail-container">
        <div class="container-title">
            <h4 class="data-ift">基本信息</h4>
        </div>
        <div class="detail-content">
            <div class="content-rig">
                <tr class="key content-rig"><strong>用户名：</strong>
                </tr>
                <span>
                    ${cUserModel.userName }
                </span>
            </div>
            <div>
                <tr><strong>手机号码：</strong>
                </tr>
                <span>${cUserModel.cellPhone }</span>
            </div>
            <div>
               <div class="content-rig">
                   <tr class="key"><strong>用户来源：</strong></tr>
                   <span><c:choose>
                        <c:when test="${cUserModel.source==0 }">普通</c:when>
                        <c:when test="${cUserModel.source==1 }">CPA</c:when>
                        <c:when test="${cUserModel.source==2 }">CPS</c:when>
                        <c:when test="${cUserModel.source==3 }">百度</c:when>
                   </c:choose>
                   </span>
                   <div class="content-pos">
                        <tr class="key"><strong>是否禁用：</strong></tr>
                        <span><c:choose>
                            <c:when test="${cUserModel.isEnable==0 }">不禁用</c:when>
                            <c:when test="${cUserModel.isEnable==1 }">禁用</c:when>
                        </c:choose>
                        </span>
                   </div>

               </div>
            </div>
            <div>
                <tr class="key"><strong>邮箱地址：</strong>
                </tr>
                <span colspan="3">${cUserModel.email }</span>
            </tr>
            </div>
            <div>
                <tr class="key"><strong>创建时间：</strong></tr>
                <span>
                    <fmt:formatDate value="${cUserModel.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </span>
            </div>
            <div>
                <tr class="key"><strong>最后登录时间：</strong>
                </tr>
                <span>
                    <fmt:formatDate value="${cUserModel.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </span>
            </div>
            <div>
                <tr class="key"><strong>注册IP：</strong>
                </tr>
                <span>
                    ${cUserModel.regIp}
                </span>
            </div>
            <div>
                <tr class="key"><strong>最后登录IP：</strong>
                </tr>
                <span>
                    ${cUserModel.lastLoginIp}
                </span>
            </div>
        </div>
    </div>

        <%--实名信息--%>
    <div class="detail-container">
        <div class="container-title">
            <h4 class="key data-ift">实名信息</h4>
        </div>
        <div class="detail-content">
        <c:choose>
            <c:when test="${cUserModel.isAuth == ''|| cUserModel.isAuth ==null}">
                <div>
                    <tr class="key"><input type="checkbox" name="checkbox" value="realName"><strong>真实姓名：</strong></tr>
                    <span>
                            ${cUserModel.realName }
                    </span>
                    <div>
                        <tr class="key"><input type="checkbox" name="checkbox" style="visibility: hidden"/><strong>性别：</strong></tr>
                        <span>
                            <c:choose>
                                <c:when test="${cUserModel.cardid != null && fn:length(cUserModel.cardid) >= 18}">
                                    <c:if test="${fn:substring(cUserModel.cardid, 16, 17)%2==1}">
                                        男
                                    </c:if>
                                    <c:if test="${fn:substring(cUserModel.cardid, 16, 17)%2==0}">
                                        女
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                </div>
                <div>
                        <%--<td class="key"><strong>实名时间：</strong></td>
                        <td >
                            <fmt:formatDate value="${cUserModel.pcreateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td >--%>
                    <tr class="key"><input type="checkbox" name="checkbox" value="marryStatus"><strong>婚姻状态：</strong></tr>
                    <span>
                        <c:if test="${cUserModel.marryStatus ==1}">
                            未婚
                        </c:if>

                        <c:if test="${cUserModel.marryStatus ==2}">
                            已婚
                        </c:if>

                        <c:if test="${cUserModel.marryStatus ==3}">
                            离异
                        </c:if>
                    </span>
                </div>
                <div>
                    <tr class="key"><input type="checkbox" name="checkbox" value="cardid"><strong>身份证号：</strong></tr>
                    <span>
                            ${cUserModel.cardid}
                    </span>
                </div>
                <div>
                    <tr class="key"><input type="checkbox" name="checkbox" value="validityTime"><strong>有效期至：</strong></tr>
                    <span>
                        <fmt:formatDate value="${cUserModel.validityTime}" pattern="yyyy-MM-dd"/>
                    </span>
                </div>
                <div style="height:110px;">
                    <tr class="key"><input type="checkbox" name="checkbox" value="cardidImgA"><strong>身份证正面图片：</strong></tr>
                    <span>
                        <c:forEach items="${cUserModel.userCardPics}" var="userCardPics">
                            <c:if test="${userCardPics.img_name=='cardidImgA'}">

                                <a class="group" rel="group1" data-fancybox="gallery" data-caption="身份证正面图片" href="${userCardPics.img_url_800}">
                                    <img alt="身份证正面图片" src="${userCardPics.img_url_200}" style="width:100px; height: 100px">
                                </a>
                            </c:if>
                        </c:forEach>
                    </span>
                </div>
                <div style="height:110px;">
                    <tr class="key"><input type="checkbox" name="checkbox" value="cardidImgB"><strong>身份证反面图片：</strong></tr>
                    <span>
                        <c:forEach items="${cUserModel.userCardPics}" var="userCardPics">
                            <c:if test="${userCardPics.img_name=='cardidImgB'}">
                                <a class="group" rel="group1" data-fancybox="gallery" data-caption="身份证反面图片" href="${userCardPics.img_url_800}">
                                    <img alt="身份证反面图片" src="${userCardPics.img_url_200}" style="width:100px; height: 100px">
                                </a>
                            </c:if>
                        </c:forEach>
                    </span>
                </div>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4" style="text-align: center; ">没有实名</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </div>
    </div>

        <%--工作信息--%>
    <div class="detail-container">
        <div class="container-title">
            <h4 class="key data-ift">工作信息</h4>
        </div>
        <div class="detail-content">
            <div>
                <tr class="key"><strong>是否自雇人士：</strong></tr>
            <span>
                <c:if test="${cUserModel.source!=null && cUserModel.source==2}">
                    是
                </c:if>
                <c:if test="${cUserModel.source!=null && cUserModel.source==0}">
                    否
                </c:if>
            </span>
            </div>
            <div>
                <tr class="key"><input type="checkbox" name="checkbox" value="industryName"><strong>所属行业：</strong></tr>
            <span>
                ${cUserModel.industryName}
            </span>
            </div>
            <div>
                <tr class="key"><input type="checkbox" name="checkbox" value="companyName"><strong>单位名称：</strong></tr>
            <span>
                ${cUserModel.companyName}
            </span>
            </div>
            <div>
                <span class="key"><input type="checkbox" name="checkbox" value="companyArea"><strong>单位地址：</strong></span>
                <span style="">
                    ${cUserModel.companyAddress}<br/><p style="padding-left: 88px;">${cUserModel.companyArea}</p>
                </span>
            </div>

            <div>
                <tr class="key"><input type="checkbox" name="checkbox" value="landline"><strong>座机电话：</strong></tr>
                <span>
                    ${cUserModel.landline}
                </span>
            </div>
            <div>
                <tr class="key"><input type="checkbox" name="checkbox" value="workYearName"><strong>工作年限：</strong></tr>
                <span>
                    ${cUserModel.workYearName}
                </span>
            </div>

            <div>
                <tr class="key"><input type="checkbox" name="checkbox" value="positionName"><strong>职位：</strong></tr>
                <span>
                    ${cUserModel.positionName}
                </span>
            </div>
            <div>
                <tr class="key"><input type="checkbox" name="checkbox" value="monthIncome"><strong>月收入：</strong></tr>
                <span>
                    <c:if test="${cUserModel.monthIncome == 1}">6k以下</c:if>
                    <c:if test="${cUserModel.monthIncome == 2}">6k-10k</c:if>
                    <c:if test="${cUserModel.monthIncome == 3}">10k-20k</c:if>
                    <c:if test="${cUserModel.monthIncome == 4}">20k-40k</c:if>
                    <c:if test="${cUserModel.monthIncome == 5}">40k以上</c:if>
                </span>
            </div>
        </div>
    </div>

        <%--紧急联系人--%>
    <div class="detail-container">
        <div class="container-title">
            <h4 class="key data-ift"><strong>紧急联系人</strong></h4>
        </div>
        <div class="detail-content">
            <c:forEach items="${cUserModel.emergencyContactDtos}" var="emergencyContactDto" varStatus="idxStatus">
                <div class="content-rig">
                    <tr class="key"><input type="checkbox" name="checkbox" value="emergencyContactName${idxStatus.index}"><strong>姓名：</strong></tr>
                    <span>
                            ${emergencyContactDto.name}
                    </span>
                    <div class="content-pos">
                        <tr class="key"><input type="checkbox" name="checkbox" value="relation${idxStatus.index}"><strong>关系：</strong></tr>
                        <span>
                            <c:if test="${emergencyContactDto.relation == 33}">夫妻</c:if>
                            <c:if test="${emergencyContactDto.relation == 34}">父母</c:if>
                            <c:if test="${emergencyContactDto.relation == 35}">子女</c:if>
                            <c:if test="${emergencyContactDto.relation == 36}">哥哥</c:if>
                            <c:if test="${emergencyContactDto.relation == 37}">弟弟</c:if>
                            <c:if test="${emergencyContactDto.relation == 38}">姐姐</c:if>
                            <c:if test="${emergencyContactDto.relation == 39}">妹妹</c:if>
                            <c:if test="${emergencyContactDto.relation == 40}">爷爷</c:if>
                            <c:if test="${emergencyContactDto.relation == 41}">奶奶</c:if>
                            <c:if test="${emergencyContactDto.relation == 42}">旁系亲属</c:if>
                            <c:if test="${emergencyContactDto.relation == 43}">朋友同事</c:if>
                                <%--	${emergencyContactDto.relationName}--%>
                        </span>
                    </div>

                </div>
                <div>
                    <tr class="key"><input type="checkbox" name="checkbox" value="contactPhone${idxStatus.index}"><strong>联系电话：</strong></tr>
                    <span>
                            ${emergencyContactDto.phone}
                    </span>
                </div>
            </c:forEach>
        </div>
    </div>

        <%--车况信息--%>
    <div class="detail-container">
        <div class="container-title">
            <h4 class="key data-ift"><strong>车况信息</strong></h4>
        </div>
        <div class="detail-content">
            <c:forEach items="${cUserModel.userCarDtos}" var="userCarDto">
                <div>
                    <tr class="key"><input type="checkbox" name="checkbox" value="car_model"><strong>品牌型号：</strong></tr>
                    <span>
                            ${userCarDto.car_model}
                    </span>
                </div>
                <div>
                    <tr class="key"><input type="checkbox" name="checkbox" value="car_num"><strong>车牌号码：</strong></tr>
                        <span>
                                ${userCarDto.car_num}
                        </span>
                </div>
                <div>
                    <tr class="key"><input type="checkbox" name="checkbox" value="car_price"><strong>车辆购买金额：</strong></tr>
                    <span>
                        <c:if test="${userCarDto.car_price == 1}">5万-10万</c:if>
                        <c:if test="${userCarDto.car_price == 2}">10万-15万</c:if>
                        <c:if test="${userCarDto.car_price == 3}">15万-20万</c:if>
                        <c:if test="${userCarDto.car_price == 4}">20万以上</c:if>
                    </span>
                </div>
                <div>
                    <tr class="key"><input type="checkbox" name="checkbox" value="is_aj"><strong>是否按揭：</strong></tr>
                    <span>
                        <c:if test="${userCarDto.is_aj ==0}">否</c:if>
                        <c:if test="${userCarDto.is_aj ==1}">是</c:if>
                    </span>
                </div>
                <div>
                    <tr class="key"><input type="checkbox" name="checkbox" value="is_dy"><strong>是否抵押：</strong></tr>
                    <span>
                        <c:if test="${userCarDto.is_dy ==0}">否</c:if>
                        <c:if test="${userCarDto.is_dy ==1}">是</c:if>
                    </span>
                </div>

                <div style="height: 110px;">
                    <tr class="key"><input type="checkbox" name="checkbox" value="carImgA"><strong>机动车行驶证：</strong></tr>
                    <span>
                        <c:forEach items="${cUserModel.userCarPics}" var="userCarPics">
                            <c:if test="${userCarPics.img_name=='carImgA'}">
                                <a class="group" rel="group1" data-fancybox="gallery" data-caption="机动车行驶证" href="${userCarPics.img_url_800}">
                                    <img alt="机动车行驶证" src="${userCarPics.img_url_200}" style="width:100px; height: 100px">
                                </a>
                            </c:if>
                        </c:forEach>
                            <%--<img src="https://www.vpfinance.cn:443/upload/banner/90320161222154359155.JPG" width="100px;">--%>
                    </span>
                </div>
                <%--<div style="height: 90px">--%>
                    <%--<tr class="key"><strong>本人与车辆合照：</strong></tr>--%>
                    <%--<span>--%>
                        <%--<c:forEach items="${cUserModel.userCarPics}" var="userCarPics">--%>
                            <%--<c:if test="${userCarPics.img_name=='carImgB'}">--%>
                                <%--<a class="group" rel="group1" data-fancybox="gallery" data-caption="本人与车辆合照" href="${userCarPics.img_url_800}">--%>
                                    <%--<img alt="本人与车辆合照" src="${userCarPics.img_url_200}" style="width:100px;">--%>
                                <%--</a>--%>
                            <%--</c:if>--%>
                        <%--</c:forEach>--%>
                    <%--</span>--%>
                <%--</div>--%>
            </c:forEach>
        </div>
    </div>

        <%--银行卡信息--%>
    <div class="detail-container">
        <div class="container-title">
            <h4 class="key data-ift"><strong>银行卡</strong></h4>
        </div>
        <div class="detail-content">
            <div>
                <tr class="key"><input type="checkbox" name="checkbox" value="bankAccount"><strong>银行卡号：</strong></tr>
                <span>
                    ${cUserModel.userBankDto.bankAccount}
                </span>
            </div>
            <div>
                <tr class="key"><input type="checkbox" name="checkbox" value="bankname"><strong>选择银行：</strong></tr>
                <span>
                    ${cUserModel.userBankDto.bankname}
                </span>
            </div>
            <%--<div style="height: 90px">--%>
                <%--<tr class="key"><strong>银行卡正面照</strong></tr>--%>
                <%--<span>--%>
                    <%--<c:forEach items="${cUserModel.userBankPics}" var="userBankPics">--%>
                        <%--<c:if test="${userBankPics.img_name=='bankImgA'}">--%>
                            <%--<a class="group" rel="group1" data-fancybox="gallery" data-caption="银行卡正面照" href="${userBankPics.img_url_800}">--%>
                                <%--<img src="${userBankPics.img_url_200}" width="100px;" alt="银行卡正面照">--%>
                            <%--</a>--%>
                        <%--</c:if>--%>
                    <%--</c:forEach>--%>
                <%--</span>--%>
            <%--</div>--%>
            <%--<div style="height: 90px">--%>
                <%--<tr class="key"><strong>银行卡反面照</strong></tr>--%>
                <%--<span>--%>
                    <%--<c:forEach items="${cUserModel.userBankPics}" var="userBankPics">--%>
                        <%--<c:if test="${userBankPics.img_name=='bankImgB'}">--%>
                            <%--<a class="group" rel="group1" data-fancybox="gallery" data-caption="银行卡反面照" href="${userBankPics.img_url_800}">--%>
                                <%--<img src="${userBankPics.img_url_200}" width="100px;" alt="银行卡反面照">--%>
                            <%--</a>--%>
                        <%--</c:if>--%>
                    <%--</c:forEach>--%>
                <%--</span>--%>
            <%--</div>--%>
        </div>
    </div>
<%--</div>--%>

    <%--信用信息--%>
    <div class="detail-container">
        <div class="container-title">
            <h4 class="key data-ift"><strong>芝麻信用/蚂蚁借呗/微粒贷</strong></h4>
        </div>
        <div class="detail-content">
            <div>
                <tr class="key"><strong>信用凭证：</strong></tr>
                <span>
                    <c:if test="${cUserModel.limitType==1}">
                        微粒贷
                    </c:if>
                    <c:if test="${cUserModel.limitType==2}">
                        芝麻信用
                    </c:if>
                    <c:if test="${cUserModel.limitType==3}">
                        蚂蚁借呗
                    </c:if>
                </span>
            </div>
            <div>
                <tr class="key"><strong>信用值：</strong></tr>
                    <span>
                        ${cUserModel.limit}
                    </span>
            </div>

            <div style="height: 110px;">
                <c:if test="${cUserModel.limitType==1}">
                    <tr class="key"><strong>微粒贷分截图：</strong></tr>
                </c:if>
                <c:if test="${cUserModel.limitType==2}">
                    <tr class="key"><strong>芝麻信用分截图：</strong></tr>
                </c:if>
                <c:if test="${cUserModel.limitType==3}">
                    <tr class="key"><strong>蚂蚁借呗分截图：</strong></tr>
                </c:if>
            <span>
                <c:forEach items="${cUserModel.userCreditPics}" var="userCreditPics">
                    <if test="${userCreditPics.img_name=='creditImg'}">
                        <a class="group" rel="group1" data-fancybox="gallery" data-caption="信用分截图"  href="${userCreditPics.img_url_800}">
                            <img src="${userCreditPics.img_url_200}" width="100px;">
                        </a>
                    </if>
                </c:forEach>
            </span>
            </div>

            <div>
                <tr class="key"><strong>回退记录：</strong></tr>
                <p>
                    <c:forEach items="${tAuditBackInfoList}" var="tAuditBackInfoList">
                        <fmt:formatDate value="${tAuditBackInfoList.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp&nbsp;
                        ${tAuditBackInfoList.auditOpinion}<br/>
                    </c:forEach>
                </p>
            </div>

        </div>

    </div>

    <%--审核意见--%>
    <div class="detail-container">
        <c:choose>
            <c:when test="${isCheck == '1'}">
                <div class="container-title">

                    <h4 class="key data-ift"><strong>审核意见</strong></h4>
                </div>
                <div class="detail-content">
                    <div>
                        <tr>
                            <strong>选择:</strong>
                        </tr>
                    <span>
                         <select id="chooseCheckStatus">
                             <option value="2">审核通过</option>
                             <option value="3">审核不通过</option>
                             <option value="4">回退</option>
                         </select>
                    </span>

                    </div>
                    <div>
                        <tr>
                            <strong>审核意见：</strong>
                        </tr>
                        <p>
                            <textarea id="auditRemrk" style="height: 80px;"></textarea>
                        </p>
                    </div>
                    <input class="btn btn-inverse" id="btnCheck" style="background-color: #EA3E3A; color: #fff"
                           type="button" onclick="toCheck()" value="审核"/>&nbsp;&nbsp;&nbsp;
                    <input class="btn btn-inverse" id="btnBack" style="background-color: #6F86FE; color: #fff"
                           type="button" onclick="goUrl('queryCUserList')" value="返回"/>
                </div>

            </c:when>
            <c:otherwise>
                <div style="text-align: center">
                    <input class="btn btn-inverse" id="btnBack" style="background-color: #6F86FE; color: #fff"
                                           type="button" onclick="goUrl('queryCUserList')" value="返回用户列表"/>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <%--</div>--%>
</div>
<!--右边框架结束-->

</body>
<script type="text/javascript">

    $(function(){
        if (${isCheck != '1'}) {
            $("input[name='checkbox']:checkbox").each(function () {
                $(this).hide();
            });
        }
    });

    $("a.group").fancybox({
        'transitionIn'	:	'elastic',
        'transitionOut'	:	'elastic',
        'speedIn'		:	600,
        'speedOut'		:	200,
        'overlayShow'	:	false
    });

    function toCheck() {

        var remark = $("#auditRemrk").val();
        var status = $("#chooseCheckStatus").val();
        var userid = $("#userid").val();
        var wrongColumn="";//回退列
        if (status == "4") {
            var ifcheck = false;
            $("input[name='checkbox']:checkbox:checked").each(function () {
                ifcheck = true;
                wrongColumn += $(this).val() + ",";
            });
            if (!ifcheck) {
                alert("请选择回退信息");
                return;
            }
            wrongColumn = wrongColumn.substr(0,wrongColumn.length-1);
        }

        var sss = window.location.protocol+"//"+window.location.host + "/admin/auditUser";
        $.ajax({
            type: 'post',
            url: sss,
            data: {
                userid: userid,
                status: status,
                auditRemark: remark,
                wrongColumn:wrongColumn

            },
            success: function (msg) {
                if (msg.status == 1) {
//                    layer.alert('审核完成', {
//                        icon: 3
//                    });
                    alert("审核完成");
                    goUrl('queryCUserList');
                } else {
//                    layer.alert("审核失败");
                    alert("审核失败");
                }

            }
        });
    }

    function goUrl(url) {
        window.location.href = url;
    }

    $(function(){
        pushHistory();
        window.addEventListener("popstate", function(e) {
            window.location.href="queryCUserList";
        }, false);
        function pushHistory() {
            var state = {
                title: "title",
                url: "#"
            };
            window.history.pushState(state, "title", "#");
        }
    });

</script>
</html>