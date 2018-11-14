package app.controller.admin;

import app.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller(value = "adminClientController")
@RequestMapping(value = "/admin")
public class UserController  extends BaseController {

    @RequestMapping(value = "/add-manager", method = RequestMethod.POST)
    public void addManager(@RequestParam("fileExcel") MultipartFile fileExcel) {
        userService.saveUsersByExel(fileExcel);
    }
}
