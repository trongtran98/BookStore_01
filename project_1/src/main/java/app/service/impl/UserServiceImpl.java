package app.service.impl;

import app.model.User;
import app.service.UserService;
import app.utlis.ExcelUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.List;

public class UserServiceImpl extends BaseServiceImpl implements UserService {
    @Autowired
    private ExcelUtils excelUtils;

    private static final Logger logger = Logger.getLogger(UserServiceImpl.class);

    @Override
    public User findById(Serializable key) {
        return null;
    }

    @Override
    public User saveOrUpdate(User entity) {
        try {
            return userDAO.saveOrUpdate(entity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean delete(User entity) {
        return false;
    }

    @Override
    public void saveUsersByExel(MultipartFile fileExcel) {
        List<User> users = excelUtils.getUsers(fileExcel);
        try {
            users.forEach(user -> userDAO.saveOrUpdate(user));
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public User findByEmail(String email) {
        try {
            return userDAO.findUserByEmail(email);
        } catch (Exception e) {
            return null;
        }
    }
}
