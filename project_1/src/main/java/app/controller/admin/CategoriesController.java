package app.controller.admin;

import app.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/categories")
public class CategoriesController extends BaseController {
    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("categories", categoryService.findAll());
        return "/admin/categories";
    }
}
