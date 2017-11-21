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
<spring:message code="notice.edit"/>
//确定要修改吗?

<body>

<div class="layui-container">
    <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px"
         data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <!--修改-->
        <legend>
            <spring:message @resourcesBundle code="@resourcesPrefixJsp.edit"/>
            (
            <spring:message code="validation.header"/>
            )
        </legend>
    </fieldset>

    <form class="layui-form layui-form-pane" action="/@objectNameLEditSave">
        <hidden name="@objectNameLForm" property="@objectNameL.@pObjectNameL"/>

        <L>
            <LS>
                <div class="layui-form-item">
                    <!--@fieldDesc--><label class="layui-form-label">
                    <spring:message @resourcesBundle code="@resourcesPrefixJsp.@fieldNameL"/>
                </label>
                    <div class="layui-input-inline" style="width:300px">
                        <input type="text" name="@objectNameL.@fieldNameL" id="@objectNameL.@fieldNameL"
                               lay-verify="required"
                               placeholder="<spring:message @resourcesBundle code='@resourcesPrefixJsp.@fieldNameL'/>"
                               title="@resourcesPrefixJsp.@fieldNameLMaxLength"
                               maxlength="@maxlength" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid">@requiredResources</div>
                </div>
            </LS>
            <LT>
                <div class="layui-form-item">
                    <!--@fieldDesc--><label class="layui-form-label">
                    <spring:message @resourcesBundle code="@resourcesPrefixJsp.@fieldNameL"/>
                </label>
                    <div class="layui-input-inline" style="width: 140px;">
                        <input type="text" name="@objectNameL.@fieldNameL" id="@objectNameL.@fieldNameL"
                               placeholder="YYYY-MM-DD" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid">@requiredResources</div>
                </div>
            </LT>
            <LN>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <!--@fieldDesc--><label class="layui-form-label">
                        <spring:message @resourcesBundle code="@resourcesPrefixJsp.@fieldNameL"/>
                    </label>
                        <div class="layui-input-inline" style="width: 140px;">
                            <input type="text" name="@objectNameL.@fieldNameL"
                                   placeholder="<spring:message @resourcesBundle code='@resourcesPrefixJsp.@fieldNameL'/>"
                                   id="@objectNameL.@fieldNameL"
                                   placeholder="<spring:message @resourcesBundle code='@resourcesPrefixJsp.@fieldNameL'/>"
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid">@requiredResources</div>
                    </div>
                </div>
            </LN>
        </L>

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