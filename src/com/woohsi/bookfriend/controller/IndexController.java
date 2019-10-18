package com.woohsi.bookfriend.controller;

import com.woohsi.bookfriend.po.Book;
import com.woohsi.bookfriend.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    @Autowired
    private IndexService indexService;

    @RequestMapping("/toRegister")
    public String toRegister(Model model) {
        return indexService.toRegister(model);
    }
    @RequestMapping("/toLogin")
    public String toLogin(Model model) {
        return indexService.toLogin(model);
    }
    @RequestMapping("/toAddBook")
    public String toAddBook(Model model) {
        model.addAttribute("book", new Book());
        return "addBook";
    }

}
