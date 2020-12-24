package com.zhf.dao;

import com.zhf.entity.Blog;

import java.util.List;
import java.util.Map;

/**
 * 博客实体
 */
public interface BlogDao {

    /**
     * 根据日期分月分组查询
     * @return
     */
    public List<Blog> countList();

    /**
     * 分页查询博客文章
     * @param map
     * @return
     */
    public List<Blog> list(Map<String,Object> map);

    /**
     * 获取博客文章的总记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String,Object> map);

    /**
     * 通过博客Id获取博客文章
     * @param id
     * @return
     */
    public Blog findById(Integer id);

    /**
     * 修改或更新博客
     * @param blog
     * @return
     */
    public Integer update(Blog blog);

    /**
     * 查找五条根据阅读量降序，前五条博客
     * @param map
     * @return
     */
    public List<Blog> fiveBlogList(Map<String,Object> map);

    /**
     * 查询上一篇博客文章
     * @param id
     * @return
     */
    public Blog upBlog(Integer id);

    /**
     * 查询下一篇博客文章
     * @param id
     * @return
     */
    public Blog downBlog(Integer id);

    /**
     * 添加博客
     * @param blog
     * @return
     */
    public Integer add(Blog blog);

    /**
     * 通过id删除博客
     * @param id
     * @return
     */
    public int delete(Integer id);

    /**
     * 更新博客信息
     * @param blog
     * @return
     */
    public Integer updateBlog(Blog blog);

    /**
     * 更新评论数量
     * @param blog
     * @return
     */
    public Integer updateReplyHit(Blog blog);

}
