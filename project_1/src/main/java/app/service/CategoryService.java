package app.service;

import app.model.Category;

import java.util.List;

public interface CategoryService  extends BaseService<Integer, Category>  {
    List<Category> findAll();
}
