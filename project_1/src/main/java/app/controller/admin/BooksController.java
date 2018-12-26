package app.controller.admin;


import app.DTO.BookDTO;
import app.controller.BaseController;
import app.helper.FileUploadForm;
import app.helper.Helper;
import app.model.Book;
import app.utils.CloudinaryUtils;
import app.utils.ImageUtils;
import com.cloudinary.Cloudinary;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

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
    public String createBook(BookDTO bookDTO, @ModelAttribute("uploadForm") FileUploadForm uploadForm, Model model) {
        if (createOrUpdate(bookDTO, uploadForm)){
            model.addAttribute("messages", "error");
            return "redirect:/admin/books";
        }
            return "redirect:/admin/books";
    }

    @RequestMapping(method = RequestMethod.PUT)
    public String updatebook(BookDTO bookDTO, @ModelAttribute("uploadForm") FileUploadForm uploadForm, Model model) {
        if (createOrUpdate(bookDTO, uploadForm)){
            model.addAttribute("messages", "error");
            return "redirect:/admin/books";
        }
        return "redirect:/admin/books";
    }

    private boolean createOrUpdate(BookDTO bookDTO, FileUploadForm uploadForm) {
        if (bookDTO == null || uploadForm == null)
            return false;

        List<MultipartFile> files = uploadForm.getFiles();


        if (null == files && files.size() <= 0) {
            return false;

        }

        String imageName = "";
        for (MultipartFile multipartFile : files) {
            imageName = imageName + cloudinaryUtils.upLoadIamge(multipartFile) + "#";
        }
        Book book = new Book(bookDTO, imageName,
                authorService.findById(bookDTO.getAuthor()),
                producerService.findById(bookDTO.getProducer()),
                categoryDetailService.findById(bookDTO.getCategoryDetail())
        );
        if (bookService.saveOrUpdate(book) == null)
            return false;
        return true;
    }
}
