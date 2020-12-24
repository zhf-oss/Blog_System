package com.zhf.dao;

import com.zhf.entity.Click;

import java.util.Map;

public interface ClickDao {

    /**
     * 获取访问量
     * @return
     */
    public Click getClick(Map<String,Object> map);

    /**
     * 修改访问量
     * @return
     */
    public Integer update(Click click);
}
