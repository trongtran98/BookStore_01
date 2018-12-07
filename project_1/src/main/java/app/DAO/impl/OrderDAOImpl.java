package app.DAO.impl;

import app.DAO.GenericDAO;
import app.DAO.OrderDAO;
import app.model.Order;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;

public class OrderDAOImpl extends GenericDAO<Integer, Order> implements OrderDAO {
    private static final Logger logger = Logger.getLogger(OrderDAOImpl.class);

    public OrderDAOImpl() {
        super(Order.class);
    }

    public OrderDAOImpl(SessionFactory sessionfactory) {
        setSessionFactory(sessionfactory);
    }

    @Override
    public Long ordersOfTheMonth(int day) {
        return (Long) getSession().createQuery("SELECT COUNT(id) FROM Order WHERE DAY(orderDate) = :day AND MONTH(orderDate) = MONTH(CURRENT_DATE)").setParameter("day", day).uniqueResult();
    }

    @Override
    public Long ordersOfTheYear(int month) {
        return (Long) getSession().createQuery("SELECT COUNT(id) FROM Order WHERE MONTH(orderDate) = :month").setParameter("month", month).uniqueResult();
    }

    @Override
    public Long ordersOfTheYears(int year) {
        return (Long) getSession().createQuery("SELECT COUNT(id) FROM Order WHERE YEAR(orderDate) = :year").setParameter("year", year).uniqueResult();
    }

    @Override
    public Long totalOrder() {
        return (Long) getSession().createQuery("SELECT count(id) FROM Order where DAY(orderDate) = DAY(CURRENT_DATE)").uniqueResult();
    }
}
