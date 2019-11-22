package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.dao.MessageDao;
import com.woohsi.bookfriend.po.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("messageService")
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageDao messageDao;
    @Override
    public void saveMessage(Message message) {
        messageDao.saveMessage(message);
        System.out.println("serviece:" + message);
    }
}
