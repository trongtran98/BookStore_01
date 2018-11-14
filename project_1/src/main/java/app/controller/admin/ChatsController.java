package app.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/chats")
public class ChatsController {
    @GetMapping
    public String index() {
        return "/admin/chats";
    }
}
