//JavaScript Document


function numStart() {
    if (num != 0) {
        s = s + 1;
        $(".mask").eq(0).find("span").text(s);
        if (s >= num) {
            clearInterval(num0);
        }
    } else {

        clearInterval(num0);
    }
}

function startOne() {
    if (num != 0) {

        if (num < 0 || num > 100) {
            clearInterval(t0);
        } else {

            i = i + 3.6;
            count = count + 1;

            $(".cir_right").eq(0).css("-ms-transform", "rotate(" + i + "deg) translateZ(0)");
            $(".cir_right").eq(0).css("-o-transform", "rotate(" + i + "deg) translateZ(0)");
            $(".cir_right").eq(0).css("-moz-transform", "rotate(" + i + "deg) translateZ(0)");
            $(".cir_right").eq(0).css("-webkit-transform", "rotate(" + i + "deg) translateZ(0)");
            if (count >= num) {
                clearInterval(t0);
            }
            ;
            if (count >= 50) {

                clearInterval(t0);
                st0 = setInterval("startTwo()", 20);
            }
        }

    } else {
        clearInterval(t0);
    }
};
function startTwo() {

    j = j + 3.6;
    count = count + 1;
    if (count <= num) {
        $(".cir_left").eq(0).css("-ms-transform", "rotate(" + j + "deg) translateZ(0)");
        $(".cir_left").eq(0).css("-o-transform", "rotate(" + j + "deg) translateZ(0)");
        $(".cir_left").eq(0).css("-moz-transform", "rotate(" + j + "deg) translateZ(0)");
        $(".cir_left").eq(0).css("-webkit-transform", "rotate(" + j + "deg) translateZ(0)");
    } else {
        clearInterval(st0);
    }
};


function numStart1() {
    if (num1 != 0) {
        s1 = s1 + 1;
        $(".mask").eq(1).find("span").text(s1);
        if (s1 >= num1) {
            clearInterval(numTwo);
        }
    } else {
        clearInterval(numTwo);
    }
}

function startOne1() {

    if (num1 != 0) {

        if (num1 < 0 || num1 > 100) {
            clearInterval(t1);

        } else {
            i1 = i1 + 3.6;
            count1 = count1 + 1;
            $(".cir_right").eq(1).css("-ms-transform", "rotate(" + i1 + "deg) translateZ(0)");
            $(".cir_right").eq(1).css("-o-transform", "rotate(" + i1 + "deg) translateZ(0)");
            $(".cir_right").eq(1).css("-moz-transform", "rotate(" + i1 + "deg) translateZ(0)");
            $(".cir_right").eq(1).css("-webkit-transform", "rotate(" + i1 + "deg) translateZ(0)");
            if (count1 >= num1) {
                clearInterval(t1);
            }
            ;
            if (count1 >= 50) {
                clearInterval(t1);
                st1 = setInterval("startTwo1()", 20);
            }
        }
    } else {
        clearInterval(t1);
    }
};
function startTwo1() {

    j1 = j1 + 3.6;
    count1 = count1 + 1;
    if (count1 <= num1) {
        $(".cir_left").eq(1).css("-ms-transform", "rotate(" + j1 + "deg) translateZ(0)");
        $(".cir_left").eq(1).css("-o-transform", "rotate(" + j1 + "deg) translateZ(0)");
        $(".cir_left").eq(1).css("-moz-transform", "rotate(" + j1 + "deg) translateZ(0)");
        $(".cir_left").eq(1).css("-webkit-transform", "rotate(" + j1 + "deg) translateZ(0)");
    } else {
        clearInterval(st1);
    }
};

