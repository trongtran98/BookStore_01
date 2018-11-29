package app.service;

import app.bean.OrderInfo;
import app.model.Cart;
import app.model.Order;
import app.model.OrderDetail;
import java.util.List;

public interface OrderService extends BaseService<Integer , Order>{

    boolean saveOrderAndRemoveCart(OrderInfo order, List<OrderDetail> orderDetails, Integer cartId);

    OrderInfo getOrderByCart(Integer cartId);
}
