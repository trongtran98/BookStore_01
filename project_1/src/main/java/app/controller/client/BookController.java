package app.controller.client;

import app.bean.BookInfo;
import app.controller.BaseController;
import app.model.Book;
import app.model.Review;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/books")
public class BookController extends BaseController {

    public final int BOOK_PER_PAGE = 10;
    private final int MAX_RESULT_RANDOM_BOOK = 3;


    @GetMapping(value = "/info/{id}")
    public String loadAndBook(@PathVariable Integer id, Model model) {
        Book book = bookService.findById(id);
        List<Review> reviews = reviewService.findByBookId(id);
        model.addAttribute("reviews", reviews);
        return "/client/detail";
    }

    @GetMapping(value = "/{id}")
    public @ResponseBody
    BookInfo loadBookJson(@PathVariable Integer id) {
        Book book = bookService.findById(id);
        return new BookInfo(book);
    }

    @GetMapping(value = "/search")
    public String searchBook(@RequestParam String bookName, Model model) {
        int bookCount = bookService.countByName(bookName);
        int page = (bookCount % BOOK_PER_PAGE == 0) ? (bookCount / BOOK_PER_PAGE) : (bookCount / BOOK_PER_PAGE + 1);
        model.addAttribute("pages", page);
        model.addAttribute("randomBooks", bookService.randomBooks(MAX_RESULT_RANDOM_BOOK));
        return "/client/searchResult";
    }


    @RequestMapping(value = "/pages/{page}/{bookName}")
    public @ResponseBody
    List<BookInfo> searchBookAjax(@PathVariable Integer page, @PathVariable String bookName) {
        List<BookInfo> books = bookService.findByName(bookName.trim(), page, BOOK_PER_PAGE);
        return books;
    }
}

