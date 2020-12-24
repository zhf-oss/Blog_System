<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>修改关于博主信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.js"></script>
    <style type="text/css">

        table tr td{
            padding: 10px;
        }

        .layui-upload-img{width: 92px; height: 92px; margin: 0 10px 10px 0;}

    </style>
</head>
<body>
<div style="padding: 20px">

    <div style="border: 2px solid grey; margin: 20px 20px;">
        <form action="${pageContext.request.contextPath}/admin/bloggerUpload.do" method="post" enctype="multipart/form-data">
            <table cellspacing="20px">
                <!-- 头像 -->
                <tr>
                    <td>
                        <div>
                            <%--                    <button style="margin-top: -30%; margin-left: 31%; border: 0.5px solid lightskyblue;" id="e" type="button" class="layui-btn layui-btn-sm">修改头像</button>--%>
                            <input type="file" id="file2" name="file2" value="上传" style="margin-top: -35%; margin-left: 31%; border: 0.5px solid lightskyblue;" />
                        </div>
                    </td>
                    <td>
                        <div style="width: 200px; border: 2px solid darkseagreen; margin-top: 100px; margin-left: -65%;">
                            <img alt="image" style="width: 200px; height: 250px;" src="${pageContext.request.contextPath}/static/images/${personMsg.profile }" />
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

</div>
<script type="text/javascript">

    $(function () {
        var a = "${success2 }";
        if (a == 1) {
            alert("修改成功！");
            <%
                HttpSession session1 = request.getSession();
                session1.removeAttribute("success2");
            %>
        }
    });

</script>
</body>
</html>
