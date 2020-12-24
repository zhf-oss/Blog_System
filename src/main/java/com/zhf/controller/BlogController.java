package com.zhf.controller;

import com.zhf.entity.Blog;
import com.zhf.entity.BlogType;
import com.zhf.entity.Comment;
import com.zhf.entity.Link;
import com.zhf.service.BlogService;
import com.zhf.service.BlogTypeService;
import com.zhf.service.CommentService;
import com.zhf.service.LinkService;
import com.zhf.util.ResponseUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private BlogTypeService blogTypeService;

    @Autowired
    private LinkService linkService;

    @Autowired
    private CommentService commentService;

    /**
     * 通过Id获取到博客文章所有信息，用于阅读全文模块
     * @param id
     * @return
     */
    @RequestMapping("/articles/{id}")
    public ModelAndView details(@PathVariable("id")Integer id, Comment s_comment, HttpServletRequest request)throws Exception{
        ModelAndView mav = new ModelAndView();
        Blog blogContext = blogService.findById(id);
        Map<String,Object> map = new HashMap<String,Object>();
        /** 查询评论中关于该博客文章的评论. */
        List<Comment> commentList = commentService.list(map);
        List<String> timeList = new ArrayList<String>();
        int i = 0;
        for(Comment c:commentList){
            timeList.add(i++,c.getDate());
        }
        mav.addObject("commentList",commentList);
        mav.addObject("timeList",timeList);
        Blog upResult = null; // 上一篇
        try{
            upResult = blogService.upBlog(id);
            if(upResult.getId()!=null){
                mav.addObject("upResult",upResult);
            }
        }catch (Exception e){
            upResult = blogContext;
            mav.addObject("upResult",upResult);
            e.printStackTrace();
        }
        Blog downResult = null; // 下一篇
        try{
            downResult = blogService.downBlog(id);
            if(downResult.getId()!=null){
                mav.addObject("downResult",downResult);
            }
        }catch (Exception et){
            downResult = blogContext;
            mav.addObject("downResult",downResult);
            et.printStackTrace();
        }

        mav.addObject("blogContext",blogContext);
        blogContext.setClickHit(blogContext.getClickHit()+1);
        blogService.update(blogContext);
        mav.addObject("pageComment","foreground/common/z.jsp");
        mav.addObject("mainPage","foreground/blog/blogcontext.jsp");
        mav.setViewName("mainTemp");
        return mav;
    }

    /**
     * 博客文章评论功能
     * @param s_comment
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/sendComment")
    public String sendComment(Comment s_comment, HttpServletRequest request, HttpServletResponse response)throws Exception {
        if (s_comment.getContent() != null) {
            /** 获取评论人的IP. */
            String userIP = request.getRemoteAddr();
            s_comment.setIp(userIP);
            commentService.add(s_comment);
        }
        JSONObject result = new JSONObject();
        result.put("success",true);
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 用于导航中的归档操作
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/blogType")
    public ModelAndView list(HttpServletRequest request)throws Exception{
        ModelAndView mav = new ModelAndView();
        Map<String,Object> map = new HashMap<String,Object>();
        List<BlogType> blogTypeList = blogTypeService.list(map);
        List<Blog> blogList1 = blogService.list(map);
        mav.addObject("blogTypeList",blogTypeList);
        mav.addObject("blogList1",blogList1);
        mav.addObject("pageTitle","归档");
        mav.addObject("pageComment","foreground/common/z.jsp");
        mav.addObject("mainPage","foreground/blog/blogtype.jsp");
        mav.setViewName("mainTemp");
        return mav;
    }

    /**
     * 友情链接模块
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/link")
    public ModelAndView linkList(HttpServletRequest request)throws Exception{
        ModelAndView mav = new ModelAndView();
        Map<String,Object> map = new HashMap<String,Object>();
        List<Link> linkList = linkService.list(map);
        mav.addObject("linkList",linkList);
        mav.addObject("pageTitle","友情链接");
        mav.addObject("pageComment","foreground/common/z.jsp");
        mav.addObject("mainPage","foreground/blog/link1.jsp");
        mav.setViewName("mainTemp");
        return mav;
    }
}
