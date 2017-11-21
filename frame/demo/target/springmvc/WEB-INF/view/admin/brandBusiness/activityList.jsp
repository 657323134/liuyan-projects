<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>活动列表
</div>
<form id="searchForm" action="marketActivityList">
    <table class="table table-striped table-bordered search-table">
        <thead>
        <tr>
            <td colspan="10" class="auto-style2">&nbsp;请填写查询条件
                <input id="curPage" name="curPage" type="hidden" value="1"/>
            </td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>活动名称</td>
            <td>
                <input id="phone" name="phone" class="dinp" type="text" value="${model.activityName }"/>
            </td>
          <%--  <td>xxxxxx</td>
            <td>
                <input id="name" name="name" class="dinp" type="text" value="${model.activityName }"/>
            </td>--%>
            <%--  <td>是否禁用</td>--%>
        </tr>
        <tr>
            <td colspan="10" align="right">
                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>
                <input class="btn btn-inverse" type="button" onclick="goUrl('addActivitySharingIndex')" value="添加"/>&nbsp;
            </td>
        </tr>
        </tbody>
    </table>
</form>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">序号</td>
        <td class="auto-style1">活动名称</td>
        <td class="auto-style1">活动开始时间</td>
        <td class="auto-style1">活动结束时间</td>
        <td class="auto-style1">分享奖励类型</td>
        <td class="auto-style1">分享奖励</td>
        <td class="auto-style1">被分享奖励类型</td>
        <td class="auto-style1">被分享奖励</td>
        <td class="auto-style1">奖励兑换条件</td>
        <td class="auto-style1">是否有效</td>
        <td class="auto-style1">操作</td>
    </tr>
    </thead>
    <tbody>
    <c:set var="dataIndex"></c:set>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <c:set var="dataIndex" value="${dataIndex+1}"></c:set>
        <tr>
            <td>${dataIndex}</td>
            <td>${bean.activity_name}</td>
            <td>${bean.begin_tm}</td>
            <td>${bean.end_tm}</td>
            <td>
                <c:if test="${bean.share_reward_type==1}">现金奖励</c:if>
            </td>
            <td>${bean.share_reward_value}</td>
            <td>
                <c:if test="${bean.beshared_reward_type==1}">现金奖励</c:if>
            </td>
            <td>${bean.beshared_reward_value}</td>
            <td>
                <c:if test="${bean.reward_exchange_type==1}">限购买特定活动商品可兑换奖励</c:if>
                <c:if test="${bean.reward_exchange_type==2}">购买所有我的品牌产品均可兑换奖励</c:if>
            </td>
            <td>
                <c:if test="${bean.isValid==1}">有效</c:if>
                <c:if test="${bean.isValid==0}">无效</c:if>
            </td>
            <td>
                <input class="btn btn-inverse" type="button" value="查看活动详情"
                       onclick="goUrl('activityDetail?id=${bean.id}');"/>&nbsp;
                <c:if test="${bean.isValid==1}">
                    <input class="btn btn-inverse" type="button" value="取消活动"
                           onclick="withdrawActivity('${bean.id}');"/>
                </c:if>
            </td>
            <td>
            </td>
        </tr>
    </c:forEach>
    <tr class="tr_pagenumber">
        <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit}"
                                    totalCount="${page.totalCount }"/></td>
    </tr>
    </tbody>
</table>
<script type="text/javascript">
    function withdrawActivity(id) {

        /* layer.confirm('是否确定取消活动？', {
         btn: ['是','否'] //按钮
         }, function(){
         layer.msg('的确很重要',{
         time: 1 //1s后自动关闭
         });
         }, function(){
         layer.msg('也可以这样', {
         time: 1 //1s后自动关闭
         });
         });*/
//    layer.confirm('您是如何看待前端开发？', {
//      btn: ['重要','奇葩'] //按钮
//    }, function(){
//      layer.msg('的确很重要', {icon: 1});
//    }, function(){
//      layer.msg('也可以这样', {
//        time: 20000, //20s后自动关闭
//        btn: ['明白了', '知道了']
//      });
//    });
        $.ajax({
            type: 'post',
            url: 'withdrawActivity',
            data: {
                id: id
            },
            success: function (msg) {
                if (msg.status == 'y') {
                    goUrl('marketActivityList')
                } else {
                    alert(msg.info);
                }
            }
        });


    }

</script>
