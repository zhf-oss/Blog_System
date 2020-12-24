package com.zhf.controller;

import com.zhf.entity.Blogger;
import com.zhf.entity.Message;
import com.zhf.service.BloggerService;
import com.zhf.service.MessageService;
import com.zhf.util.CryptographyUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/blogger")
public class BloggerController {

    @Autowired
    private BloggerService bloggerService;

    @Autowired
    private MessageService messageService;

    /**
     * 用户登录验证
     * @param blogger
     * @param request
     * @return
     */
    @RequestMapping("/login")
    public String login(Blogger blogger, HttpServletRequest request){
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(blogger.getUserName(), CryptographyUtil.md5(blogger.getPassword(),"zhf"));
        try{
            /** 登录验证. */
            subject.login(token);
            /** 获取博主信息. */
            Blogger currentUser = bloggerService.getByUserName(blogger.getUserName());
            /** 获取所有留言. */
            List<Message> allMessageList = messageService.list(null);
            /** 按日期降序排序，取前三条留言. */
            List<Message> messageList = messageService.listThreeComment();
            /** 获取留言总记录数. */
            Long getTotal = messageService.getTotal(null);
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", currentUser);
            session.setAttribute("allMessageList",allMessageList);
            session.setAttribute("MessageTopThree",messageList);
            session.setAttribute("getTotalMessage",getTotal);
            return "redirect:/admin/main.jsp";
        }catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("blogger",blogger);
            session.setAttribute("errorInfo", "1");
            return "redirect:/adminLogin.jsp";
        }
    }

    /**
     * 关于博主
     * @return
     * @throws Exception
     */
    @RequestMapping("/aboutMe")
    public ModelAndView aboutMe()throws Exception{
        ModelAndView mav=new ModelAndView();
        mav.addObject("pageTitle", "关于博主");
        mav.addObject("pageComment","foreground/common/z.jsp");
        mav.addObject("mainPage", "foreground/blogger/info.jsp");
        mav.setViewName("mainTemp");
        return mav;
    }

}
