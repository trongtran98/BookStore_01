package app.service.impl;

import app.model.User;
import app.service.UserService;
import org.apache.log4j.Logger;

import java.io.Serializable;

public class UserServiceImpl extends BaseServiceImpl implements UserService {
	private static final Logger logger = Logger.getLogger(UserServiceImpl.class);

	@Override
	public User findById(Serializable key) {
		return null;
	}

	@Override
	public User saveOrUpdate(User entity) {
		return userDAO.saveOrUpdate(entity);
	}

	@Override
	public boolean delete(User entity) {
		return false;
	}
}
