package com.woohsi.bookfriend.dao;

import com.woohsi.bookfriend.po.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("adminrDao")
@Mapper
public interface AdminDao {

    public List<Admin> login(Admin admin);

}
