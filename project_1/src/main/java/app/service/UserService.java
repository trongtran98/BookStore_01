package app.service;

import app.model.User;
import org.springframework.web.multipart.MultipartFile;

public interface UserService extends BaseService<Integer, User> {
    void saveUsersByExel(MultipartFile multipartFile);
    User findByEmail(String email);
}
