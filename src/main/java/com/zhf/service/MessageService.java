package com.zhf.service;

import com.zhf.entity.Message;

import java.util.List;
import java.util.Map;

public interface MessageService {

    /**
     * 查询所有评论
     * @param map
     * @return
     */
    public List<Message> list(Map<String,Object> map);

    /**
     * 获取总评论数
     * @param map
     * @return
     */
    public Long getTotal(Map<String,Object> map);

    /**
     * 添加留言
     * @param message
     * @return
     */
    public Integer add(Message message);

    /**
     * 删除评论
     * @param id
     * @return
     */
    public int delete(Integer id);

    /**
     * 审核留言：通过
     * @param id
     * @return
     */
    public int update(Integer id);

    /**
     * 按时间降序排序，获取前三条留言
     * @return
     */
    public List<Message> listThreeComment();
}
