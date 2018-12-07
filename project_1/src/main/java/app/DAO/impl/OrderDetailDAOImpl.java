package app.DAO.impl;

import app.DAO.GenericDAO;
import app.DAO.OrderDetailDAO;
import app.model.OrderDetail;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;

import java.math.BigDecimal;
import java.util.List;

public class OrderDetailDAOImpl extends GenericDAO<Integer, OrderDetail> implements OrderDetailDAO {
    private static final Logger logger = Logger.getLogger(OrderDetailDAOImpl.class);

    public OrderDetailDAOImpl() {
        super(OrderDetail.class);
    }

    public OrderDetailDAOImpl(SessionFactory sessionfactory) {
        setSessionFactory(sessionfactory);
    }

    @Override
    public BigDecimal totalProfit() {
        return (BigDecimal) getSession().createQuery("SELECT sum(amount * price)  FROM OrderDetail ").uniqueResult();
    }

    @Override
    public void saveOrderDetails(List<OrderDetail> orderDetails) {
        orderDetails.forEach(orderDetail -> saveOrUpdate(orderDetail));
    }
}
