package app.controller;

import app.info.UtilConvertModel;
import app.service.*;
import app.utils.CloudinaryUtils;
import app.utils.GoogleUtils;
import app.utils.MailUtils;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseController {
    @Autowired
    protected CategoryService categoryService;
    @Autowired
    protected BookService bookService;
    @Autowired
    protected CategoryDetailService categoryDetailService;
    @Autowired
    protected UserService userService;
    @Autowired
    protected GoogleUtils googleUtils;
    @Autowired
    protected AuthorService authorService;
    @Autowired
    protected ReviewService reviewService;
    @Autowired
    protected CartService cartService;
    @Autowired
    protected CartDetailService cartDetailService;
    @Autowired
    protected ProducerService producerService;
    @Autowired
    protected OrderService orderService;
    @Autowired
    protected MailUtils mailUtils;
    @Autowired
    protected UtilConvertModel utilConvertModel;
    @Autowired
    protected OrderDetailService orderDetailService;
    @Autowired
    protected CloudinaryUtils cloudinaryUtils;
}
