<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section id="posts" class="posts-expand">
    <article class="post post-type-normal" itemscope="" itemtype="http://schema.org/Article">
        <div class="post-block">
            <header class="post-header">
                <h1 class="post-title" itemprop="name headline">
                    留言板
                </h1>
                <div class="post-meta">
                    <span class="post-time" style="color: #00a7e0">
                        <span class="post-meta-item-icon"><i class="fa fa-calendar-o"></i></span>
                        <span class="post-meta-item-text">发表于</span>
                        <time title="Post created" itemprop="dateCreated datePublished" datetime="2020-8-5 23:17:27">
                            2020-08-05
                        </time>
                    </span>

                    <span class="leancloud_visitors" style="color:#ff3f1a">
                        <span class="post-meta-divider">•</span>
                        <span class="post-meta-item-icon"><i class="far fa-eye"></i></span>
                        <span class="post-meta-item-text">有</span>
                        <span class="leancloud-visitors-count">${getClick.click }</span>
                        <span class="post-meta-item-text">来过</span>
                    </span>
                </div>
            </header>

            <div class="post-body" itemprop="articleBody">
                <p>有什么话要对我说吗？这里是你畅所欲言的地方，可以咨询，可以交流，可以感叹，可以发飙，但不可以订外卖。</p>
            </div>
        </div>
    </article>
</section>
