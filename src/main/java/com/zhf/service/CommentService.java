package com.zhf.service;

import com.zhf.entity.Comment;

import java.util.List;
import java.util.Map;

public interface CommentService {

    /**
     * 查询所有评论
     * @param map
     * @return
     */
    public List<Comment> list(Map<String,Object> map);

    /**
     * 查询所有评论，用于后端，按id降序
     * @param map
     * @return
     */
    public List<Comment> commentList(Map<String,Object> map);

    /**
     * 评论博客文章
     * @param comment
     * @return
     */
    public Integer add(Comment comment);

    /**
     * 删除评论
     * @param id
     * @return
     */
    public int delete(Integer id);

    /**
     * 审核评论：通过
     * @param id
     * @return
     */
    public int update(Integer id);

}
