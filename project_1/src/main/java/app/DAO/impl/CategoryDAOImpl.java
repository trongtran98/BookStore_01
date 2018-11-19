package app.DAO.impl;

import app.DAO.CategoryDAO;
import app.DAO.GenericDAO;
import app.model.Category;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;

import javax.persistence.NoResultException;
import java.util.List;

public class CategoryDAOImpl extends GenericDAO<Integer, Category> implements CategoryDAO {
    private static final Logger logger = Logger.getLogger(CategoryDAOImpl.class);

    public CategoryDAOImpl() {
        super(Category.class);
    }

    public CategoryDAOImpl(SessionFactory sessionfactory) {
        setSessionFactory(sessionfactory);
    }

    @Override
    public List<Category> findAll() {
        return getSession().createQuery("from Category").getResultList();
    }


}
