package com.zhf.controller.admin;

import com.zhf.entity.BlogType;
import com.zhf.entity.PageBean;
import com.zhf.service.BlogTypeService;
import com.zhf.util.ResponseUtil;
import net.sf.json.JSONObject;
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
@RequestMapping("/admin/blogType")
public class BlogTypeAdminController {

    @Autowired
    private BlogTypeService blogTypeService;

    /**
     * 查询所有博客类别
     * @param page
     * @param limit
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String blogTypeList(@RequestParam(value = "page",required = false)String page, @RequestParam(value = "limit",required = false)String limit, HttpServletResponse response)throws Exception{
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(limit));
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("start",pageBean.getStart());
        map.put("size",pageBean.getPageSize());
        List<BlogType> blogTypeList = blogTypeService.blogTypeList(map);
        JSONObject result = new JSONObject();
        result.put("code", 0);
        result.put("count", blogTypeList.size());
        result.put("data",blogTypeList);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 添加或修改博客类别
     * @param blogType
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/save")
    public String save(BlogType blogType,HttpServletResponse response)throws Exception{
        int resultTotal = 0;
        if(blogType.getId()==null){
            resultTotal = blogTypeService.add(blogType);
        }else{
            resultTotal = blogTypeService.update(blogType);
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
     * 删除博客类别
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam(value = "ids",required = false)String ids,HttpServletResponse response)throws Exception{
        String[] idsStr = ids.split(",");
        for(int i=0;i<idsStr.length;i++){
            blogTypeService.delete(Integer.parseInt(idsStr[i]));
        }
        JSONObject result = new JSONObject();
        result.put("success",true);
        ResponseUtil.write(response,result);
        return null;
    }
}
