package app.service;

import app.bean.OrderInfo;
import app.model.Order;
import app.model.OrderDetail;

import java.util.LinkedHashMap;
import java.util.List;

public interface OrderService extends BaseService<Integer, Order> {

    boolean saveOrderAndRemoveCart(OrderInfo order, List<OrderDetail> orderDetails, Integer cartId);

    OrderInfo getOrderByCart(Integer cartId);

    Long totalOrder();

    LinkedHashMap<String, Integer> ordersOfTheMonth();

    LinkedHashMap<String, Integer> ordersOfTheYear();

    LinkedHashMap<String, Integer> ordersOfTheYears();
}
