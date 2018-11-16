package app.service.impl;

import app.model.Book;
import app.service.BookService;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

public class BookServiceImpl extends BaseServiceImpl implements BookService {
    @Override
    public List<Book> loadBooksTypeNew(int number) {
        try{
            return bookDAO.loadBooksTypeNew(number);
        }catch (Exception e){
            return Collections.emptyList();
        }
    }

    @Override
    public List<Book> findByName(String bookName) {
        return bookDAO.findByName(bookName);
    }

    @Override
    public Book findById(Serializable key) {
        return bookDAO.findById(key);
    }

    @Override
    public Book saveOrUpdate(Book entity) {
        return null;
    }

    @Override
    public boolean delete(Book entity) {
        return false;
    }
}
