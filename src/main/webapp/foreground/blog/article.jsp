<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section id="posts" class="posts-expand">

    <c:forEach var="blog" items="${blogList }">

        <article class="post post-type-normal" itemscope="" itemtype="http://schema.org/Article">

            <!-- 左上角的月日日期 -->
            <div class="post-date">
                <div class="post-month">
                    <fmt:formatDate value="${blog.releaseDate }" type="date" pattern="MM"/>
                </div>
                <div class="post-day">
                    <fmt:formatDate value="${blog.releaseDate }" type="date" pattern="dd"/>
                </div>
            </div>

            <!-- 博客类别 -->
            <div class="post-badge">
            <span itemprop="about" itemscope="" itemtype="http://schema.org/Thing">
                <a href="#" itemprop="url" rel="index">
                    <span itemprop="name">${blog.blogType.typeName }</span>
                </a>
            </span>
            </div>

            <div class="post-block">
                <link itemprop="mainEntityOfPage" href="${pageContext.request.contextPath}/blog/articles/${blog.id }.html">
                <header class="post-header">
                    <!-- 博客标题 -->
                    <h1 class="post-title" itemprop="name headline">
                        <a class="post-title-link" href="${pageContext.request.contextPath}/blog/articles/${blog.id }.html" itemprop="url">${blog.title }</a>
                    </h1>
                    <div class="post-meta">

                        <!-- 日期 -->
                        <span class="post-time" style="color: #00a7e0">
                        <span class="post-meta-item-icon"><i class="fa fa-calendar-o"></i></span>
                        <span class="post-meta-item-text">发表于</span>
                        <time title="Post created" itemprop="dateCreated datePublished" datetime="2020-5-19 13:00:55">
                            <fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd"/>
                        </time>
                    </span>

                        <!-- 博客标题下面的设计模式与单例模式 -->
                        <span class="post-tags">
                        <span class="post-meta-divider">•</span>
                        <span class="post-meta-item-icon"><i class="fa fa-tag"></i></span>

                            <a href="${pageContext.request.contextPath}/blog/articles/${blog.id }.html" itemprop="url" rel="index">
                                   <span title="标题">${blog.title }</span>
                            </a>

                    </span>

                        <!-- 浏览量 -->
                        <span class="leancloud_visitors" style="color:#ff3f1a">
                        <span class="post-meta-divider">•</span>
                        <span class="post-meta-item-icon"><i class="far fa-eye"></i></span>
                        <span class="post-meta-item-text">被</span>
                        <span class="leancloud-visitors-count">${blog.clickHit }</span>
                        <span class="post-meta-item-text">人看爆</span>
                    </span>
                    </div>
                </header>

                <!-- 博客内容 -->
                <div class="post-body" itemprop="articleBody">
                    <p style="text-indent:2em;">${blog.summary }</p>
                    <div class="post-button text-center">
                        <a class="btn post-more-btn" href="${pageContext.request.contextPath}/blog/articles/${blog.id }.html" rel="contents">
                            阅读全文 »
                        </a>
                    </div>
                </div>
                <footer class="post-footer">

                </footer>
            </div>
        </article>

    </c:forEach>

</section>