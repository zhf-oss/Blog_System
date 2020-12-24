<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/static/css/news.css" rel="stylesheet">
<style type="text/css">

    .comment_list{
        margin-top: 15px;
    }

    .comment_list .commentDatas{
        padding: 10px;
    }

    .comment_list .commentDatas .comment{
        margin-bottom: 5px;
        padding-bottom:15px;
        border-bottom: 1px dotted gray;
    }

    .comment_list .commentDatas .comment font{
        font-weight: bold;
    }

    .publish_list{
        margin-top: 15px;
        height: 130px;
    }

    .publish_list .publishButton{
        float: right;
        margin-right: 12px;
    }

</style>
<script type="text/javascript">

    $(function () {
        var a = "${success }";
        if (a == 1) {
            alert("评论成功，博主审核中...");
        }
    });

    function resetValue() {
        $("#area").val("");
    }

</script>
<article class="post post-type-normal" itemscope="" itemtype="http://schema.org/Article">
    <!-- 左上角的时间和标题名称 -->
    <div class="post-date">
        <div class="post-month">
            <fmt:formatDate value="${blogContext.releaseDate }" type="date" pattern="MM"/>
        </div>
        <div class="post-day">
            <fmt:formatDate value="${blogContext.releaseDate }" type="date" pattern="dd"/>
        </div>
    </div>
    <div class="post-badge">
            <span itemprop="about" itemscope="" itemtype="http://schema.org/Thing">
                <a href="#" itemprop="url">
                    <span itemprop="name">${blogContext.blogType.typeName }</span>
                </a>
            </span>
    </div>
    <div class="post-block">
        <!-- 头部信息 -->
        <header class="post-header">
            <h1 class="post-title" itemprop="name headline">
                <a class="post-title-link" href="${pageContext.request.contextPath}/blog/articles/${blogContext.id }.html" itemprop="url">${blogContext.title }</a>
            </h1>
            <div class="post-meta" style="margin-top: 20px;">
                    <span class="post-time" style="color: #00a7e0">
                        <span class="post-meta-item-icon"><i class="fa fa-calendar-o"></i></span>
                        <span class="post-meta-item-text">发表于</span>
                        <time title="Post created" itemprop="dateCreated datePublished" datetime="2020-5-15 16:36:58">
                            <fmt:formatDate value="${blogContext.releaseDate }" type="date" pattern="yyyy-MM-dd"/>
                        </time>
                    </span>
                <span class="post-tags">
                        <span class="post-meta-divider">•</span>
                    <span class="post-meta-item-icon"><i class="fa fa-tag"></i></span>
                        <a href="${pageContext.request.contextPath}/blog/articles/${blogContext.id }.html" itemprop="url" rel="index">
                                   <span title="标签">${blogContext.title }</span>
                        </a>
                        <a href="#" itemprop="url" rel="index">
                               <span title="评论" style="color: lightskyblue">评论(${blogContext.replyHit })</span>
                        </a>
                    </span>

                <span class="leancloud_visitors" style="color:#ff3f1a">
                        <span class="post-meta-divider">•</span>
                        <span class="post-meta-item-icon"><i class="far fa-eye"></i></span>
                        <span class="post-meta-item-text">被</span>
                        <span class="leancloud-visitors-count">${blogContext.clickHit }</span>
                        <span class="post-meta-item-text">人看爆</span>
                    </span>
            </div>
        </header>

        <!-- 博客内容 -->
        <div class="post-body" itemprop="articleBody">
            ${blogContext.content }
        </div>

        <!-- 上一篇和下一篇 -->
        <footer class="post-footer" style="margin-bottom: 30px;">
            <div class="post-nav">
                <div class="post-nav-next post-nav-item">
                    <a href="${pageContext.request.contextPath}/blog/articles/${upResult.id }.html" rel="next" title="${upResult.title }">
                        <i class="fas fa-angle-left"></i> ${upResult.title }
                    </a>
                </div>
                <span class="post-nav-divider"></span>
                <div class="post-nav-prev post-nav-item">
                    <a href="${pageContext.request.contextPath}/blog/articles/${downResult.id }.html" rel="prev" title="${downResult.title }">${downResult.title }
                        <i class="fas fa-angle-right"></i>
                    </a>
                </div>
            </div>
        </footer>

        <!-- 新闻的评论 -->
        <div class="data_list comment_list">
            <div class="dataHeader">用户评论</div>
            <c:set var="salary" scope="session" value="${blogContext.id }"/>
            <c:forEach var="comment" items="${commentList }" varStatus="status">
                <c:if test="${comment.state==1 }">
                    <c:if test="${comment.blogId==salary }">
                        <div class="commentDatas">
                            <!-- status从0开始 -->
                            <div class="comment" style="margin-top: 10px;">
                                <font>评论人的IP：</font>${comment.ip }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font>内容：</font>${comment.content }&nbsp;&nbsp;&nbsp;&nbsp;〖${timeList.get(status.index) }〗
                            </div>
                        </div>
                    </c:if>
                </c:if>
            </c:forEach>
        </div>

        <!-- 评论区 -->
        <div class="publish_list">
            <form action="${pageContext.request.contextPath}/blog/articles/${blogContext.id }.html" method="post">
                <div>
                    <!-- 隐藏域 -->
                    <input type="hidden" id="blogId" name="blogId" value="${blogContext.id }" />
                    <textarea style="width: 100%;" rows="3" id="content2" name="content2"></textarea>
                </div>
                <div class="publishButton" style="padding-top: 15px; margin-right: 2%;">
                    <button class="btn btn-primary" type="button" onclick="javascript:sendComment()">表发评论</button>
                </div>
            </form>
        </div>
    </div>
</article>
<script type="text/javascript">

    function sendComment() {
        var content = $("#content2").val();
        var blogId = $("#blogId").val();
        if (content == "") {
            alert("评论内容不能为空！");
            return;
        }
        $.post('${pageContext.request.contextPath}/blog/sendComment.html',{blogId:blogId,content:content},function(result) {
            var result = eval('('+result+')');
            if (result.success) {
                alert("评论成功，待博主审核...");
                resetValue1();
            } else {
                alert("评论失败，请联系博主...");
                resetValue1();
            }
        });
    }

    function resetValue1() {
        $("#content2").val("");
    }

</script>