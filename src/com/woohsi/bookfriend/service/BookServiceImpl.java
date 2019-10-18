package com.woohsi.bookfriend.service;

import com.mysql.cj.protocol.x.Notice.XSessionStateChanged;
import com.mysql.cj.protocol.x.Notice.XSessionVariableChanged;
import com.woohsi.bookfriend.dao.BookDao;
import com.woohsi.bookfriend.po.Book;
import com.woohsi.bookfriend.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service("bookService")
public class BookServiceImpl implements BookService{
    @Autowired
    private BookDao bookDao;
    @Override
    public String saveBook(Book book) {
        if (bookDao.saveBook(book) > 0) {
            return "bookList";
        }
        return null;
    }


    @Override
    public String listBook(Model model, HttpSession session) {
       List<Book> books = bookDao.selectAllBooks((User) session.getAttribute("user"));
       model.addAttribute("books", books);
       return "bookList";
    }
}
