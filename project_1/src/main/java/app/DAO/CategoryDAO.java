package app.DAO;

import app.model.Category;
import app.model.User;

import java.util.List;

public interface CategoryDAO extends BaseDAO<Integer, Category>  {
    List<Category> findAll();

    Long sumProductThemCategory(String category);
}
