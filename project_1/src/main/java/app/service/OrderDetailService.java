package app.service;

import app.model.OrderDetail;

import java.math.BigDecimal;

public interface OrderDetailService extends BaseService<Integer , OrderDetail>{
    BigDecimal totalProfit();
}
