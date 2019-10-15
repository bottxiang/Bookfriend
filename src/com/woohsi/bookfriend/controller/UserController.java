package com.woohsi.bookfriend.controller;

import com.woohsi.bookfriend.po.MyUser;
import com.woohsi.bookfriend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userDao;
    @RequestMapping("/select")
    public String select(MyUser user, Model model) {
        List<MyUser> list = userDao.selectUserByUname(user);
        model.addAttribute("userList", list);
        return "userList";
    }
}
