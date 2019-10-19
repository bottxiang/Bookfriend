package com.woohsi.bookfriend.controller;

import com.woohsi.bookfriend.po.Book;
import com.woohsi.bookfriend.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @RequestMapping("/save")
    public String saveBook(@ModelAttribute Book book) {
        return bookService.saveBook(book);
    }
    @RequestMapping("/query")
    public String queryBook(Model model, Integer bkid) {
        return bookService.queryBook(model, bkid);
    }
    @RequestMapping("/delete")
    public String saveBook(@RequestParam Integer bkid) {
        return bookService.deleteBook(bkid);
    }
    @RequestMapping("/list")
    public String listBook(Model model, HttpSession session) {
        return bookService.listBook(model, session);
    }

}
