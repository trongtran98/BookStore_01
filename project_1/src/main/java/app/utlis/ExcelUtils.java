package app.utlis;

import app.model.User;
import app.service.UserService;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ExcelUtils {
    @Autowired
    private BCryptPasswordEncoder encode;

    public List<User> getUsers(MultipartFile fileExcel) {
        List<User> lstAdmin = new ArrayList<>();
        try {
            int i = 0;
            // Creates a workbook object from the uploaded excelfile
            XSSFWorkbook workbook = new XSSFWorkbook(fileExcel.getInputStream());
            // Creates a worksheet object representing the first sheet
            XSSFSheet worksheet = workbook.getSheetAt(0);
            // Reads the data in excel file until last row is encountered
            while (i < worksheet.getLastRowNum()) {
                i++;
                // Creates an object for the UserInfo Model
                User admin = new User();
                // Creates an object representing a single row in excel
                XSSFRow row = worksheet.getRow(i);
                // Sets the Read data to the model class
                //user.setId((int) row.getCell(0).getNumericCellValue());
                admin.setFullName(row.getCell(1).getStringCellValue());
                admin.setEmail(row.getCell(2).getStringCellValue());
                admin.setPassword(encode.encode("123456"));
                admin.setPhone(row.getCell(3).getStringCellValue());
                admin.setGender(row.getCell(4).getStringCellValue().equals("Nam") ? true : false);
                admin.setBirthday(row.getCell(5).getDateCellValue());
                lstAdmin.add(admin);
            }
            workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lstAdmin;
    }
}
