package app.service;

import app.model.Cart;
import app.model.CartDetail;

import java.util.List;

public interface CartDetailService extends BaseService<Integer, CartDetail> {
    List<CartDetail> findByCartId(Integer cartId);

    CartDetail findByCartIdAndBookId(Integer id, Integer bookId);

    void deleteById(Integer cartDetailId);

    void updateListCartDetails(Cart cart);
}
