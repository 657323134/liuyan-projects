/*
 * tableUI 0.1
 * Copyright (c) 2011  segbuy Ld
 * Date: 2011-03-29
 * 插件
 */
(function ($) {

    $.fn.extend({
        watertext: function (options) {//watertext为插件名  
            var defaults = {defaulttext: "请输入相关内容", defaultcss: "defaultwatertxt", action: "append"};
            var options = $.extend(defaults, options);
            this.each(function () {
                var watertext = $(this);
                switch (options.action) {
                    case "replace"://替换水印文字
                        $("#jquerywatertiptxt" + $(this).attr("id")).html(options.defaulttext).addClass(options.defaultcss).attr("style", "cursor:text;");
                        break;
                    case "clear"://清除文字
                        $("#jquerywatertiptxt" + $(this).attr("id")).html("");
                        break;
                    default://case "append":
                        //添加一个层，作为提示语
                        $(this).before("<label id='jquerywatertiptxt" + $(this).attr("id") + "' style='cursor:text;' class=" + options.defaultcss + ">" + options.defaulttext + "</label>");
                        break;

                }
                var topid = "jquerywatertiptxt" + $(this).attr("id");
                //判断文本框是否有内容，有内容，隐藏层
                if ($(this).val() != "") {
                    $("#" + topid).css("display", "none");
                }

                //点击层，层隐藏，文本框获取焦点
                $("#" + topid).bind("click", function () {
                    watertext.focus();
                    $("#" + topid).css("display", "none");

                });

                //文本框获取焦点时
                $(this).bind("focus", function () {
                    $("#" + topid).css("display", "none");
                });
                //文本框失去焦点时
                $(this).bind("blur", function () {
                    if ($(this).val() == "") {
                        $("#" + topid).css("display", "");
                    }
                });
            })
        },
        tabs: function (options) {//tab为插件名
            var defaults = {
                eventname: "click", //触发事件，click为点击,mousemove为鼠标移动
                sedcss: "sed", //选中时的CSS
                nosedcss: "nosed" //未选中时的CSS

            };
            var keyid = $(this).attr("id"); //ul的ID
            var licount;
            var options = $.extend(defaults, options);
            this.each(function () {
                var tabs = $(this);
                //绑定事件
                $(tabs).find("li").bind(options.eventname, function () {
                    $("#" + keyid).find("li").attr("class", options.nosedcss);
                    $(this).attr("class", options.sedcss);
                    $("#info" + keyid + ">div").css("display", "none");
                    $("#info" + $(this).attr("id")).css("display", "block");
                    //$("#" + options.titlekeyid + "info").find("div").hide();
                    //$("#" + $(this).attr("id") + "info").show("normal");
                });
            });

        }


    });


})(jQuery);
