package app.service.impl;

import app.bean.OrderInfo;
import app.model.Cart;
import app.model.CartDetail;
import app.model.Order;
import app.model.OrderDetail;
import app.service.OrderService;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;
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
            for (OrderDetail orderDetail : orderDetails) {
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
    public LinkedHashMap<String, Integer> ordersOfTheMonth() {

        int lastDayOfMonth = datetimeUtils.getLastDayOfCurrentMonth();
        if (lastDayOfMonth > 0) {
            LinkedHashMap<String, Integer> treeMap = new LinkedHashMap<>();
            try {
                for (int i = 1; i <= lastDayOfMonth; i++) {
                    treeMap.put(i + "th", orderDAO.ordersOfTheMonth(i) == null ? 0 : orderDAO.ordersOfTheMonth(i).intValue());
                }
                return treeMap;
            } catch (Exception e) {
            }
        }
        return null;
    }

    @Override
    public LinkedHashMap<String, Integer> ordersOfTheYear() {
        LinkedHashMap<String, Integer> treeMap = new LinkedHashMap<>();
        try {
            for (int i = 1; i <= 12; i++) {
                treeMap.put(month(i), orderDAO.ordersOfTheYear(i) == null ? 0 : orderDAO.ordersOfTheYear(i).intValue());
            }
            return treeMap;
        } catch (Exception e) {
        }
        return null;
    }

    @Override
    public LinkedHashMap<String, Integer> ordersOfTheYears() {
        LinkedHashMap<String, Integer> treeMap = new LinkedHashMap<>();
        int year = datetimeUtils.getCurrentYear();
        if (year > 0) {
            try {
                for (int i = year - 10; i <= year; i++) {
                    treeMap.put(Integer.toString(i), orderDAO.ordersOfTheYears(i) == null ? 0 : orderDAO.ordersOfTheYears(i).intValue());
                }
                return treeMap;
            } catch (Exception e) {
            }
        }
        return null;
    }

    @Override
    public Long totalOrder() {
        try {
            return orderDAO.totalOrder();
        } catch (Exception e) {
            return 0l;
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

    private String month(int numberMonth) {
        String month = "";
        switch (numberMonth) {
            case 1:
                month = "Jan";
                break;
            case 2:
                month = "Feb";
                break;
            case 3:
                month = "Mar";
                break;
            case 4:
                month = "Apr";
                break;
            case 5:
                month = "May";
                break;
            case 6:
                month = "Jun";
                break;
            case 7:
                month = "Jul";
                break;
            case 8:
                month = "Agu";
                break;
            case 9:
                month = "Sep";
                break;
            case 10:
                month = "Oct";
                break;
            case 11:
                month = "Nov";
                break;
            case 12:
                month = "Dec";
                break;
        }
        return month;
    }

}
