package app.DAO;

import app.model.Cart;

import java.io.Serializable;

public interface CartDAO extends BaseDAO<Integer, Cart> {
    Cart getCartByEmail(String email);

    Cart findByCartId(Serializable key);
}
