package app.DAO.impl;

import app.DAO.BookDAO;
import app.DAO.GenericDAO;
import app.model.Book;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

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
    public List<Book> findByName(String bookName, Integer page, Integer bookPerPage) {
        return getSession().createQuery("from Book b where LOWER(b.title) like :bookName")
                .setParameter("bookName", "%" + bookName.toLowerCase() + "%")
                .setFirstResult((page-1) * bookPerPage )
                .setMaxResults(bookPerPage)
                .list();
    }

    public List<Book> findBooks() {
        return getSession().createQuery("FROM Book").getResultList();
    }


    @Override
    public List<Book> bestSaleOfTheDay(int maxResult) {
        return getSession().createQuery("SELECT b FROM Book b JOIN b.orderDetails oD JOIN oD.order o WHERE DATE(o.orderDate) = DATE(CURRENT_DATE) ORDER BY oD.amount DESC", Book.class).setMaxResults(maxResult).getResultList();

    }

    @Override
    public List<Book> getPanel(int maxResult) {
        return getSession().createQuery("FROM Book b WHERE b.categoryDetail.id = 8").setMaxResults(maxResult).getResultList();
    }

    @Override
    public List<Book> randomBooks(int maxResult) {
        Criteria criteria = getSession().createCriteria(Book.class);
        criteria.add(Restrictions.sqlRestriction("1=1 order by rand()"));
        criteria.setMaxResults(maxResult);
        return criteria.list();
    }

    @Override
    public Book findBookById(Integer id, boolean lock) {
        if (lock == false)
            return (Book) getSession().createQuery("FROM Book WHERE id = :id").setParameter("id", id).getSingleResult();

        return getSession().load(Book.class, id, LockMode.PESSIMISTIC_WRITE);
    }

    @Override
    public Long countByName(String bookName) {
        return (Long) getSession().createQuery("select count(*) from Book b where LOWER(b.title) like :bookName")
                .setParameter("bookName", "%" + bookName.toLowerCase() + "%")
                .uniqueResult();
    }
}
