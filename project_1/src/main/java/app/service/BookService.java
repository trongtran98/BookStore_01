package app.service;

import app.bean.BookInfo;
import app.model.Book;

import java.util.List;

public interface BookService extends BaseService<Integer, Book> {
    List<BookInfo> loadBooksTypeNew(int number);
    List<BookInfo> findByName(String bookName, Integer page, Integer bookPerPage);
    List<BookInfo> findBooks();
    Integer countByName(String bookName);
}
