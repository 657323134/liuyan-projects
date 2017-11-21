<%@ page contentType="text/html;charset=UTF-8"  language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
    <meta charset="utf-8">
    <title>
        <spring:message code="badmin.search"/>
    </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <link rel="stylesheet" href="/components/layui/css/layui.css" media="all">
</head>

<body>

<div class="layui-container">
    <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px"
         data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <!--修改-->
        <legend>
            <spring:message  code="badmin.edit"/>
            (
            <spring:message code="validation.header"/>
            )
        </legend>
    </fieldset>

    <form class="layui-form layui-form-pane" action="/bAdmin/bAdminEditSave" method="post">

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <!--ID--><label class="layui-form-label">
                        <spring:message  code="badmin.id"/>
                    </label>
                        <div class="layui-input-inline" style="width: 140px;">
                            <input type="text" name="id"
                                   placeholder="<spring:message  code='badmin.id'/>"
                                   id="bAdmin.id" value="${bAdmin.id}"
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid"><spring:message code="validation.required"/></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <!--帐户名--><label class="layui-form-label">
                    <spring:message  code="badmin.adminName"/>
                </label>
                    <div class="layui-input-inline" style="width:300px">
                        <input type="text" name="adminName" id="bAdmin.adminName"
                               lay-verify="required"
                               placeholder="<spring:message  code='badmin.adminName'/>"
                               title="badmin.adminNameMaxLength"
                               value="${bAdmin.adminName}"
                               maxlength="20" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid"></div>
                </div>
                <div class="layui-form-item">
                    <!--密码--><label class="layui-form-label">
                    <spring:message  code="badmin.pwd"/>
                </label>
                    <div class="layui-input-inline" style="width:300px">
                        <input type="text" name="pwd" id="bAdmin.pwd"
                               lay-verify="required"
                               placeholder="<spring:message  code='badmin.pwd'/>"
                               title="badmin.pwdMaxLength"
                               value="${bAdmin.pwd}"
                               maxlength="32" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid"></div>
                </div>
                <div class="layui-form-item">
                    <!--创建时间--><label class="layui-form-label">
                    <spring:message  code="badmin.createTime"/>
                </label>
                    <div class="layui-input-inline" style="width: 140px;">
                        <input type="text" name="createTime" id="bAdmin.createTime" value="${bAdmin.createTime}"
                               placeholder="YYYY-MM-DD" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid"></div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <!--是否禁用--><label class="layui-form-label">
                        <spring:message  code="badmin.isEnable"/>
                    </label>
                        <div class="layui-input-inline" style="width: 140px;">
                            <input type="text" name="isEnable"
                                   placeholder="<spring:message  code='badmin.isEnable'/>"
                                   id="bAdmin.isEnable" value="${bAdmin.isEnable}"
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid"></div>
                    </div>
                </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <!--确定-->
                <button class="layui-btn" lay-submit="" lay-filter="demo2">
                    <spring:message code="button.ok"/>
                </button>
                <!--取消-->
                <button type="reset" class="layui-btn layui-btn-primary">
                    <spring:message code="button.cancel"/>
                </button>
            </div>
        </div>
    </form>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;"></fieldset>
</div>
</body>
</html>

