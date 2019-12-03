package com.woohsi.bookfriend.dao;

import com.woohsi.bookfriend.po.Message;
import org.apache.commons.fileupload.util.LimitedInputStream;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("messageDao")
@Mapper
public interface MessageDao {
    public int saveMessage(Message message);
    public List<Message> selectMessageByUid(Integer uid);
    public int deleteMessageByUid(Integer from, Integer to);
}
