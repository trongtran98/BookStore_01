package app.controler.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import app.model.User;
import app.service.UserService;

@Controller
public class IndexController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(){
        return "login";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(User user){
        User userVerified = userService.loadUser(user);
        if(userVerified != null){
            return "index";
        }else {
            return "login";
        }
    }
}
