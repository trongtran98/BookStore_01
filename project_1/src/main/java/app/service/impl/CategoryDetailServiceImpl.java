package app.service.impl;

import app.model.CategoryDetail;
import app.service.CategoryDetailService;
import app.utils.CloudinaryUtils;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

public class CategoryDetailServiceImpl extends BaseServiceImpl implements CategoryDetailService {
    @Override
    public CategoryDetail findById(Serializable key) {
        try {
            CategoryDetail result = categoryDetailDAO.findById(key);
            result.getBooks().removeAll(Collections.singleton(null));
            result.getBooks().forEach(book -> book.setAvatar(cloudinaryUtils.loadImageBook(book.getAvatar())));
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
    public boolean delete(Integer id) {
        return false;
    }

    @Override
    public List<CategoryDetail> findCategoryDetails() {
        return categoryDetailDAO.findCategoryDetails();
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
