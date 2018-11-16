package app.controller;

import app.service.*;
import app.utlis.GoogleUtils;
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
}
