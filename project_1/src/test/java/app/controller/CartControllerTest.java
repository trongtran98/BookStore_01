package app.controller;

import app.bean.CartInfo;
import app.controller.client.CartController;
import app.model.Book;
import app.model.Cart;
import app.model.CartDetail;
import app.service.BookService;
import app.service.CartDetailService;
import app.service.CartService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.Arrays;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.when;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/configs/*.xml", "/bookstore-servlet.xml"})
@WebAppConfiguration
public class CartControllerTest {
    @Mock
    BookService bookService;
    @Mock
    CartService cartService;
    @Mock
    CartDetailService cartDetailService;
    @Mock
    CartController cartController;

    @Before
    public void setUp() {
        System.out.println("--starting--");
        MockitoAnnotations.initMocks(this);
    }

    @After
    public void shutDown() {
        System.out.println("--completed");
    }

    //Test addToCart function in CartController
    @Test
    public void addToCart_CartDetailExitsNotNull() {

        Cart cart = new Cart();
        cart.setId(1);

        CartDetail cartDetailExits = new CartDetail();
        cartDetailExits.setId(1);
        cartDetailExits.setAmount(5);

        Book book = new Book();
        book.setId(1);

        cart.setCartDetails(Arrays.asList(cartDetailExits));

        when(cartService.createCart(any(String.class))).thenReturn(cart);
        when(cartDetailService.findByCartIdAndBookId(1, 1)).thenReturn(cartDetailExits);

        if (cartDetailExits == null) {
            doAnswer((i) -> {
                return null;
            }).when(cartController).createNewCartDetail(cart, any(Integer.class));
        } else {
            cartDetailExits.setAmount(cartDetailExits.getAmount() + 1);

            when(cartDetailService.saveOrUpdate(cartDetailExits)).thenReturn(new CartDetail());
            assertThat(cartDetailExits.getAmount(), is(6));
        }

        when(cartService.findById(cart.getId())).thenReturn(cart);
        CartInfo cartInfo = new CartInfo(cart);
        assertThat(cartInfo.getId(), is(cart.getId()));
    }
}
