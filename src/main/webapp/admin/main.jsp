<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>博客后台管理系统</title>

    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.js"></script>
    <script type="text/javascript">

        function modifyPassword() {
            layer.open({
                type: 2,
                title: '修改密码',
                area: ['480px', '400px'],
                content: '${pageContext.request.contextPath}/admin/modifyPassword.jsp' //iframe的url
            });
        }

        function reloadDate() {
            $.post("${pageContext.request.contextPath}/reload/data.do", {}, function (result) {
                if(result.success){
                    layer.alert("刷新缓存成功！！");
                }
            }, "json");
        }

        function logout() {
            layer.confirm("确定退出吗？",function () {
                $.post("${pageContext.request.contextPath}/reload/logout.do", {}, function (success) {
                    window.location.href = "${pageContext.request.contextPath}/adminLogin.jsp";
                });
            })
        }

    </script>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img alt="image" class="img-circle" src="${pageContext.request.contextPath}/static/img/zzzz.jpg" /></span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">曾华帆</strong></span>
                                <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/admin/blogger/blogData.jsp">个人资料</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/blogger/logout.do">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">zhf
                    </div>
                </li>
                <li>
                    <a class="J_mainContent" href="#">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">主页</span>
                    </a>
                </li>
                <!-- 博客管理 -->
                <li>
                    <a href="#">
                        <i class="fa fa-edit"></i>
                        <span class="nav-label">博客管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/admin/blog/writeBlog.jsp">写博客</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/admin/blog/listBlog.jsp">博客列表</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/admin/blog/commentBlog.jsp">博客评论</a>
                        </li>
                    </ul>
                </li>
                <!-- 博客类别管理 -->
                <li>
                    <a class="J_menuItem" href="${pageContext.request.contextPath}/admin/blogType/blogTypeList.jsp">
                        <i class="fa fa-table"></i>
                        <span class="nav-label">博客类别管理</span>
                    </a>
                </li>
                <!-- 留言板管理 -->
                <li>
                    <a class="J_menuItem" href="${pageContext.request.contextPath}/admin/message/listMessage.jsp">
                        <i class="fa fa-envelope"></i> <span class="nav-label">留言板</span>
                    </a>
                </li>
                <!-- 友情链接管理 -->
                <li>
                    <a class="J_menuItem" href="${pageContext.request.contextPath}/admin/link/linkList.jsp">
                        <i class="fa fa fa-bar-chart-o"></i> <span class="nav-label">友情链接</span>
                    </a>
                </li>
                <!-- 关于博主 -->
                <li>
                    <a class="J_menuItem" href="${pageContext.request.contextPath}/admin/blogger/modifyBloggerInfo.jsp">
                        <i class="menu-item-icon fa fa-heartbeat"></i> <span class="nav-label">关于博主</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-magic"></i>
                        <span class="nav-label">系统设置</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="javascript:reloadDate()">刷新服务器缓存</a>
                        </li>
                        <li>
                            <a href="javascript:modifyPassword()">修改密码</a>
                        </li>
                        <li>
                            <a href="javascript:logout()">安全退出</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">

                <!-- 搜索区域 -->
                <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" method="post" action="http://www.zi-han.net/theme/hplus/search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="该功能暂未开放 …" class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>

                <!-- 消息框 -->
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">${getTotalMessage }</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <c:forEach var="topThree" items="${MessageTopThree }" varStatus="status">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a href="#" class="pull-left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/static/images/${status.index+1 }.jpg">
                                        </a>
                                        <div class="media-body">
                                            <strong>${topThree.commentName }</strong> ${topThree.content }
                                            <br>
                                            <small class="text-muted">
                                                    ${topThree.date }
                                            </small>
                                        </div>
                                    </div>
                                </li>
                                <!-- 分割线 -->
                                <li class="divider"></li>
                            </c:forEach>
                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="${pageContext.request.contextPath}/admin/message/listMessage.jsp">
                                        <i class="fa fa-envelope"></i> <strong> 查看所有留言</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">${getTotalMessage+1 }</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有${getTotalMessage+1 }条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown hidden-xs">
                        <a class="right-sidebar-toggle" aria-expanded="false">
                            <i class="fa fa-tasks"></i> 主题
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

        <!-- 内容的操作区域 -->
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="" class="active J_menuTab" data-id="">主页</a>
                </div>
            </nav>

            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i></button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>
                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>

            <a href="${pageContext.request.contextPath}/admin/blogger/logout.do" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
        </div>

        <!-- 点击时候的content填充页，后台拼凑地址 -->
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${pageContext.request.contextPath}/admin/welcome.jsp" frameborder="0" data-id="${pageContext.request.contextPath}/admin/welcome.jsp"></iframe>
        </div>

        <!-- 底部 -->
        <div class="footer">
            <div class="pull-right">&copy; 2019-2020 <a href="http://www.hycollege.net/" target="_blank"> 河源职业技术学院 </a> 粤ICP备2020089565号-1
            </div>
        </div>
    </div>

    <!--通知栏-->
    <div id="right-sidebar">
        <div class="sidebar-container">

            <ul class="nav nav-tabs navs-3">

                <li class="active">
                    <a data-toggle="tab" href="#tab-1">
                        <i class="fa fa-gear"></i> 主题
                    </a>
                </li>
                <li class="">
                    <a data-toggle="tab" href="#tab-2">
                        通知
                    </a>
                </li>
            </ul>

            <div class="tab-content">

                <!-- tab-1 -->
                <div id="tab-1" class="tab-pane active">
                    <div class="sidebar-title">
                        <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                        <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                    </div>
                    <div class="skin-setttings">
                        <div class="title">主题设置</div>
                        <div class="setings-item">
                            <span>收起左侧菜单</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                    <label class="onoffswitch-label" for="collapsemenu">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定顶部</span>

                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                    <label class="onoffswitch-label" for="fixednavbar">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定宽度</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                    <label class="onoffswitch-label" for="boxedlayout">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="title">皮肤选择</div>
                        <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                                     <a href="#" class="s-skin-0">
                                         默认皮肤
                                     </a>
                                </span>
                        </div>
                        <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                                    <a href="#" class="s-skin-1">
                                        蓝色主题
                                    </a>
                                </span>
                        </div>
                        <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                                    <a href="#" class="s-skin-3">
                                        黄色/紫色主题
                                    </a>
                                </span>
                        </div>
                    </div>
                </div>

                <!-- tab-2 -->
                <div id="tab-2" class="tab-pane">

                    <div class="sidebar-title">
                        <h3> <i class="fa fa-comments-o"></i> 最新通知</h3>
                        <small><i class="fa fa-tim"></i> 您当前有${getTotalMessage }条未读信息</small>
                    </div>
                    <div>
                        <c:forEach var="allMessage" items="${allMessageList }">
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${pageContext.request.contextPath}/static/images/3.jpg">
                                    </div>
                                    <div class="media-body">
                                        ${allMessage.content }
                                        <br>
                                        <small class="text-muted">
                                            ${allMessage.date }
                                        </small>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/contabs.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/pace/pace.min.js"></script>
</body>
</html>