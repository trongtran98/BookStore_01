package app.service.impl;

import app.model.Cart;
import app.model.Order;
import app.model.OrderDetail;
import app.service.OrderService;

import java.io.Serializable;
import java.util.List;

public class OrderServiceImpl extends BaseServiceImpl implements OrderService {
    @Override
    public Order findById(Serializable key) {
        return null;
    }

    @Override
    public Order saveOrUpdate(Order entity) {
        try{
            return orderDAO.saveOrUpdate(entity);
        }catch (Exception e){
            throw e;
        }
    }

    @Override
    public boolean delete(Order entity) {
        return false;
    }

    @Override
    public boolean saveOrderAndRemoveCart(Order order, List<OrderDetail> orderDetails, Cart cart) {
        try{
            Order orderPersist = saveOrUpdate(order);
            orderDetails.forEach(orderDetail -> orderDetail.setOrder(orderPersist));
            orderDetailDAO.saveOrderDetails(orderDetails);
            cartDAO.delete(cart);
            return true;
        }catch (Exception e){
            throw e;
        }
    }
}
