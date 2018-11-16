package app.service;

import app.model.Cart;

public interface CartService  extends BaseService<Integer, Cart> {
    Cart createCart(String email);

    Cart findByUserId(String name);
}
