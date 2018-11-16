package app.controller.client;

import app.controller.BaseController;
import app.model.Book;
import app.model.Cart;
import app.model.CartDetail;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;

@Controller
public class CartController extends BaseController {
    private Integer cartId;

    @RequestMapping(value = "/cart/{cartId}")
    public String checkCart(Model model, @PathVariable Integer cartId) {
        this.cartId = cartId;
        Cart cart = cartService.findById(cartId);
        if (cart != null)
            cart.getCartDetails().removeAll(Collections.singleton(null));
        model.addAttribute("cart", cart);
        return "/client/cart";
    }

    @RequestMapping(value = "/carts/add-to-cart/{bookId}")
    @ResponseBody
    public Cart addToCart(@PathVariable Integer bookId, Authentication authentication) {
        Cart cart = cartService.createCart(authentication.getName());
        CartDetail cartDetailExits = cartDetailService.findByCartIdAndBookId(cart.getId(), bookId);
        if (cartDetailExits == null) {
            createNewCartDetail(cart, bookId);
        } else {
            cartDetailExits.setAmount(cartDetailExits.getAmount() + 1);
            cartDetailService.saveOrUpdate(cartDetailExits);
        }
        return setNullField(cartService.findById(cart.getId()));
    }

    @RequestMapping(value = "/carts/update")
    public String updateCart(@ModelAttribute("cart") Cart cart, BindingResult bindingResult) {
        cartDetailService.updateListCartDetails(cart);
        return "redirect:/cart/" + cartId;
    }

    @RequestMapping(value = "/carts/remove-from-cart/{cartDetailId}")
    public String removeFromCart(@PathVariable Integer cartDetailId) {
        cartDetailService.deleteById(cartDetailId);
        return "redirect:/cart/" + cartId;

    }

    private Cart setNullField(Cart cart) {
        cart.setUser(null);
        cart.getCartDetails().removeAll(Collections.singleton(null));
        for (CartDetail cd : cart.getCartDetails()) {
            cd.setCart(null);
            cd.getBook().setAuthor(null);
            cd.getBook().setCategoryDetail(null);
            cd.getBook().setProducer(null);
            cd.getBook().setReviews(null);
        }
        return cart;
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
