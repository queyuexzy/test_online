/*  
 * @(#) BaseDao.java Create on 2015年3月23日 上午8:59:07   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.base;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 
 * @author zhangying
 * @param <T>
 * @date   2015年3月23日
 */
public class BaseDao<T> {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	protected Transaction TRANSACTION;

	
	protected Session SESSION;
	
	@Autowired
	private void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	protected void openSession(){
		SESSION = sessionFactory.openSession();
	}
	
	protected void beginTransaction(){
		TRANSACTION = SESSION.beginTransaction();
	}
	
	protected void rollBack(){
		TRANSACTION.rollback();
	}
	
	protected void commit(){
		TRANSACTION.commit();
	}
	
	protected void close() {
		SESSION.close();
	}
	
	protected synchronized void save(T transientInstance) {
		try {
			openSession();
			beginTransaction();
			SESSION.save(transientInstance);
		} catch (RuntimeException re) {
			re.printStackTrace();
			rollBack();
			throw re;
		}finally{
			commit();
			close();
		}
	}
	
	protected synchronized void delete(T persistentInstance) {
		try {
			openSession();
			beginTransaction();
			SESSION.delete(persistentInstance);
		} catch (RuntimeException re) {
			re.printStackTrace();
			rollBack();
			throw re;
		}finally{
			commit();
			close();
		}
	}
	
	@SuppressWarnings("unchecked")
	protected synchronized List<T> findByProperty(String persistenceName,String propertyName, Object value) {
		try {
			openSession();
			beginTransaction();
			String queryString = "from " + persistenceName +" as model where model." + propertyName + "= ?";
			Query queryObject = SESSION.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			re.printStackTrace();
			rollBack();
			throw re;
		}finally{
			commit();
			close();
		}
	}
	
	@SuppressWarnings("unchecked")
	protected synchronized List<T> findAll(String persistentName) {
		try {
			openSession();
			beginTransaction();
			String queryString = "from " + persistentName;
			Query queryObject = SESSION.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			re.printStackTrace();
			rollBack();
			throw re;
		}finally{
			commit();
			close();
		}
	}
	
	protected synchronized void update(T updateInstance) {
		try {
			openSession();
			beginTransaction();
			SESSION.update(updateInstance);
		} catch (RuntimeException re) {
			re.printStackTrace();
			rollBack();
			throw re;
		}finally{
			commit();
			close();
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public synchronized T findById(Class<T> clazz,java.lang.Integer id) {
		try {
			openSession();
			beginTransaction();
			T instance = (T) SESSION.get(clazz,id);
			return instance;
		} catch (RuntimeException re) {
			re.printStackTrace();
			throw re;
		}finally{
			commit();
			close();
		}
	}
	
}
