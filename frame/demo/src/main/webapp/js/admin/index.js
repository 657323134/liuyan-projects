﻿$(function () {
    //日历
    $("#datepicker").datepicker();

    //左边菜单
    $('.one').click(function () {
        var siblings = $(this).parent('.menu-item').siblings().find('.one');

        $(this).addClass('one-hover').find('i').addClass('hover');
        $(this).addClass('one-hover').find('.arrow').addClass('hover');
        $(this).siblings('.kid').slideDown();

        siblings.removeClass('one-hover');
        siblings.siblings('.kid').slideUp();
        siblings.children('.arrow').removeClass('hover');
        // $(this).find('i').toggleClass('hover');
        //$(this).addClass('one-hover').find('i').addClass('hover');
        // $(this).parent().find('.kid').sl();
    });

    //影藏菜单
    var l = $('.left_c');
    var r = $('.right_c');
    var c = $('.Conframe');
    $('.nav-tip').click(function () {
        if (l.css('left') == '0px') {
            l.animate({
                left: -300
            }, 500);
            r.animate({
                left: 21
            }, 500);
            c.animate({
                left: 29
            }, 500);
            $(this).animate({
                "background-position-x": "-12"
            }, 300);
        } else {
            l.animate({
                left: 0
            }, 500);
            r.animate({
                left: 260
            }, 500);
            c.animate({
                left: 268
            }, 500);
            $(this).animate({
                "background-position-x": "0"
            }, 300);
        }
        ;
    })
    //横向菜单
    $('.top-menu-nav li').click(function () {
        $('.kidc').hide();
        $(this).find('.kidc').show();

    })
    $('.kidc').bind('mouseleave', function () {
        $('.kidc').hide();
    })

})