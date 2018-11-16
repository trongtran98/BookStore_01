package app.service.impl;

import app.DAO.BookDAO;
import app.DAO.CategoryDAO;
import app.DAO.CategoryDetailDAO;
import app.DAO.UserDAO;

public class BaseServiceImpl {
	protected UserDAO userDAO;
	protected CategoryDAO categoryDAO;
	protected BookDAO bookDAO;
	protected CategoryDetailDAO categoryDetailDAO;

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public BookDAO getBookDAO() {
		return bookDAO;
	}

	public void setBookDAO(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}

	public CategoryDetailDAO getCategoryDetailDAO() {
		return categoryDetailDAO;
	}

	public void setCategoryDetailDAO(CategoryDetailDAO categoryDetailDAO) {
		this.categoryDetailDAO = categoryDetailDAO;
	}

	public CategoryDAO getCategoryDAO() {
		return categoryDAO;
	}

	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}
}
