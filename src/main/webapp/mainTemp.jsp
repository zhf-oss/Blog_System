<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="zh"><head>
    <title>${pageTitle }</title>
    <meta charset="utf-8">
    <meta http-equiv="x-dns-prefetch-control" content="on">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="hfang">
    <meta name="renderer" content="webkit">
    <style type="text/css">

    </style>
    <script>

        (function(){
            window.oncontextmenu=function(){return false;}
            if (window.console) {
                var cons = console;
                if (cons) {
                    cons.log("%c\n    ", "font-size:86px;background:url('http://q1.qlogo.cn/g?b=qq&nk=2362882118&s=100') no-repeat");
                    cons.log('hfang\'s blog  http://www.zhf943.top/zhf_blog  QQ: 862592396\n');
                }
            }
        })();

    </script>
    <script src="https://cdn.jsdelivr.net/npm/darkmode-js@1.5.5/lib/darkmode-js.min.js"></script>
    <link rel="alternate" type="application/atom+xml" title="ATOM 1.0" href="https://blog.tsxygfy.cn/atom.xml">
    <link href="https://cdn.jsdelivr.net/npm/tocbot@4.11.1/dist/tocbot.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" rel="stylesheet" type="text/css" media="screen">
    <link href="https://cdn.jsdelivr.net/gh/feiyangbeyond/halo-theme-sagiri@sagiri-cdn/css/prism.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/css/share.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/zoomify@0.2.5/dist/zoomify.min.css" rel="stylesheet" type="text/css">
    <link rel="alternate" href="https://blog.tsxygfy.cn/atom.xml" title="fyang's blog" type="application/atom+xml">

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async="" src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js">
    </script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-pjax@2.0.1/jquery.pjax.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.css">
    <script src="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/meting@2/dist/Meting.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .post-body>p a{
            color: #409EFF;
        }

        @font-face {
            font-family: Candyshop;
            src: url(https://cdn.jsdelivr.net/gh/feiyangbeyond/halo-theme-sagiri@sagiri-cdn/font/Candyshop.otf)
        }
    </style>

    <script>

        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-165910751-1');
    </script>

</head>

<body itemscope="" itemtype="http://schema.org/WebPage" lang="zh" class="theme-darling">

<div class="container sidebar-position-right page-home">

    <!-- 导航菜单和背景图 -->
    <header id="header" class="header" itemscope="" itemtype="http://schema.org/WPHeader">
        <div class="header-inner">

            <!-- 导航菜单 -->
            <jsp:include page="/foreground/common/nav.jsp"></jsp:include>

            <!-- 背景图 -->
            <jsp:include page="/foreground/common/background.jsp"></jsp:include>

            <!-- 背景图里显示的头像和个性签名 -->
            <div class="site-master" itemprop="author" itemscope="" itemtype="http://schema.org/Person">
                <img class="scrolldown_b site-master-avatar scaleup" itemprop="image" src="${pageContext.request.contextPath}/static/images/qqq.jpg" alt="fyang">
                <h2 class="site-master-description scaleup" itemprop="description">我是要成为海贼王的男人!</h2>
                <!-- 需要动态显示语句需要在h2里加id="hitokoto" -->
            </div>
        </div>
    </header>
    <main id="main" class="main">
        <div class="main-inner">
            <div class="content-wrap">
                <div id="content" class="content">

                    <!-- 博客文章 -->
                    <section id="posts" class="posts-expand">
                        <jsp:include page="${mainPage }"></jsp:include>
                    </section>

                    <!-- 分页 -->
                    <jsp:include page="/foreground/common/pagination.jsp"></jsp:include>

                </div>

                <!-- 评论框 -->
                <jsp:include page="${pageComment }"></jsp:include>

            </div>

            <!-- 个人信息 -->
            <aside id="sidebar" class="sidebar">
                <div class="sidebar-inner affix">
                    <div class="sidebar-inner-top ">
                        <section class="site-overview-wrap sidebar-panel sidebar-panel-active" id="about-me">
                            <div class="site-overview" style="max-height: 773px;">
                                <div class="site-author motion-element" itemprop="author" itemscope="" itemtype="http://schema.org/Person">

                                    <img class="site-author-image" style="height: 300px; margin-bottom: 40px;" itemprop="image" src="${pageContext.request.contextPath}/static/images/${personMsg.imageName }" alt="fyang">

                                    <p class="site-author-name" itemprop="name">
                                        <span style="opacity:1;">${personMsg.nickName}</span>
                                    </p>
                                    <p class="site-description motion-element" itemprop="description">${personMsg.sign}</p>
                                </div>
                                <!-- 个人信息下面的超链接图标 -->
                                <div class="links-of-author motion-element">
                                    <span class="links-of-author-item scaleup">
                                        <a href="https://github.com/" target="_blank">
                                            <i class="fa fab fa-github" style="color:#191717;"><span>Github</span></i>
                                        </a>
                                    </span>
                                    <span class="links-of-author-item scaleup">
                                        <a href="https://im.qq.com/" target="_blank" data-balloon-pos="up">
                                            <i class="fa fab fa-qq" style="color: #41aade"><span>QQ</span></i>
                                        </a>
                                    </span>
                                    <span class="links-of-author-item scaleup">
                                        <a href="https://mail.qq.com/" target="_blank">
                                            <i class="fa fab fa-envelope" style="color: #54bcff;"><span>Email</span></i>
                                        </a>
                                    </span>
                                </div>
                                <!-- 个人信息下面超链接图标下面的下拉框 -->
                                <details class="views-top-wrap">
                                    <summary class="views-top-name scaleup">看爆 Top5</summary>
                                    <ul class="views-top">
                                        <c:forEach var="fiveBlog" items="${fiveBlogList }">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/blog/articles/${fiveBlog.id }.html">
                                                    <span class="views-top-title">${fiveBlog.title }</span>
                                                    <span class="views-top-time">${fiveBlog.clickHit }次看爆</span>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </details>
                            </div>
                        </section>
                    </div>
                    <div id="sidebar-plugin" class="sidebar-inner-plugin">

                    </div>
                </div>
            </aside>

        </div>
    </main>

    <!-- 尾部，版权信息 -->
    <jsp:include page="/foreground/common/footer.jsp"></jsp:include>

    <div id="back-to-top" class="back-to-top" style="top: -226px;">
        <i class="fa fa-arrow-up"></i>
    </div>
</div>

<!-- 播放器 -->
<jsp:include page="/foreground/common/player.jsp"></jsp:include>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/velocity-animate@1.2.3/velocity.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/tocbot@4.4.2/dist/tocbot.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/greensock@1.20.2/dist/TweenMax.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-lazyload@1.9.3/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/js/jquery.share.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/zoomify@0.2.5/dist/zoomify.min.js"></script>
<script data-pjax="" src="https://cdn.jsdelivr.net/gh/feiyangbeyond/halo-theme-sagiri@sagiri-cdn/js/prism.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/animate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/backtotop.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/evanyou.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/main.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/normal.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/pjax.js"></script>

<iframe id="google_osd_static_frame_5928345569643" name="google_osd_static_frame" style="display: none; width: 0px; height: 0px;"></iframe></body><iframe id="google_esf" name="google_esf" src="https://googleads.g.doubleclick.net/pagead/html/r20200729/r20190131/zrt_lookup.html#" data-ad-client="ca-pub-7240792349583460" style="display: none;"></iframe></html>
