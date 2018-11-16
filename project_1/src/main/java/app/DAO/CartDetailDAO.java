package app.DAO;

import app.model.CartDetail;

import java.util.List;

public interface CartDetailDAO extends BaseDAO<Integer, CartDetail> {
    List<CartDetail> findByCartId(Integer cartId);

    CartDetail findByCartIdAndBookId(Integer cartId, Integer bookId);
}
