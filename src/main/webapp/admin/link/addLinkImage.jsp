<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加或修改友情链接头像</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"></link>
    <style type="text/css">

        table tr td{
            padding: 10px;
        }

        .layui-upload-img{width: 92px; height: 92px; margin: 0 10px 10px 0;}

    </style>
</head>
<body>
<div style="padding: 20px">

    <div class="layui-upload">
        <button type="button" class="layui-btn" id="uploadBtn">上传头像</button>
        <div class="layui-inline layui-word-aux">
            头像大小限制200KB
        </div>
        <div class="layui-upload-list">
            <img class="layui-upload-img" id="uploadImage">
            <p id="demoText"></p>
        </div>
    </div>
    <br/>
    <button class="layui-btn" onclick="javascript:parent.window.location.reload();">确定</button>

</div>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script>

    var linkData;
    var modifyLink;
    var url;

    function childLinkData(data) {
        linkData = data;
    }

    function childLinkId(id) {
        modifyLink = id;
        url = '${pageContext.request.contextPath}/admin/linkImageUpload.do?linkId=' + id + '';

        layui.use('upload', function(){
            var $ = layui.jquery
                ,upload = layui.upload;

            //普通图片上传
            var uploadInst = upload.render({
                elem: '#uploadBtn'
                , url: url
                ,size: 200 //限制文件大小，单位 KB
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#uploadImage').attr('src', result); //图片链接（base64）
                    });
                }
                ,done: function(res){
                    //如果上传失败
                    if (res.code > 0) {
                        return layer.msg('上传失败！');
                    } else {
                        return layer.msg('上传成功！');
                    }
                }
                ,error: function(){
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: forestgreen;">上传成功</span>');
                }
            });
        });
    }

</script>
</body>
</html>
