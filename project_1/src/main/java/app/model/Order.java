package app.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order implements java.io.Serializable {
    private Integer id;
    private Boolean status;
    private User user;
    private List<OrderDetail> orderDetails;
    private Cart cart;
    private Date orderDate;

    public Order() {

    }

    public Order(Cart cart) {
        this.status = false;
        this.user = cart.getUser();
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
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

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

}
