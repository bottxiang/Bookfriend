package com.woohsi.bookfriend.dao;

import com.woohsi.bookfriend.po.MyUser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("userDao")
@Mapper
public interface UserDao {
    public List<MyUser> selectUserByUname(MyUser user);
}
