package com.woohsi.bookfriend.dao;

import com.woohsi.bookfriend.po.Message;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository("messageDao")
@Mapper
public interface MessageDao {
    public int saveMessage(Message message);
}
