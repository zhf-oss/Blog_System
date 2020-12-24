<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>写博客</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.js"></script>
    <script type="text/javascript">

        function submitData() {
            var title = $("#title").val();
            var blogTypeId = $('#blogTypeId option:selected').val();
            var content = UE.getEditor('editor').getContent();
            var keyWord = $("#keyWord").val();
            if(title==null || title==''){
                alert("博客标题不能为空！");
            }else if(blogTypeId==null || blogTypeId==''){
                alert("博客类别不能为空！");
            }else if(content==null || content==''){
                alert("请编写博客内容！")
            }else{
                $.post("${pageContext.request.contextPath}/admin/blog/save.do",{'title':title,
                        'blogType.id':blogTypeId,'content':content,'keyWord':keyWord},
                    function (result) {
                        if(result.success){
                            alert("发布成功！");
                            resetValue();
                            parent.location.reload();
                        }else{
                            alert("发布失败，请联系管理员处理！");
                            parent.location.reload();
                        }
                    },"json");
            }
        }

        function resetValue() {
            $("#title").val("");
            $('#blogTypeId').val(-1);
            UE.getEditor('editor').setContent("");
            $("#keyWord").val("");
        }

    </script>
</head>
<body>

<div style="border: 2px solid grey; margin: 20px 20px;">
    <table cellspacing="20px">
        <tr >
            <div class="layui-form-item" style="margin-top: 40px;">
                <label class="layui-form-label">标题：</label>
                <div class="layui-input-block">
                    <input type="text" id="title" name="title" lay-verify="title" style="width: 300px;" autocomplete="off" placeholder="请输入博客标题" class="layui-input">
                </div>
            </div>
        </tr>
        <tr>
            <div class="layui-inline" style="margin-top: 10px;">
                <label class="layui-form-label" style="margin-left: 28px;">博客类别：</label>
                <div class="layui-input-inline">
                    <select id="blogTypeId" name="blogType.id" lay-verify="required" lay-search="" style="height: 30px; width: 160px;">
                        <option value="-1">请选择博客类别...</option>
                        <c:forEach var="adminBlogType" items="${adminBlogTypeList }">
                            <option value="${adminBlogType.id }">${adminBlogType.typeName }</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </tr>
        <tr>
            <div class="layui-form-item" style="margin-top: 20px;">
                <label class="layui-form-label" style="margin-left: 28px;">博客内容：</label>
                <div class="layui-input-block" style="margin-left: 130px;">
                    <script id="editor" name="content" type="text/plain" style="width:90%;height:400px;"></script>
                </div>
            </div>
        </tr>
        <tr>
            <div class="layui-form-item" style="margin-top: 40px;">
                <label class="layui-form-label">关键字：</label>
                <div class="layui-input-block">
                    <input type="text" id="keyWord" name="keyWord" lay-verify="title" style="width: 300px;" autocomplete="off" placeholder="请输入搜索博客的关键字" class="layui-input">
                </div>
            </div>
        </tr>
        <tr>
            <div class="layui-form-item" style="margin-top: 20px;">
                <label class="layui-form-label"></label>
                <div class="layui-input-block">
                    <button onclick="submitData()" id="button" type="button" class="layui-btn layui-btn-sm layui-btn-normal">发布博客</button>
                </div>
            </div>
        </tr>
    </table>
</div>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"> </script>
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</body>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('editor')
</script>
</html>
