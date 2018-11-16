package app.DAO.impl;

import app.DAO.BookDAO;
import app.DAO.GenericDAO;
import app.model.Book;
import app.model.Category;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;

import java.util.List;

public class BookDAOImpl extends GenericDAO<Integer, Book> implements BookDAO {
    private static final Logger logger = Logger.getLogger(BookDAOImpl.class);

    public BookDAOImpl() {
        super(Book.class);
    }

    public BookDAOImpl(SessionFactory sessionfactory) {
        setSessionFactory(sessionfactory);
    }

    @Override
    public List<Book> loadBooksTypeNew(int number) {
        return getSession().createQuery("from Book b order by id desc").setMaxResults(number)
                .getResultList();
    }
}
