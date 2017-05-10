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

import com.movie.dao.api.PerformDao;
import com.movie.form.Performs;
@Transactional
@Repository(value = "performDaoImpl")
public class PerformDaoImpl implements PerformDao {
	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;
	public List<Performs> getPerformByActorId(int actorId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = null;
		try {
			query = session.createQuery(
					"from Performs perfoms where perfoms.actorId =:actorId").setParameter(
					"actorId", actorId);
		} catch (HibernateException e) {
			e.printStackTrace();
		} 
		@SuppressWarnings("unchecked")
		List<Performs> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}

	public List<Performs> getPerformByMoiveId(int movieId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = null;
		try {
			query = session.createQuery(
					"from Performs perfoms where perfoms.movieId =:movieId").setParameter(
					"movieId", movieId);
		} catch (HibernateException e) {
			e.printStackTrace();
		} 
		@SuppressWarnings("unchecked")
		List<Performs> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}


	public boolean deletePerform(Performs pId) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.delete(pId);
		} catch (HibernateException e) {
			return false;
		} 
		return true;
	}

}
