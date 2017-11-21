<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<!--foot start-->
<footer>
    <div class="footerBg">
        <div class="footerBox">
            <div class="footerLeft">
                <p class="attention">
                    <span class="dis_ib">关注我们</span>
                    <span class="wx"><a class="wx_click" href="javascript:;"></a></span>
                    <span class="wb"><a href="http://weibo.com/p/1006065597660135/home?from=page_100606&mod=TAB#place"
                                        target="_blank" rel="external nofollow"></a></span>
                </p>

                <p class="serviceTel"><span class="tit">客服热线</span><span class="hot_time">(9：00 - 18：00)</span></p>

                <p class="tel">400-808-3900</p>

                <p class="servicEmail"><span class="email"> services@vpfinance.cn	</span></p>
            </div>
            <div class="footerRight">
                <div class="navBt">
                    <a href="aboutus.html">关于微品金融</a> | <a href="helpInfo.html">帮助中心</a> | <a href="safe.html">安全保障</a>
                    | <a href="contactus.html">联系我们</a> | <a href="platformPrinciple.html">平台原理</a> |
                    <!-- <a href="#">管理团队</a> | --> <a href="newsIndex.html">新闻资讯</a></div>

                <div class="foot_zs">
                    <a class="f_zs f_zs1" href="https://cert.ebs.gov.cn/75282f24-7477-466c-b9e7-32466e2604e7"
                       target="_blank" rel="external nofollow"></a>
                    <a class="f_zs f_zs2" href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action"
                       target="_blank" rel="external nofollow"></a>
                    <a class="f_zs f_zs3" href="http://wljc.szga.gov.cn/" target="_blank" rel="external nofollow"></a>
                    <!-- <a href="#" class="f_zs f_zs4"></a> -->
                </div>

                <div class="tx_cen font12 mt20">微品金融 (<a href="http://www.vpfinance.cn">www.vpfinance.cn</a>)
                    版权所有2015-2016 备案号：<a href="http://www.miitbeian.gov.cn/" target="_blank" rel="external nofollow">粤ICP备08036625号</a>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--foot end-->
<!--侧边栏 start-->
<div class="p_snav">
    <div class="pnav_box">
        <div class="nav_box nav_box1">
            <i class="n_boxico tran"></i>
        </div>
    </div>
    <div class="pnav_box pnav_box2">
        <div class="nav_box nav_box2">
            <i class="n_boxico n_boxico2 tran"></i>
        </div>
        <div class="nav_kefu">
            <div class="kefu_box kefu_a">
                <i class="kf_ico kf_ico1 tran"></i>

                <p class="kefu_txt">
                    全国服务热线：<br/> <span class="kefu_tel">400-808-3900</span>
                </p>
            </div>
            <div class="kefu_box kefu_b">
                <i class="kf_ico kf_ico2 tran"></i>

                <div class="online_qq">
                    <!-- WPA Button Begin -->
                    <script charset="utf-8" type="text/javascript"
                            src="http://wpa.b.qq.com/cgi/wpa.php?key=XzkzODAxNDQ5NV8yNjIzOTFfNDAwODA4MzkwMF8"></script>
                    <!-- WPA Button End -->
                </div>
                <h2 class="qun_tit">投资理财群：</h2>

                <div class="qun_qq">
                    <a target="_blank"
                       href="http://shang.qq.com/wpa/qunwpa?idkey=feff7406bd5e0e6703eb470592f4315be2d3ecbba7ee62c5567d152b7ef4b58c"
                       alt="微品金融官方交流群" title="微品金融官方交流群">425112647</a>
                </div>
            </div>
        </div>
    </div>
    <div class="pnav_box">
        <div class="nav_box" id="gotop">
            <i class="n_boxico n_boxico3 tran"></i>
        </div>
    </div>
