package com.woohsi.bookfriend.controller;

import com.google.gson.Gson;
import com.woohsi.bookfriend.dao.BookDao;
import com.woohsi.bookfriend.po.Book;
import com.woohsi.bookfriend.po.BookForm;
import com.woohsi.bookfriend.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;
    @Autowired
    private BookDao bookDao;

    @RequestMapping("/save")
    public String saveBook(@ModelAttribute BookForm bookForm, HttpServletRequest request) {
        return bookService.saveBook(bookForm, request);
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
    public String listAllBooks(Model model) {
        return bookService.listAllBooks(model);
    }
    @RequestMapping("/list-mysell")
    public String listMySell(Model model, HttpSession session) {
        return bookService.listMySell(model, session);
    }
    @RequestMapping("/search")
    public String search(Model model, String keyword) {
        return bookService.searchBook(model, keyword);
    }
    @RequestMapping("/edit")
    public void edit(HttpServletResponse response, Integer bkid) throws IOException {
        response.setContentType("application/json; charset=utf-8");
        Book book = bookDao.queryBook(bkid);
        String json = new Gson().toJson(book);
        System.out.println(json);
        response.getWriter().write(json);
    }
    @RequestMapping("/update")
    public String updateBook(Book book) {
        return bookService.updateBook(book);
    }
}
