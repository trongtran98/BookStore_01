package app.controller.client;

import app.controller.BaseController;
import app.model.Cart;
import app.model.CartDetail;
import app.model.Order;
import app.model.OrderDetail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/orders")
public class OrderController extends BaseController {

    @RequestMapping(value = "/purchase", method = RequestMethod.POST)
    public String purchase(@RequestParam Integer id) {
        Cart cart = cartService.findById(id);
        Order order = new Order(cart);
        List<OrderDetail> orderDetails = new ArrayList<>();
        for (CartDetail cartDetail : cart.getCartDetails()) {
            if (cartDetail != null) {
                orderDetails.add(new OrderDetail(cartDetail));
            }
        }
        if (orderService.saveOrderAndRemoveCart(order, orderDetails, cart)) {
            mailUtils.sendSimpleMessage(cart.getUser().getEmail(), cart.getUser().getFullName());
        }
        return "redirect:/home";
    }


}
