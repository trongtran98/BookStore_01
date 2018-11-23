package app.DAO;

import app.DAO.BaseDAO;
import app.model.Book;

import java.io.Serializable;
import java.util.List;

public interface BookDAO extends BaseDAO<Integer, Book> {
    List<Book> loadBooksTypeNew(int number);

    List<Book> findByName(String bookName);
}
