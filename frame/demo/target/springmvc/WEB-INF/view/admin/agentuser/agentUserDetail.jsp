<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>修改商户
</div>
<form id="editForm">
    <input type="hidden" value="${bUserModel.id}" name="id"/>
    <input type="hidden" value="${bUserModel.parent_id}" name="parent_id"/>
    <input type="hidden" value="${bUserModel.create_time}" name="create_time"/>
    <input type="hidden" value="${bUserModel.update_time}" name="update_time"/>
    <input type="hidden" value="${bUserModel.isDeleted}" name="isDeleted"/>
    <input type="hidden" value="${bUserModel.percentage}" name="percentage"/>
    <input type="hidden" value="${bUserModel.userType}" name="userType"/>
    <input type="hidden" value="${agentInfo.status}" name="status"/>
    <input type="hidden" value="${agentInfo.begin_tm}" name="begin_tm"/>
    <input type="hidden" value="${agentInfo.end_tm}" name="end_tm"/>
    <input type="hidden" value="${agentInfo.insert_tm}" name="insert_tm"/>
    <input type="hidden" value="${agentInfo.update_tm}" name="update_tm"/>
    <input type="hidden" value="${agentInfo.user_type}" name="user_type"/>
    <input type="hidden" value="${bUserModel.password}" name="password"/>
    <table class="table table-striped table-bordered edit-table">
        <thead>
        <tr>
            <td colspan="10"><b>代理信息</b>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>代理商名<font color="FF0000">*</font>
            </td>
            <td><input name="name" value="${bUserModel.name}" type="text"
                       nullmsg="请输入代理姓名" errorMsg="商户姓名长度为4-20位"/>
            </td>
            <td>手机号<font color="FF0000">*</font>
            </td>
            <td><input name="phone" value="${bUserModel.phone}" type="text"
                       datatype="s4-20" nullmsg="请输入手机号" errorMsg="手机号长度为11位"/>
            </td>
            <td>是否可用<font color="FF0000">*</font>
            </td>
            <td><select name="isEnable">
                <option value="0">是</option>
                <option value="1">否</option>
            </select>
            </td>
            <td colspan="10">
            </td>
        </tr>


        <tr>
            <td>法人姓名<font color="FF0000">*</font>
            </td>
            <td><input name="corporateName" value="${agentInfo.corporate_name}" type="text" nullmsg="请输入法人姓名"/>
            </td>
            <td>法人身份证号<font color="FF0000">*</font>
            </td>
            <td><input name="corporateCardid" value="${agentInfo.corporate_cardid}" type="text" nullmsg="请输入法人身份证号"
                    />
            </td>
            <td>法人手机号<font color="FF0000">*</font>
            </td>
            <td><input name="corporatePhone" value="${agentInfo.corporate_phone}" type="text" nullmsg="请输入法人手机号"
                    />
            </td>
            <td colspan="10">
            </td>
        </tr>


        <tr>
            <td>代理人姓名<font color="FF0000">*</font>
            </td>
            <td><input name="agentor" value="${agentInfo.agentor}" type="text" nullmsg="请输入代理人姓名"/>
            </td>
            <td>代理人身份证号<font color="FF0000">*</font>
            </td>
            <td><input name="agentorCardid" value="${agentInfo.agentor_cardid}" type="text" nullmsg="请输入代理人身份证号"
                    />
            </td>
            <td>代理商级别<font color="FF0000">*</font>
            </td>
            <td><input name="agentLevel" value="${agentInfo.agent_level}" type="number" nullmsg="请输入代理商级别"
                    />
            </td>
            <td colspan="10">
            </td>
        </tr>


        <tr>
            <td>代理区域<font color="FF0000">*</font>
            </td>
            <td><input name="area" value="${agentInfo.area}" type="text" nullmsg="请输入代理区域"
                    />
            </td>
            <td>默认分成比例(%)<font color="FF0000">*</font>
            </td>
            <td><input name="percentage" value="" type="number"
                       nullmsg="请输入代理商默认分成比例" errorMsg="代理商默认分成比例错误"/>

            </td>
            <td colspan="10">
            </td>
        </tr>

        <tr>
            <td>银行类型
            </td>
            <td><select class="select" id="banktypeId" name="banktypeId">
                <option value="0">请选择</option>
                <c:forEach var="aBankType" items="${tBankType}">
                    <option value="${aBankType.id}"
                            <c:if test="${tUserBank.banktypeId == aBankType.id}">selected</c:if>>${aBankType.name}</option>
                </c:forEach>
            </select>
            </td>
            <td>支行</td>
            <td>
                <input name="branch" value="${tUserBank.branch}" type="text"
                       nullmsg="请准确输入银行支行信息"/>
                </select>
            </td>
            <td>银行账号</td>
            <td>
                <input name="bankAccount" value="${tUserBank.bankAccount}" type="text"
                       nullmsg="请输入银行账号"/>
                </select>
            </td>

            <td>银行账号名</td>
            <td>
                <input name="accountName" value="${tUserBank.accountName}" type="text"
                       nullmsg="请输入银行账号名"/>
                </select>
            </td>
        </tr>
        <tr>
            <td>省</td>
            <td><select class="select" id="province" name="province">
                <option value="0">请选择</option>
                <c:forEach var="provinceMap" items="${provinces}">
                    <c:set var="key" value="${provinceMap.key}"></c:set>
                    <c:set var="province" value="${provinceMap.value}"></c:set>
                    <option value="${province.id}"
                            <c:if test="${tUserBank.province == province.id}">selected</c:if>>${province.regionName}</option>
                </c:forEach>
            </select>
            </td>
            <td>市</td>
            <td>
                <select class="select" id="city" name="city">
                    <c:forEach var="cityInfo" items="${citys}">
                        <option value="${cityInfo.id}"
                                <c:if test="${tUserBank.city == cityInfo.id}">selected</c:if>>${cityInfo.regionName}</option>
                    </c:forEach>
                </select>
            </td>
            <td colspan="10">
            </td>
        </tr>
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</form>

