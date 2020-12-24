<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 友情链接部分 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/main.js"></script>
<div id="posts" class="post posts-expand">
    <div class="post-block page">
        <header class="post-header">
            <h1 class="post-collapse-title" style="color: lightskyblue; text-align: center" itemprop="name headline">
                <i class="menu-item-icon fa fa-link"></i>&nbsp;&nbsp;友情链接
            </h1>
        </header>
        <div class="post-body">
            <div class="links">
                <h3 style="width: 100%; margin: 10px;">本人</h3>
                <ul>
                    <li>
                        <a href="http://www.zhf943.top/zhf_blog" target="_blank" rel="external">
                            <img class="no-fancybox" src="${pageContext.request.contextPath}/static/images/qqq.jpg" />
                            <h4>hfang's blog</h4>
                            <p>博主本人👦</p>
                        </a>
                    </li>
                </ul>
                <h3 style="width: 100%; margin: 10px;">链接地址</h3>
                <ul>
                    <c:forEach var="link" items="${linkList }">
                        <li style="margin: 10px 0px;">
                            <a href="${link.linkUrl }" target="_blank" rel="external">
                                <img class="no-fancybox" src="${pageContext.request.contextPath}/static/images/${link.linkImage }">
                                <h4>${link.linkName }</h4>
                                <p>${link.linkUrl }</p>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
