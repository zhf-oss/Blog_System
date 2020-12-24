package com.zhf.controller.admin;

import com.zhf.service.impl.InitComponent;
import com.zhf.util.ResponseUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContextEvent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/reload")
public class AdminController {

    @Autowired
    private InitComponent initComponent;

    /**
     * 刷新服务器缓存
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/data")
    public String reloadDate(HttpServletRequest request, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        initComponent.reloadData(request.getServletContext());
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 安全退出
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response)throws Exception{
        JSONObject result = new JSONObject();
        HttpSession session = request.getSession();
        session.invalidate();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
}
