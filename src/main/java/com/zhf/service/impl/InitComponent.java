package com.zhf.service.impl;

import com.zhf.entity.Blog;
import com.zhf.entity.BlogType;
import com.zhf.entity.Blogger;
import com.zhf.service.BlogService;
import com.zhf.service.BlogTypeService;
import com.zhf.service.BloggerService;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebServlet;
import java.util.List;

/**
 * 服务器启动前初始化一些需要的数据
 */
@Component
public class InitComponent implements ServletContextListener, ApplicationContextAware {

    private static ApplicationContext applicationContext;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        this.reloadData(sce.getServletContext());
    }

    /** 加载数据到application缓存中. */
    public void reloadData(ServletContext application){
        BloggerService bloggerService = (BloggerService) applicationContext.getBean("bloggerService"); // 获取Bean(bloggerService)
        BlogService blogService = (BlogService) applicationContext.getBean("blogService"); // 获取Bean(blogService)
        BlogTypeService adminBlogTypeService = (BlogTypeService) applicationContext.getBean("blogTypeService"); // 获取博客类别
        Blogger blogger = bloggerService.findMessage(); // 获取博主信息
        List<Blog> fiveBlogList = blogService.fiveBlogList(null); // 获取点击量前五的博客文章
        List<BlogType> adminBlogTypeList = adminBlogTypeService.list(null); // 获取博客类型
        blogger.setPassword(null); // 密码清空
        application.setAttribute("personMsg",blogger); // 博主信息存入application中
        application.setAttribute("fiveBlogList",fiveBlogList);// 点击量前五的博客文章存入application中
        application.setAttribute("adminBlogTypeList",adminBlogTypeList); // 博主信息存入application中
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        // 获取ApplicationContext
        this.applicationContext = applicationContext;
    }

}
