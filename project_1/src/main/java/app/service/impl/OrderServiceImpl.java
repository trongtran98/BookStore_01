package app.service.impl;

import app.bean.OrderInfo;
import app.model.Cart;
import app.model.CartDetail;
import app.model.Order;
import app.model.OrderDetail;
import app.service.OrderService;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class OrderServiceImpl extends BaseServiceImpl implements OrderService {
    @Override
    public Order findById(Serializable key) {
        return null;
    }

    @Override
    public Order saveOrUpdate(Order entity) {
        try {
            return orderDAO.saveOrUpdate(entity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    @Override
    public boolean saveOrderAndRemoveCart(OrderInfo orderInfo, List<OrderDetail> orderDetails, Integer cartId) {
        try {
            Order order = convertBeanToModel(orderInfo);
            Order orderPersist = saveOrUpdate(order);
            for (OrderDetail orderDetail : orderDetails){
                orderDetail.setOrder(orderPersist);
                orderDetailDAO.saveOrUpdate(orderDetail);
            }
            cartDAO.delete(cartDAO.findByCartId(cartId));
            return true;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public OrderInfo getOrderByCart(Integer cartId) {
        Cart cart = cartDAO.findById(cartId);
        OrderInfo order = new OrderInfo(cart);
        List<OrderDetail> orderDetails = new ArrayList<>();
        for (CartDetail cartDetail : cart.getCartDetails()) {
            if (cartDetail != null) {
                orderDetails.add(new OrderDetail(cartDetail));
            }
        }
        order.setOrderDetails(orderDetails);
        return order;
    }

    private Order convertBeanToModel(OrderInfo orderInfo) {
        Order order = new Order();
        order.setUser(orderInfo.getUser());
        order.setStatus(orderInfo.getStatus());
        return order;
    }

}
