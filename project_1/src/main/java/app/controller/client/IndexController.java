package app.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import app.model.User;
import app.service.UserService;

@Controller
public class IndexControllerClient {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(){
        return "/client/login";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(User user){
        User userVerified = userService.loadUser(user);
        if(userVerified != null){
            return "/client/index";
        }else {
            return "/client/login";
        }
    }
}
