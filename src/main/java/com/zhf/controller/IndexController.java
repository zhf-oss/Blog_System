package com.zhf.controller;

import com.zhf.entity.Blog;
import com.zhf.entity.PageBean;
import com.zhf.service.BlogService;
import com.zhf.util.PageUtil;
import com.zhf.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 主页Controller
 */
@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private BlogService blogService;

    /**
     * 请求主页
     * @return
     */
    @RequestMapping("/index")
    public ModelAndView index(@RequestParam(value = "page",required = false)String page,@RequestParam(value = "search_title",required = false)String search_title, HttpServletRequest request)throws Exception{
        ModelAndView mav = new ModelAndView();
        // todo Jsp页面性能差，这里请求主页的时候可以做个redis缓存，提高整体的访问性能.
        if(StringUtil.isEmpty(page)){
            page = "1";
        }
        PageBean pageBean = new PageBean(Integer.parseInt(page),4);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("title",StringUtil.formatLike(search_title));
        map.put("start",pageBean.getStart());
        map.put("size",pageBean.getPageSize());
        List<Blog> blogList = blogService.list(map);
        mav.addObject("blogList",blogList);
        mav.addObject("pageCode", PageUtil.genPagination(request.getContextPath()+"/index.html",blogService.getTotal(map),Integer.parseInt(page),4,null));
        mav.addObject("pageTitle","个人博客系统");
        mav.addObject("pageComment","foreground/common/z.jsp");
        mav.addObject("mainPage","foreground/blog/article.jsp");
        mav.setViewName("mainTemp");
        return mav;
    }

}
