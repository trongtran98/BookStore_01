package app.bean;

import app.model.Cart;
import app.model.Order;
import app.model.OrderDetail;
import app.model.User;

import java.util.List;

public class OrderInfo {
    private Integer id;
    private Boolean status;
    private User user;
    private List<OrderDetail> orderDetails;

    public OrderInfo() {

    }

    public OrderInfo(Order order) {
        this.user = order.getUser();
        this.orderDetails = order.getOrderDetails();
    }

    public OrderInfo(Cart cart) {
        this.status = false;
        this.user = cart.getUser();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }
}
