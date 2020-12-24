package com.zhf.controller.admin;

import com.zhf.controller.DateJsonValueProcessor;
import com.zhf.entity.Blog;
import com.zhf.entity.Comment;
import com.zhf.entity.PageBean;
import com.zhf.service.BlogService;
import com.zhf.service.CommentService;
import com.zhf.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/comment")
public class CommentAdminController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private BlogService blogService;

    /**
     * 查询所有评论
     * @param page
     * @param limit
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String commentList(@RequestParam(value = "page",required = false)String page, @RequestParam(value = "limit",required = false)String limit, HttpServletResponse response)throws Exception{
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(limit));
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("start",pageBean.getStart());
        map.put("size",pageBean.getPageSize());
        List<Comment> commentList = commentService.commentList(map);
        /** 对象数据的转换. */
        JsonConfig jsonConfig=new JsonConfig();
        /** 过滤日期，是用于当前端有传来时间格式时，转换为字符串格式存入. */
        jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(commentList,jsonConfig);
        result.put("code", 0);
        result.put("count", commentList.size());
        result.put("data",jsonArray);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 删除评论
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam(value = "ids")String ids,HttpServletResponse response)throws Exception{
        String[] idsStr = ids.split(",");
        for(int i=0;i<idsStr.length;i++){
            commentService.delete(Integer.parseInt(idsStr[i]));
        }
        JSONObject result = new JSONObject();
        result.put("success",true);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 审核评论：通过
     * @param id
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/update")
    public String update(@RequestParam(value = "id")String id,@RequestParam(value = "blogId",required = false)String blogId,HttpServletResponse response)throws Exception{
        Blog blog = blogService.findById(Integer.parseInt(blogId));
        blog.setReplyHit(blog.getReplyHit() + 1);
        /** 修改改评论状态为1：审核通过. */
        commentService.update(Integer.parseInt(id));
        /** 审核通过后，更新评论数量. */
        blogService.updateReplyHit(blog);
        JSONObject result = new JSONObject();
        result.put("success",true);
        ResponseUtil.write(response,result);
        return null;
    }

}
