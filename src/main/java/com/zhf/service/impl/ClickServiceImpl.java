package com.zhf.service.impl;

import com.zhf.dao.ClickDao;
import com.zhf.entity.Click;
import com.zhf.service.ClickService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service("clickService")
public class ClickServiceImpl implements ClickService {

    @Resource
    private ClickDao clickDao;

    @Override
    public Click getClick(Map<String, Object> map) {
        return clickDao.getClick(map);
    }

    @Override
    public Integer update(Click click) {
        return clickDao.update(click);
    }
}
