package app.controller.admin;

import app.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.Locale;


@Controller(value = "adminClientController")
@RequestMapping(value = "/admin")
public class UserController extends BaseController {
    @Autowired
    private ApplicationContext applicationContext;

    @RequestMapping(value = "/add-manager", method = RequestMethod.POST)
    public String addManager(@RequestParam("fileExcel") MultipartFile fileExcel, Model model) {
        try {
            userService.saveUsersByExel(fileExcel);
            model.addAttribute("excelMessage", applicationContext.getMessage("message.success", null, Locale.US));
        } catch (Exception e) {
            model.addAttribute("excelMessage", applicationContext.getMessage("message.error", null, Locale.US));
        }
        return "/admin/index";
    }
}
