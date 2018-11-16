package app.controller.client;

import app.bean.BookInfo;
import app.controller.BaseController;
import app.model.Book;
import app.model.Review;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/books")
public class BookController extends BaseController {
    @RequestMapping(value = "/info/{id}")
    public String loadAndBook(@PathVariable Integer id, Model model) {
        Book book = bookService.findById(id);
        List<Review> reviews = reviewService.findByBookId(id);
        model.addAttribute("reviews", reviews);
        model.addAttribute("book", book);
        return "/client/detail";
    }

    @RequestMapping(value = "/{id}")
    public @ResponseBody
    BookInfo loadBookJson(@PathVariable Integer id) {
        Book book = bookService.findById(id);
        return new BookInfo(book);
    }

    @RequestMapping(value = "/search")
    public String searchBook(@RequestParam String bookName, Model model){
        model.addAttribute("books", bookService.findByName(bookName));
        return "/client/searchResult";
    }
}

