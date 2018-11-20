package app.service.impl;

import app.DAO.*;

public class BaseServiceImpl {
	protected UserDAO userDAO;
	protected CategoryDAO categoryDAO;
	protected BookDAO bookDAO;
	protected CategoryDetailDAO categoryDetailDAO;
	protected AuthorDAO authorDAO;

	public AuthorDAO getAuthorDAO() {
		return authorDAO;
	}

	public void setAuthorDAO(AuthorDAO authorDAO) {
		this.authorDAO = authorDAO;
	}

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
