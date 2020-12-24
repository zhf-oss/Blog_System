package com.zhf.service.impl;

import com.zhf.dao.MessageDao;
import com.zhf.entity.Message;
import com.zhf.service.MessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("messageService")
public class MessageServiceImpl implements MessageService {

    @Resource
    private MessageDao messageDao;

    @Override
    public List<Message> list(Map<String, Object> map) {
        return messageDao.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return messageDao.getTotal(map);
    }

    @Override
    public Integer add(Message message) {
        return messageDao.add(message);
    }

    @Override
    public int delete(Integer id) {
        return messageDao.delete(id);
    }

    @Override
    public int update(Integer id) {
        return messageDao.update(id);
    }

    @Override
    public List<Message> listThreeComment() {
        return messageDao.listThreeComment();
    }
}
