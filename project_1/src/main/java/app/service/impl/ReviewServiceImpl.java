package app.service.impl;

import app.model.Review;
import app.service.ReviewService;

import java.io.Serializable;
import java.util.List;

public class ReviewServiceImpl extends BaseServiceImpl implements ReviewService {
    @Override
    public Review findById(Serializable key) {
        return null;
    }

    @Override
    public Review saveOrUpdate(Review entity) {
        return reviewDAO.saveOrUpdate(entity);
    }

    @Override
    public boolean delete(Review entity) {
        return false;
    }

    @Override
    public List<Review> findByBookId(Integer id) {
        return reviewDAO.findByBookId(id);
    }
}
