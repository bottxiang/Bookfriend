package com.woohsi.bookfriend.service;

import com.mysql.cj.protocol.x.Notice.XSessionStateChanged;
import com.mysql.cj.protocol.x.Notice.XSessionVariableChanged;
import com.woohsi.bookfriend.dao.BookDao;
import com.woohsi.bookfriend.po.Book;
import com.woohsi.bookfriend.po.User;
import com.woohsi.bookfriend.util.MyUtil;
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
            return "redirect:/book/list";
        }
        return null;
    }

    @Override
    public String queryBook(Model model, Integer bkid) {
        Book book = bookDao.queryBook(bkid);
        model.addAttribute("book", book);
        return "bookDetail";
    }

    @Override
    public String updateBook(Book book) {
        if (bookDao.updateBook(book) > 0) {
            return "redirect:/book/list";
        }
        return null;
    }

    @Override
    public String deleteBook(Integer bkid) {
        if (bookDao.deleteBook(bkid) > 0) {
            return "redirect:/book/list";
        }
        return null;
    }

    @Override
    public String listAllBooks(Model model) {
       List<Book> books = bookDao.selectAllBooks();
       model.addAttribute("books", books);
       return "index";
    }

    @Override
    public String listMySell(Model model, HttpSession session) {
        List<Book> books = bookDao.selectBookByUid(MyUtil.getUserId(session));
        model.addAttribute("books", books);
        return "mySellBookList";
    }

    @Override
    public String searchBook(Model model, String keyword) {
        List<Book> books = bookDao.selectBookByKeyword(keyword);
        model.addAttribute("books", books);
        return "index";
    }
}
