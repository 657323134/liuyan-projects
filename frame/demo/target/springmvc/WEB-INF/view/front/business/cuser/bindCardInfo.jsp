<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=utf-8" %>
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
    <link rel="stylesheet" href="/css/businesses/weui.min.css">
    <link rel="stylesheet" href="/css/front/common.css">
    <link rel="stylesheet" href="/css/front/style.css">
    <link rel="stylesheet" href="/css/front/city-picker.css">
</head>
<body>
<header>
    <%--<a class="back-btn" href="index.html"></a>--%>
    <div></div>
    <div class="title">个人资料</div>
    <div class="header-right"></div>
</header>
<div class="container show-data by-stage">
    <!--步骤条-->
    <div class="steps-bar">
        <div class="sui-steps-round steps-round-auto steps-3">
            <div class="finished">
                <div class="wrap">
                    <div class="round">1</div>
                    <div class="bar"></div>
                </div>
                <label>基本信息</label>
            </div>
            <div class="finished">
                <div class="wrap">
                    <div class="round">2</div>
                    <div class="bar"></div>
                </div>
                <label>工作信息</label>
            </div>
            <div class="todo last current">
                <div class="wrap">
                    <div class="round">3</div>
                </div>
                <label>绑定银行卡</label>
            </div>
        </div>
    </div>
    <c:forEach items="${columnsMap}" var="entry">
        <input id="backModule${entry.key}" value="${entry.value}" hidden="hidden" />
    </c:forEach>
    <!--基本信息-->
    <%--<form id="saveCar" enctype="multipart/form-data" method="post">--%>
        <!--图片隐藏域-->
        <%--<div class="hidden-file" style="display: none">
            <input class="img-in" name="cardidImgA" type="file" id="cardidImgA" onchange="userImgChange(this);"
                   style="visibility:hidden"/>
            <input class="img-in" name="cardidImgB" type="file" id="cardidImgB" onchange="userImgChange(this);"
                   style="visibility:hidden"/>
            <input class="img-in" name="carImgA" type="file" id="carImgA" onchange="userImgChange(this);"
                   style="visibility:hidden"/>
            <input class="img-in" name="carImgB" type="file" id="carImgB" onchange="userImgChange(this);"
                   style="visibility:hidden"/>
            <input class="img-in" name="bankImgA" type="file" id="bankImgA" onchange="userImgChange(this);"
                   style="visibility:hidden"/>
            &lt;%&ndash;<input class="img-in" name="bankImgB" type="file" id="bankImgB"  onchange="userImgChange(this);" style="visibility:hidden"/>&ndash;%&gt;
        </div>
--%>
        <!--银行卡-->
        <%--银行卡遮罩层--%>
        <c:if test="${status==4 && !fn:contains(moduleInfos, 6)}">
            <div id="bankInfoMask" class="maskStyle">
            </div>
        </c:if>
        <div id="bankInfo" class="input-box user-data">
            <h2 class="title">绑定银行卡</h2>
            <span>还款代扣时使用</span>

            <c:if test="${status==4}">
                <c:if test="${fn:contains(moduleInfos, 6)}">
                    <span onclick="showTips('backModule6')" class="span-yz" id="ntp-ico"><img src="/images/front/adopt-wtg.png" class="adopt-img">未通过</span>
                </c:if>

                <c:if test="${!fn:contains(moduleInfos, 6)}">
                    <span class="span-yz"><img src="/images/front/adopt-tg.png" class="adopt-img">验证通过</span>
                </c:if>
            </c:if>


            <div class="data-input">
                <div class="data-left">选择银行</div>
                <select class="select" id="bank" name="bank">
                    <option value="0">请选择</option>
                    <c:forEach var="aBankType" items="${tBankType}">
                        <c:if test="${aBankType.name != '其他银行'}">
                            <option value="${aBankType.id}"
                                    <c:if test="${tUserBank.bankNumber == aBankType.bankcode}">selected</c:if>>${aBankType.name}
                            </option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="data-input">
                <div class="data-left">银行卡号</div>
                <input type="text" placeholder="请绑定本人银行卡" name="bankcard" id="bankcard"
                       value="${tUserBank.bankAccount}"/>
                <input type="hidden" id="cellPhone" value="${cUser.cellPhone}"/>
            </div>
            <div class="">
                <label for="weuiAgree" class="weui-agree">
                    <input type="checkbox" class="weui-agree__checkbox" id="daikou" />
                    <input type="hidden" id="daikous" name="is_dy" value="${cUserCar.is_dy}"/>
                    <span class="weui-agree__text">同意使用银行卡自动代扣还款</span>
                </label>
            </div>

            <%--<div class="user-photo">--%>
                <%--<p class="photo-text">请拍摄本人储蓄卡正面照片并上传</p>--%>

                <%--<div class="user-upload">--%>
                    <%--<div class="upload-img">--%>
                        <%--<input type="hidden" class="imgName" value="bankImgA"/><!--file对象名-->--%>
                        <%--&lt;%&ndash;<div class="reset-btn"></div>&ndash;%&gt;--%>
                        <%--<img id="bankImgA-img" class="img-box"--%>
                             <%--<c:if test="${not empty bankImgA }">src="${bankImgA}" </c:if>--%>
                             <%--<c:if test="${empty bankImgA }">src="/images/front/default-img.png" </c:if>/>--%>

                        <%--<div class="upload-btn" <c:if test="${not empty bankImgA }">style="display: none" </c:if>>添加--%>
                        <%--</div>--%>
                        <%--<div class="upload-name">储蓄卡正面照片</div>--%>
                    <%--</div>--%>
                    <%--<div class="upload-img">--%>
                    <%--<input type="hidden" class="imgName" value="bankImgB"/><!--file对象名-->--%>
                    <%--&lt;%&ndash;<div class="reset-btn"></div>&ndash;%&gt;--%>
                    <%--<img id="bankImgB-img" class="img-box" <c:if test="${not empty bankImgB }">src="${bankImgB}" </c:if>  <c:if test="${empty bankImgB }">src="/images/front/default-img.png" </c:if>/>--%>
                    <%--<div class="upload-btn"  <c:if test="${not empty bankImgB }">style="display: none" </c:if>>添加</div>--%>
                    <%--<div class="upload-name">银行卡反面</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>

        </div>
        <c:if test="${check!=null}">
            <input type="hidden" id="Msg" value="${check}"/>
        </c:if>

        <a class="next-btn" id="nextStep-btn" onclick="checkBankCard()">下一步</a>
        <input type="hidden" id="userid" name="userid" value="${cUser.id}"/>
    <%--</form>--%>
