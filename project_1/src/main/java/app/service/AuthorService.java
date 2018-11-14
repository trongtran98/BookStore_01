package app.service;

import app.model.Author;

import java.util.List;

public interface AuthorService extends BaseService<Integer, Author> {
    List<Author> findAuthors();
    boolean deleteAuthor(Integer id);
}
