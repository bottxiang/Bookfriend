package com.woohsi.bookfriend.dao;

import com.woohsi.bookfriend.po.Book;
import com.woohsi.bookfriend.po.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("bookDao")
@Mapper
public interface BookDao {
    public int saveBook(Book book);
    public Book queryBook(Integer bkid);
    public int updateBook(Book book);
    public int deleteBook(Integer bkid);
    List<Book> selectAllBooks();
    List<Book> selectBookByUid(Integer uid);

    List<Book> selectBookByKeyword(String keyword);
}
