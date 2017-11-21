<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>订单审核
</div>
<form id="searchForm" action="checkPinzheng">
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
            <td>订单号</td>
            <td class="detail">
                <input id="orderNum" class="dinp" name="orderNum" type="text" value="${model.orderNum }"/>
            </td>
            <%--<td>商户名</td>
            <td>
              <input id="bUserName" name="bUserName" class="dinp" type="text" value="${model.bUserName}" />
            </td>--%>
            <td>用户手机</td>
            <td>
                <input id="userPhone" name="userPhone" class="dinp" type="text" value="${model.userPhone }"/>
            </td>
            <td>用户姓名</td>
            <td>
                <input id="userRealName" name="userRealName" class="dinp" type="text" value="${model.userRealName }"/>
            </td>
        </tr>
        <tr>
            <td colspan="10" align="right">

                <input class="btn btn-inverse" onclick="queryForm()" type="button" value="查询"/>&nbsp;
                <input class="btn btn-inverse" onclick="resetForm()" type="button" value="清空"/>
            </td>
        </tr>
        </tbody>
    </table>
</form>
<table class="table table-striped table-bordered table-hover" id="top">
    <thead>
    <tr class="tr_detail">
        <td class="auto-style1">订单号</td>
        <td class="auto-style1">支付方式</td>
        <td class="auto-style1">分期期数</td>
        <td class="auto-style1">商户</td>
        <td class="auto-style1">服务商门店</td>
        <td class="auto-style1">订单金额</td>
        <td class="auto-style1">上传凭证状态</td>
        <td class="auto-style1">凭证</td>
        <td class="auto-style1">订单时间</td>
        <td class="auto-style1">操作</td>
        <%--
            b.id,b.user_id,b.order_num,b.order_money,b.pay_type,b.periodization,date_format(b.order_date,'%Y-%m-%d %h:%i:%s') as order_date,b_user_id,b.facilitator_id,b.car_num,b.status,b.imgUrl
        --%>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageBean}" var="bean" varStatus="st">
        <tr>
            <td>${bean.order_num}</td>
            <td>
                <c:if test="${bean.pay_type == 0}">立即支付</c:if>
                <c:if test="${bean.pay_type == 1}">分期支付</c:if>
            </td>
            <td>${bean.periodization}</td>
            <td><a onclick="viewBuser('${bean.bUserId}');" style="cursor: pointer">查看商户</a></td>
            <td><a onclick="viewFacilitator('${bean.facilitatorId}');" style="cursor: pointer">查看门店</a></td>
            <td>${bean.order_money}</td>
            <td>
                <c:choose>
                    <c:when test="${bean.status==0}">待上传凭证</c:when>
                    <c:when test="${bean.status==1}">待审核</c:when>
                </c:choose>
            </td>

            <td>

                <c:if test="${bean.status==1}">
                    <button class="xiaofei">消费凭证</button>
                    <input type="hidden" class="hiddenClass" value="${bean.order_num}"/>
                    <button class="chep">车牌照</button>
                  <%-- <a href="${resourceURL}${pics.img_url}" target="_blank" style="cursor: pointer;color: #08c">消费凭证</a>
                   <a href="${resourceURL}${pics.img_url}" target="_blank" style="cursor: pointer;color: #08c">车牌照</a>--%>
                </c:if>
                </td>
            <td><fmt:formatDate value="${bean.order_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <c:if test="${bean.status==1}">
                    <input class="btn btn-inverse" type="button" value="通过"
                           onclick="goCheck('auditOrderStatus','${bean.id}','2');"/>&nbsp;
                    <input class="btn btn-inverse" type="button" value="不通过"
                           onclick="goCheck('auditOrderStatus','${bean.id}','5');"/>&nbsp;
                </c:if>
            </td>
        </tr>
    </c:forEach>
    <tr class="tr_pagenumber">
        <td colspan="100"><my:pager curPage="${page.page }" pageSize="${page.limit }"
                                    totalCount="${page.totalCount }"/></td>
    </tr>
    </tbody>
</table>
<script type="text/javascript">
    /*查看消费*/

    $('.xiaofei').click(function(){
        var order_id= $(this).siblings(".hiddenClass").val();
        $.ajax({
            url:"/admin/getPhotos",
            data:{"type":1,"orderNum":order_id},
            dataType:"JSON",
            success:function(data){
                window.open(data.imgUrl,"_blank");
            }
        });
    })
    $('.chep').click(function(){
        var order_id= $(this).siblings(".hiddenClass").val();
        $.ajax({
            url:"/admin/getPhotos",
            data:{"type":2,"orderNum":order_id},
            dataType:"JSON",
            success:function(data){
                if(data.error=='error'){
                    alert("当前订单没有车牌照");
                    return;
                }
                window.open(data.imgUrl,"_blank");
            }
        });
    })
    function viewBuser(id) {

        openWindow("queryBUserIndexView?id=" + id, "商户信息", 800, 600);
    }


    function viewFacilitator(id) {

        openWindow("queryCFacilitatorIndexView?id=" + id, "门店信息", 800, 600);
    }


    function viewGoods(id) {
        openWindow("queryOrderGoodsListView?orderId=" + id, "商品信息", 1100, 600);
    }

    function goCheck(url, id, status) {

        $.ajax({
            type: 'post',
            url: url,
            data: {
                orderId: id,
                status: status
            },
            success: function (msg) {
                if (msg.status == 1) {
                    layer.alert("处理成功",{
                        icon:3
                    })
                    var params = $("#searchForm").serialize();
                    goUrl("checkPinzheng?" + params);
                  //  $("#mainContent").html($("#searchForm").submit());
                } else {
                    layer.alert("处理失败");
                }
            }
        });

    }


    function openWindow(url, name, iWidth, iHeight) {
        var url;                                 //转向网页的地址;
        var name;                           //网页名称，可为空;
        var iWidth;                          //弹出窗口的宽度;
        var iHeight;                        //弹出窗口的高度;
        var iTop = (window.screen.availHeight - 30 - iHeight) / 2;       //获得窗口的垂直位置;
        var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;           //获得窗口的水平位置;
        window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
    }
</script>
<!--右边框架结束-->