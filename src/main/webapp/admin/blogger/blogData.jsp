<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>写博客</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>

</head>
<body>

<div style="border: 2px solid grey; margin: 20px 20px;">
    <form action="${pageContext.request.contextPath}/admin/upload.do" method="post" enctype="multipart/form-data">
        <table cellspacing="20px">
            <tr >
                <td>
                    <div class="layui-form-item" style="margin-top: 80px; margin-left: 25px;">
                        <label class="layui-form-label">博客名称：</label>
                        <div class="layui-input-block">
                            <input type="text" id="blogName" name="blogName" value="${personMsg.nickName }" lay-verify="title" style="width: 300px;" autocomplete="off" placeholder="请输入..." class="layui-input">
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item" style="margin-top: 80px; margin-left: 50px;">
                        <label class="layui-form-label">个人简介：</label>
                        <div class="layui-input-block">
                            <input type="text" id="bloggerMsg" name="bloggerMsg" value="${personMsg.profile }" lay-verify="title" style="width: 300px;" autocomplete="off" placeholder="请输入..." class="layui-input">
                        </div>
                    </div>
                </td>
            </tr>
            <tr >
                <td>
                    <div class="layui-form-item" style="margin-top: 20px; margin-left: 25px;">
                        <label class="layui-form-label">真实姓名：</label>
                        <div class="layui-input-block">
                            <input type="text" id="trueName" name="trueName" value="${personMsg.userName }" lay-verify="title" style="width: 300px;" autocomplete="off" placeholder="请输入..." class="layui-input">
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item" style="margin-top: 84px; margin-left: 50px;">
                        <label class="layui-form-label">个性签名：</label>
                        <div class="layui-input-block">
                            <textarea id="sign" name="sign" placeholder="请输入个..."  class="layui-textarea">${personMsg.sign }</textarea>
                        </div>
                    </div>
                </td>
            </tr>
            <!-- 头像 -->
            <tr>
                <td>
                    <div>
                        <input type="file" id="file1" name="file1" value="上传" style="margin-top: -35%; margin-left: 31%; border: 0.5px solid lightskyblue;" />
                    </div>
                </td>
                <td>
                    <div style="width: 200px; border: 2px solid darkseagreen; margin-top: 14px; margin-left: -65%;">
                        <img alt="image" style="width: 200px; height: 250px;" src="${pageContext.request.contextPath}/static/images/${personMsg.imageName }" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item" style="margin-top: 30px; margin-left: 6%">
                        <label class="layui-form-label"></label>
                        <div class="layui-input-block">
                            <%--                            <button onclick="submitData()" id="button" type="button" class="layui-btn layui-btn-sm layui-btn-normal">修改信息</button>--%>
                            <input type="hidden" id="id" name="id" value="${personMsg.id }" />
                            <input type="submit" value="修改信息" style="height: 30px; background-color: lightskyblue" />
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
<script type="text/javascript">

    $(function () {
        var result = "${success1 }";
        if (result == 1) {
            alert("修改成功！")
        }
    });

</script>
</html>
