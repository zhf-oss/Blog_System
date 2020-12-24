package com.zhf.service.impl;

import com.zhf.dao.BloggerDao;
import com.zhf.entity.Blogger;
import com.zhf.service.BloggerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService {

    @Resource
    private BloggerDao bloggerDao;

    @Override
    public Blogger getByUserName(String userName) {
        return bloggerDao.getByUserName(userName);
    }

    @Override
    public Blogger findMessage() {
        return bloggerDao.findMessage();
    }

    @Override
    public int modifyPassword(Blogger blogger) {
        return bloggerDao.modifyPassword(blogger);
    }

    @Override
    public int update(Blogger blogger) {
        return bloggerDao.update(blogger);
    }
}
