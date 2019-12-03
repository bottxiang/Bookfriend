package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.dao.BookDao;
import com.woohsi.bookfriend.po.Book;
import com.woohsi.bookfriend.po.BookForm;
import com.woohsi.bookfriend.po.User;
import com.woohsi.bookfriend.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service("bookService")
public class BookServiceImpl implements BookService{
    @Autowired
    private BookDao bookDao;
    @Override
    public String saveBook(BookForm bookForm, HttpServletRequest request) {
        MultipartFile multipartFile = bookForm.getBkimg();
        String filename = multipartFile.getOriginalFilename();
        String newFilename = UUID.randomUUID() + filename.substring(filename.lastIndexOf("."));
        File imgFile = new File(request.getServletContext().getRealPath("/images"), newFilename);
        System.out.println(request.getServletContext().getRealPath("/images"));
        //File imgFile = new File("/home/xb/IdeaProjects/bookfriend/webapp/images", newFilename);
        try {
            multipartFile.transferTo(imgFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Book book = new Book();
        book.setBkid(bookForm.getBkid());
        book.setBkname(bookForm.getBkname());
        book.setBkprice(bookForm.getBkprice());
        book.setBkpress(bookForm.getBkpress());
        book.setBkdescription(bookForm.getBkdescription());
        book.setStatus(bookForm.getStatus());
        book.setUid(bookForm.getUid());
        book.setBkimg(newFilename);
        book.setOnsell(bookForm.getOnsell());
        System.out.println(book);
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
            return "redirect:/book/list-mysell";
        }
        return null;
    }

    @Override
    public String deleteBook(Integer bkid) {
        if (bookDao.deleteBook(bkid) > 0) {
            return "redirect:/book/list-mysell";
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
        List<Book> books = bookDao.selectOnSellBookByUid(MyUtil.getUserId(session));
        model.addAttribute("books", books);
        return "mySellBookList";
    }

    @Override
    public String searchBook(Model model, String keyword) {
        List<Book> books = bookDao.selectBookByKeyword(keyword);
        model.addAttribute("books", books);
        return "index";
    }

    @Override
    public String listMyAll(Model model, HttpSession session) {
        List<Book> books = bookDao.selectAllBookByUid(MyUtil.getUserId(session));
        model.addAttribute("books", books);
        return "myAllBookList";
    }

    @Override
    public String check(Model model) {
        List<Book> books = bookDao.selectBookForCheck();
        model.addAttribute("books", books);
        return "waitCheck";

    }

    @Override
    public String setOnSell(Integer bkid) {
        if (bookDao.setOnSell(bkid) > 0) {
            return "redirect:/book/check";
        }
        return null;
    }
}
