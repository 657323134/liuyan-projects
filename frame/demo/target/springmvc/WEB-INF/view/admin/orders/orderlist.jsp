<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b>订单结算
</div>
<form id="searchForm" action="queryOrderInfoList">
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
            <%-- <td>商户名</td>
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
            <td>订单状态</td>
            <td>
                <select class="dinp" name="status" id="orderCStatus">
                    <option value="">请选择</option>
                    <option value="-1" <c:if test="${model.status == -1}">selected</c:if>>无效订单</option>
                    <option value="1" <c:if test="${model.status == 1}">selected</c:if>>待审核</option>
                    <option value="2" <c:if test="${model.status == 2}">selected</c:if>>结算中</option>
                    <option value="3" <c:if test="${model.status == 3}">selected</c:if>>已结算</option>
                    <option value="4" <c:if test="${model.status == 4}">selected</c:if>>已失效</option>
                    <option value="5" <c:if test="${model.status == 5}">selected</c:if>>未通过</option>
                    <option value="6" <c:if test="${model.status == 6}">selected</c:if>>已取消</option>
                </select>
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
        <td class="auto-style1">订单状态</td>
        <td class="auto-style1">凭证</td>
        <td class="auto-style1">用户姓名</td>
        <td class="auto-style1">用户手机号</td>
        <td class="auto-style1">自动还款</td>
        <td class="auto-style1">用户签名</td>
        <td class="auto-style1">商品明细</td>
        <td class="auto-style1">订单时间</td>
        <td class="auto-style1">操作</td>
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
            <td><a onclick="viewBuser('${bean.bUserId}');" style="cursor: pointer">${bean.bname}</a></td>
            <td><a onclick="viewFacilitator('${bean.facilitatorId}');"
                   style="cursor: pointer">${bean.facilitatorName}</a></td>
            <td>${bean.order_money}</td>
            <td>
                    <c:if test="${bean.cancel_order_status!=2}">
                        <c:choose>
                            <c:when test="${bean.status==0}">待上传凭证</c:when>
                            <c:when test="${bean.status==1}">待审核</c:when>
                            <c:when test="${bean.status==2}">结算中</c:when>
                            <c:when test="${bean.status==3}">已结算</c:when>
                            <c:when test="${bean.status==4}">已失效</c:when>
                            <c:when test="${bean.status==5}">未通过</c:when>
                        </c:choose>
                    </c:if>
                    <c:if test="${bean.cancel_order_status==2}">
                        已取消
                    </c:if>

            </td>
                <%--
                      "'${resourceURL}' + '${bean.imgUrl}'"2394201612221542586951.PNG
                --%>
                <%--
                      <c:set var="imgUrl" value="${}"></c:set>
                --%>
            <td><a href="${resourceURL}${bean.imgUrl}" target="_blank" style="cursor: pointer;color: #08c">查看凭证</a></td>
            <td>${bean.realName}</td>
            <td>${bean.cellphone}</td>
            <td>
                <c:if test=" ${bean.is_auto_return == 0}">不自动还款 </c:if>
                <c:if test=" ${bean.is_auto_return == 1}">自动还款</c:if>
            </td>
            <td><a onclick="viewSignature('${bean.user_signature}','${bean.id}')">查看签名</a></td>
            <td><a onclick="viewGoods('${bean.id}');" style="cursor: pointer">查看商品明细</a></td>
            <td><fmt:formatDate value="${bean.order_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <c:if test="${bean.status==2}">
                    <input class="btn btn-inverse" type="button" value="结算"
                           onclick="goCheck('auditOrderStatus','${bean.id}','3');"/>&nbsp;
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

    function viewBuser(id) {

        openWindow("queryBUserIndexView?id=" + id, "商户信息", 800, 600);
    }


    function viewFacilitator(id) {

        openWindow("queryCFacilitatorIndexView?id=" + id, "门店信息", 800, 600);
    }

    function viewGoods(id) {
        openWindow("queryOrderGoodsListView?orderId=" + id, "商品信息", 1100, 600);
    }

    function viewSignature(user_signature, id) {
        openWindow("userSignView?orderId=" + id, "商品信息", 1100, 600);
    }

    function goCheck(url, id, status) {
        if(confirm("是否立即结算该订单")){
            $.ajax({
                type: 'post',
                url: url,
                data: {
                    orderId: id,
                    status: status
                },
                success: function (msg) {
                    if (msg.status == 1) {
                        var params = $("#searchForm").serialize();
                        layer.alert("处理成功");
                        goUrl("queryOrderInfoList?" + params);
                        //$("#mainContent").html($("#searchForm").submit());
                    }else if(msg.status==2){
                        layer.alert("平台账户余额不足，结算失败");
                    } else {
                        layer.alert("处理失败");
                    }
                }
            });
        }
        else{
            return false;
        }
       /* */

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