package app.service.impl;

import app.model.Cart;
import app.model.CartDetail;
import app.model.User;
import app.service.CartService;

import java.io.Serializable;

public class CartServiceImpl extends BaseServiceImpl implements CartService {
    @Override
    public Cart findById(Serializable key) {
        try {
            return setUrlImage(cartDAO.findByCartId(key));
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Cart saveOrUpdate(Cart entity) {
        try {
            return cartDAO.saveOrUpdate(entity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    @Override
    public Cart createCart(String email) {
        try {
            Cart cart = cartDAO.getCartByEmail(email);
            if (cart != null)
                return cart;
            User user = userDAO.findUserByEmail(email);
            Cart newCart = new Cart();
            newCart.setUser(user);
            return cartDAO.saveOrUpdate(newCart);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Cart findByUserId(String name) {
        try {
            return setUrlImage(cartDAO.getCartByEmail(name));
        } catch (Exception e) {
            return null;
        }
    }

    private Cart setUrlImage(Cart cart){
        for (CartDetail cartDetail : cart.getCartDetails()){
            if ( cartDetail == null) break;
            cartDetail.getBook().setAvatar(cloudinaryUtils.loadImageBook(cartDetail.getBook().getAvatar()));
        }
        return cart;
    }
}
