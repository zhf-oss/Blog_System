<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="site-nav">
    <ul id="menu" class="menu">
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/index.html" target="_self">
                <i class="menu-item-icon fa fa-home"></i><br>
                首页
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/blog/blogType.html" target="_self">
                <i class="menu-item-icon fa fa-archive"></i><br>
                归档
            </a>
        </li>
        <li class="menu-item">
            <a href="http://share.zhf943.top/" target="_blank">
                <i class="fa fa-magic"></i>
                zhf-项目演示
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/blog/link.html" target="_self">
                <i class="menu-item-icon fa fa-link"></i><br>
                友情链接
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/message/list.html" target="_self">
                <i class="menu-item-icon fa fa-paper-plane"></i><br>
                留言板
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/blogger/aboutMe.html" target="_self">
                <i class="menu-item-icon fa fa-heartbeat"></i><br>
                关于博主
            </a>
        </li>
        <li class="menu-item search">
            <form action="${pageContext.request.contextPath}/index.html" method="post" class="search-form">
                <input type="text" name="search_title" id="search_title" class="search-input" placeholder="站内搜索（已开放）">
                <button type="submit" class="search-submit"><i class="fas fa-search"></i></button>
            </form>
        </li>
    </ul>
</nav>
