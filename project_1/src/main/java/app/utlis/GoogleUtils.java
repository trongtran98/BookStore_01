package app.utlis;

import app.bean.GoogleUserInfo;
import app.service.UserService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class GoogleUtils {
    @Value("${google.link.get.token}")
    private String linkToken;
    @Value("${google.app.id}")
    private String appId;
    @Value("${google.app.secret}")
    private String appSecret;
    @Value("${google.redirect.uri}")
    private String redirectUri;
    @Value("${google.link.get.user_info}")
    private String linkGetUserInfo;

    @Autowired
    private UserService userService;
    @Autowired
    private BCryptPasswordEncoder encoder;

    public String getToken(final String code) throws ClientProtocolException, IOException {
        String response = Request.Post(linkToken)
                .bodyForm(Form.form().add("client_id", appId)
                        .add("client_secret", appSecret)
                        .add("redirect_uri", redirectUri).add("code", code)
                        .add("grant_type", "authorization_code").build())
                .execute().returnContent().asString();
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = mapper.readTree(response).get("access_token");
        return node.textValue();
    }

    public GoogleUserInfo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = linkGetUserInfo + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        ObjectMapper mapper = new ObjectMapper();
        GoogleUserInfo googleUserInfo = mapper.readValue(response, GoogleUserInfo.class);
        System.out.println(googleUserInfo);
        return googleUserInfo;
    }

    public UserDetails buildUser(GoogleUserInfo googleUserInfo) {

        boolean enabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
        app.model.User exitsUser = userService.findByEmail(googleUserInfo.getEmail());
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
        app.model.User newUser = null;

        //return user if email was exits in database
        //or create new user
        if (exitsUser == null) {
            newUser = new app.model.User();
            newUser.setEmail(googleUserInfo.getEmail());
            newUser.setPassword(encoder.encode("123456"));
            newUser.setFullName(googleUserInfo.getName());
            newUser.setRole("ROLE_CUSTOMER");
            userService.saveOrUpdate(newUser);
        }

        UserDetails userDetail = new User(googleUserInfo.getEmail(),
                "", enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        return userDetail;
    }
}
