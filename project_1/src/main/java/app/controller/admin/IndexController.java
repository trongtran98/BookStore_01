package app.controller.admin;

import app.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(value = "adminController")
@RequestMapping(value = "/admin")
public class IndexController  extends BaseController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String indexPage(Model model) {
        ObjectMapper objectMapper  = new ObjectMapper();
        model.addAttribute("totalProfit", orderDetailService.totalProfit());
        model.addAttribute("totalOrder", orderService.totalOrder());
        model.addAttribute("ordersOfTheMonth", orderService.ordersOfTheMonth());
        model.addAttribute("ordersOfTheYear", orderService.ordersOfTheYear());
        model.addAttribute("ordersOfTheYears", orderService.ordersOfTheYears());
        return "/admin/index";
    }
}
