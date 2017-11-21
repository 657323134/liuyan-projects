/**
 * name: �ֻ�ǩ��
 * Created by Administrator on 2016/12/26.
 */

var canvas, board, img;
canvas = document.getElementById('myCanvas');
img = document.getElementById('signatureImg');

//console.error(document.body.clientHeight);

//var winW = window.screen.width, winH = window.screen.height;
var winW = window.innerWidth, winH = window.innerHeight;
//var winW = document.body.clientWidth, winH = document.body.clientHeight;

canvas.width = winW; //document.body.clientWidth;
canvas.height = 300//winH-120; //300;


var topNum = canvas.offsetTop;
//console.log(topNum);

board = canvas.getContext('2d');

var mousePress = false;
var last = null;
var isPortrait = true; //竖屏

function beginDraw() {
    mousePress = true;
}

function drawing(event) {
    event.preventDefault();
    if (!mousePress)return;
    var xy = pos(event);
    board.strokeStyle = "#000000";
    if (last != null) {
        board.beginPath();
        board.moveTo(last.x, last.y);
        board.lineTo(xy.x, xy.y);
        board.stroke();
    }
    last = xy;

}

function endDraw(event) {
    mousePress = false;
    event.preventDefault();
    last = null;
}

function pos(event) {
    var x, y, boxX, boxY, scrollY;
    var bbox = canvas.getBoundingClientRect();
    if (isTouch(event)) {
        boxX = bbox.left * (canvas.width / bbox.width);
        boxY = bbox.top;
        scrollY = document.body.scrollTop;
        //console.log(scrollY);
        if (!isPortrait) {
            x = event.touches[0].pageY - scrollY;
            y = winW - event.touches[0].pageX;
        } else {
            x = event.touches[0].pageX;
            y = event.touches[0].pageY - boxY - scrollY;
        }
    } else {
        x = event.offsetX + event.target.offsetLeft;
        y = event.offsetY + event.target.offsetTop;
    }
    //console.log('x='+x+' y='+y);
    return {x: x, y: y};
}

function log(msg) {
    var log = document.getElementById('log');
    var val = log.value;
    log.value = msg + 'n' + val;
}

function isTouch(event) {
    var type = event.type;
    if (type.indexOf('touch') >= 0) {
        return true;
    } else {
        return false;
    }
}

function save() {
    //base64
    var dataUrl = canvas.toDataURL();
    //document.getElementById('textId').innerText(dataUrl);
    //document.getElementById("textId").innerHTML = dataUrl;
    // dataUrl = dataUrl.replace("image/png","image/octet-stream");
    img.src = dataUrl;

    img.style.display = "block";
    document.getElementById("contractTip").style.margin = 0;
    document.getElementById("popUp").style.display = "none";
    document.getElementById("popUp").style.display = "none";
    document.getElementById("drawSubmit").classList.remove("grey");

    //$('#popUp').css({width: winW,height: winH,'transform':'rotate(0deg)'});
    //$('#signature').addClass('vertical').hide();
    //canvas.width = winW;
    //canvas.height = 300
    //$('.top-
    isPortrait = false;
    crossScreen();


    //src保存隐藏域
    //console.log(dataUrl);
    $("input[name='orderjsignature']").val(dataUrl);

}

function clean() {
    board.clearRect(0, 0, canvas.width, canvas.height);
    //$(".cleanHtml").html("") ;
    //var html = '<canvas id="myCanvas"></canvas>' ;
    //html+='<div class="draw-btn">' ;
    //html+=' <span class="btn" onclick="clean();">重签</span>' ;
    //html+='<span class="btn" onclick="save();">确定</span>' ;
    //html+=' </div>' ;
    //$(".cleanHtml").append(html) ;
    //canvas.onmousedown = beginDraw;
    //canvas.onmousemove = drawing;
    //canvas.onmouseup = endDraw;
    //canvas.addEventListener('touchstart',beginDraw,false);
    //canvas.addEventListener('touchmove',drawing,false);
    //canvas.addEventListener('touchend',endDraw,false);
}

//切换横竖屏

function crossScreen() {
    if (isPortrait) {
        //横屏操作
        $('#popUp').css({
            width: winH,
            height: winW,
            'transform': 'rotate(90deg) translate(0px,-' + winW + 'px)',
            'transform-origin': '0 0'
        });
        $('.top-bar').hide();
        canvas.width = winH;
        canvas.height = winW;
        $('#change').html('竖');
        $('.draw-btn').css({left: '30%', top: winW - 60});
        $('.draw-btn').addClass('scross');
        $('#signature').removeClass('vertical');
    } else {
        $('#popUp').css({width: winW, height: winH, 'transform': 'rotate(0deg)'});
        $('.top-bar').show();
        canvas.width = winW;
        canvas.height = 300;
        $('#change').html('横');
        $('.draw-btn').removeClass('scross');
        $('#signature').addClass('vertical');
    }
    isPortrait = !isPortrait;
    //$('.draw-btn').toggleClass('scross');
    //$('#signature').toggleClass('vertical');
}

//console.log(window.orientation);//打印屏幕的默认方向
//window.addEventListener("orientationchange",function(){
//    console.log(window.orientation);
////    alert(window.orientation);
//});


board.lineWidth = 1;
board.strokeStyle = "#0000ff";


canvas.onmousedown = beginDraw;
canvas.onmousemove = drawing;
canvas.onmouseup = endDraw;
canvas.addEventListener('touchstart', beginDraw, false);
canvas.addEventListener('touchmove', drawing, false);
canvas.addEventListener('touchend', endDraw, false);
