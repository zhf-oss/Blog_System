package com.zhf.service.impl;

import com.zhf.dao.BlogDao;
import com.zhf.entity.Blog;
import com.zhf.service.BlogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("blogService")
public class BlogServiceImpl implements BlogService {

    @Resource
    private BlogDao blogDao;

    @Override
    public List<Blog> countList() {
        return blogDao.countList();
    }

    @Override
    public List<Blog> list(Map<String, Object> map) {
        return blogDao.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return blogDao.getTotal(map);
    }

    @Override
    public Blog findById(Integer id) {
        return blogDao.findById(id);
    }

    @Override
    public Integer update(Blog blog) {
        return blogDao.update(blog);
    }

    @Override
    public List<Blog> fiveBlogList(Map<String, Object> map) {
        return blogDao.fiveBlogList(map);
    }

    @Override
    public Integer updateBlog(Blog blog) {
        return blogDao.updateBlog(blog);
    }

    @Override
    public Blog upBlog(Integer id) {
        return blogDao.upBlog(id);
    }

    @Override
    public Blog downBlog(Integer id) {
        return blogDao.downBlog(id);
    }

    @Override
    public Integer add(Blog blog) {
        return blogDao.add(blog);
    }

    @Override
    public int delete(Integer id) {
        return blogDao.delete(id);
    }

    @Override
    public Integer updateReplyHit(Blog blog) {
        return blogDao.updateReplyHit(blog);
    }

}
