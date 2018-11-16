package app.controller.client;

import app.controller.BaseController;
import app.model.Book;
import app.model.Category;
import app.model.CategoryDetail;
import app.service.BookService;
import app.service.CategoryDetailService;
import app.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller(value = "clientController")
public class IndexController extends BaseController {

    private final int TYPE_NEW_BOOKS = 7;
    private final int TYPE_NEW_ARRIVAL = 5;
    private final int TYPE_ON_SALE = 6;
    private final int TYPE_FEATURE = 7;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpSession session, Model model) {
        if(session.getAttribute("categories") == null){
            session.setAttribute("categories", categoryService.findAll());
        }
        model.addAllAttributes(getMapAttributes());
        return "/client/index";
    }

    private Map<String, Object> getMapAttributes(){
        Map<String, Object> attrs = new HashMap<>();
        attrs.put("newArrival", categoryDetailService.findById(TYPE_NEW_ARRIVAL));
        attrs.put("onSale", categoryDetailService.findById(TYPE_ON_SALE));
        attrs.put("feature", categoryDetailService.findById(TYPE_FEATURE));
        attrs.put("newBooks", bookService.loadBooksTypeNew(TYPE_NEW_BOOKS));
        return attrs;
    }

}
