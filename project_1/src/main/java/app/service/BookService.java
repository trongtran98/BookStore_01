package app.service;

import app.model.Book;

import java.util.List;

public interface BookService extends BaseService<Integer, Book> {
    List<Book> loadBooksTypeNew(int number);

    List<Book> findByName(String bookName);
}
