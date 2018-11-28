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
}
