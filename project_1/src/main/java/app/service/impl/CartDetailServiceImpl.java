package app.service.impl;

import app.model.Cart;
import app.model.CartDetail;
import app.service.CartDetailService;

import java.io.Serializable;
import java.util.List;

public class CartDetailServiceImpl extends BaseServiceImpl implements CartDetailService {
    @Override
    public List<CartDetail> findByCartId(Integer cartId) {
        return cartDetailDAO.findByCartId(cartId);
    }

    @Override
    public CartDetail findByCartIdAndBookId(Integer cartId, Integer bookId) {
        return cartDetailDAO.findByCartIdAndBookId(cartId, bookId);
    }

    @Override
    public void deleteById(Integer cartDetailId) {
        try {
            cartDetailDAO.deleteById(cartDetailId);
        }catch (Exception e){
            throw e;
        }
    }

    @Override
    public void updateListCartDetails(Cart cart) {
        try {
            for (CartDetail cartDetailTemp : cart.getCartDetails()){
                CartDetail cartDetail = cartDetailDAO.findById(cartDetailTemp.getId());
                cartDetail.setAmount(cartDetailTemp.getAmount());
                saveOrUpdate(cartDetail);
            }
        }catch (Exception e){
            throw e;
        }
    }

    @Override
    public CartDetail findById(Serializable key) {
        return null;
    }

    @Override
    public CartDetail saveOrUpdate(CartDetail entity) {
        return cartDetailDAO.saveOrUpdate(entity);
    }

    @Override
    public boolean delete(CartDetail entity) {
        return false;
    }
}