</div>
<!--侧边栏 end-->
<!--计算器 start-->
<div class="calculator">
    <div class="space15"></div>
    <div class="cal_box clearfix">
        <div class="cal_btit clearfix">投标金额</div>
        <div class="cal_btxt">
            <input type="text" id="investSM"
                   onkeyup="this.value=this.value.replace(/\D/g,'')"
                   onblur="calculatorChack(this,'投标金额不能为空')" class="calb_text"
                   maxlength="11"/><i class="cb_tico">元</i>
        </div>
    </div>
    <div class="cal_box clearfix">
        <div class="cal_btit">年化收益</div>
        <div class="cal_btxt">
            <input type="text" id="annualRate"
                   onkeyup="value=value.replace(/[^\d\.]/g,'')"
                   onblur="calculatorChack(this,'年化收益不能为空')" class="calb_text"/><i
                class="cb_tico">%</i>
        </div>
    </div>
    <div class="cal_box clearfix">
        <div class="cal_btit">投资期限</div>
        <div class="cal_btxt">
            <input type="text" id="investLine"
                   onkeyup="this.value=this.value.replace(/\D/g,'')"
                   onblur="calculatorChack(this,'投资期限不能为空')" class="calb_text"/><i
                class="cb_tico tb_type">天</i>
        </div>
    </div>
    <div class="cal_box biao_tpyewz clearfix">
        <div class="cal_btit">投标类型</div>
        <div class="cal_btxt">
            <div class="cal_type">
                <span class="ctype_t ctype_tian ctype_tok tran">天</span> <span
                    class="ctype_t ctype_yue tran">月</span> <input type="hidden"
                                                                   id="lineType" value="1">
            </div>
        </div>
    </div>
    <div class="cal_box biao_type clearfix">
        <div class="cal_btit">还款方式</div>
        <div class="cal_btxt">
            <!--天 start-->
            <div class="cal_btian">
                <input type="text" class="calb_text tran" value="一次性还款"
                       readonly="readonly"/>
            </div>
            <!--天 end-->
            <!--月 start-->
            <div class="cal_byue">
                <input type="text" class="calb_text calb_tyue tran" value="一次性还款"
                       readonly="readonly"/>

                <div class="yue_box">
                    <ul>
                        <li lang="1">一次性还款</li>
                        <li lang="2">按月付息到期还本</li>
                        <li lang="3">等额本息还款</li>
                    </ul>
                    <input type="hidden" id="repayTypeSM" value="1">
                </div>
            </div>
            <!--月 end-->
        </div>
    </div>
    <div class="cal_sub">
        <input type="button" id="calculatorSM" class="cal_submit"
               value="亲，算一算"/>
    </div>
    <div class="cal_yan" id="calculatorTs"></div>
    <div class="cal_line"></div>
    <div class="cal_result">
        可获利息：<span class="cal_resmoney" id="showVal">0</span> 元
    </div>
    <%--
      <p class="cal_gongshi">具体计算公式:<br />
       本金 + 本金*(年化收益率/365)*投资期限</p>
    --%>
</div>
<!--计算器 end-->
<!--微信号 start-->
<div class="fwx_main">
    <div class="f_wxcode"><img src="images/page/wei_code.jpg"/></div>
    <div class="f_wxtext">使用微信″扫一扫″即可关注微品金融官方微信。</div>
