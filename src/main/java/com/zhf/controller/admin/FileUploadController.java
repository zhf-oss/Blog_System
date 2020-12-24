package com.zhf.controller.admin;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import com.zhf.entity.Blogger;
import com.zhf.entity.Link;
import com.zhf.service.BloggerService;
import com.zhf.service.LinkService;
import com.zhf.service.impl.InitComponent;
import com.zhf.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin")
public class FileUploadController {

    @Autowired
    private BloggerService bloggerService;

	@Autowired
	private InitComponent initComponent;

	@Autowired
	private LinkService linkService;

	/**
	 * 文件上传
	 * @param file1
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/upload")
	public String uploadFile(@RequestParam("file1") MultipartFile file1,@RequestParam(value = "id",required = false)String id,@RequestParam(value = "blogName",required = false)String blogName,@RequestParam(value = "bloggerMsg",required = false)String bloggerMsg,@RequestParam(value = "trueName",required = false)String trueName,@RequestParam(value = "sign",required = false)String sign, HttpServletRequest request)throws Exception{
		Blogger blogger = new Blogger();
		blogger.setId(Integer.parseInt(id));
		blogger.setUserName(trueName);
		blogger.setProfile(bloggerMsg);
		blogger.setNickName(blogName);
		blogger.setSign(sign);
		/** 获取application缓存里的值. */
		ServletContext application = request.getSession().getServletContext();
		Blogger blogger1 = (Blogger) application.getAttribute("personMsg");
		if (blogger.getImageName() == null) {
			/** 当上传头像为空时，使用原始图片. */
			blogger.setImageName(blogger1.getImageName());
			bloggerService.update(blogger);
			request.getSession().setAttribute("success1", "1");
		} else {
			blogger.setImageName(file1.getOriginalFilename());
			bloggerService.update(blogger);
			String filePath=request.getServletContext().getRealPath("/");
			// 上传路径
			file1.transferTo(new File(filePath+"static/images/"+file1.getOriginalFilename()));
			request.getSession().setAttribute("success1", "1");
		}
		initComponent.reloadData(request.getServletContext());
		return "redirect:/admin/blogger/blogData.jsp";
	}

	/**
	 * 修改关于博主模块的简历
	 * @param file2
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/bloggerUpload")
	public String bloggerUpload(@RequestParam("file2") MultipartFile file2,HttpServletRequest request)throws Exception {
		/** 获取application缓存里的值. */
		ServletContext application = request.getSession().getServletContext();
		Blogger blogger1 = (Blogger) application.getAttribute("personMsg");
		blogger1.setProfile(file2.getOriginalFilename());
		bloggerService.update(blogger1);
		/** 上传路径. */
		String filePath=request.getServletContext().getRealPath("/");
		file2.transferTo(new File(filePath+"static/images/"+file2.getOriginalFilename()));
		initComponent.reloadData(request.getServletContext());
		request.getSession().setAttribute("success2", "1");
		return "redirect:/admin/blogger/modifyBloggerInfo.jsp";
	}

	/**
	 * 添加或修改友情链接头像
	 * @param file
	 * @param linkId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkImageUpload")
	public Map<String,Object> linkImageUpload(MultipartFile file, @RequestParam(value = "linkId", required = false) String linkId, HttpServletRequest request) throws Exception {
		Map<String,Object> map=new HashMap<String,Object>();
		if (!file.isEmpty()) {
			/** 获取文件名. */
			String fileName=file.getOriginalFilename();
			/** 获取文件的后缀. */
			String suffixName=fileName.substring(fileName.lastIndexOf("."));
			/** 新文件名，唯一的图片名. */
			String newFileName= DateUtil.getCurrentDateStr()+suffixName;
			Link link = linkService.findById(Integer.parseInt(linkId));
			link.setLinkImage(newFileName);
			/** 更新链接头像. */
			linkService.update(link);
			/** 上传路径. */
			String filePath = request.getServletContext().getRealPath("/");
			file.transferTo(new File(filePath + "static/images/" + newFileName));
			map.put("code", 0);
			map.put("msg", "上传成功！");
			Map<String,Object> map2=new HashMap<String,Object>();
			map2.put("src", filePath +"static/images/"+file.getOriginalFilename());
			map2.put("title", file.getOriginalFilename());
			map.put("data", map2);
		}
		return map;
	}

}
