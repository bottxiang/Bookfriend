package com.woohsi.bookfriend.controller;

import com.woohsi.bookfriend.po.Book;
import com.woohsi.bookfriend.po.User;
import com.woohsi.bookfriend.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
    @Autowired
    private IndexService indexService;

    @RequestMapping("/toRegister")
    public String toRegister(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }
    @RequestMapping("/toLogin")
    public String toLogin(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }
    @RequestMapping("/toAddBook")
    public String toAddBook(Model model) {
        model.addAttribute("book", new Book());
        return "addBook";
    }
    @RequestMapping("/toFindPwd")
    public String toFindPwd(Model model) {
        return "sendEmail";
    }
    @RequestMapping("/index")
    public String index(Model model) {
        return "forward:/book/list";
    }
    @RequestMapping("/test")
    public String test(Model model) {
        return "test";
    }


}
