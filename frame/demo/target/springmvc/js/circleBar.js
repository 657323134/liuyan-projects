function loadImg(data, obj, fun, n, img) {
    styleRemove(obj, img, n);
    var i = 0;
    var fun = setInterval(function () {
        i++;
        var imgTop = -i * n + "px";
        obj.css("background-position", "0px  " + imgTop);
        if (i >= data) {
            clearInterval(fun);
        }
    }, 1000 / 60);
}

function styleRemove(obj, img, n) {
    obj.css({
        "width": n + "px",
        "height": n + "px",
        "background": "url(" + img + ")"
    });

    obj.find(".circle").css({
        "width": n + "px",
        "height": n + "px",
        "background": "none"
    });
    obj.find(".cir_left,.cir_right,.mask,.maskMid").css({
        "background": "none"
    });


}


//画布

var line;
canvas1();
function canvas1() {
    var c = document.getElementById("canvas1");
    var ctx = c.getContext("2d");
    clearInterval(line);
    ctx.clearRect(0, 0, 920, 200);

    var w = 1;
    var h = 1;
    line = setInterval(function () {
        ctx.beginPath();
        ctx.strokeStyle = "#ff846b";
        ctx.font = "15px 微软雅黑";


        switch (true) {
            case w <= 1:

                ctx.fillStyle = "#939393";
                ctx.fillText("投资人", 10, 145);

                w = w + 1;
                break;
            case w < 60:
                var img = new Image();
                img.src = "images/step_2__09.png";
                ctx.drawImage(img, 10, 80);

                w = w + 1;
                ctx.moveTo(60, 100.5);
                ctx.lineTo(60 + w, 100.5);
                ctx.stroke();
                break;
            case w >= 60 && h < 55:
                h = h + 1;
                ctx.moveTo(119.5, 100);
                ctx.lineTo(119.5, 100 - h);
                ctx.moveTo(119.5, 100);
                ctx.lineTo(119.5, 100 + h);
                ctx.stroke();
                break;

            case w == 60  :
                setTimeout(function () {
                    ctx.fillStyle = "#ff846b";
                    ctx.fillText("投资操作", 170, 35);
                    ctx.fillText("资金托管", 170, 145);
                }, 300);
                w = w + 1;
                break;
            case 61 <= w && w < 210  :
                w = w + 1;
                ctx.moveTo(119, 45.5);
                ctx.lineTo(60 + w, 45.5);
                ctx.moveTo(119, 155.5);
                ctx.lineTo(60 + w, 155.5);
                ctx.stroke();
                break;

            case w == 210  :
                ctx.fillStyle = "#939393";
                ctx.fillText("微品金融", 275, 90);
                ctx.fillText("第三方托管平台", 255, 195);

                w = w + 1;
                break;

            case 211 <= w && w < 380:

                var img = new Image();
                img.src = "images/step_2__03.png";
                var img2 = new Image();
                img2.src = "images/step_2__23.png";

                ctx.drawImage(img, 275, 15);
                ctx.drawImage(img2, 281, 130);
                w = w + 1;
                ctx.moveTo(337, 45.5);
                ctx.lineTo(130 + w, 45.5);
                ctx.moveTo(337, 155.5);
                ctx.lineTo(130 + w, 155.5);
                ctx.stroke();

                break;

            case w == 380  :
                ctx.fillStyle = "#ff846b";
                ctx.fillText("债权转让", 400, 35);
                ctx.fillText("资金托管", 400, 145);

                w = w + 1;
                break;

            case 381 <= w && h <= 110 :
                h = h + 1;
                ctx.moveTo(510.5, 45);
                ctx.lineTo(510.5, 45 + h - 55);
                ctx.moveTo(510.5, 155);
                ctx.lineTo(510.5, 155 - (h - 55));
                ctx.stroke();
                break;

            case 380 <= w && w < 480 && h >= 110 :
                w = w + 1;
                ctx.moveTo(510, 100.5);
                ctx.lineTo(130 + w, 100.5);
                ctx.stroke();
                break;


            case w == 480 :
                ctx.fillStyle = "#ff846b";
                ctx.fillText("担保/回购", 525, 88);
                ctx.fillStyle = "#939393";
                ctx.fillText("委托人/委托机构 ", 585, 137);

                setTimeout(function () {
                    ctx.fillStyle = "#ff846b";
                    ctx.fillText("借 款 ", 735, 85);
                }, 300);
                w = w + 1;
                break;


            case 481 <= w && w < 655 :

                var img = new Image();
                img.src = "images/step_2__12.png";
                ctx.drawImage(img, 615, 75);
                w = w + 1;
                ctx.moveTo(670, 94.5);
                ctx.lineTo(190 + w, 94.5);
                ctx.stroke()
                break;

            case w == 655 :
                ctx.fillStyle = "#939393";
                ctx.fillText("借款人/企业 ", 830, 140);
                w = w + 1;
                setTimeout(function () {
                    ctx.fillStyle = "#ff846b";
                    ctx.fillText("还 款 ", 735, 127);
                }, 500);
                break;


            case w >= 656 && w < 830 :
                var img = new Image();
                img.src = "images/step_2__16.png";
                ctx.drawImage(img, 840, 90);
                var img2 = new Image();
                img2.src = "images/step_2__06.png";
                ctx.drawImage(img2, 855, 75);
                w = w + 1;
                ctx.moveTo(845, 106.5);
                ctx.lineTo((846 + (655 - w)), 106.5);
                ctx.stroke();

                break;


            case w >= 830 && w < 832 :
                var img = new Image();
                img.src = "images/step_2__17.png";
                ctx.drawImage(img, 670, 102);
                w = w + 1

                break;
            default:
                clearInterval(line);
        }

    }, 1)
}
