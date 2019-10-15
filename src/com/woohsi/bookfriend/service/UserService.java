package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.po.MyUser;

import java.util.List;

public interface UserService {
    public List<MyUser> selectUserByUname(MyUser user);
}
