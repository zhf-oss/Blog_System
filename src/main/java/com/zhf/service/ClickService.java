package com.zhf.service;

import com.zhf.entity.Click;

import java.util.Map;

public interface ClickService {

    /**
     * 获取访问量
     * @return
     */
    public Click getClick(Map<String,Object> map);

    /**
     *
     * @return
     */
    public Integer update(Click click);
}
