package com.zhf.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhf.entity.Blogger;
import com.zhf.util.CryptographyUtil;
import com.zhf.util.ResponseUtil;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhf.service.BloggerService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * 管理员博主Controller层
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin/blogger")
public class BloggerAdminController {

	@Resource
	private BloggerService bloggerService;

	/**
	 * 修改密码
	 * @param blogger
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/modifyPassword")
	public String modifyPassword(Blogger blogger, @RequestParam(value = "oldPassword", required = false) String oldPassword, HttpServletResponse response,HttpServletRequest request) throws Exception {
		/** 获取当前用户的信息. */
		HttpSession session = request.getSession();
		Blogger currentUser = (Blogger) session.getAttribute("currentUser");
		/** 操作的记录条数. */
		int resultTotal = 0;
		/** 原始密码. */
		String oldUserPassword = CryptographyUtil.md5(oldPassword, "zhf");
		if (currentUser.getPassword().equals(oldUserPassword)) {
			currentUser.setPassword(CryptographyUtil.md5(blogger.getPassword(), "zhf"));
			/** 更新密码. */
			bloggerService.update(currentUser);
			resultTotal = 1;
		}else{
			resultTotal = 0;
		}
		JSONObject result = new JSONObject();
		if (resultTotal > 0) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 安全退出
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/adminLogin.jsp");
		return mav;
	}

}
