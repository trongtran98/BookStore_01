package app.service.impl;

import app.DAO.UserDAO;

public class BaseServiceImpl {
	protected UserDAO userDAO;

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
}
