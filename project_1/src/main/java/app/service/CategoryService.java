package app.service;

import app.model.Category;

import java.util.List;
import java.util.Map;

public interface CategoryService  extends BaseService<Integer, Category>  {
    List<Category> findAll();
    Map<String, Long> totalProductOfEachCategory();
}
