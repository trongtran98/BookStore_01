package app.controller.admin;

import app.DTO.AuthorDTO;
import app.controller.BaseController;
import app.model.Author;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AuthorsController extends BaseController {

    @RequestMapping(value = "/authors", method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("authors", authorService.findAuthors());
        return "/admin/authors";
    }

    @RequestMapping(value = "/authors/delete/{id}", method = RequestMethod.GET)
    public ResponseEntity deleteAuthor(@PathVariable Integer id) {
        if (id == null || !authorService.deleteAuthor(id)) {
            return ResponseEntity.status(HttpStatus.FAILED_DEPENDENCY).body(null);
        }
        return ResponseEntity.status(HttpStatus.OK).

                body(null);
    }

    @RequestMapping(value = "/authors/create", method = RequestMethod.POST)
    public ResponseEntity createAuthor(@RequestBody AuthorDTO authorDTO) {
        Author author = new Author(authorDTO);
        if (authorDTO == null || authorService.saveOrUpdate(author) == null)
            return ResponseEntity.status(HttpStatus.FAILED_DEPENDENCY).body(null);
        return ResponseEntity.status(HttpStatus.OK).body(HttpStatus.OK);
    }

    @RequestMapping(value = "/authors/edit", method = RequestMethod.PUT)
    public ResponseEntity editAuthor(@RequestBody AuthorDTO authorDTO) {
        Author author = new Author(authorDTO);
        if (authorDTO == null || authorService.saveOrUpdate(author) == null)
            return ResponseEntity.status(HttpStatus.FAILED_DEPENDENCY).body(null);
        return ResponseEntity.status(HttpStatus.OK).body(HttpStatus.OK);
    }
}
