<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>管理员登陆-zhf下载</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/login/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/login/css/camera.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/login/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/login/matrix-login.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/login/font-awesome.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/login/js/jquery-1.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.js"></script>
    <!-- 软键盘控件start -->
    <link href="${pageContext.request.contextPath}/static/login/keypad/css/framework/form.css" rel="stylesheet" type="text/css"/>
    <!-- 软键盘控件end -->
    <style type="text/css">
        .cavs{
            z-index:1;
            position: fixed;
            width:95%;
            margin-left: 20px;
            margin-right: 20px;
        }
    </style>
    <script type="text/javascript">

        $(function () {
            var username = "${blogger.userName }";
            var password = "${blogger.password }";
            var b = "${errorInfo }";
            if (b == 1) {
                alert("用户名或者密码错误！");
            }
            if (username != null && password !=null) {
                $("#userName").val(username.toString());
                $("#password").val(password.toString());
            }
            <%
                request.getSession().invalidate();
            %>
        });

        function submitData(){
            var userName = $("#userName").val();
            var password = $("#password").val();
            if(userName==""){
                alert("请输入用户名!");
                $("#userName").focus();
                return;
            }
            if(password==""){
                alert("请输入密码！");
                $("#password").focus();
                return;
            }
            $.post("${pageContext.request.contextPath}/blogger/login.do",{userName:$("#userName").val().trim(),password:$("#password").val().trim()});
        }

        //js  日期格式
    </script>
    <script>
        //window.setTimeout(showfh,3000);
        var timer;
        function showfh(){
            fhi = 1;
            //关闭提示晃动屏幕，注释掉这句话即可
            timer = setInterval(xzfh2, 10);
        };
        var current = 0;
        function xzfh(){
            current = (current)%360;
            document.body.style.transform = 'rotate('+current+'deg)';
            current ++;
            if(current>360){current = 0;}
        };
        var fhi = 1;
        var current2 = 1;
        function xzfh2(){
            if(fhi>50){
                document.body.style.transform = 'rotate(0deg)';
                clearInterval(timer);
                return;
            }
            current = (current2)%360;
            document.body.style.transform = 'rotate('+current+'deg)';
            current ++;
            if(current2 == 1){current2 = -1;}else{current2 = 1;}
            fhi++;
        };
    </script>
</head>
<body>
<!--小键盘承载器-->
<canvas class="cavs"></canvas>
<div style="width:100%;text-align: center;margin: 0 auto;position: absolute;">
    <!-- 登录 -->
    <div id="windows1">
        <div id="loginbox" >
            <form action="${pageContext.request.contextPath}/blogger/login.do" method="post" name="myForm" id="loginForm">
                <div class="control-group normal_text">
                    <h3>
                        <img src="static/login/logo.png" alt="Logo" />
                    </h3>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg">
                            <i><img height="37" src="static/login/user.png" /></i>
                            </span><input type="text" style="height: 35px; margin-top: 3px;" name="userName" id="userName" value="" placeholder="请输入用户名" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly">
                            <i><img height="37" src="static/login/suo.png" /></i>
                            </span><input type="password" style="height: 33px; margin-top: 4px;" name="password" id="password" placeholder="请输入密码" class="keypad" keypadMode="full" allowKeyboard="true" value=""/>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <div style="width:86%;padding-left:8%;">

                        <span class="pull-right">
<%--                                <a onclick="submitData();" class="flip-link btn btn-info" id="to-recover">登录</a>--%>
                            <input type="submit" class="flip-link btn btn-info" id="to-recover" />
                        </span>
                    </div>
                </div>
            </form>
            <div class="controls">
                <div class="main_input_box">
                    <font color="white"><span id="nameerr">Copyright © zhf个人站点  2019-2020</span></font>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="templatemo_banner_slide" class="container_wapper">
    <div class="camera_wrap camera_emboss" id="camera_slide">
        <!-- 背景图片 -->
        <div data-src="${pageContext.request.contextPath}/static/login/images/banner_slide_01.jpg"></div>
        <div data-src="${pageContext.request.contextPath}/static/login/images/banner_slide_02.jpg"></div>
        <div data-src="${pageContext.request.contextPath}/static/login/images/banner_slide_03.jpg"></div>
        <div data-src="${pageContext.request.contextPath}/static/login/images/banner_slide_04.jpg"></div>
        <div data-src="${pageContext.request.contextPath}/static/login/images/banner_slide_05.jpg"></div>
    </div>
    <!-- #camera_wrap_3 -->
</div>
<script src="${pageContext.request.contextPath}/static/login/js/camera.min.js"></script>
<script src="${pageContext.request.contextPath}/static/login/js/templatemo_script.js"></script>
<script src="${pageContext.request.contextPath}/static/login/js/ban.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jQuery.md5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.tips.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.cookie.js"></script>

<!-- 软键盘控件start -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/login/keypad/js/form/keypad.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/login/keypad/js/framework.js"></script>
</body>

</html>