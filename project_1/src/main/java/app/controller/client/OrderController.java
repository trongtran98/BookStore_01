package app.controller.client;

import app.bean.CartInfo;
import app.bean.OrderInfo;
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
        Order order = orderService.getOrderByCart(id);
        if (orderService.saveOrderAndRemoveCart(order, order.getOrderDetails(), order.getCart())) {
            mailUtils.sendSimpleMessage(order.getCart().getUser().getEmail(), order.getCart().getUser().getFullName());
        }
        return "redirect:/home";
    }

}
