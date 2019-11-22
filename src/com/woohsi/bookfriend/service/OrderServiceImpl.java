package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.dao.BookDao;
import com.woohsi.bookfriend.dao.OrderDao;
import com.woohsi.bookfriend.po.Book;
import com.woohsi.bookfriend.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private BookDao bookDao;
    @Override
    public String saveOrder(Model model, HttpSession session, Integer bkid, Integer suid) {
        //添加订单
        Map<String, Object> map = new HashMap<>();
        map.put("bkid", bkid);
        map.put("suid", suid);
        map.put("buid", MyUtil.getUserId(session));
        orderDao.saveOrder(map);
        //更新书籍状态为“已出售”
        Book book = bookDao.queryBook(bkid);
        book.setStatus(1);
        bookDao.updateBook(book);
        return "redirect:/order/list-buy";
    }

    @Override
    public String listSellOrders(Model model, HttpSession session) {
        List<Map<String, Object>> orders = orderDao.selectAllSellOrders(MyUtil.getUserId(session));
        model.addAttribute("orders", orders);
        return "sellOrderList";
    }

    @Override
    public String listBuyOrders(Model model, HttpSession session) {
        List<Map<String, Object>> orders = orderDao.selectAllBuyOrders(MyUtil.getUserId(session));
        model.addAttribute("orders", orders);
        return "buyOrderList";
    }

    @Override
    public String cancelOrder(Model model, HttpSession session, Integer oid, Integer bkid, String who) {
        orderDao.deleteOrder(oid);
        //更新书籍状态为“未出售”
        Book book = bookDao.queryBook(bkid);
        book.setStatus(0);
        bookDao.updateBook(book);
        if (who.equals("buyer")) {
            return listBuyOrders(model,session);
        }
        if (who.equals("seller")) {
            return listSellOrders(model,session);
        }
        return null;
    }

}
