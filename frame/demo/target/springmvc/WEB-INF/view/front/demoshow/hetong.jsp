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
    <title>优卡分期--合同</title>
    <style>
        body .rows {
            /*padding-right: 4%;*/
            width: 100%;
            height: 300px;
            overflow: auto;
        }

        .rows {
            height: 230px;
            overflow: hidden;
            overflow-y: auto;
        }

        .rows::-webkit-scrollbar-track-piece {
            background-color: rgba(0, 0, 0, 0);
            border-left: 1px solid rgba(0, 0, 0, 0);
        }

        .rows::-webkit-scrollbar {
            width: 5px;
            height: 13px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

        .rows::-webkit-scrollbar-thumb {
            background-color: rgba(0, 0, 0, 0.5);
            background-clip: padding-box;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            min-height: 28px;
        }

        .rows::-webkit-scrollbar-thumb:hover {
            background-color: rgba(0, 0, 0, 0.5);
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }
    </style>
</head>
<body class="bg-eee">
<p style="text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px"><span
            style="font-family:宋体">个人消费信贷申请及征信授权协议</span></span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">鉴于：</span>(1)</span><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px">深圳市优卡分期科技有限公司</span><span
        style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">（以下简称</span>“贷款人”）是一家致力于为用户提供全</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">方位的普惠金融服务，通过运用互联网技术简化申请贷款流程、提高贷款审核与发放效率，提升用户的体验的有限责任公司；</span>(2)在本协议签名的自然人用户（以下简称”申请人”）有意使用贷款人提供的产品和服务，向贷款人申请个人消费贷款。现就贷款人向申请人提供消费贷款的条件以及贷款人向申请人提供相关客户服务等内容，由贷款人和申请人共同确认以下条款：</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span
            style="font-family:宋体">一、</span></span><strong><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px"><span
        style="font-family:宋体">贷款人的业务范围</span> </span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px">&nbsp;</span></strong><span
        style=";font-family:宋体;line-height:200%;font-size:14px">1、发放个人消费贷款；2、与消费金融相关的咨询、代理业务。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span
            style="font-family:宋体">二、</span></span><strong><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px"><span
        style="font-family:宋体">申请人需满足的条件</span> &nbsp;</span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">申请人向贷款人申请任何一款贷款产品均需满足以下条件：</span>1、申请人具有完全民事行为能力；2、资信状况良好。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span
            style="font-family:宋体">三、</span></span><strong><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px"><span
        style="font-family:宋体">双方确认</span></span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">1、在本协议签署日之后，贷款人有权根据申请人的过往征信记录情况、资信状况变化或突发性欺诈风险等情况，按照贷款人内部审核标准自主确定是否向申请人发放贷款以及发放贷款的具体额度。贷款人不因本协议的签署承诺向申请人发放贷款，具体贷款产品的发放以后续签署的贷款合同条款约定为准。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">2、无论贷款人最终是否向申请人发放贷款，申请人向贷款人提交的申请资料以及贷款人查询获取的申请人的个人征信等信息资料均不予退还，但是，贷款人应当根据相关规定妥善保存并在申请人的授权范围内使用申请人的个人信息、个人征信信息以及其他相关信息资料。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span style="font-family:宋体">四、申请人同意并不可撤销地授权贷款人：</span></span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">1、通过面签授权方式（包括但不限于面签专门的授权文件、含有授权条款的合同或文件）或通过信息网络方式（包括但不限于通过网络、电话、以及其他及时通信工具等数据电文方式进行签署或确认授权）给予贷款人的授权均系申请人的真实意思表示，贷款人有权按照申请人的授权查询、获取、使用、维护、保存申请人的个人信息、个人征信信息以及其他相关信息，贷款人有权将申请人的借款相关信息上传至个人征信数据库。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">2、出于向申请人提供消费贷款及相关服务之目的（包括但不限于贷款申请的处理、各阶段的贷款管理、账户及付款管理、双方权利的保护及执行等），贷款人向贷款人的关联公司、合作伙伴、依法设立的征信机构及其他台法来源查询并获取申请人的个人相关信息（包括但不限于本人身份信息、信用信息、社会保险及公积金相关信息等）；贷款人有权提供申请人信用信息及个人相关信息和贷款信息给贷款人的关联公司以及合作伙伴、依法设立的征信机构等；贷款人将部分与贷款合同有关的服务外包给贷款人的业务合作伙伴，并为履行该服务外包合同之目的将申请人的相关个人信息和相关贷款信息提供给该业务合作伙伴；贷款人推荐产品时可以使用申请人的个人信息，推荐的方式包括但不限于向申请人通信地址、电子邮箱、移动电话（含短信和彩信等）、QO、微信等发送产品信息。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">3、出于对申请人信用状况的评估和与申请人所申请的贷款、偿还和违约追究有关的目的，向芝麻信用等拥有台法资质的征信机构查询并获取申请人的个人相关信息。申请人特此授权该等征信机构，可基于提供征信服务的目的，依法采集、查询、保存、整理、加工申请人的信息。申请人理解并同意，申请人的收入、存款、有价证券、商业保险、不动产的信息和纳税数额等资产信息可被征信机掏采集和使用，以及相应的后果，包括但不限于纳入这些信息对申请人的信用评级（评分）、信用报告等结果可能产生的影响。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">4、申请人同意还款时由贷款人及贷款人指定第三方进行代扣，并在此不可撤销地授权贷款人及贷款人指定第三方从申请人指定的银行账户划扣到期应还的相应款项至贷款人账户，而无需进—步通知申请人或者得到其同意。若申请人指定的银行卡账户暂不支持代扣的，—旦贷款人接入申请人指定银行卡账户的代扣服务，申请人同意并不可撤销的授权贷款人对其指定的银行账户进行代扣还款的设置，而无需进—步通知申请人或得到其同意。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">5、申请人同意在此之后申请贷款人的任何—款产品时，通过账号密码、验证码及其他身份验证方式验证的手机客户端、网络等方式填写的申请表、签署电子贷款合同，与申请人面签申请表及贷款合同具有同等法律效力。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">6、申请人为了通过多种渠道获得贷款，特授权贷款人：如果申请人未能从贷款人处成功获得贷款，则申请人委托贷款人将申请人推荐给贷款人其他合作伙伴，并授权贷款人将申请人的贷款申请、个人信息、评估及审核结果等所有信息资料提供给贷款人合作伙伴。贷款人合作伙伴使用申请人的贷款申请、个人信息、评估及审核结果等所有信息资料，仅用于向申请人提供相关产品或服务。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">7、特别授权--申请人无条件、不可撤销地授权贷款人：出于向申请人提供消费贷款及相关服务之目的，申请人授权贷款人向中国人民银行个人信用信息基础数据库查询并获取申请人的个人征信等相关信息，并向该数据库报送申请人的有关信息。本授权即日起生效。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;margin-right:28px;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px;"><span style="font-family:宋体">贷款申请人：</span></span></strong><strong><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px;">&nbsp;${cUser.realName}</span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px;"><span style="font-family:宋体">身份证号码：</span></span></strong><strong><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px;">&nbsp;${cUser.cardid}</span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px;"><span style="font-family:宋体">签署日期：</span> &nbsp;${year}&nbsp;<span
            style="font-family:宋体">年</span> &nbsp;${month}&nbsp;<span style="font-family:宋体">月</span> &nbsp;${day}&nbsp;<span
            style="font-family:宋体">日</span></span></strong>
</p>

<p style="margin-top:0;text-indent:392px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;text-indent:392px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;text-indent:392px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;text-indent:392px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;text-indent:392px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;text-indent:392px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;text-indent:392px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;text-indent:392px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;text-indent:392px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px"><span
            style="font-family:宋体">借款人告知书</span></span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px;"><span style="font-family:宋体">尊敬的</span></span><span
        style="text-decoration:underline;"><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px;">&nbsp;${cUser.realName}&nbsp;</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px;"><span style="font-family:宋体">（女士、先生）：</span></span>
</p>

<p style="margin-top:16px;text-indent:28px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span
            style="font-family:宋体">非常感谢您选择</span></span><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span
        style="font-family:宋体">深圳市优卡分期科技有限公司</span></span><span style=";font-family:宋体;line-height:200%;font-size:14px"><span
        style="font-family:宋体">分期付款这种最新的消费方式。希望我们的服务能提高您生活质量，让您的生活更加时尚、更加现代化。在您充分享受美好生活之际，请按时按计划还款。</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px;"><span
        style="font-family:宋体">您的首次还款日期：</span></span><span style="text-decoration:underline;"><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px;">&nbsp;${firstDate}&nbsp;</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px;">&nbsp;<span
        style="font-family:宋体">，之后每月还款日期：</span></span><span style="text-decoration:underline;"><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px;">&nbsp;${lastDate}&nbsp;</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px;"><span style="font-family:宋体">，</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">每月还款额</span></span><span
        style="text-decoration:underline;"><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px">&nbsp;<fmt:formatNumber value="${everyRepayMoney}"
                                                                                          pattern="0.00"/>&nbsp;</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px"><span
        style="font-family:宋体">元。以下是您分期付款业务的详情：</span></span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span
            style="font-family:宋体">借款人信息</span></span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span
            style="font-family:宋体">借款人姓名：</span></span><strong><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px;">&nbsp;${cUser.realName}</span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span
            style="font-family:宋体">身份证号码：</span></span><strong><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px;">&nbsp;${cUser.cardid}</span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span
            style="font-family:宋体">借款基本信息</span></span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span
            style="font-family:宋体">贷款本金（元）：</span></span><strong><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px;">&nbsp;<fmt:formatNumber value="${border.order_money}"
                                                                                           pattern="0.00"/></span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span
            style="font-family:宋体">分期期数（月）：</span></span><strong><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px;">&nbsp;${totalPeriods}</span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">每月还款额（元）：参照《还款计划表》</span></span>
</p>

<p style="margin-top:0;text-indent:28px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">为了您的良好信用记录，避免产生不必要的违约金，建议您在到期还款日期前保证代扣银行卡中余额大于每次应还款。我们将在每月到期还款日从您的指定银行账户内自动划扣。如您的银行代扣账户有变动，请致电客服热线或网上提交变更账户信息。</span></span>
</p>

<p style="margin-top:0;text-indent:28px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span
            style="font-family:宋体">若您有建议或疑问，欢迎致电</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px;"><span style="font-family:宋体">客服热线</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">：</span></span><span
        style="text-decoration:underline;"><span style="font-family: 宋体;line-height: 200%;font-size: 14px">&nbsp;0755-86627587&nbsp;</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;text-indent:28px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">如您阅读后理解并同意本</span>“借款人告知书”和”个人商品贷合同”的内容，请确认合同。确认合同即表示您认真考虑了自己每月的还款能力，也仔细阅读了“借款人告知书”和“合同的重要事项提示”的内容，对其完全理解并同意。</span>
</p>

<p style="margin-top:0;margin-right:28px;text-indent:392px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px;"><span style="font-family:宋体">签名：</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px;">&nbsp;${cUser.realName}</span>
</p>

<p style="margin-top:0;margin-right:28px;text-indent:392px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px;"><span style="font-family:宋体">日期：</span> &nbsp;${year}&nbsp;<span
            style="font-family:宋体">年</span> &nbsp;${month}&nbsp;<span style="font-family:宋体">月</span> &nbsp;${day}&nbsp;<span
            style="font-family:宋体">日</span></span>
</p>

<p style="margin-top:0;text-align:right;line-height:200%">
    <span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span
            style="font-family:宋体">深圳市优卡分期科技有限公司</span></span>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px"><span
            style="font-family:宋体">合同的重要事项提示</span></span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">1、您分期付款的期数、金额以及还款日期都在合同中列明，您应按照合同中约定的每月还款日按时并足额还款。合同中列明的每月还款额是您每月应偿还的总金额，包括贷款本金、利息客户服务费以及可选服务费（如有）等。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">2、在每月还款日前，您可以随时主动还款。若未主动还款，请确保您的银行账户里在还款到期日有足够的余额保证我司代扣成功。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style="font-family: 宋体;line-height: 200%;font-size: 14px">3、如果您想取消分期服务，您除了应偿还全部贷款本金之外，还需支付截至提前还款月（含）的应付利息、客户服务费和可选服务费（如有）。请您仔阅读合同，确保您完全理解如何申请提前还款，以及相应款项应何时到账。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">4、您申请的贷款只能用于您在合同中约定的贷款目的。您应保存货款使用的相关证明（如消费发票和合同等）。如果我司请求您提供该证明，您应向我司提供。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">5、为顺利履行您的合同并保障我司的权益，我司可能在人民银行个人信用信息基础数据库或征信机构中使用或向其提供您的个人相关信息，也可能在进行信用评估、数据处理、风险控制、产品推荐、还款提醒等活动时，使用您的个人相关信息。如业务需要，我司可能将您的个人相关信息提供给为我司提供以上服务的合作单位。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">6、如您个人信息（如手机号码）、地址或雇主信息等发生变更，您应及时通知我司。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style="font-family: 宋体;line-height: 200%;font-size: 14px">7、如您未按合同约定的到期还款日足额偿还分期付款，应向我司支付违约金（逾期第10天产生50元，逾期20天再产生75元，逾期30天再产生100元，逾期60天将再产生100元，逾期90天将再产生100元）。根据合同的相关约定，如果借款人违约，贷款人（或者其授权的第三方）直接或者经由可能认识借款人的第三方，就该违约事件通过当面拜访、电话、邮寄、短信、网络等合法形式，提醒或督促借款人改正违约行为，并且向该第三方披露此违约事件。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">8、您需要妥善保管好个人账号、密码、银行卡及密码以及其他交易信息，凡使用您的账号密码进行的交易均视为您本人所为，由您承担因账号密码保管不善（包括但不限于被盗用等）造成的风险损失。您应确保在安全的信息网络环境下进行交易，对于非我司原因导致的信息网络交易风险和损失，责任将需要您自行承担。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">9、您与我司之间的任何争议应友好协商解决。如协商不能解决，双方均有权向贷款人所在地法院起诉。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">10、以上内容仅作为重要信息提示。请您仔细阅读您的贷款合同全文，以及其它贷款文件，以便详细了解贷款细节及您的权利和义务。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px">&nbsp;</span></strong>
</p>

<p style="margin-top:0;text-align:right;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span
            style="font-family:宋体">深圳市优卡分期科技有限公司</span></span></strong>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px">&nbsp;</span></strong>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px">&nbsp;</span></strong>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px">&nbsp;</span></strong>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px">&nbsp;</span></strong>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px">&nbsp;</span></strong>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px">&nbsp;</span></strong>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px">&nbsp;</span></strong>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px">&nbsp;</span></strong>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px">&nbsp;</span></strong>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px">&nbsp;</span></strong>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px">&nbsp;</span></strong>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 19px"><span style="font-family:宋体">个人消费贷款合同</span></span></strong>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span
            style="font-family:宋体">甲方（贷款人）：</span></span><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px"><span
        style="font-family:宋体">深圳市优卡分期科技有限公司</span></span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px;"><span
            style="font-family:宋体">乙方（借款人）：</span></span><span style=";font-family:宋体;line-height:200%;font-size:14px;">&nbsp;${cUser.realName}&nbsp;</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px;"><span
            style="font-family:宋体">身份证号码：</span></span><span style=";font-family:宋体;line-height:200%;font-size:14px;">&nbsp;${cUser.cardid}&nbsp;</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px;"><span style="font-family:宋体">联系地址：</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;${cUser.companyAddress}${cUser.companyArea}&nbsp;</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span
            style="font-family:宋体">丙方（居间人）：</span></span><span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;<span
        style="font-family:宋体">深圳五维微品金融信息服务有限公司</span></span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span style="font-family:宋体">第</span>—条 &nbsp;贷款基本条款</span></strong>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px">1、&nbsp;</span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">贷款本金：</span></span><span style=";font-family:宋体;font-size:14px;"><span
        style="font-family:宋体">人民币</span></span><span style="text-decoration:underline;"><span
        style="font-family: 宋体;font-size: 14px;">&nbsp;<fmt:formatNumber value="${border.order_money}" pattern="0.00"/>&nbsp;</span></span><span
        style=";font-family:宋体;font-size:14px;"><span style="font-family:宋体">元</span></span><span
        style=";font-family:宋体;font-size:14px"><span style="font-family:宋体">。贷款本金由甲方直接支付给</span></span><span
        style="text-decoration:underline;"><span style="font-family: 宋体;font-size: 14px">&nbsp;${cf.facilitator_name}&nbsp;</span></span><span
        style=";font-family:宋体;font-size:14px"><span style="font-family:宋体">（以下简祢</span></span><span
        style=";font-family:宋体;font-size:14px;">“商家”）。</span>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px">2、&nbsp;</span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">贷款期限及还款额：本合同借款以按月结账的</span></span><span style="font-family: 宋体;font-size: 14px"><span
        style="font-family:宋体">还款方式偿</span></span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">还贷款，</span></span><span style=";font-family:宋体;font-size:14px;"><span
        style="font-family:宋体">首次还款日期是</span></span><span style="text-decoration:underline;"><span
        style="font-family: 宋体;font-size: 14px;">&nbsp;${firstDate}&nbsp;</span></span><span
        style=";font-family:宋体;font-size:14px;"><span style="font-family:宋体">，还款日为每月</span></span><span
        style="text-decoration:underline;"><span style="font-family: 宋体;font-size: 14px;">&nbsp;${everyDay}&nbsp;</span></span><span
        style=";font-family:宋体;font-size:14px;"><span style="font-family:宋体">日</span></span><span
        style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">。借款人还款日之前偿还当期账单金额（下称</span>“账单金额”或“期款”）。</span>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px">3、&nbsp;</span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">还</span></span><span style="font-family: 宋体;font-size: 14px"><span
        style="font-family:宋体">款方式：等额本息。</span></span>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px">4、&nbsp;</span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">发放货款的账户：乙方授权甲方将货款本金支付至商家或商家指定的第三方账户。</span></span>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px;">5、&nbsp;</span><span style=";font-family:宋体;font-size:14px;"><span
        style="font-family:宋体">还款的账户：乙方指定如下银行账户作为还款账户：账户名：</span></span><span style="text-decoration:underline;"><span
        style="font-family: 宋体;font-size: 14px;">&nbsp;${tUserBank.accountName}&nbsp;</span></span><span
        style=";font-family:宋体;font-size:14px;"><span style="font-family:宋体">；开户行名称：</span></span><span
        style="text-decoration:underline;"><span style="font-family: 宋体;font-size: 14px;">&nbsp;${tUserBank.bankname}&nbsp;</span></span><span
        style=";font-family:宋体;font-size:14px;"><span style="font-family:宋体">；账号：</span></span><span
        style="text-decoration:underline;"><span style="font-family: 宋体;font-size: 14px;">&nbsp;${tUserBank.bankAccount}&nbsp;</span></span><span
        style=";font-family:宋体;font-size:14px;"><span style="font-family:宋体">。</span></span>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px;">6、&nbsp;</span><span style=";font-family:宋体;font-size:14px;"><span
        style="font-family:宋体">还款到期日：第一期期款的到期日为</span></span><span style="text-decoration:underline;"><span
        style="font-family: 宋体;font-size: 14px;">&nbsp;${firstDate}&nbsp;</span></span><span
        style=";font-family:宋体;font-size:14px;"><span style="font-family:宋体">；其后的每一期期款的到期日为之后每月的</span></span><span
        style="text-decoration:underline;"><span
        style="font-family: 宋体;font-size: 14px;">&nbsp;&nbsp;&nbsp;</span></span><span
        style="text-decoration:underline;"><span style="font-family: 宋体;font-size: 14px;">&nbsp;${everyDay}&nbsp;</span></span><span
        style="font-family: 宋体;font-size: 14px;"><span style="font-family:宋体">日。（两者统称</span>“还款到期日”）。</span>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family: 宋体;font-size: 14px">7、&nbsp;</span><span style="font-family: 宋体;font-size: 14px"><span
        style="font-family:宋体">贷款用途：仅限于个人消费。乙方</span></span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">使用本合同项下货款消费时应保留相应的消费凭据（包括但不限于发票、收据、购物凭证等），在甲方要求提供时，乙方应当提供。</span></span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span style="font-family:宋体">第二条</span> &nbsp;<span
            style="font-family:宋体">乙方支付的款项</span></span></strong>
</p>

<p style="margin-top:0;margin-left:28px;text-indent:28px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">乙方每月还款额（以下简称</span>“期款”）包括以下(1)至(2)：(1)每月偿还的贷款本金；(2)每月偿还的贷款利息；乙方因签订本合同所应承担的印花税由甲方代扣代缴，印花税包含在第一期期款内。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span style="font-family:宋体">第三条</span> &nbsp;<span
            style="font-family:宋体">甲方向乙方提供的服务</span></span></strong>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style=";font-family:宋体;font-size:14px"><span style="font-family:宋体">甲方向乙方提供以下与本合同有关的服务：</span>(1)贷款方案设计服务；(2)客户个人申请信息维护服务；(3)客户还款信息查询及还款渠道维护服务；(4)客户还款提醒及到账通知服务；(5个人信用管理及维护服务；(6)客户纸质和电子文档管理服务等。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span style="font-family:宋体">第四条</span> &nbsp;<span
            style="font-family:宋体">丙方向乙方提供的服务</span></span></strong>
</p>

<p style="margin-top:0;margin-left:28px;text-indent:28px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">丙方为乙方提供借贷撮合的居间服务。</span></span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span style="font-family:宋体">第五条</span> &nbsp;<span
            style="font-family:宋体">逾期还款</span></span></strong>
</p>

<p style="margin-top:0;margin-left:28px;text-indent:28px;line-height:200%">
    <span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span style="font-family:宋体">如果乙方未按照本合同履行还款义务，应立即偿还拖欠款项，并按本条规定向甲方支付违约金。违约金按照逾期天数计算，逾期天数是指最早一笔未全额支付的期款已逾期的天数。逾期第</span>10天，产生违约金50元；逾期第20天，在已产生的违约金基础上再额外产生违约金75元；逾期第30天，再额外产生违约金100元；逾期第60天，再额外产生违约金100元；逾期第90天，再额外产生违约金100元。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span style="font-family:宋体">第六条</span> &nbsp;<span
            style="font-family:宋体">清偿顺序</span></span></strong>
</p>

<p style="margin-top:0;margin-left:28px;text-indent:28px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">乙方付至甲方账户的款项，按照如下顺序清偿各项债务先到期的债务先偿还；多笔贷款的期款同时到期，乙方申请了提前还款的贷款合同优先偿还，剩余贷款合同按签署时间在前的先偿还；应还款项按照以下顺序依次清偿：贷款本金、印花税、利息、违约金等。</span></span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span style="font-family:宋体">第七条</span> &nbsp;<span
            style="font-family:宋体">各方权利义务</span></span></strong>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px">1、&nbsp;</span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">乙方承诺并保证向甲方提交的所有资料和信息完整、真实、准确、合法有效。乙方如果在甲方或甲方合作方的互联网平台上通过勾选方式签署本合同，是本人的真实意愿，乙方并已充分理解本协议项下所有内容。</span></span>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px">2、&nbsp;</span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">乙方授权甲方或甲方指定第三方从乙方指定或绑定的银行账户将期款及所有本合同项下的其他应付款项划扣至甲方账户，而无需进一步通知乙方或者得到其同意。若乙方指定的银行卡账户暂不支持代扣的，一旦甲方接入乙方指定银行卡账户的代扣服务，乙方同意并不可撤销的授权甲方对其指定的银行账户进行代扣还款的设置，而无需进一步通知乙方或得到其同意。若乙方指定银行账户发生变更，乙方应在账户变更后及时通知甲方并经甲方确认，授权划扣账户相应发生变更。除非乙方特别申明，乙方变更划扣账户的效力及于甲方与乙方签订的所有未结合同。无论何种原因，如果甲方指定第三方代扣失败，乙方在本合同项下的还款义务并不减免，乙方应采用其它合理方式继续偿还。</span></span>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px">3、&nbsp;</span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">乙方同意并授权甲方有权使用其自行收集或乙方提供的乙方资料及信息用于以下用途（包括但不限于）：</span>(1)为核实乙方的身份、资料和信息的真实性，向相关的个人、企事业单位、征信机构、国家机关迸行必要的验证；(2)为了提供本协议项下的服务，向有关合作机构、征信机构提供必要之资料；(3)用于催收、解决争议、调停纠纷等；(4)根据监管部门的要求提供乙方相关信息等。乙方为了通过多种渠道获得贷款，特授权甲方如果乙方未能从甲方处成功获得贷款，则乙方委托甲方将乙方推荐给甲方其他合作伙伴，并授权甲方将乙方的贷款申请、个</span>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px">4、&nbsp;</span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">人信息、评估及审核结果等所有信息资料提供结甲方合作伙伴。甲方合作伙伴使用乙方的贷款申请、个人信息、评估及审核结果等所有信息资料，仅用于向乙方提供相关产品或服务。</span></span>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px">5、&nbsp;</span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">乙方同意甲方和丙方有权向乙方发送与本协议内容有关的信息及通知，包括但不限于放款通知、还款提醒及逾期催收等信息，发送方式包括但不限于电话、短信、邮寄、传真等。</span></span>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px">6、&nbsp;</span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">以下任何事件发生，甲方有权宣布贷款提前到期，要求乙方立即一次性偿还本合同项下的全部款项：</span>(1)乙方违约；(2)乙方在其与甲方或其他贷款方签署的任何其他贷款合同项下发生违约；(3)甲方认为乙方可能无能力履行本合同项下相关义务，乙方虚假陈述或有与贷款相关的欺诈行为；(4)甲方认为乙方发生了可能对甲方的权利或利益造成损害的任何其他情形。若在某一期期款的还款到期日90夭之后，乙方仍未完全偿还该期期款，则本合同于该还款到期日90天后自动提前终止，乙方应立即一次性偿还本合同下全部款项。</span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span style="font-family:宋体">第八条</span> &nbsp;<span
            style="font-family:宋体">退货和退款</span></span></strong>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px">1、&nbsp;</span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">乙方使用本协议项下贷款所购买的商品或者服务如果出现退货情形的，乙方同意借款本金由商家直接全额退还甲方，且不论甲方是否收到由商家退还的乙方借款本金，乙方均应当在甲方要求的时限内向甲方清偿应当由乙方支付的利息、违约金等。</span></span>
</p>

<p style="margin-top:0;margin-left:28px;line-height:200%">
    <span style="font-family:宋体;font-size:14px">2、&nbsp;</span><span style=";font-family:宋体;font-size:14px"><span
        style="font-family:宋体">甲乙丙三方同意，乙方在收到商品后申请退货且商户同意的，乙方在申请贷款时支付给商户的商户管理费由商户直接退还的乙方。由于乙方在退货时与商户就商户管理费产生争议的，由乙方自行与商户协商解决，乙方理解并同意该争议与甲方无关。</span> </span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span style="font-family:宋体">第九条</span> &nbsp;<span
            style="font-family:宋体">争议解决</span></span></strong>
</p>

<p style="margin-top:0;margin-left:28px;text-indent:28px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">甲乙丙三方同意向深圳时南山区人民法院起诉，败诉方应承担对方为解决本争议而产生的所有费用，包括但不限于诉讼费、律师费、公证费、交通费等。</span></span>
</p>

<p style="margin-top:0;line-height:200%">
    <strong><span style="font-family: 宋体;line-height: 200%;font-size: 14px"><span style="font-family:宋体">第十条</span> &nbsp;<span
            style="font-family:宋体">其他</span></span></strong>
</p>

<p style="margin-top:0;margin-left:28px;text-indent:28px;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">甲乙丙三方共同确认：甲方可自主决定将其在本合同项下的债权转让给任何第三方而无需取得乙方同意。</span></span>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">（以下无正文）</span></span>
</p>

<p style="margin-top:0;text-align:center;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">甲方：</span></span><span
        style="font-family: 宋体;line-height: 200%;font-size: 14px"><span
        style="font-family:宋体">深圳市优卡分期科技有限公司</span></span><span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;&nbsp;&nbsp;&nbsp;</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">日期：</span> &nbsp;${year}&nbsp;<span
            style="font-family:宋体">年</span> &nbsp;${month}&nbsp;<span style="font-family:宋体">月</span> &nbsp;${day}&nbsp;<span
            style="font-family:宋体">日</span></span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px;"><span style="font-family:宋体">乙方：</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px;">&nbsp;${cUser.realName}&nbsp;</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px;"><span style="font-family:宋体">日期：</span> &nbsp;${year}&nbsp;<span
            style="font-family:宋体">年</span> &nbsp;${month}&nbsp;<span style="font-family:宋体">月</span> &nbsp;${day}&nbsp;<span
            style="font-family:宋体">日</span></span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px">&nbsp;</span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">丙方：</span></span><span
        style=";font-family:宋体;line-height:200%;font-size:14px"><span
        style="font-family:宋体">深圳五维微品金融信息服务有限公司</span></span>
</p>

<p style="margin-top:0;line-height:200%">
    <span style=";font-family:宋体;line-height:200%;font-size:14px"><span style="font-family:宋体">日期：</span> &nbsp;${year}&nbsp;<span
            style="font-family:宋体">年</span> &nbsp;${month}&nbsp;<span style="font-family:宋体">月</span> &nbsp;${day}&nbsp;<span
            style="font-family:宋体">日</span></span>
</p>

<p>
    <br/>
</p>
</body>
</html>
