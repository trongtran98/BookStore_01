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

    public List<Book> findBooks() {
        return bookDAO.findBooks();
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
