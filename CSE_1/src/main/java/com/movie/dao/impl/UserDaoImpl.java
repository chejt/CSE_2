package com.movie.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import util.Constant;

import com.movie.dao.api.UserDao;
import com.movie.form.User;

@Transactional
@Repository(value = "userDaoImpl")
public class UserDaoImpl implements UserDao {

	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;

	public User getUserByUserName(String userName,String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(
				"from User user where user.username=:username and user.password =:password");
		query.setParameter("username", userName);
		query.setParameter("password", password);
		@SuppressWarnings("unchecked")
		List<User> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}

	public int saveUser(User user) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(user);
		} catch (Exception e) {
			return Constant.FAIL;
		}
		return Constant.SUCCESS;
	}

	public User getUserByUserId(long userId) {
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.get(User.class, userId);
		return user;
	}

	public int updateUser(User user) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(user);
			return Constant.SUCCESS;
		} catch (Exception e) {
			return Constant.FAIL;
		}
	}

	public List<User> getAllUser() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(
				"from User user");
		@SuppressWarnings("unchecked")
		List<User> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
}
