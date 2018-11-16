package app.DAO;

import app.model.CategoryDetail;

import java.util.List;

public interface CategoryDetailDAO  extends BaseDAO<Integer, CategoryDetail>  {
    List<CategoryDetail> loadFeatureCateDetails(int categoryId);
}
