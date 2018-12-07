package app.service.impl;

import app.model.OrderDetail;
import app.service.OrderDetailService;

import java.io.Serializable;
import java.math.BigDecimal;

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
    public boolean delete(Integer id) {
        return false;
    }

    @Override
    public BigDecimal totalProfit() {
        try{
            return orderDetailDAO.totalProfit();
        }catch (Exception e){
            return new BigDecimal(0);
        }

    }
}
