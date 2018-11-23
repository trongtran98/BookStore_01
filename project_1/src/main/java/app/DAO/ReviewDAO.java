package app.DAO;

import app.model.Review;

import java.util.List;

public interface ReviewDAO  extends BaseDAO<Integer, Review>  {
    List<Review> findByBookId(Integer id);
}
