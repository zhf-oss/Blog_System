package com.zhf.controller;

import com.zhf.entity.Click;
import com.zhf.entity.Message;
import com.zhf.entity.PageBean;
import com.zhf.service.ClickService;
import com.zhf.service.MessageService;
import com.zhf.util.PageUtil;
import com.zhf.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private ClickService clickService;

    /**
     * 留言板
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "page",required = false)String page, Message s_message, HttpServletRequest request)throws Exception{
        ModelAndView mav = new ModelAndView();
        if(StringUtil.isEmpty(page)){
            page = "1";
        }
        /** pageSize为每一页的大小. */
        PageBean pageBean = new PageBean(Integer.parseInt(page),6);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("start",pageBean.getStart());
        map.put("size",pageBean.getPageSize());
        /** 如果commentName不为空，则添加评论. */
        if(StringUtil.isNotEmpty(s_message.getCommentName())){
            messageService.add(s_message);
            mav.addObject("success3", "1");
        }
        /** 获取总评论数. */
        Long getTotal = messageService.getTotal(map);
        Click click = new Click();
        /** 获取数据库里的访问量，用于留言板的显示. */
        Click getClick = clickService.getClick(map);
        mav.addObject("getClick",getClick);
        /** 访问量+1. */
        click.setClick(getClick.getClick()+1);
        /** 更新访问量. */
        clickService.update(click);
        /** 所有留言. */
        List<Message> messageList = messageService.list(map);
        /** 评论时间. */
        List<String> messageTimeList = new ArrayList<String>();
        int i = 0;
        for(Message m:messageList){
            messageTimeList.add(i++,m.getDate());
        }
        /** 评论分页. */
        mav.addObject("commentPageCode", PageUtil.genPagination(request.getContextPath()+"/message/list.html",getTotal,Integer.parseInt(page),6,null));
        mav.addObject("messageTimeList",messageTimeList);
        mav.addObject("getTotal",getTotal);
        mav.addObject("messageList",messageList);
        mav.addObject("pageComment","foreground/board/commentbox.jsp");
        mav.addObject("mainPage","foreground/board/message.jsp");
        mav.setViewName("mainTemp");
        return mav;
    }

}
