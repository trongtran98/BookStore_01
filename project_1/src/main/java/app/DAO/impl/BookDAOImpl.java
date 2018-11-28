package app.DAO.impl;

import app.DAO.BookDAO;
import app.DAO.GenericDAO;
import app.model.Book;
import org.apache.log4j.Logger;
import org.hibernate.LockMode;
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

    @Override
    public List<Book> findByName(String bookName) {
        return getSession().createQuery("from Book b where LOWER(b.title) like :bookName")
                .setParameter("bookName", "%" + bookName.toLowerCase() + "%")
                .list();
    }

    public List<Book> findBooks() {
        return getSession().createQuery("FROM Book ").getResultList();
    }

    @Override
    public Book findBookById(Integer id, boolean lock) {
        if (lock == false)
            return (Book) getSession().createQuery("FROM Book WHERE id = :id").setParameter("id", id).getSingleResult();

        return getSession().load(Book.class, id, LockMode.PESSIMISTIC_WRITE);
    }
}
