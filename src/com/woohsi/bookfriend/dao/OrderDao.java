package com.woohsi.bookfriend.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("orderDao")
@Mapper
public interface OrderDao {
    public int saveOrder(Map<String, Object> map);
    public List<Map<String, Object>> selectAllSellOrders(Integer suid);
    public List<Map<String, Object>> selectAllBuyOrders(Integer buid);
    public int deleteOrder(Integer oid);
}
