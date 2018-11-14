package app.service;

import app.model.Category;
import app.model.CategoryDetail;

import java.util.List;

public interface CategoryDetailService  extends BaseService<Integer, CategoryDetail>   {
    List<CategoryDetail> loadFeatureCateDetails(int categoryId);
    List<CategoryDetail> findCategoryDetails();
}
