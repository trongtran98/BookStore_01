package app.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller(value = "userClientController")
public class UserController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(@RequestParam(required = false) Boolean error, Model model) {
        if (error != null) {
            if (error) {
                model.addAttribute("errorMessage", "label.login.error.messages");
            }
        }
        return "/client/login";
    }

    @RequestMapping(value = "/register" ,method = RequestMethod.PUT)
    public String register(){
        return "/client/register";
    }
}
