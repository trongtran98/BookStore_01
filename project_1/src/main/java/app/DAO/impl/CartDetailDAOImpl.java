package app.DAO.impl;

import app.DAO.CartDetailDAO;
import app.DAO.GenericDAO;
import app.model.CartDetail;

import java.util.List;

public class CartDetailDAOImpl extends GenericDAO<Integer, CartDetail> implements CartDetailDAO {

    @Override
    public List<CartDetail> findByCartId(Integer cartId) {
        return getSession().createQuery("from CartDetail cd where cd.cart.id = :cartId")
                .setParameter("cartId", cartId)
                .list();
    }

    @Override
    public CartDetail findByCartIdAndBookId(Integer cartId, Integer bookId) {
        return (CartDetail) getSession().createQuery("from CartDetail cd where cd.cart.id = :cartId and cd.book.id = :bookId")
                .setParameter("cartId", cartId)
                .setParameter("bookId", bookId)
                .uniqueResult();
    }

    @Override
    public List<CartDetail> findInventory(Integer date) {
        return getSession().createQuery("from CartDetail cd where datediff(current_date ,cd.time) = :date")
                .setParameter("date", date).list();
    }

}
