package app.service.impl;

import app.model.Category;
import app.service.CategoryService;

import java.io.Serializable;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class CategoryServiceImpl extends BaseServiceImpl implements CategoryService {
    @Override
    public Category findById(Serializable key) {
        return null;
    }

    @Override
    public Category saveOrUpdate(Category entity) {
        return null;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }


    @Override
    public List<Category> findAll() {
        try {
            return categoryDAO.findAll();
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    @Override
    public Map<String, Long> totalProductOfEachCategory() {
        try {
            List<Category> categories = categoryDAO.findAll();
            if (categories == null)
                return Collections.emptyMap();

            Map<String, Long> map = new LinkedHashMap<>();
            for (Category category : categories) {
                if ("panel".equalsIgnoreCase(category.getCategoryName()))
                    continue;

                map.put(category.getCategoryName(),
                        categoryDAO.sumProductThemCategory(category.getCategoryName()) == null ?
                                0l : categoryDAO.sumProductThemCategory(category.getCategoryName()));
            }
            return map;

        } catch (Exception e) {
            return Collections.emptyMap();
        }
    }
}
