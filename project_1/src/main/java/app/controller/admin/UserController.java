package app.controller.admin;

import app.model.User;
import app.service.UserService;
import app.utlis.ExcelUtils;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller(value = "adminClientController")
@RequestMapping(value = "/admin")
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/add-manager", method = RequestMethod.POST)
    public void addManager(@RequestParam("fileExcel") MultipartFile fileExcel){
        userService.saveUsersByExel(fileExcel);
    }
}
