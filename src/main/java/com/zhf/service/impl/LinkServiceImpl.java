package com.zhf.service.impl;

import com.zhf.dao.LinkDao;
import com.zhf.entity.Link;
import com.zhf.service.LinkService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("linkService")
public class LinkServiceImpl implements LinkService {

    @Resource
    private LinkDao linkDao;

    @Override
    public List<Link> list(Map<String, Object> map) {
        return linkDao.list(map);
    }

    @Override
    public List<Link> listLink(Map<String, Object> map) {
        return linkDao.listLink(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return linkDao.getTotal(map);
    }

    @Override
    public Integer add(Link link) {
        return linkDao.add(link);
    }

    @Override
    public int delete(Integer id) {
        return linkDao.delete(id);
    }

    @Override
    public Integer update(Link link) {
        return linkDao.update(link);
    }

    @Override
    public Link findById(Integer id) {
        return linkDao.findById(id);
    }
}