</div>

<div class="pop-up imgTips">
    <!--<div class="mask animate-fade-in"></div>-->
    <div class="picker animate-slide-up">
        <div class="top-bar">
            <h3>图片上传示例</h3>
            <a href="javascript:;" data-action="cancel" class="action" id="imgCancel">取消</a>
            <!--<a href="javascript:;" data-action="select" class="weui-picker__action" id="weui-picker-confirm">确定</a>-->
        </div>
        <div class="content">
            <img src="/images/front/single-project-img.png" alt="" id="imgExample"/>

            <div class="tip">
                <h5>示例说明：</h5>

                <div id="txtExplain">
                    <%--<p>1. 打开支付宝应用进入“我的”页面，点击头像进入“个人中心”，点击进入“个人主页”</p>--%>
                    <%--<p>2.点击显示更多将芝麻信用显示出来截取当前屏幕，上传截图即可，如左图显示。</p>--%>
                    <%--<p>注意：截取屏必须同时显示真实姓名和芝麻信用信息</p>--%>
                </div>
            </div>
            <div class="upload-pic">
                <div class="btn" onclick="javascript:openFile('cardidImgA')">立即上传</div>
            </div>
            <input type="hidden" id="imgType"/>
        </div>
    </div>
</div>

<%--资料验证不通过信息提示--%>
<div class="pop-up pop-up-wtg">
    <div class="pop-up-box wait-ntp">
        <figure>
            <a href="javascript:;" class="wait-img" id="wait-ntp-ai"></a>
            <div class="wait-ntp-box">
                <span class="wait-span">验证未通过</span>
            </div>
            <p class="wait-p2" id="wait-ntp-idp"></p>
        </figure>
        <a href="javascript:;" class="weui-btn weui-btn_plain-primary xiugai-a">我知道了</a>
    </div>
</div>

</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/front/cuser_common.js?v=1"></script>
<script src="/js/front/cUserData.js?v=1"></script>
<script src="/js/front/fileHandle.js?v=1"></script>
<%--<script src="/js/front/city-picker.data.js"></script>--%>
<%--<script src="/js/front/city-picker.js"></script>--%>

<script>
   $(function () {
      /* var resultMsg = $("#Msg").val();
       if(resultMsg!=null || resultMsg==''){
           alert("身份证号有误");
       }*/

       $("#bankInfoMask").css("height", $("#bankInfo").height());
       $("#bankInfoMask").css("width", $("#bankInfo").width());
       if (${status==4}) {
           $("#daikou").attr("checked","checked");
       }


       //弹框方法
       var popUp = {
           show : function(ele){
               $('.pop-up-wtg').show().children(ele).show();
           },
           hide : function (ele) {
               $('.pop-up-wtg').hide().children(ele).hide();
           }
       };

       //关闭未通过提示
       $("#wait-ntp-ai").click(function(){
           popUp.hide('.wait-ntp');
       });

       $(".xiugai-a").click(function(){
           popUp.hide('.wait-ntp');
       });

       //审核未通过改变文字颜色提示
       var backColumns = "${backColumns}";
       noPassColumns(backColumns);
   });


</script>
</html>