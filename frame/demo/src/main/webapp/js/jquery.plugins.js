/*
 * tableUI 0.1
 * Copyright (c) 2011  segbuy Ld
 * Date: 2011-03-29
 * ���
 */
(function ($) {

    $.fn.extend({
        watertext: function (options) {//watertextΪ�����  
            var defaults = {defaulttext: "�������������", defaultcss: "defaultwatertxt", action: "append"};
            var options = $.extend(defaults, options);
            this.each(function () {
                var watertext = $(this);
                switch (options.action) {
                    case "replace"://�滻ˮӡ����
                        $("#jquerywatertiptxt" + $(this).attr("id")).html(options.defaulttext).addClass(options.defaultcss).attr("style", "cursor:text;");
                        break;
                    case "clear"://�������
                        $("#jquerywatertiptxt" + $(this).attr("id")).html("");
                        break;
                    default://case "append":
                        //���һ���㣬��Ϊ��ʾ��
                        $(this).before("<label id='jquerywatertiptxt" + $(this).attr("id") + "' style='cursor:text;' class=" + options.defaultcss + ">" + options.defaulttext + "</label>");
                        break;

                }
                var topid = "jquerywatertiptxt" + $(this).attr("id");
                //�ж��ı����Ƿ������ݣ������ݣ����ز�
                if ($(this).val() != "") {
                    $("#" + topid).css("display", "none");
                }

                //����㣬�����أ��ı����ȡ����
                $("#" + topid).bind("click", function () {
                    watertext.focus();
                    $("#" + topid).css("display", "none");

                });

                //�ı����ȡ����ʱ
                $(this).bind("focus", function () {
                    $("#" + topid).css("display", "none");
                });
                //�ı���ʧȥ����ʱ
                $(this).bind("blur", function () {
                    if ($(this).val() == "") {
                        $("#" + topid).css("display", "");
                    }
                });
            })
        },
        tabs: function (options) {//tabΪ�����
            var defaults = {
                eventname: "click", //�����¼���clickΪ���,mousemoveΪ����ƶ�
                sedcss: "sed", //ѡ��ʱ��CSS
                nosedcss: "nosed" //δѡ��ʱ��CSS

            };
            var keyid = $(this).attr("id"); //ul��ID
            var licount;
            var options = $.extend(defaults, options);
            this.each(function () {
                var tabs = $(this);
                //���¼�
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
