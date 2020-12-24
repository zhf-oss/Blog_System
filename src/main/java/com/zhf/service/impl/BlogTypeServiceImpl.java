package com.zhf.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhf.dao.BlogTypeDao;
import com.zhf.entity.BlogType;
import com.zhf.service.BlogTypeService;

/**
 * 博客类型Service实现类
 * @author Administrator
 *
 */
@Service("blogTypeService")
public class BlogTypeServiceImpl implements BlogTypeService{

	@Resource
	private BlogTypeDao blogTypeDao;

	@Override
	public List<BlogType> list(Map<String, Object> map) {
		return blogTypeDao.list(map);
	}

	@Override
	public List<BlogType> blogTypeList(Map<String, Object> map) {
		return blogTypeDao.blogTypeList(map);
	}

	public List<BlogType> countList() {
		return blogTypeDao.countList();
	}

	@Override
	public int update(BlogType blogType) {
		return blogTypeDao.update(blogType);
	}

	@Override
	public int delete(Integer id) {
		return blogTypeDao.delete(id);
	}

	@Override
	public int add(BlogType blogType) {
		return blogTypeDao.add(blogType);
	}

	@Override
	public BlogType findById(Integer id) {
		return blogTypeDao.findById(id);
	}


}
