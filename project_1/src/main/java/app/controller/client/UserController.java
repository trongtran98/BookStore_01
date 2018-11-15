package app.controller.client;

import app.bean.GoogleUserInfo;
import app.utlis.GoogleUtils;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller(value = "userClientController")
public class UserController {
    @Autowired
    private GoogleUtils googleUtils;

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

    @RequestMapping("/login-google")
    public String loginGoogle(HttpServletRequest request) throws ClientProtocolException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            return "redirect:/login?error=true";
        }
        String accessToken = googleUtils.getToken(code);

        GoogleUserInfo googleUserInfo = googleUtils.getUserInfo(accessToken);
        UserDetails userDetails = googleUtils.buildUser(googleUserInfo);
        setWebAuthentication(userDetails, request);
        return "redirect:/";
    }

    private void setWebAuthentication(UserDetails userDetails, HttpServletRequest request){
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null,
                userDetails.getAuthorities());
        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }
}
