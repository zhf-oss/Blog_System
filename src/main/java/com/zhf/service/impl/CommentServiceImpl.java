package com.zhf.service.impl;

import com.zhf.dao.CommentDao;
import com.zhf.entity.Comment;
import com.zhf.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentDao commentDao;

    @Override
    public List<Comment> list(Map<String, Object> map) {
        return commentDao.list(map);
    }

    @Override
    public List<Comment> commentList(Map<String, Object> map) {
        return commentDao.commentList(map);
    }

    @Override
    public Integer add(Comment comment) {
        return commentDao.add(comment);
    }

    @Override
    public int delete(Integer id) {
        return commentDao.delete(id);
    }

    @Override
    public int update(Integer id) {
        return commentDao.update(id);
    }

}
