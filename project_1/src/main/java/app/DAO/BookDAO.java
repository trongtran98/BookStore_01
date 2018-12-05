package app.DAO;

import app.model.Book;

import java.util.List;

public interface BookDAO extends BaseDAO<Integer, Book> {
    List<Book> loadBooksTypeNew(int number);
    List<Book> findByName(String bookName, Integer page, Integer bookPerPage);
    List<Book> findBooks();
    Book findBookById(Integer id, boolean lock);
    Long countByName(String bookName);
}
