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

import com.movie.dao.api.ActorDao;
import com.movie.form.Actor;
import com.movie.form.Movie;
import com.movie.form.Performs;
@Transactional
@Repository(value = "actorDaoImpl")
public class ActorDaoImpl implements ActorDao {
	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;
	public Actor getActorById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Actor actor where actor.id=:id").setParameter("id", id);
		List<Actor> resultList = query.list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList.get(0);
		}
	}
	public List<Actor> getActorByKeyWordPage(String keyword, int page,
			int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = null;
		try {
			query = session.createQuery(
					"from Actor actor where actor.name like :keyword");
			query.setParameter("keyword", "%"+keyword+"%");
		} catch (HibernateException e) {
			e.printStackTrace();
		} 
		@SuppressWarnings("unchecked")
		List<Actor> resultList = query.setFirstResult((page - 1) * pageSize).setMaxResults(pageSize).list();
		if (resultList.isEmpty()) {
			return null;
		} else {
			return resultList;
		}
	}
	public long getActorCount(String keyword){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Actor actor where actor.name like :keyword");
		query.setParameter("keyword", "%"+keyword+"%");
		return (Long) query.iterate().next();
	}
	public boolean updateActor(Actor actor) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(actor);
		} catch (HibernateException e) {
			return false;
		} 
		return true;
	}
	public boolean deleteActor(Actor actor) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.delete(actor);
		} catch (HibernateException e) {
			return false;
		} 
		return true;
	}

}
