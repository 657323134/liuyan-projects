
//建立一個可存取到該file的url
function getObjectURL(file) {
    var url = null;
    if (window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    } else if (window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}

$("#imgCancel").click(function () {
    $(".imgTips").hide();
});

$(".upload-img").click(function () {
    var name = $(this).children(".imgName").val();
    var explainImg, explainTxt;
    //示例图片
    if (name == 'cardidImgA') {
        explainImg = '/images/front/upload-explain/auth-front.jpg';
        explainTxt = '请拍摄本人身份证正面完整清晰照片上传，<br>不允许：<br>× 边框缺失<br>× 照片模糊<br>× 闪光强烈';
    } else if (name == 'cardidImgB') {
        explainImg = '/images/front/upload-explain/auth-back.jpg';
        explainTxt = '请拍摄本人身份证反面完整清晰照片上传，<br>不允许：<br>× 边框缺失<br>× 照片模糊<br>× 闪光强烈';
    } else if (name == 'carImgA') {
        explainImg = '/images/front/upload-explain/driving-license.jpg';
        explainTxt = '请拍摄本人车辆行驶证内页完整清晰照片上传，<br>不允许：<br>× 边框缺失<br>× 单页上传<br>× 照片模糊<br>× 闪光强烈';
    } else if (name == 'carImgB') {
        explainImg = '/images/front/upload-explain/human-car.jpg';
        explainTxt = '请拍摄本人与车辆正面合照上传，<br>不允许：<br>× 本人或车辆不完整<br>× 车辆非正面照<br>× 照片模糊';
    } else if (name == 'bankImgA') {
        explainImg = '/images/front/upload-explain/bank-front.jpg';
        explainTxt = '请拍摄本人持有借记卡完整清晰照片上传，<br>不允许：<br>× 边框缺失<br>× 照片模糊<br>× 闪光强烈';
    } else if (name == 'bankImgB') {
        explainImg = '/images/front/upload-explain/bank-back.jpg';
        explainTxt = '请拍摄本人借记卡正面完整清晰照片上传，<br>不允许：<br>× 边框缺失<br>× 照片模糊<br>× 闪光强烈';
    } else {
        explainImg = '/images/front/single-project-img.png';
        explainTxt = '请拍摄完整清晰照片上传，<br>不允许：<br>× 边框缺失<br>× 照片模糊<br>× 闪光强烈';
    }

    $("#imgExample").attr('src', explainImg);
    $("#txtExplain").html(explainTxt);

    $("#imgType").val(name);//图片input存储在隐藏域
    $(".imgTips").show();
});

//给上传文件input赋值
function openFile() {
    var name = $("#imgType").val();
    if (name == null || name == '' || name == undefined) {
        $(".imgTips").hide();
        return;
    }
    var imgInput = $("#" + name);
    imgInput.click();
    $(".imgTips").hide();
}

//图片改变时触发
function userImgChange(obj) {
    console.log("file对象" + obj);
    console.log(obj.files[0]);
    if (obj.files && obj.files[0]) {
        //判断图片类型
        if (!/\.(gif|jpg|jpeg|png|bmp)$/i.test(obj.files[0].name)) {
            alert("请选择图片类型上传");
            return;
        }

        //图片压缩
        var data;
        var reader = new FileReader();
        reader.readAsDataURL(obj.files[0]);
        reader.onload = function () {

            var result = this.result;
            var img = new Image();
            img.src = result;
            img.onload = function () {
                data = compress(img);

                var objUrl = data;
                //console.log("objUrl = " + objUrl);
                if (objUrl) {

                    var name = obj.name;//cardidImgA cardidImgB
                    var imgDivShow = $("#" + name + "-img");//展示缩略图的img

                    imgDivShow.attr("src", objUrl);
                    imgDivShow.siblings(".upload-btn").css("display", "none");
                    imgDivShow.siblings(".reset-btn").css("display", "block");
                    imgDivShow.siblings(".reset-btn").click(function () {
                        $(this).siblings(".img-box").attr("src", "/images/businesses/white.svg");
                        $(this).siblings(".upload-btn").css("display", "block");
                        $(this).css("display", "none");
                        //隐藏域更新
                        $(".hidden-file").children("#" + name).remove();
                        $(".hidden-file").append("<input class='img-in' type='file' name='" + name + "'  id='" + name + "'  onchange='userImgChange(this);'/>");

                    });
                } else {
                    //IE下，使用滤镜
                    this.select();
                    var imgSrc = document.selection.createRange().text;
                    var localImagId = document.getElementById("sss");
                    //图片异常的捕捉，防止用户修改后缀来伪造图片
                    try {
                        preload.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = data;
                    } catch (e) {
                        this._error("filter error");
                        return;
                    }
                    this.img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src=\"" + data + "\")";
                }
            }
        }
    }
}

//    使用canvas对大图片进行压缩
function compress(img) {
    //    用于压缩图片的canvas
    var canvas = document.createElement("canvas");
    var ctx = canvas.getContext('2d');
    //    瓦片canvas
    var tCanvas = document.createElement("canvas");
    var tctx = tCanvas.getContext("2d");
    var maxsize = 100 * 1024;
    var initSize = img.src.length;
    var width = img.width;
    var height = img.height;
    //如果图片大于四百万像素，计算压缩比并将大小压至400万以下
    var ratio;
    if ((ratio = width * height / 4000000) > 1) {
        ratio = Math.sqrt(ratio);
        width /= ratio;
        height /= ratio;
    } else {
        ratio = 1;
    }
    canvas.width = width;
    canvas.height = height;
//        铺底色
    ctx.fillStyle = "#fff";
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    //如果图片像素大于100万则使用瓦片绘制
    var count;
    if ((count = width * height / 1000000) > 1) {
        count = ~~(Math.sqrt(count) + 1); //计算要分成多少块瓦片
//            计算每块瓦片的宽和高
        var nw = ~~(width / count);
        var nh = ~~(height / count);
        tCanvas.width = nw;
        tCanvas.height = nh;
        for (var i = 0; i < count; i++) {
            for (var j = 0; j < count; j++) {
                tctx.drawImage(img, i * nw * ratio, j * nh * ratio, nw * ratio, nh * ratio, 0, 0, nw, nh);
                ctx.drawImage(tCanvas, i * nw, j * nh, nw, nh);
            }
        }
    } else {
        ctx.drawImage(img, 0, 0, width, height);
    }
    //进行最小压缩
    var ndata = canvas.toDataURL('image/jpeg', 0.5);
    tCanvas.width = tCanvas.height = canvas.width = canvas.height = 0;
    return ndata;
}
