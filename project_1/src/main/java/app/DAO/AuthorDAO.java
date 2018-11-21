package app.DAO;

import app.model.Author;

import java.util.List;

public interface AuthorDAO extends BaseDAO<Integer,Author>{
    List<Author> findAuthors();
    Author findAuthorById(Integer id,boolean lock);
}