<div>
    <p><span><b>代理产品</b></span></p>
</div>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">

        <td class="auto-style1">序号</td>
        <td class="auto-style1">产品名称</td>
        <td class="auto-style1">型号</td>
        <td class="auto-style1">授权时间</td>
        <td class="auto-style1">分红金额</td>
        <td class="auto-style1">总销量</td>
        <td class="auto-style1">本月销量</td>
        <td class="auto-style1">总退货</td>
        <td class="auto-style1">本月退货</td>
    </tr>
    </thead>
    <tbody>
    <c:set var="dataIndex"></c:set>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <c:set var="dataIndex" value="${dataIndex+1}"></c:set>
        <tr>
            <td>${dataIndex}</td>
            <td> ${bean.id } </td>
            <td>${bean.agent_name}</td>
            <td>${bean.name}</td>
            <td>${bean.phone}</td>
            <td>${bean.goodsKindNum}</td>
            <td>${bean.percentage}</td>
            <td>
                <c:if test="${bean.isSell == 1}">
                    是
                </c:if>
                <c:if test="${bean.status == 2}">
                    否
                </c:if>
            </td>
            <td>
                <c:if test="${bean.status == 1}">
                正常代理
                </c:if>
            <td>${bean.create_time}</td>
            <c:if test="${bean.status == 2}">
                异常代理
            </c:if>
            </td>
            <td>
                <input class="btn btn-inverse" type="button" value="代理详情"
                       onclick="goUrl('agentUserDetailIndex?id=${bean.id}');"/>&nbsp;
            </td>
        </tr>
    </c:forEach>
    <%--<tr class="tr_pagenumber">
        <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit}" totalCount="${page.totalCount }" /></td>
    </tr>--%>
    </tbody>
</table>

<script type="text/javascript">
    <!--
    var valiForm = $("#editForm").Validform({
        btnSubmit: "#btnSave",
        tiptype: function (msg, o, cssctl) {
            var objtip = $("#errorMsg");
            cssctl(objtip, o.type);
            objtip.text(msg);
        },
        postonce: true,
        ajaxPost: true,
        callback: function (data) {
            alert(data.info);
            if (data.status == 'y') {
                goUrl("queryAgentBUserList");
            }
        }
    });
    $.Tipmsg.r = "";

    $("#province").change(function () {
        $.ajax({
            url: "getCityList",
            data: {
                provinceId: $(this).val()
            }
        }).success(function (data) {
            if (data.length > 1) {
                $("#city").css("display", "");
                $("#city").empty();
                for (var i = 0; i < data.length; i++) {
                    $("#city").append("<option value='" + data[i].id + "'>" + data[i].regionName + "</option>");
                }
            } else {
                $("#city").css("display", "");
            }
        });
    });
    //-->
</script>
<!--右边框架结束-->