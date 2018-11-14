package app.controller.admin;

import app.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller(value = "adminClientController")
@RequestMapping(value = "/admin")
public class UserController  extends BaseController {

    @RequestMapping(value = "/add-manager", method = RequestMethod.POST)
    public String addManager(@RequestParam("fileExcel") MultipartFile fileExcel, Model model) {
        try {
            userService.saveUsersByExel(fileExcel);
            model.addAttribute("excelMessage", "success!");
        }catch (Exception e){
            model.addAttribute("excelMessage", "error!");
        }
        return "/admin/index";
    }
}
