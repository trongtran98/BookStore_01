package app.controller;

import app.info.UtilConvertModel;
import app.service.*;
import app.utlis.GoogleUtils;
import app.utlis.MailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

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
    protected BCryptPasswordEncoder encoder;
}
