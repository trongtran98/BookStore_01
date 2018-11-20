package app.DAO.impl;

import app.DAO.AuthorDAO;
import app.DAO.GenericDAO;
import app.model.Author;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;

import java.util.List;

public class AuthorDAOImpl extends GenericDAO<Integer, Author> implements AuthorDAO {
    public AuthorDAOImpl() {
        super(Author.class);
    }


    public AuthorDAOImpl(SessionFactory sessionfactory) {
        setSessionFactory(sessionfactory);
    }

    @Override
    public Author findAuthorById(Integer id) {
        return (Author) getSession().createQuery("FROM Author WHERE Author.id = :id").setParameter("id", id).getSingleResult();
    }

    @Override
    public Author findAuthorById(Integer id, boolean lock) {
        if (lock == false)
            return (Author) getSession().createQuery("FROM Author WHERE id = :id").setParameter("id", id).getSingleResult();
        else
        {
            return getSession().load(Author.class, id, LockMode.PESSIMISTIC_WRITE);
        }
    }

    @Override
    public List<Author> findAuthors() {
        return getSession().createQuery("FROM Author").getResultList();
    }
}
