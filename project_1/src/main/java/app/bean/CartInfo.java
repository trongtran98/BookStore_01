package app.bean;

import app.model.Cart;
import app.model.CartDetail;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.List;

public class CartInfo {
    private static final Logger logger = Logger.getLogger(CartInfo.class);


    private Integer id;
    private List<CartDetailInfo> cartDetails;

    public CartInfo() {

    }

    public CartInfo(Cart cart) {
        this.id = cart.getId();
        try{
            this.cartDetails = getCartDetailsInfo(cart.getCartDetails());
        }catch (Exception e){
            logger.info(e);
        }
    }

    public List<CartDetailInfo> getCartDetailsInfo(List<CartDetail> cartDetails){
        ArrayList<CartDetailInfo> cartDetailsInfo = new ArrayList<>();
        for (CartDetail cartDetail : cartDetails){
            if (cartDetail != null){
                cartDetailsInfo.add(new CartDetailInfo(cartDetail));
            }
        }
        return cartDetailsInfo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<CartDetailInfo> getCartDetails() {
        return cartDetails;
    }

    public void setCartDetails(List<CartDetailInfo> cartDetails) {
        this.cartDetails = cartDetails;
    }
}
