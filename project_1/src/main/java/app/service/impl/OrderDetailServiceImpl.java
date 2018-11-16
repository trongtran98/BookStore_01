package app.service.impl;

import app.model.OrderDetail;
import app.service.OrderDetailService;

import java.io.Serializable;

public class OrderDetailServiceImpl extends BaseServiceImpl implements OrderDetailService {
    @Override
    public OrderDetail findById(Serializable key) {
        return null;
    }

    @Override
    public OrderDetail saveOrUpdate(OrderDetail entity) {
        return null;
    }

    @Override
    public boolean delete(OrderDetail entity) {
        return false;
    }
}
