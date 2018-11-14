package app.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import app.model.User;
import app.service.UserService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller(value = "clientController")
public class IndexController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "/client/index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(@RequestParam(required = false) Boolean error, Model model) {
        if (error != null) {
            if (error) {
                model.addAttribute("errorMessage", "Sai tài khoản hoặc mật khẩu");
            }
        }
        return "/client/login";
    }
}
