package app.DAO.impl;

import app.DAO.BookDAO;
import app.DAO.GenericDAO;
import app.model.Book;
import app.model.Category;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaQuery;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import java.io.Serializable;
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

    @Override
    public List<Book> findByName(String bookName) {
        return getSession().createQuery("from Book b where LOWER(b.title) like :bookName")
                .setParameter("bookName", "%"+bookName.toLowerCase()+"%")
                .list();
    }


}
