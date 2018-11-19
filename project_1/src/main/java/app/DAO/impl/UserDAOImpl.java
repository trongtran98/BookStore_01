package app.DAO.impl;

import app.DAO.GenericDAO;
import app.DAO.UserDAO;
import app.model.Address;
import app.model.Author;
import app.model.User;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;

public class UserDAOImpl extends GenericDAO<Integer, User> implements UserDAO {
    private static final Logger logger = Logger.getLogger(UserDAOImpl.class);

    public UserDAOImpl() {
        super(User.class);
    }

    public UserDAOImpl(SessionFactory sessionfactory) {
        setSessionFactory(sessionfactory);
    }

    @Override
    public User findUserByEmail(String email) {
        logger.info("email: " + email);
        User user = (User) getSession().createQuery("from User u where u.email = :email")
                .setParameter("email", email)
                .getSingleResult();
        return user;
    }

}
