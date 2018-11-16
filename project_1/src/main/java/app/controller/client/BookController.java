package app.controller.client;

import app.bean.BookInfo;
import app.controller.BaseController;
import app.model.Book;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BookController extends BaseController {
    @RequestMapping(value = "/books/{id}")
    public @ResponseBody
    BookInfo loadBook(@PathVariable Integer id) {
        Book book = bookService.findById(id);
        return  new BookInfo(book);
    }
}

