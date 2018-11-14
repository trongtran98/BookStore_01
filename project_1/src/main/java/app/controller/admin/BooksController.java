package app.controller.admin;


import app.DTO.BookDTO;
import app.controller.BaseController;
import app.helper.Helper;
import app.model.Book;
import app.utils.ImageUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/books")
public class BooksController extends BaseController {

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {

        model.addAttribute("books", bookService.findBooks());
        model.addAttribute("authors", authorService.findAuthors());
        model.addAttribute("categoryDetails", categoryDetailService.findCategoryDetails());
        model.addAttribute("producers", producerService.findProducers());

        return "/admin/books";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public @ResponseBody
    BookDTO findById(@PathVariable Integer id) {
        if (id == null)
            return null;

        BookDTO bookDTO = new BookDTO(bookService.findById(id));

        return bookDTO;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity deleteBook(@PathVariable Integer id) {

        return Helper.delete(id, bookService.delete(id));

    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity createBook(BookDTO bookDTO ,MultipartFile multipartFile) {
        return createOrUpdate(bookDTO, multipartFile);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity updateAuthor(@RequestBody BookDTO bookDTO, MultipartFile image) {

        return createOrUpdate(bookDTO, image);
    }

    private ResponseEntity createOrUpdate(BookDTO bookDTO, MultipartFile multipartFile) {
        if (bookDTO == null || multipartFile == null)
            return ResponseEntity.status(HttpStatus.FAILED_DEPENDENCY).body(null);

        Book book = new Book(bookDTO, ImageUtils.renameBook(multipartFile.getOriginalFilename()),
                authorService.findById(bookDTO.getAuthor()),
                producerService.findById(bookDTO.getProducer()),
                categoryDetailService.findById(bookDTO.getCategoryDetail())
        );

        if (!ImageUtils.copyFileUsingStream(multipartFile))
            return ResponseEntity.status(HttpStatus.FAILED_DEPENDENCY).body(null);

        if (bookService.saveOrUpdate(book) == null)
            return ResponseEntity.status(HttpStatus.FAILED_DEPENDENCY).body(null);

        return ResponseEntity.status(HttpStatus.OK).body(null);

    }
}
