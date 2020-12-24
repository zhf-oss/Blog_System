<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="post-block archive post">
    <div id="posts" class="posts-collapse">

        <!-- 标题 -->
        <h1 class="post-collapse-title" style="color: lightskyblue; text-align: center" itemprop="name headline">
            <i class="menu-item-icon fa fa-archive"></i>归档
        </h1>

        <div class="collection-year">

            <!-- 博客类型 -->
            <c:forEach var="blogType" items="${blogTypeList }">
                <div class="collection-title">
                    <h2 class="archive-year" style="color:dimgray;" id="-year-2020">${blogType.typeName }</h2>
                </div>
                <!-- 博客标题 -->
                <c:forEach var="blog1" items="${blogList1 }">
                    <c:set var="salary" scope="session" value="${blogType.typeName }"/>
                    <c:if test="${blog1.blogType.typeName==salary }">
                        <article class="post post-type-normal" itemscope="" itemtype="http://schema.org/Article">
                            <header class="post-header">

                                <!-- 博客标题 -->
                                <h2 class="post-title" style="text-align: left;text-indent: 1em; padding-top: 11px;">
                                    <a class="post-title-link" href="${pageContext.request.contextPath}/blog/articles/${blog1.id }.html" itemprop="url">
                                        <span itemprop="name" style="color: grey; font-size: 15px; font-family: 宋体;">${blog1.title }</span>
                                    </a>
                                </h2>

                                <div class="post-meta">
                                    <!-- 博客发布时间 -->
                                    <time class="post-time" itemprop="dateCreated" datetime="2020-5-19 13:00:55" content="2020-05-19">
                                        『<fmt:formatDate value="${blog1.releaseDate }" type="date" pattern="yyyy-MM-dd"/>』
                                    </time>
                                </div>
                            </header>
                        </article>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </div>
    </div>
</div>
