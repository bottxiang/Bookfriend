package com.woohsi.bookfriend.dao;

import com.woohsi.bookfriend.po.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("userDao")
@Mapper
public interface UserDao {
   public int register(User user);
   public List<User> login(User user);
   public User selectUserByEmail(String email);

   public User selectUserByCode(String code);

   public int updateUser(User user);
}
