package app.service.impl;

import app.model.Book;
import app.service.BookService;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

public class BookServiceImpl extends BaseServiceImpl implements BookService {
    @Override
    public List<Book> loadBooksTypeNew(int number) {
        try {
            return bookDAO.loadBooksTypeNew(number);
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    @Override
    public List<Book> findByName(String bookName) {
        try {
            return bookDAO.findByName(bookName);
        } catch (Exception e) {
            return Collections.emptyList();
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

    @Override
    public Book saveOrUpdate(Book entity) {
        return null;
    }

    @Override
    public boolean delete(Book entity) {
        return false;
    }
}
