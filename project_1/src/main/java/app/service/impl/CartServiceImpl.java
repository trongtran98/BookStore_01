package app.service.impl;

import app.model.Cart;
import app.model.User;
import app.service.CartService;

import java.io.Serializable;

public class CartServiceImpl extends BaseServiceImpl implements CartService {
    @Override
    public Cart findById(Serializable key) {
        return cartDAO.findByCartId(key);
    }

    @Override
    public Cart saveOrUpdate(Cart entity) {
        return cartDAO.saveOrUpdate(entity);
    }

    @Override
    public boolean delete(Cart entity) {
        return false;
    }

    @Override
    public Cart createCart(String email) {
        Cart cart = cartDAO.getCartByEmail(email);
       if(cart != null){
           return cart;
       }else {
    	   User user = userDAO.findUserByEmail(email);
           Cart newCart = new Cart();
           newCart.setUser(user);
           return cartDAO.saveOrUpdate(newCart);
       }
    }

    @Override
    public Cart findByUserId(String name) {
        return cartDAO.getCartByEmail(name);
    }
}
