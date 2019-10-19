package com.woohsi.bookfriend.controller;

import com.woohsi.bookfriend.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("/save")
    public String saveOrder(Model model, HttpSession session, Integer bkid, Integer suid) {
        return orderService.saveOrder(model, session, bkid, suid);
    }
    @RequestMapping("/list-buy")
    public String listBuyOrders(Model model, HttpSession session) {
        return orderService.listBuyOrders(model, session);
    }
    @RequestMapping("/list-sell")
    public String listSellOrders(Model model, HttpSession session) {
        return orderService.listSellOrders(model, session);
    }
}
