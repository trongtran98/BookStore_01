package app.service;

import app.model.Cart;
import app.model.Order;
import app.model.OrderDetail;
import java.util.List;

public interface OrderService extends BaseService<Integer , Order>{

    boolean saveOrderAndRemoveCart(Order order, List<OrderDetail> orderDetails, Cart cart);

    Order getOrderByCart(Integer cartId);
}
