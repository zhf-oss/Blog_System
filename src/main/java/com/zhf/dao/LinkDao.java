package com.zhf.dao;

import com.zhf.entity.Link;

import java.util.List;
import java.util.Map;

/**
 * 友情链接实体
 */
public interface LinkDao {

    /**
     * 查询友情链接，前端
     * @param map
     * @return
     */
    public List<Link> list(Map<String,Object> map);

    /**
     * 查询友情链接，后端
     * @param map
     * @return
     */
    public List<Link> listLink(Map<String,Object> map);

    /**
     * 可扩展，实现分页功能
     * @param map
     * @return
     */
    public Long getTotal(Map<String,Object> map);

    /**
     * 添加友情链接
     * @param link
     * @return
     */
    public Integer add(Link link);

    /**
     * 删除友情链接
     * @param id
     * @return
     */
    public int delete(Integer id);

    /**
     * 修改友情链接
     * @param link
     * @return
     */
    public Integer update(Link link);

    /**
     * 通过Id寻找改友情链接
     * @param id
     * @return
     */
    public Link findById(Integer id);
}
