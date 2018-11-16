package app.service.impl;

import app.model.CategoryDetail;
import app.service.CategoryDetailService;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

public class CategoryDetailServiceImpl extends BaseServiceImpl implements CategoryDetailService {
    @Override
    public CategoryDetail findById(Serializable key) {
        try {
            CategoryDetail result = categoryDetailDAO.findById(key);
            result.getBooks().removeAll(Collections.singleton(null));
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public CategoryDetail saveOrUpdate(CategoryDetail entity) {
        return null;
    }

    @Override
    public boolean delete(CategoryDetail entity) {
        return false;
    }

    @Override
    public List<CategoryDetail> loadFeatureCateDetails(int categoryId) {
        try {
            return categoryDetailDAO.loadFeatureCateDetails(categoryId);
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }
}
