package app.info;

import app.DTO.UserDTO;
import app.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class UtilConvertModel {
    @Autowired
    protected BCryptPasswordEncoder encoder;

    public User convertNewUser(UserDTO userDTO){
            User newUser = new User();
            newUser.setEmail(userDTO.getEmail());
            newUser.setPassword(encoder.encode(userDTO.getPassword()));
            newUser.setFullName(userDTO.getFullName());
            newUser.setBirthday(userDTO.getBirthday());
            newUser.setGender(userDTO.getGender());
            newUser.setPhone(userDTO.getPhone());
            newUser.setRole("ROLE_CUSTOMER");
            return newUser;

    }
}
