package app.DAO.impl;

import app.DAO.GenericDAO;
import app.DAO.ReviewDAO;
import app.model.Review;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;

import java.util.List;

public class ReviewDAOImpl  extends GenericDAO<Integer, Review> implements ReviewDAO {
    private static final Logger logger = Logger.getLogger(ReviewDAOImpl.class);

    public ReviewDAOImpl() {
        super(Review.class);
    }

    public ReviewDAOImpl(SessionFactory sessionfactory) {
        setSessionFactory(sessionfactory);
    }

    @Override
    public List<Review> findByBookId(Integer id) {
        return getSession().createQuery("select rv from Review rv join fetch rv.user where rv.book.id = :id")
                .setParameter("id", id)
                .list();
    }
}
