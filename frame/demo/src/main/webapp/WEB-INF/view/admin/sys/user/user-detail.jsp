<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${basePath}/js/plugins/fancybox/jquery.fancybox.min.css"/>
<script type="text/javascript" src="${basePath}/js/plugins/fancybox/jquery.fancybox.min.js"/>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>用户详细信息
</div>
<div class="detail">
    <input type="hidden" id="userid" value="${cUserModel.id}">
    <table class="table table-striped table-bordered edit-table">
        <tr>
            <td colspan="4" style="text-align: center;" class="key"><strong>基本信息</strong>
            </td>
        </tr>
        <tr>
            <td class="key"><strong>用户名：</strong>
            </td>
            <td>
                ${cUserModel.userName }
            </td>
            <td class="key"><strong>手机号码：</strong>
            </td>
            <td>${cUserModel.cellPhone }</td>
        </tr>
        <tr>
            <td class="key"><strong>邮箱地址：</strong>
            </td>
            <td colspan="3">${cUserModel.email }</td>
        </tr>
        <tr>
            <td class="key"><strong>用户来源：</strong></td>
            <td><c:choose>
                <c:when test="${cUserModel.source==0 }">普通</c:when>
                <c:when test="${cUserModel.source==1 }">CPA</c:when>
                <c:when test="${cUserModel.source==2 }">CPS</c:when>
                <c:when test="${cUserModel.source==3 }">百度</c:when>
            </c:choose>
            </td>
            <td class="key"><strong>是否禁用：</strong></td>
            <td><c:choose>
                <c:when test="${cUserModel.isEnable==0 }">不禁用</c:when>
                <c:when test="${cUserModel.isEnable==1 }">禁用</c:when>
            </c:choose>
            </td>
        </tr>
        <tr>
            <td class="key"><strong>创建时间：</strong></td>
            <td>
                <fmt:formatDate value="${cUserModel.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td class="key"><strong>注册IP：</strong>
            </td>
            <td>
                ${cUserModel.regIp}
            </td>
        </tr>
        <tr>
            <td class="key"><strong>最后登录IP：</strong>
            </td>
            <td>
                ${cUserModel.lastLoginIp}
            </td>
            <td class="key"><strong>最后登录时间：</strong>
            </td>
            <td>
                <fmt:formatDate value="${cUserModel.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
        </tr>
        <tr>
            <td class="key" colspan="4" style="text-align: center;"><strong>实名信息</strong>
            </td>
        </tr>
        <c:choose>
            <c:when test="${cUserModel.isAuth == ''|| cUserModel.isAuth ==null}">
                <tr>
                    <td class="key"><input type="checkbox" name="checkbox" value="realName"><strong>真实姓名：</strong></td>
                    <td>
                            ${cUserModel.realName }
                    </td>
                    <td class="key"><strong>性别：</strong></td>
                    <td>
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
                    </td>
                </tr>
                <tr>
                        <%--<td class="key"><strong>实名时间：</strong></td>
                        <td >
                            <fmt:formatDate value="${cUserModel.pcreateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td >--%>
                    <td class="key"><input type="checkbox" name="checkbox" value="marryStatus"><strong>婚姻状态：</strong></td>
                    <td>
                        <c:if test="${cUserModel.marryStatus ==1}">
                            未婚
                        </c:if>

                        <c:if test="${cUserModel.marryStatus ==2}">
                            已婚
                        </c:if>

                        <c:if test="${cUserModel.marryStatus ==3}">
                            离异
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td class="key"><input type="checkbox" name="checkbox" value="cardid"><strong>身份证号：</strong></td>
                    <td>
                            ${cUserModel.cardid}
                    </td>
                    <td class="key"><input type="checkbox" name="checkbox" value="validityTime"><strong>有效期至：</strong></td>
                    <td>
                        <fmt:formatDate value="${cUserModel.validityTime}" pattern="yyyy-MM-dd"/>
                    </td>
                </tr>
                <tr style="height:150px;width: 20px;">
                    <td class="key"><input type="checkbox" name="checkbox" value="cardidImgA"><strong>身份证正面图片：</strong></td>
                    <td>
                        <c:forEach items="${cUserModel.userCardPics}" var="userCardPics">
                            <c:if test="${userCardPics.img_name=='cardidImgA'}">

                                <a class="group" rel="group1" data-fancybox="gallery" data-caption="身份证正面图片" href="${userCardPics.img_url_800}">

                                    <img alt="身份证正面图片" src="${userCardPics.img_url_200}" style="width:100px;">
                                </a>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td class="key"><input type="checkbox" name="checkbox" value="cardidImgB"><strong>身份证反面图片：</strong></td>
                    <td>
                        <c:forEach items="${cUserModel.userCardPics}" var="userCardPics">
                            <c:if test="${userCardPics.img_name=='cardidImgB'}">
                                <a class="group" rel="group1" data-fancybox="gallery" data-caption="身份证反面图片" href="${userCardPics.img_url_800}">
                                    <img alt="身份证反面图片" src="${userCardPics.img_url_200}" style="width:100px;">
                                </a>
                            </c:if>
                        </c:forEach>
                    </td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4" style="text-align: center; ">没有实名</td>
                </tr>
            </c:otherwise>
        </c:choose>
        <tr>
            <td colspan="4" style="text-align: center; " class="key"><strong>工作信息</strong></td>
        </tr>
        <tr>
            <td class="key"><input type="checkbox" name="checkbox" value="industryName"><strong>所属行业</strong></td>
            <td>
                ${cUserModel.industryName}
            </td>
            <td class="key"><input type="checkbox" name="checkbox" value="companyName"><strong>单位名称</strong></td>
            <td>
                ${cUserModel.companyName}
            </td>
        </tr>

            <tr>
                <td class="key"><strong>是否自雇人士</strong></td>
                <td colspan="4">
                    <c:if test="${cUserModel.source!=null && cUserModel.source==2}">
                    是
                    </c:if>
                    <c:if test="${cUserModel.source!=null && cUserModel.source==0}">
                        否
                    </c:if>
                </td>
            </tr>

        <tr>
            <td class="key"><input type="checkbox" name="checkbox" value="companyArea"><strong>单位地址</strong></td>
            <td colspan="4">
                ${cUserModel.companyAddress}${cUserModel.companyArea}
            </td>
        </tr>

        <tr>
            <td class="key"><input type="checkbox" name="checkbox" value="landline"><strong>座机电话</strong></td>
            <td>
                ${cUserModel.landline}
            </td>

            <td class="key"><input type="checkbox" name="checkbox" value="workYearName"><strong>工作年限</strong></td>
            <td>
                ${cUserModel.workYearName}
            </td>
        </tr>

        <tr>
            <td class="key"><input type="checkbox" name="checkbox" value="positionName"><strong>职位</strong></td>
            <td>
                ${cUserModel.positionName}
            </td>

            <td class="key"><input type="checkbox" name="checkbox" value="monthIncome"><strong>月收入</strong></td>
            <td>
                <c:if test="${cUserModel.monthIncome == 1}">6k以下</c:if>
                <c:if test="${cUserModel.monthIncome == 2}">6k-10k</c:if>
                <c:if test="${cUserModel.monthIncome == 3}">10k-20k</c:if>
                <c:if test="${cUserModel.monthIncome == 4}">20k-40k</c:if>
                <c:if test="${cUserModel.monthIncome == 5}">40k以上</c:if>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center; " class="key"><strong>紧急联系人</strong></td>
        </tr>
        <c:forEach items="${cUserModel.emergencyContactDtos}" var="emergencyContactDto" varStatus="idxStatus">
            <tr>
                <td class="key"><input type="checkbox" name="checkbox" value="emergencyContactName${idxStatus.index}"><strong>姓名</strong></td>
                <td>
                        ${emergencyContactDto.name}

                </td>

                <td class="key"><input type="checkbox" name="checkbox" value="relation${idxStatus.index}"><strong>关系</strong></td>
                <td>
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
                </td>
            </tr>

            <tr>
                <td class="key"><input type="checkbox" name="checkbox" value="contactPhone${idxStatus.index}"><strong>联系电话</strong></td>
                <td colspan="4">
                        ${emergencyContactDto.phone}
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4" style="text-align: center; " class="key"><strong>车况信息</strong></td>
        </tr>
        <c:forEach items="${cUserModel.userCarDtos}" var="userCarDto">
            <tr>
                <td class="key"><input type="checkbox" name="checkbox" value="car_model"><strong>品牌型号</strong></td>
                <td>
                        ${userCarDto.car_model}
                </td>
                <td class="key"><input type="checkbox" name="checkbox" value="car_num"><strong>车牌号码</strong></td>
                <td>
                        ${userCarDto.car_num}
                </td>
            </tr>

            <tr>
                <td class="key"><input type="checkbox" name="checkbox" value="car_price"><strong>车辆购买金额</strong></td>
                <td>
                    <c:if test="${userCarDto.car_price == 1}">5万-10万</c:if>
                    <c:if test="${userCarDto.car_price == 2}">10万-15万</c:if>
                    <c:if test="${userCarDto.car_price == 3}">15万-20万</c:if>
                    <c:if test="${userCarDto.car_price == 4}">20万以上</c:if>
                </td>
                <td class="key"><input type="checkbox" name="checkbox" value="is_aj"><strong>是否按揭</strong></td>
                <td>
                    <c:if test="${userCarDto.is_aj ==0}">否</c:if>
                    <c:if test="${userCarDto.is_aj ==1}">是</c:if>
                </td>
            </tr>

            <tr>
                <td class="key"><input type="checkbox" name="checkbox" value="is_dy"><strong>是否抵押</strong></td>
                <td>
                    <c:if test="${userCarDto.is_dy ==0}">否</c:if>
                    <c:if test="${userCarDto.is_dy ==1}">是</c:if>
                </td>
            </tr>


            <tr style="height: 150px;">
                <td class="key"><input type="checkbox" name="checkbox" value="carImgA"><strong>机动车行驶证</strong></td>
                <td>
                    <c:forEach items="${cUserModel.userCarPics}" var="userCarPics">
                        <c:if test="${userCarPics.img_name=='carImgA'}">
                            <a class="group" rel="group1" data-fancybox="gallery" data-caption="机动车行驶证" href="${userCarPics.img_url_800}">
                                <img alt="机动车行驶证" src="${userCarPics.img_url_200}" style="width:100px;">
                            </a>
                        </c:if>
                    </c:forEach>
                        <%--<img src="https://www.vpfinance.cn:443/upload/banner/90320161222154359155.JPG" width="100px;">--%>
                </td>

                <%--<td class="key"><strong>本人与车辆合照</strong></td>--%>
                <%--<td>--%>
                    <%--<c:forEach items="${cUserModel.userCarPics}" var="userCarPics">--%>
                        <%--<c:if test="${userCarPics.img_name=='carImgB'}">--%>
                            <%--<a class="group" rel="group1" data-fancybox="gallery" data-caption="本人与车辆合照" href="${userCarPics.img_url_800}">--%>
                                <%--<img alt="本人与车辆合照" src="${userCarPics.img_url_200}" style="width:100px;">--%>
                            <%--</a>--%>
                        <%--</c:if>--%>
                    <%--</c:forEach>--%>
                <%--</td>--%>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4" style="text-align: center; " class="key"><strong>银行卡</strong></td>
        </tr>
        <tr>
            <td class="key"><input type="checkbox" name="checkbox" value="bankAccount"><strong>银行卡号</strong></td>
            <td>
                ${cUserModel.userBankDto.bankAccount}
            </td>
            <td class="key"><input type="checkbox" name="checkbox" value="bankname"><strong>选择银行</strong></td>
            <td>
                ${cUserModel.userBankDto.bankname}
            </td>
        </tr>

        <%--<tr>--%>
            <%--<td class="key"><strong>银行卡正面照</strong></td>--%>
            <%--<td>--%>
                <%--<c:forEach items="${cUserModel.userBankPics}" var="userBankPics">--%>
                    <%--<c:if test="${userBankPics.img_name=='bankImgA'}">--%>
                        <%--<a class="group" rel="group1" data-fancybox="gallery" data-caption="银行卡正面照" href="${userBankPics.img_url_800}">--%>
                            <%--<img src="${userBankPics.img_url_200}" width="100px;" alt="银行卡正面照">--%>
                        <%--</a>--%>
                    <%--</c:if>--%>
                <%--</c:forEach>--%>
            <%--</td>--%>

            <%--<td class="key"><strong>银行卡反面照</strong></td>--%>
            <%--<td>--%>
                <%--<c:forEach items="${cUserModel.userBankPics}" var="userBankPics">--%>
                    <%--<c:if test="${userBankPics.img_name=='bankImgB'}">--%>
                        <%--<a class="group" rel="group1" data-fancybox="gallery" data-caption="银行卡反面照" href="${userBankPics.img_url_800}">--%>
                            <%--<img src="${userBankPics.img_url_200}" width="100px;" alt="银行卡反面照">--%>
                        <%--</a>--%>
                    <%--</c:if>--%>
                <%--</c:forEach>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <tr>
            <td colspan="4" style="text-align: center; " class="key"><strong>芝麻信用/蚂蚁借呗/微粒贷</strong></td>
        </tr>
        <tr>
            <td class="key"><strong>信用凭证</strong></td>
            <td>
                <c:if test="${cUserModel.limitType==1}">
                    微粒贷
                </c:if>
                <c:if test="${cUserModel.limitType==2}">
                    芝麻信用
                </c:if>
                <c:if test="${cUserModel.limitType==3}">
                    蚂蚁借呗
                </c:if>
            </td>
            <td class="key"><strong>信用值</strong></td>
            <td>
                ${cUserModel.limit}
            </td>
        </tr>

        <tr>
            <td class="key"><strong>回退记录</strong></td>
            <td colspan="4">
                <c:forEach items="${tAuditBackInfoList}" var="tAuditBackInfoList">
                    <fmt:formatDate value="${tAuditBackInfoList.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
                    ${tAuditBackInfoList.auditOpinion}<br/><br/>

                </c:forEach>
            </td>
        </tr>

        <tr style="height: 150px;">
            <c:if test="${cUserModel.limitType==1}">
                <td class="key"><strong>微粒贷分截图</strong></td>
            </c:if>
            <c:if test="${cUserModel.limitType==2}">
                <td class="key"><strong>芝麻信用分截图</strong></td>
            </c:if>
            <c:if test="${cUserModel.limitType==3}">
                <td class="key"><strong>蚂蚁借呗分截图</strong></td>
            </c:if>
            <td colspan="4">
                <c:forEach items="${cUserModel.userCreditPics}" var="userCreditPics">
                    <if test="${userCreditPics.img_name=='creditImg'}">
                        <a class="group" rel="group1" data-fancybox="gallery" data-caption="信用分截图"  href="${userCreditPics.img_url_800}">
                            <img src="${userCreditPics.img_url_200}" width="100px;">
                        </a>
                    </if>
                </c:forEach>
            </td>
        </tr>
        <tfoot>
        <c:choose>
            <c:when test="${isCheck == '1'}">
                <tr style="height: 150px;">
                    <td class="key"><strong>审核意见</strong></td>
                    <td colspan="4">
                        <strong>选择:</strong>
                        <select id="chooseCheckStatus">
                            <option value="2">审核通过</option>
                            <option value="3">审核不通过</option>
                            <option value="4">回退</option>
                        </select>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>审核意见：</strong><textarea id="auditRemrk"
                                                                                                        style="height: 80px;"></textarea>

                        <p></p>
                        <input class="btn btn-inverse" id="btnCheck"
                               type="button" onclick="toCheck()" value="审核"/>
                        <input class="btn btn-inverse" id="btnBack"
                               type="button" onclick="goUrl('queryCUserList')" value="返回"/>
                    </td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4"><input class="btn btn-inverse" id="btnBack"
                                           type="button" onclick="goUrl('queryCUserList')" value="返回"/></td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tfoot>
    </table>
