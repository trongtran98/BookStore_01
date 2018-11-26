package app.service.impl;

import app.DAO.*;

public class BaseServiceImpl {
	protected UserDAO userDAO;
	protected CategoryDAO categoryDAO;
	protected BookDAO bookDAO;
	protected CategoryDetailDAO categoryDetailDAO;
	protected AuthorDAO authorDAO;
	protected CartDAO cartDAO;
	protected CartDetailDAO cartDetailDAO;

	public AuthorDAO getAuthorDAO() {
		return authorDAO;
	}

	public void setAuthorDAO(AuthorDAO authorDAO) {
		this.authorDAO = authorDAO;
	}

	protected ReviewDAO reviewDAO;

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


	public ReviewDAO getReviewDAO() {
		return reviewDAO;
	}

	public void setReviewDAO(ReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}

	public CartDAO getCartDAO() {
		return cartDAO;
	}

	public void setCartDAO(CartDAO cartDAO) {
		this.cartDAO = cartDAO;
	}

	public CartDetailDAO getCartDetailDAO() {
		return cartDetailDAO;
	}

	public void setCartDetailDAO(CartDetailDAO cartDetailDAO) {
		this.cartDetailDAO = cartDetailDAO;
	}
}
