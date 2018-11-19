package app.controller;

import app.service.BookService;
import app.service.CategoryDetailService;
import app.service.CategoryService;
import app.service.UserService;
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
}
