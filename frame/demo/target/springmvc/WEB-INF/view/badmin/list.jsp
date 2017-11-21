<%--
  Created by IntelliJ IDEA.
  User: shaoqinghuang
  Date: 2017/10/20
  Time: 下午3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="welcome"></spring:message></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/components/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="layui-container">

<!----------------------------------------------------------------------------------------------------------------------------->
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend><spring:message code="notioce.search.input"/></legend>
    </fieldset>
    <form class="layui-form" action="/bAdmin/bAdminSearchListPage">
        <input type="hidden" name="auth_action_list" value ="true"/>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><spring:message  code="badmin.id"/></label>
                <div class="layui-input-inline" style="width: 140px;">
                    <input type="text" name="bAdminSearch.idBegin" placeholder="" id="badmin.idBeginRange" placeholder="<spring:message  code='badmin.id'/><spring:message code='search.begin'/>" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">-</div>
                <div class="layui-input-inline" style="width: 140px;">
                    <input type="text" name="bAdminSearch.idEnd" placeholder="",id="badmin.idEndRange" placeholder="<spring:message  code='badmin.id'/><spring:message code='search.end'/>" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><spring:message  code="badmin.adminName"/></label>
            <div class="layui-input-inline" style="width:300px">
                <input type="text" name="bAdminSearch.adminName" id="bAdminSearch.adminName" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><spring:message  code="badmin.pwd"/></label>
            <div class="layui-input-inline" style="width:300px">
                <input type="text" name="bAdminSearch.pwd" id="bAdminSearch.pwd" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><spring:message  code="badmin.createTime"/></label>
            <div class="layui-input-inline" style="width: 140px;">
                <input type="text" name="bAdminSearch.createTimeBegin" id="bAdminSearch.createTimeBegin" placeholder="YYYY-MM-DD" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline" style="width: 140px;">
                <input type="text" name="bAdminSearch.createTimeEnd" id="bAdminSearch.createTimeEnd" placeholder="YYYY-MM-DD" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><spring:message  code="badmin.isEnable"/></label>
                <div class="layui-input-inline" style="width: 140px;">
                    <input type="text" name="bAdminSearch.isEnableBegin" placeholder="" id="badmin.isEnableBeginRange" placeholder="<spring:message  code='badmin.isEnable'/><spring:message code='search.begin'/>" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">-</div>
                <div class="layui-input-inline" style="width: 140px;">
                    <input type="text" name="bAdminSearch.isEnableEnd" placeholder="",id="badmin.isEnableEndRange" placeholder="<spring:message  code='badmin.isEnable'/><spring:message code='search.end'/>" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo2"><spring:message code="button.search"/></button>
                <button type="reset" class="layui-btn layui-btn-primary"><spring:message code="button.cancel"/></button>
            </div>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        </fieldset>
    </form>
<!----------------------------------------------------------------------------------------------------------------------------->

    <div class="layui-btn-group bAdminTable" style="display:none">
        <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
        <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
        <button class="layui-btn" data-type="isAll">验证是否全选</button>
        <button class="layui-btn" data-type="addData">添加记录</button>
    </div>

    <table class="layui-table" lay-data="{height: 'full-526', url:'/bAdmin/bAdminListPage', page:true, id:'idTest',limits:[10,15,20,25,30],limit:10}" lay-filter="demo">
        <thead>
        <tr>
            <th lay-data="{checkbox:true, fixed: true}"></th>
            <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
            <th lay-data="{field:'adminName', width:120}">用户名</th>
            <th lay-data="{field:'pwd', width:280, sort: true}">密码</th>
            <th lay-data="{field:'createTime', width:240}">创建时间</th>
            <th lay-data="{field:'isEnable', width:80}">是否禁用</th>
            <th lay-data="{field:'experience', width:80, sort: true}">备注</th>
            <th lay-data="{fixed: 'right', width:160, align:'center', toolbar: '#operationBar'}"></th>
        </tr>
        </thead>
    </table>

    <script type="text/html" id="operationBar">
        <a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
    </script>
</form>
</div>
<script src="/components/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['table','form', 'layedit', 'laydate'],function(){
        var table = layui.table
            ,form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date1'
        });
        laydate.render({
            elem: '#date2'
        });

        //监听表格复选框选择
        table.on('checkbox(demo)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });

        var $ = layui.$, active = {
            getCheckData: function(){ //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
            ,getCheckLength: function(){ //获取选中数目
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
            }
            ,isAll: function(){ //验证是否全选
                var checkStatus = table.checkStatus('idTest');
                layer.msg(checkStatus.isAll ? '全选': '未全选');
            }
            ,addData:function(){//新增加一条记录
                layer.msg('新增一条记录');
            }
        };

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });


        $('.bAdminTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>

</body>
</html>