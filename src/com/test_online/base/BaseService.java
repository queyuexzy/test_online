/*  
 * @(#) baseService.java Create on 2015年3月23日 上午10:23:24   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.base;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 
 * @author zhangying
 * @date   2015年3月23日
 */
public class BaseService {
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
}
