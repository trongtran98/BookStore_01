package app.controller.client;

import app.bean.CartInfo;
import app.controller.BaseController;
import app.model.Book;
import app.model.Cart;
import app.model.CartDetail;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/carts")
public class CartController extends BaseController {

    private Integer cartId;

    @GetMapping(value = "/{cartId}")
    public String checkCart(Model model, @PathVariable Integer cartId) {
        this.cartId = cartId;
        Cart cart = cartService.findById(cartId);
        if (cart != null)
            model.addAttribute("cart", new CartInfo(cart));
        return "/client/cart";
    }

    @GetMapping(value = "/add-to-cart/{bookId}")
    @ResponseBody
    public CartInfo addToCart(@PathVariable Integer bookId, Authentication authentication) {
        Cart cart = cartService.createCart(authentication.getName());
        CartDetail cartDetailExits = cartDetailService.findByCartIdAndBookId(cart.getId(), bookId);
        if (cartDetailExits == null) {
            createNewCartDetail(cart, bookId);
        } else {
            cartDetailExits.setAmount(cartDetailExits.getAmount() + 1);
            cartDetailService.saveOrUpdate(cartDetailExits);
        }
        return new CartInfo(cartService.findById(cart.getId()));
    }

    @PostMapping(value = "/update")
    public String updateCart(@ModelAttribute("cart") Cart cart, BindingResult bindingResult) {
        cartDetailService.updateListCartDetails(cart);
        return "redirect:/carts/" + cartId;
    }

    @GetMapping(value = "/remove-from-cart/{cartDetailId}")
    public String removeFromCart(@PathVariable Integer cartDetailId) {
        cartDetailService.deleteById(cartDetailId);
        return "redirect:/carts/" + cartId;
    }

    private void createNewCartDetail(Cart cart, Integer bookId) {
        Book book = bookService.findById(bookId);
        CartDetail cartDetail = new CartDetail();
        cartDetail.setBook(book);
        cartDetail.setAmount(1);
        cartDetail.setPrice(book.getPrice());
        cartDetail.setCart(cart);
        cartDetailService.saveOrUpdate(cartDetail);
    }
}
