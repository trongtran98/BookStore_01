package app.controller.admin;

import app.DTO.AuthorDTO;
import app.controller.BaseController;
import app.helper.Helper;
import app.model.Author;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/authors")
public class AuthorsController extends BaseController {

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("authors", authorService.findAuthors());
        return "/admin/authors";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public @ResponseBody
    AuthorDTO findById(@PathVariable Integer id) {
        if (id == null)
            return null;
        AuthorDTO authorDTO = new AuthorDTO(authorService.findById(id));
        return authorDTO;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity deleteAuthor(@PathVariable Integer id) {
        return Helper.delete(id, authorService.delete(id));
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity createAuthor(@RequestBody AuthorDTO authorDTO) {
        return createOrUpdate(authorDTO);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity updateAuthor(@RequestBody AuthorDTO authorDTO) {
        return createOrUpdate(authorDTO);
    }

    private ResponseEntity createOrUpdate(AuthorDTO authorDTO) {
        Author author = new Author(authorDTO);
        return Helper.createOrUpdate(author, authorService.saveOrUpdate(author));
    }
}
