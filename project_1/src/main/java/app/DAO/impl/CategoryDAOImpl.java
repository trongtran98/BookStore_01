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
    public Long sumProductThemCategory(String category) {
        return getSession().createQuery("SELECT COUNT(cB.id) FROM Category c " +
                "JOIN c.categoryDetails cC " +
                "JOIN cC.books cB " +
                "WHERE c.categoryName = :category",Long.class)
                .setParameter("category",category)
                .uniqueResult();
    }

    @Override
    public List<Category> findAll() {
        return getSession().createQuery("select DISTINCT c from Category c inner join fetch c.categoryDetails cd ").list();
    }


}
