package app.controller.client;

import app.bean.CartInfo;
import app.bean.OrderInfo;
import app.controller.BaseController;
import app.model.Cart;
import app.model.Order;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/orders")
public class OrderController extends BaseController {

    @RequestMapping(value = "/{cartId}")
    public String order(@PathVariable Integer cartId, Model model) throws JsonProcessingException {
        Cart cart = cartService.findById(cartId);
        if (cart != null){
            model.addAttribute("cart", cart);
            model.addAttribute("cartJson", new ObjectMapper().writeValueAsString(new CartInfo(cart)));
        }
        return "/client/checkout";
    }

    @RequestMapping(value = "/purchase", method = RequestMethod.POST)
    public ResponseEntity purchase(@RequestParam Integer cartId) {
        OrderInfo order = orderService.getOrderByCart(cartId);
        if (orderService.saveOrderAndRemoveCart(order, order.getOrderDetails(), cartId)) {
            mailUtils.sendSimpleMessage(order.getUser().getEmail(), order.getUser().getFullName());
        }
        return ResponseEntity.status(HttpStatus.OK).body(null);
    }
}
