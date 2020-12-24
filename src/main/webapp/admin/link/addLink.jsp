<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>添加博客类别</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>

</head>
<body>

<div style="border: 2px solid grey; margin: 20px 20px;">
    <table cellspacing="20px">
        <tr >
            <div class="layui-form-item" style="margin-top: 40px;">
                <label class="layui-form-label">名称：</label>
                <div class="layui-input-block">
                    <input type="text" id="linkName" name="linkName" lay-verify="title" style="width: 300px;" autocomplete="off" placeholder="请输入..." class="layui-input">
                </div>
            </div>
        </tr>
        <tr >
            <div class="layui-form-item" style="margin-top: 40px;">
                <label class="layui-form-label">地址：</label>
                <div class="layui-input-block">
                    <input type="text" id="linkUrl" name="linkUrl" lay-verify="title" style="width: 300px;" autocomplete="off" placeholder="请输入..." class="layui-input">
                </div>
            </div>
        </tr>
        <tr >
            <div class="layui-form-item" style="margin-top: 40px;">
                <label class="layui-form-label">排序：</label>
                <div class="layui-input-block">
                    <input type="text" id="orderNo" name="orderNo" lay-verify="title" style="width: 300px;" autocomplete="off" placeholder="请输入..." class="layui-input">
                </div>
            </div>
        </tr>
        <tr>
            <div class="layui-form-item" style="margin-top: 20px;">
                <label class="layui-form-label"></label>
                <div class="layui-input-block">
                    <button onclick="submitData()" id="button" type="button" class="layui-btn layui-btn-sm layui-btn-normal">添加友情链接</button>
                </div>
            </div>
        </tr>
    </table>
</div>

</body>
<script type="text/javascript">

    function submitData() {
        var linkName = $("#linkName").val();
        var linkUrl = $("#linkUrl").val();
        var orderNo = $("#orderNo").val();
        if(linkName==null || linkName==''){
            alert("友情链接名称不能为空！");
        }else if(linkUrl==null || linkUrl==''){
            alert("地址不能为空！");
        }else if(orderNo==null || orderNo==''){
            alert("排序不能为空！");
        }else{
            $.post("${pageContext.request.contextPath}/admin/link/save.do",{'linkName':linkName,'linkUrl':linkUrl,'orderNo':orderNo},
                function (result) {
                    if(result.success){
                        alert("添加成功！");
                        // 从父窗口打开的弹出窗
                        // 先得到当前iframe层的索引
                        var index = parent.layer.getFrameIndex(window.name);
                        // 关闭当前窗口
                        parent.layer.close(index);
                        // 刷新父页面
                        window.parent.location.reload();
                    }else{
                        alert("添加失败，请联系管理员处理！");
                    }
                },"json");
        }
    }

</script>
</html>
