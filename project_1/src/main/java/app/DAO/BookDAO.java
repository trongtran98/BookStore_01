package app.DAO;

import app.model.Book;

import java.util.List;

public interface BookDAO extends BaseDAO<Integer, Book> {
    List<Book> loadBooksTypeNew(int number);

    List<Book> findByName(String bookName);

    List<Book> findBooks();

    Book findBookById(Integer id, boolean lock);
}
