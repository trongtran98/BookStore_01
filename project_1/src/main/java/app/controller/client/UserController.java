package app.controller.client;

import app.DTO.UserDTO;
import app.bean.GoogleUserInfo;
import app.controller.BaseController;
import app.model.User;
import org.apache.http.client.ClientProtocolException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
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
import java.util.ArrayList;
import java.util.List;

@Controller(value = "userClientController")
public class UserController extends BaseController {


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(@RequestParam(required = false) Boolean error, Model model) {
        if (error != null && error) {
            model.addAttribute("errorMessage", "label.login.error.messages");
        }
        return "/client/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerPage(@RequestParam(required = false) Boolean error, Model model) {
        if (error != null && error) {
            model.addAttribute("errorMessage", "label.login.error.messages");
        }
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


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(UserDTO userDTO) {
        if (createUser(userDTO) == null)
            return "redirect:/login?error=true";

        UserDetails userDetails = buildUser(userDTO);
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null,
                userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return "redirect:/";
    }

    private void setWebAuthentication(UserDetails userDetails, HttpServletRequest request) {
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null,
                userDetails.getAuthorities());
        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }

    private User createUser(UserDTO userDTO) {
        User exitsUser = userService.findByEmail(userDTO.getEmail());
        if (exitsUser == null)
            return userService.saveOrUpdate(utilConvertModel.convertNewUser(userDTO));
        return null;
    }

    private UserDetails buildUser(UserDTO userDTO) {

        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
        UserDetails userDetail = new org.springframework.security.core.userdetails.User(userDTO.getEmail(),
                "", authorities);
        return userDetail;
    }


}


