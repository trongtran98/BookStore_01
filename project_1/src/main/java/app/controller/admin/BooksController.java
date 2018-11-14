package app.controller.admin;


import app.model.Author;
import app.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class BooksController {

    @RequestMapping(value = "/books", method = RequestMethod.GET)
    public String books(Model model){
        return "/admin/books";
    }


}
