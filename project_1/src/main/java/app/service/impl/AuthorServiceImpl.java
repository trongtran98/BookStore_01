package app.service.impl;

import app.model.Author;
import app.service.AuthorService;

import java.io.Serializable;
import java.util.List;

public class AuthorServiceImpl extends BaseServiceImpl implements AuthorService {
    @Override
    public List<Author> findAuthors() {
        return authorDAO.findAuthors();
    }

    @Override
    public Author findById(Serializable key) {
        return authorDAO.findById(key);
    }

    public Author findById(Integer key) {
        return authorDAO.findById(key);
    }

    @Override
    public Author saveOrUpdate(Author entity) {
        try {
            return authorDAO.saveOrUpdate(entity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean delete(Integer id) {
        try {
            Author author = authorDAO.findAuthorById(id,true);
            if ( author!= null){
                authorDAO.delete(author);
                return true;
            }
            return false;
        } catch (Exception e) {
            throw e;
        }
    }

}
