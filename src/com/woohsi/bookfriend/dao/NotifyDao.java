package com.woohsi.bookfriend.dao;

import com.woohsi.bookfriend.po.Notify;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("notifyDao")
@Mapper
public interface NotifyDao {
    public int saveNotify(Notify notify);
    public List<Notify> selectNotifyByUid(Integer userId);
    public int deleteNotify(@Param("from")Integer from, @Param("to")Integer to);
    public int clearNotify(Integer uid);
}