</div>
<!--右边框架结束-->

<script type="text/javascript">
    //	layer.ready(function(){ //为了layer.ext.js加载完毕再执行
    //		layer.photos({
    //			photos: '#layer-photos-demo'
    //			,shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
    //		});
    //	});
//    $.ready(function() {
//        $("a.group").fancybox({
//            'transitionIn'	:	'elastic',
//            'transitionOut'	:	'elastic',
//            'speedIn'		:	600,
//            'speedOut'		:	200,
//            'overlayShow'	:	false
//        });
//    })

//    function fancybox() {
        $("a.group").fancybox({
            'transitionIn'	:	'elastic',
            'transitionOut'	:	'elastic',
            'speedIn'		:	600,
            'speedOut'		:	200,
            'overlayShow'	:	false
        });
//    }

    $(function(){
        if (${isCheck != '1'}) {
            $("input[name='checkbox']:checkbox").each(function () {
                $(this).hide();
            });
        }
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

        $.ajax({
            type: 'post',
            url: 'auditUser',
            data: {
                userid: userid,
                status: status,
                auditRemark: remark,
                wrongColumn:wrongColumn

            },
            success: function (msg) {
                if (msg.status == 1) {
                    layer.alert('审核完成', {
                        icon: 3
                    })
                    goUrl('queryCUserList')
                } else {
                    layer.alert("审核失败");
                }

            }
        });

    }


</script>
