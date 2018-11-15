package app.service;

import app.model.User;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface UserService extends BaseService<Integer, User> {
    void saveUsersByExel(MultipartFile multipartFile);
}
