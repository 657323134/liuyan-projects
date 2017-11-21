// JavaScript Document
$(document).ready(function () {

    var wid = $(".flicking_conI").width();
    $(".flicking_box").css({
        "margin-left": -wid / 2,
        "width": wid + "px"
    });

    $dragBln = false;

    $(".slidesImageI").touchSlider({
        flexible: true,
        speed: 500,
        btn_prev: $("#btn_prev"),
        btn_next: $("#btn_next"),
        paging: $(".flicking_conI a"),
        counter: function (e) {
            $(".flicking_conI a").removeClass("on").eq(e.current - 1).addClass("on");

        }
    });

    $(".slidesImageI").bind("mousedown", function () {
        $dragBln = false;
    });


    $(".slidesImageI").bind("dragstart", function () {
        $dragBln = true;
    });

    $(".slidesImageI a").click(function () {
        if ($dragBln) {
            return false;
        }
    });

    timer = setInterval(function () {
        $("#btn_next").click();
    }, 5000);

    $(".main_visual").hover(function () {
        clearInterval(timer);
    }, function () {
        timer = setInterval(function () {
            $("#btn_next").click();
        }, 5000);
    });

    $(".slidesImageI").bind("touchstart", function () {
        clearInterval(timer);
    }).bind("touchend", function () {
        timer = setInterval(function () {
            $("#btn_next").click();
        }, 5000);
    });
});