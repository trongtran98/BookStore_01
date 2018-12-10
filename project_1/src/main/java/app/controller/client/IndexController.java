package app.controller.client;

import app.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.Map;

@Controller(value = "clientController")
public class IndexController extends BaseController {

    private final int TYPE_NEW_BOOKS = 7;
    private final int TYPE_NEW_ARRIVAL = 5;
    private final int TYPE_ON_SALE = 6;
    private final int TYPE_FEATURE = 7;
    private final int MAX_RESULT_SALE_BEST = 9;
    private final int MAX_RESULT_PANEL = 3;


    @GetMapping(value = {"/", "/home"})
    public String index(Model model) {
        model.addAllAttributes(getMapAttributes());
        return "/client/index";
    }

    private Map<String, Object> getMapAttributes() {
        Map<String, Object> attrs = new HashMap<>();
        attrs.put("newArrival", categoryDetailService.findById(TYPE_NEW_ARRIVAL));
        attrs.put("onSale", categoryDetailService.findById(TYPE_ON_SALE));
        attrs.put("feature", categoryDetailService.findById(TYPE_FEATURE));
        attrs.put("newBooks", bookService.loadBooksTypeNew(TYPE_NEW_BOOKS));
        attrs.put("bestSale", bookService.bestSaleOfTheDay(MAX_RESULT_SALE_BEST));
        attrs.put("panels", bookService.getPanel(MAX_RESULT_PANEL));
        return attrs;
    }

    @GetMapping(value = "/about")
    public String about() {
        return "/client/about";
    }

    @GetMapping(value = "/contact")
    public String contact() {
        return "/client/contact";
    }

    @GetMapping(value = "/checkout")
    public String checkout() {
        return "/client/checkout";
    }
}
