package com.woohsi.bookfriend.service;

import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface OrderService {

    public String saveOrder(Model model, HttpSession session, Integer bkid, Integer suid);
    public String listSellOrders(Model model, HttpSession session);
    public String listBuyOrders(Model model, HttpSession session);
    public String cancelOrder(Model model, HttpSession session, Integer oid, Integer bkid, String who);
}
