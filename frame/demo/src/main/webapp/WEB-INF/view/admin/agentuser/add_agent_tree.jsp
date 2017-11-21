<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/comm/taglib.jsp" %>
<script type="text/javascript" src="${bashPath}/js/admin/jquery.form.js"></script>

<style>
    .add-agent-tree {
        width: 100%;
        background: #fff;
        border: 1px solid #ddd;
    }

    .add-agent-tree #levelTree {
        margin: 20px;
    }

    .add-agent-tree ul {
        /*margin-left: 10px;*/
        line-height: 30px;
    }

    .add-agent-tree li {
        color: #999;
        padding: 0 0 0 20px;
    }

    .add-agent-tree li span {
        font-size: 14px;
        cursor: pointer;
    }

    .add-agent-tree li.target > span {
        color: #1da0ff;
    }

    .add-agent-tree .btn {
        margin: 20px;
        color: #fff;
        background: #1da0ff;
    }

    .add-agent-tree .btn:first-child {
        background: #1da0ff;
    }

    .add-agent-tree .btn:last-child {
        background: #e9edf3;
        color: #576671;
    }

    .treeview i {
        background: url("/images/admin/treeview-default.gif") -80px -3px no-repeat;
        height: 16px;
        width: 16px;
        margin: 9px 0 0 -20px;
        float: left;
        cursor: pointer;
    }

    .treeview li {
        background: url("/images/admin/treeview-default-line.gif") 0 0px no-repeat;
    }

    .treeview li.collapsable > i {
        background-position: -64px -25px;
    }

    .treeview li.last i {
        background-position: 0 -1766px
    }

    .treeview li.lastCollapsable, .treeview li.lastExpandable {
        background-image: url("/images/admin/treeview-default.gif");
    }

    .treeview li.lastCollapsable {
        background-position: 0 -111px
    }

    .treeview li.lastExpandable {
        background-position: -32px -67px
    }


</style>
<!--右边框架开始-->
<div class="crumbs">
    当前位置<b class="tip"></b><span onclick="goUrl('${goUrl}')">代理列表</span><b class="tip"></b>添加下级代理商
    <%--<input class="btn btn-inverse" id="btnBack" type="button" onclick="goUrl('${goUrl}')" value="返回"/>--%>
</div>

<div class="add-agent-tree">
    <div id="levelTree" class="treeview">
        <ul>
            <li class="level-1" data-level="1" data-id="${user.id}">
                <i></i>
                <span>${user.name}</span>
                <%--<ul>--%>
                <%--<li></li>--%>
                <%--</ul>--%>
            </li>
        </ul>
    </div>
    <input class="btn" id="addNextLevel" type="button" value="添加代理"/>
    <input class="btn" id="lookAgent" type="button" value="代理详情"/>
    <input class="btn" id="btnBack"
           type="button" onclick="goUrl('${goUrl}')" value="返回"/>
</div>

<script type="text/javascript">

    //加载第一级代理
    getNextAgent($('.level-1'));
    $('.level-1').click(function (e) {
        e.stopPropagation();
        var that = $(this);
        getNextAgent(that);
    });


    //获取层级数据
    function getNextAgent(self) {

        //样式切换
        self.toggleClass('collapsable').children('ul').toggle();

        $('#levelTree li').removeClass('target');
        self.addClass('target');

        var iIcon = self.children('i');
        if (iIcon.hasClass('expandable-hitarea')) {
            iIcon.addClass('collapsable-hitarea')
        } else {
            iIcon.hasClass('expandable-hitarea')
        }

        //判断是否重载
        if (self.children('ul').length > 0) {
            return;
        }

        var level = self.data("level");
        var id = self.data("id");

        //获取下一级代理商列表
        $.post("queryNextAgent", {userId: id}, function (data) {
            if (data) {
                showLevel(self, level, data.list);
            }
        })
    }

    //渲染层级DOM
    function showLevel(self, level, data) {
        var str = "<ul>";
        var iStr = '';
        for (var i = 0, l = data.length; i < l; i++) {

            if (Number(data[i].userType) == 0) { //判断是否有下一级代理
                iStr = "<i></i>";
            } else {
                iStr = "";
            }

            str += "<li class='level-" + (level + 1) + "-" + data[i].id + "' data-level='" + (level + 1) + "' data-id='" + data[i].id + "' data-count='" + data[i].userType + "'>" +
                    iStr +
                    "<span>" + data[i].name + "</span>" +
                    "</li>";
        }
        str += "</ul>";

        self.append(str).find('li').on('click', function (e) {
            e.stopPropagation();
            var that = $(this);
            getNextAgent(that);
        })

    }

    //添加代理
    $('#addNextLevel').click(function () {
        var id = $('#levelTree .target').data("id");
        viewDialog('addAgentUserPage?addId=' + id, '添加下级代理', '0', '1')
    })

    //查看代理
    $('#lookAgent').click(function () {
        var id = $('#levelTree .target').data("id");
        viewDialog('queryAgentUserDetail?addId=' + id, '查看代理详情', '', '1');
    })


    function viewDialog(url, boxname, divType, haveData) {
        type = parseInt(divType);
        haveFlag = parseInt(haveData);
        openWindow(url, boxname, 800, 600);
    }


    function openWindow(url, name, iWidth, iHeight) {
        var url; //转向网页的地址;
        var name; //网页名称，可为空;
        var iWidth; //弹出窗口的宽度;
        var iHeight; //弹出窗口的高度;
        var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置;
        var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置;
        result = window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no, modal=yes,status=no');
        window.onfocus = function () {
            result.focus();
        };
        window.onclick = function () {
            result.focus();
        };
    };

    //添加下级代理，返回操作
    function closeWin(id, name) {
        console.log("id:" + id + ",name:" + name);
        if (id != null) {

            var target = $('#levelTree .target');
            var level = target.data('level');
            var str;
            if (target.data('count') == 0) {
                str = "<li data-level='" + (level + 1) + "' data-id='" + id + "'>" + name + "<span></li>";
            } else {
                str = "<ul><li data-level='" + (level + 1) + "' data-id='" + id + "'>" + name + "<span></li></ul>";
            }
            target.append(str).find('li').on('click', function (e) {
                e.stopPropagation();
                var that = $(this);
                getNextAgent(that);
            });
        }
        result.close();
    }

</script>

<!--右边框架结束-->