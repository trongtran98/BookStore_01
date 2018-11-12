package app.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(value = "adminController")
@RequestMapping(value = "/admin")
public class IndexController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String indexPage() {
        return "/admin/index";
    }

}
