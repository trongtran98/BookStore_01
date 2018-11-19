package app.DAO.impl;

import app.DAO.CategoryDetailDAO;
import app.DAO.GenericDAO;
import app.model.CategoryDetail;

import javax.persistence.NoResultException;
import java.util.List;

public class CategoryDetailDAOImpl extends GenericDAO<Integer, CategoryDetail> implements CategoryDetailDAO {
    @Override
    public List<CategoryDetail> loadFeatureCateDetails(int categoryId){
        return (List<CategoryDetail>) getSession().createQuery("from CategoryDetail cd where cd.category.id = :categoryId")
                .setParameter("categoryId", categoryId)
                .getResultList();
    }
}
