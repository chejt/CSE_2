package com.movie.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.movie.dao.api.ReviewDao;
import com.movie.form.Actor;
import com.movie.form.Review;

@Transactional
@Repository(value = "reviewDaoImpl")
public class ReviewDaoImpl implements ReviewDao{
	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;
	public List<Review> getReviewByMovieId(int movieId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Review review where review.movieId=:movieId").setParameter("movieId", movieId);
		List<Review> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
	public boolean addReview(Review review) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.save(review);
		}catch(HibernateException e){
			return false;
		}
		return true;
	}
	public boolean deleteReview(Review review) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.delete(review);
		} catch (HibernateException e) {
			return false;
		} 
		return true;
	}
	public List<Review> getReviewByKeyWordPage(String keyword, int page,
			int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = null;
		try {
			query = session.createQuery(
					"from Review review where review.content like :keyword");
			query.setParameter("keyword", "%"+keyword+"%");
		} catch (HibernateException e) {
			e.printStackTrace();
		} 
		@SuppressWarnings("unchecked")
		List<Review> resultList = query.setFirstResult((page - 1) * pageSize).setMaxResults(pageSize).list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
	public boolean updateReview(Review review) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(review);
		} catch (HibernateException e) {
			return false;
		} 
		return true;
	}
	public long getReviewCount(String keyword) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Review review where review.content like :keyword");
		query.setParameter("keyword", "%"+keyword+"%");
		return (Long) query.iterate().next();
	}
	public Review getReviewById(int reviewId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Review review where review.id=:id").setParameter("id", reviewId);
		List<Review> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}

}
