package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.po.Book;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface BookService {
    public String saveBook(Book book);

    public String listBook(Model model, HttpSession session);
}
