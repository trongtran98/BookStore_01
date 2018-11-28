package app.service.impl;

import app.model.Review;
import app.service.ReviewService;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

public class ReviewServiceImpl extends BaseServiceImpl implements ReviewService {
    @Override
    public Review findById(Serializable key) {
        return null;
    }

    @Override
    public Review saveOrUpdate(Review entity) {
        try {
            return reviewDAO.saveOrUpdate(entity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    @Override
    public List<Review> findByBookId(Integer id) {
        try {
            return reviewDAO.findByBookId(id);
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }
}
