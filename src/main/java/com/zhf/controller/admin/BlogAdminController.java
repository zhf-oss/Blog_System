package com.zhf.controller.admin;

import com.zhf.controller.DateJsonValueProcessor;
import com.zhf.entity.Blog;
import com.zhf.entity.PageBean;
import com.zhf.service.BlogService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/blog")
public class BlogAdminController {

    @Autowired
    private BlogService blogService;

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(@RequestParam(value = "page",required = false)String page, @RequestParam(value = "limit",required = false)String limit, HttpServletResponse response)throws Exception{
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(limit));
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("start",pageBean.getStart());
        map.put("size",pageBean.getPageSize());
        List<Blog> blogList = blogService.list(map);
        Long total = blogService.getTotal(map);
        /** 对象数据的转换. */
        JsonConfig jsonConfig=new JsonConfig();
        /** 过滤日期，是用于当前端有传来时间格式时，转换为字符串格式存入. */
        jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(blogList,jsonConfig);
        result.put("code", 0);
        result.put("count", total);
        result.put("data",jsonArray);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 添加或更新博客
     * @param blog
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/save")
    public String save(Blog blog, HttpServletResponse response)throws Exception{
        /** 操作的总记录数. */
        int resultTotal = 0;
        /** 截取博客内容作为模块的显示. */
        blog.setSummary(blog.getContent().substring(0,185));
        if(blog.getId()==null){
            resultTotal = blogService.add(blog);
        }else{
            resultTotal = blogService.updateBlog(blog);
        }
        JSONObject result = new JSONObject();
        if(resultTotal>0){
            result.put("success",true);
        }else{
            result.put("success",false);
        }
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 批量删除博客文章
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam(value = "ids",required = false)String ids,HttpServletResponse response)throws Exception{
        String[] idsStr = ids.split(",");
        for(int i=0;i<idsStr.length;i++){
            blogService.delete(Integer.parseInt(idsStr[i]));
        }
        JSONObject result = new JSONObject();
        result.put("success",true);
        ResponseUtil.write(response,result);
        return null;
    }
}
