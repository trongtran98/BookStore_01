package app.service.impl;


import app.bean.BookInfo;
import app.model.Book;
import app.service.BookService;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class BookServiceImpl extends BaseServiceImpl implements BookService {
    @Override
    public List<BookInfo> loadBooksTypeNew(int number) {
        try {
            List<Book> bookModels = bookDAO.loadBooksTypeNew(number);
            List<BookInfo> bookInfos = new ArrayList<>();
            for (Book book : bookModels){
                bookInfos.add(new BookInfo(book));
            }
            return bookInfos;
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    @Override

    public List<BookInfo> findByName(String bookName, Integer page, Integer bookPerPage) {
        try {
            List<Book> bookModels = bookDAO.findByName(bookName, page, bookPerPage);
            List<BookInfo> bookInfos = new ArrayList<>();
            for (Book book : bookModels){
                bookInfos.add(new BookInfo(book));
            }
            return bookInfos;
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    public List<BookInfo> findBooks() {
        List<Book> bookModels = bookDAO.findBooks();
        List<BookInfo> bookInfos = new ArrayList<>();
        for (Book book : bookModels){
            bookInfos.add(new BookInfo(book));
        }
        return bookInfos;
    }

    @Override
    public Integer countByName(String bookName) {
        try{
            return bookDAO.countByName(bookName).intValue();
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public Book findById(Serializable key) {
        try {
            return bookDAO.findById(key);
        } catch (Exception e) {
            return null;
        }
    }

    public Book findById(Integer key) {
        return bookDAO.findById(key);
    }

    @Override
    public Book saveOrUpdate(Book entity) {
        try {
            return bookDAO.saveOrUpdate(entity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean delete(Integer id) {
        try {
            Book book = bookDAO.findBookById(id, true);
            if (book == null)
                return false;

            bookDAO.delete(book);
            return true;
        } catch (Exception e) {
            throw e;
        }
    }
}