</div>
<!--微信号 end-->

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/lion-jquery.js"></script>
<script type="text/javascript" src="js/layer.min.js"></script>
<script type="text/javascript">
    //首页侧边栏
    $(".pnav_box .nav_box2").mouseover(function () {
        $(this).siblings(".nav_kefu").fadeIn();
    });
    $(".p_snav .pnav_box2").mouseleave(function () {
        $(this).find(".nav_kefu").fadeOut();
    });
    //返回顶部和二维码
    function a(x, y) {
        laa = $('.header').offset().left;
        waa = $('.header').width();
        $('.p_snav').css('left', (laa + waa + x) + 'px');
        $('.p_snav').css('bottom', y + 'px');
    }
    function b() {
        hbb = $(window).height() - 700;
        tbb = $(document).scrollTop();
        /*if(t > h){
         $('#gotop').fadeIn('slow');
         }else{
         $('#gotop').fadeOut('slow');
         }*/
    }
    $(document).ready(function (e) {
        a(16, 20);//#tbox的div距浏览器底部和页面内容区域右侧的距离
        b();
        $('#gotop').click(function () {
            $('html,body').animate({scrollTop: 0}, 500);
            //$(document).scrollTop(0);
        });
    });


    //计算器
    $('.pnav_box .nav_box1').on('click', function () {
        $.layer({
            type: 1,
            title: '计算器',
            //shadeClose: true, 开启点击遮罩关闭层
            area: ['430px', '450px'],
            border: [0, 0.5, '#666'],
            offset: [($(window).height() - 510) / 2 + 'px', ''],
            page: {dom: '.calculator'}
        });
    });
    function calculatorChack(this_, tipCount) {
        if ($(this_).val() == "") {
            $("#calculatorTs").css("color", "red");
            $("#calculatorTs").html(tipCount);
        } else {
            $("#calculatorTs").css("color", "green");
            $("#calculatorTs").html("输入正确");
        }
    }
    //首页计算器复选框
    $(".cal_box .ctype_t").click(
            function () {
                $(this).addClass("ctype_tok").siblings(".ctype_t").removeClass("ctype_tok");
            });
    //首页计算器天/月标切换
    $(".biao_tpyewz .ctype_tian").click(
            function () {
                $(".tb_type").html("天");
                $("#lineType").val("1");
                $(".cal_btxt").find(".cal_btian").show().siblings(".cal_byue").hide();
            });
    $(".biao_tpyewz .ctype_yue").click(
            function () {
                $(".tb_type").html("月");
                $("#lineType").val("2");
                $(".cal_btxt").find(".cal_byue").show().siblings(".cal_btian").hide();
            });

    //月标下拉按钮
    $(".cal_byue .calb_tyue").click(function () {
        $(this).siblings(".yue_box").slideToggle().siblings(".yue_box").hide();
    });
    //月标点击缩回box，传值
    $(".yue_box ul li").click(
            function () {
                $(this).parents(".yue_box").slideUp();
                $("#repayTypeSM").val($(this).attr("lang"));
                var c_type = $(this).text();
                $(this).parents(".yue_box").siblings(".calb_text").val(c_type);
            });

    //计算器方法，计算
    $("#calculatorSM").click(function () {
        var investAmount = $("#investSM").val();
        var annualRate = $("#annualRate").val();
        var investLine = $("#investLine").val();
        var lineType = $("#lineType").val();
        var repayType = $("#repayTypeSM").val();
        if (investAmount == "" || annualRate == "" || investLine == "" || lineType == "" || repayType == "") {
            $("#calculatorTs").css("color", "red");
            $("#calculatorTs").html("数据输入不完全整，请检查");
            return false;
        }
        $.lionPost("indexCalculator.html", {
            investAmount: investAmount,
            annualRate: annualRate,
            investLine: investLine,
            deadlineType: lineType,
            repayType: repayType
        }, function (data) {
            $("#calculatorTs").css("color", "green");
            $("#calculatorTs").html("");
            $("#showVal").html(data);
        });

    });
    //微信弹出窗
    $('.wx .wx_click').on('click', function () {
        $.layer({
            type: 1,
            title: '关注微品金融官方微信',
            //shadeClose: true, 开启点击遮罩关闭层
            area: ['380px', '400px'],
            border: [0, 0.5, '#666'],
            offset: [($(window).height() - 400) / 2 + 'px', ''],
            page: {dom: '.fwx_main'}
        });
    });

</script>
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?b3b56d6a87aa476c6931bd1383f89958";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
