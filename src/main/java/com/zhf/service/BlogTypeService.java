package com.zhf.service;

import java.util.List;
import java.util.Map;

import com.zhf.entity.BlogType;

/**
 * 博客类型Service接口
 * @author Administrator
 *
 */
public interface BlogTypeService {

	/**
	 * 查询所有博客类型
	 * @param map
	 * @return
	 */
	public List<BlogType> list(Map<String,Object> map);

	/**
	 * 查询所有博客类型，后端
	 * @param map
	 * @return
	 */
	public List<BlogType> blogTypeList(Map<String,Object> map);

	/**
	 * 查询所有博客类型，以及对应的博客数量
	 * @return
	 */
	public List<BlogType> countList();

	/**
	 * 修改博客类别
	 * @param blogType
	 * @return
	 */
	public int update(BlogType blogType);

	/**
	 * 删除博客类别
	 * @param id
	 * @return
	 */
	public int delete(Integer id);

	/**
	 * 添加博客类别
	 * @param blogType
	 * @return
	 */
	public int add(BlogType blogType);

	/**
	 * 通过id查找博客类型实体
	 * @param id
	 * @return
	 */
	public BlogType findById(Integer id);
}
