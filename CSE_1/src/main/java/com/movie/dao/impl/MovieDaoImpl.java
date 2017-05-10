package com.movie.dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.movie.dao.api.MovieDao;
import com.movie.form.Movie;
@Transactional
@Repository(value = "movieDaoImpl")
public class MovieDaoImpl implements MovieDao{
	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;
	
	public List<Movie> getMovieByDataTime(String date) {
		Session session = sessionFactory.getCurrentSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Query query = null;
		try {
			query = session.createQuery(
					"from Movie movie where movie.releaseDate>:releaseDate").setParameter(
					"releaseDate", sdf.parse(date));
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		@SuppressWarnings("unchecked")
		List<Movie> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}

	public List<Movie> getMovieByVisit() {
		return null;
	}

	public boolean updateMovie(Movie movie) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(movie);
		} catch (HibernateException e) {
			return false;
		} 
		return true;
	}

	public boolean adddMovie(Movie movie) {
		return false;
	}

	public boolean deleteMovie(Movie movie) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.delete(movie);
		} catch (HibernateException e) {
			return false;
		} 
		return true;
	}

	public Movie getMovieById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Movie movie where movie.id=:id").setParameter("id", id);
		List<Movie> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}

	public List<Movie> getMovieByKeyWord(String keyword) {
		Session session = sessionFactory.getCurrentSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Query query = null;
		try {
			query = session.createQuery(
					"from Movie movie where movie.title like :keyword or synopsis like :keyword");
			query.setParameter("keyword", "%"+keyword+"%");
			query.setParameter("keyword", "%"+keyword+"%");
		} catch (HibernateException e) {
			e.printStackTrace();
		} 
		@SuppressWarnings("unchecked")
		List<Movie> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
	public List<Movie> getMovieByKeyWordPage(String keyword,int page,int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Query query = null;
		try {
			query = session.createQuery(
					"from Movie movie where movie.title like :keyword or synopsis like :keyword");
			query.setParameter("keyword", "%"+keyword+"%");
			query.setParameter("keyword", "%"+keyword+"%");
		} catch (HibernateException e) {
			e.printStackTrace();
		} 
		@SuppressWarnings("unchecked")
		List<Movie> resultList = query.setFirstResult((page - 1) * pageSize).setMaxResults(pageSize).list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
	public long getMovieCount(String keyword){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Movie movie where movie.title like :keyword or synopsis like :keyword ");
		query.setParameter("keyword", "%"+keyword+"%");
		query.setParameter("keyword", "%"+keyword+"%");
		return (Long) query.iterate().next();
	}
}
