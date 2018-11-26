package app.controller.client;

import app.controller.BaseController;
import app.model.Cart;
import app.model.CartDetail;
import app.model.Category;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;

@ControllerAdvice
public class CommonController extends BaseController {
    @ModelAttribute("categories")
    public List<Category> getCategories(HttpSession session) {
        if (session.getAttribute("categories") == null) {
            return categoryService.findAll();
        }
        return (List<Category>) session.getAttribute("categories");
    }

    @ModelAttribute("myCart")
    public Cart getCartDetails(Authentication authentication) {
        if (authentication == null)
            return null;
        Cart cart = cartService.findByUserId(authentication.getName());
        if (cart != null && cart.getCartDetails() != null)
            cart.getCartDetails().removeAll(Collections.singleton(null));
        return cart;
    }
}
