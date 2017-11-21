<%@ page contentType="text/html;charset=UTF-8"  language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
  <meta charset="utf-8">
  <title><spring:message  code="badmin.search"/></title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
  <link rel="stylesheet" href="/components/layui/css/layui.css"  media="all">
</head>
<body>
<div class="layui-container">
  <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>
  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend><spring:message code="notioce.search.input"/></legend>
  </fieldset>
<form class="layui-form" action="/bAdminListPage">
  <!--也可能是不分页：action="/bAdminList.do"-->
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
        //日期

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

