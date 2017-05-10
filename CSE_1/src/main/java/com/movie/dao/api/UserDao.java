package com.movie.dao.api;

import java.util.List;

import com.movie.form.User;

public interface UserDao {
	public User getUserByUserName(String userName,String password);
	public List<User> getAllUser();
	public User getUserByUserId(long userId);

	public int saveUser(User user);

	public int updateUser(User user);
}
