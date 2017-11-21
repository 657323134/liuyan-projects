<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <title>规则详情</title>
    <link rel="stylesheet" href="/css/front/common.css">
    <style>
        .rule-details{background: #fff;}
        .rule-details .rule-box{margin: 0% auto; width: 90%; line-height: 25px;}
        .rule-details .rule-box h3{margin-top: 10px;}
    </style>
</head>
<body class="rule-details">
<header>
    <a class="back-btn" href="javascript:history.back()"></a>
    <div class="title">规则详情</div>
    <div class="header-right"></div>
</header>
<div class="rule-box container">
    <h3>规则说明：</h3>
    <p>用户（以下称为“分享者”）通过社交渠道将活动商品链接分享给好友（以下称为“被分享者”），好友凭手机号可接受邀请，好友安装成功平台审核后即可领取活动${moneys}元现金红包。</p>
    <h3>一、玩法介绍：</h3>
    <p>1、注册用户均可参与分享有礼活动，获得分享奖励；<br>
        2、新老用户凭手机号可接受分享，成为被分享者；<br>
        3、被分享者安装成功平台审核后予与奖励兑现，现金奖励可提现至本人银行卡；<br>
        4、奖励可在“个人中心”-“我的收入”-“分享有礼”查看，<br>
        5、被分享者也可以同样分享活动商品给其他好友，以获得分享奖励，<br>
        6、分享越多好友奖励越多，上不封顶；<br>
    </p>

    <h3>二、活动奖励说明</h3>
    <p>1、分享者和被分享者奖励形式以活动实际情况为准;<br>
        2、被分享者安装成功后系统审核后自动发放至分享者和被分享者的个人账户中；<br>
        3、活动期间安装成功后奖励均可兑换，活动结束后未兑换的奖励奖自动失效；<br>
    </p>

    <h3>三、其他注意事项：</h3>
    <p>1、如用户在活动期间存在违规行为，平台有权取消用户的活动参与资格，并收回已发放的奖励。<br>
        2、优卡分期保留以上活动规则变动、调整和解释权，相关变动或调整将公布在活动页面上，并于公布时即时生效</p>
</div>
</body>
</html>
