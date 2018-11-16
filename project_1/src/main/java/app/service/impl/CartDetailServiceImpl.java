package app.service.impl;

import app.model.Cart;
import app.model.CartDetail;
import app.service.CartDetailService;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

public class CartDetailServiceImpl extends BaseServiceImpl implements CartDetailService {
    @Override
    public List<CartDetail> findByCartId(Integer cartId) {
        try {
            return cartDetailDAO.findByCartId(cartId);
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    @Override
    public CartDetail findByCartIdAndBookId(Integer cartId, Integer bookId) {
        try {
            return cartDetailDAO.findByCartIdAndBookId(cartId, bookId);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void deleteById(Integer cartDetailId) {
        try {
            cartDetailDAO.delete(cartDetailDAO.findById(cartDetailId));
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void updateListCartDetails(Cart cart) {
        try {
            for (CartDetail cartDetailTemp : cart.getCartDetails()) {
                CartDetail cartDetail = cartDetailDAO.findById(cartDetailTemp.getId());
                cartDetail.setAmount(cartDetailTemp.getAmount());
                saveOrUpdate(cartDetail);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public CartDetail findById(Serializable key) {
        return null;
    }

    @Override
    public CartDetail saveOrUpdate(CartDetail entity) {
        try {
            return cartDetailDAO.saveOrUpdate(entity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
