package app.service.impl;

import app.model.Category;
import app.service.CategoryService;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

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
    public boolean delete(Category entity) {
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
}
