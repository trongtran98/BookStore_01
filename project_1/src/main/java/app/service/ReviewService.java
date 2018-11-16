package app.service;

import app.model.Review;
import app.service.BaseService;

import java.util.List;

public interface ReviewService extends BaseService<Integer, Review> {
    List<Review> findByBookId(Integer id);
}
