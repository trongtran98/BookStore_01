package app.controller.client;

import app.controller.BaseController;
import app.model.Category;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;
import java.util.List;

@ControllerAdvice
public class CategoryController extends BaseController {
    @ModelAttribute("categories")
    public List<Category> getCategories(HttpSession session){
        if(session.getAttribute("categories") == null){
            return categoryService.findAll();
        }
        return (List<Category>) session.getAttribute("categories");
    }
}
