package app.DAO.impl;

import app.DAO.CartDAO;
import app.DAO.GenericDAO;
import app.model.Cart;
import app.model.CartDetail;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import java.io.Serializable;
import java.util.List;

public class CartDAOImpl extends GenericDAO<Integer, Cart> implements CartDAO {
    private static final Logger logger = Logger.getLogger(CartDAOImpl.class);

    public CartDAOImpl() {
        super(Cart.class);
    }

    public CartDAOImpl(SessionFactory sessionfactory) {
        setSessionFactory(sessionfactory);
    }

    @Override
    public Cart getCartByEmail(String email) {
        Criteria c = getSession().createCriteria(Cart.class, "c");
        c.createAlias("c.user", "u");
        c.add(Restrictions.eq("u.email", email));
        Cart cart = (Cart) c.uniqueResult();
        Hibernate.initialize(cart.getCartDetails());
        return cart;
    }

    @Override
    public Cart findByCartId(Serializable key) {
        Criteria c = getSession().createCriteria(Cart.class);
        c.add(Restrictions.idEq(key));
        Cart cart = (Cart) c.uniqueResult();
        Hibernate.initialize(cart.getCartDetails());
        return cart;
    }
}
