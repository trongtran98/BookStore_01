package app.DAO;

import app.model.OrderDetail;

import java.util.List;

public interface OrderDetailDAO extends BaseDAO<Integer, OrderDetail> {
    void saveOrderDetails(List<OrderDetail> orderDetails);
}
