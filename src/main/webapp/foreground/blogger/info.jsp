<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section id="posts" class="posts-expand">
    <article class="post post-type-normal" itemscope="" itemtype="http://schema.org/Article">
        <!-- 左上角的时间和标题名称 -->
        <div class="post-date">
            <div class="post-month">
                Hi
            </div>
            <div class="post-day" style="font-size: 20px;">
                河职院
            </div>
        </div>
        <div class="post-badge">
                <span itemprop="about" itemscope="" itemtype="http://schema.org/Thing">
                    <a href="#" itemprop="url">
                        <span itemprop="name">写代码是热爱，写到世界充满爱</span>
                    </a>
                </span>
        </div>
        <div class="post-block">
            <!-- 头部信息 -->
            <header class="post-header">
                <h1 class="post-title" itemprop="name headline">
                    个人简历
                </h1>
                <div class="post-meta">
                        <span class="post-time" style="color: #00a7e0">
                            <span class="post-meta-item-icon"><i class="fa fa-calendar-o"></i></span>
                            <span class="post-meta-item-text">曾华帆</span>
                            <time title="Post created" itemprop="dateCreated datePublished" datetime="2020-5-15 16:36:58">
    							<fmt:formatDate value="${blogContext.releaseDate }" type="date" pattern="yyyy-MM-dd"/>
                            </time>
                        </span>
                </div>
            </header>

            <!-- 博客内容 -->
            <footer class="post-footer">
                <div class="post-nav">
                    <div class="post-body" itemprop="articleBody">
                        <img src="${pageContext.request.contextPath}/static/images/${personMsg.profile }" style="width: 95%; height: 700px; padding-top: 20px;" />
                    </div>
                </div>
            </footer>
        </div>
    </article>
</section>
