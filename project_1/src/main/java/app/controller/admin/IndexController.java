package app.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import app.model.User;
import app.service.UserService;

@Controller(value = "adminController")
@RequestMapping(value = "/admin")
public class IndexController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String indexPage() {
        return "/admin/index";
    }

}
