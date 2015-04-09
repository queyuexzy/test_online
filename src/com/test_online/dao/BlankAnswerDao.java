/*  
 * @(#) BlankAnswerDao.java Create on 2015年3月20日 下午2:08:49   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao;

import java.util.List;

import com.test_online.module.BlankAnswerBean;

/**
 * 
 * @author zhangying
 * @date   2015年3月20日
 */
public interface BlankAnswerDao {
	// property constants
	public static final String USER_ID = "userId";
	public static final String BLANK_ID = "blankId";
	public static final String ANSWER = "answer";
	public static final String SCORE = "score";
	public static final String REMARK = "remark";
	
	/**
	 * save a BlankAnserBean
	 * @Title: save
	 * @data:2015年3月20日下午2:46:48
	 * @author:zhangying
	 * @param transientInstance void
	 */
	public void save(BlankAnswerBean transientInstance);
	
	/**
	 * delete a BlankAnswerBean
	 * @Title: delete
	 * @data:2015年3月20日下午2:47:08
	 * @author:zhangying
	 * @param persistentInstance void
	 */
	public void delete(BlankAnswerBean persistentInstance);
	
	/**
	 * find a BlankAnswerBean by id
	 * @Title: findById
	 * @data:2015年3月20日下午2:47:23
	 * @author:zhangying
	 * @param id
	 * @return BlankAnswerBean
	 */
	public BlankAnswerBean findById(java.lang.Integer id);
	
	/**
	 * find a BlankAnswerBean by userId
	 * @Title: findByUserId
	 * @data:2015年3月20日下午2:47:46
	 * @author:zhangying
	 * @param userId
	 * @return List<BlankAnswerBean>
	 */
	public List<BlankAnswerBean> findByUserId(int userId);
	
	/**
	 * find a BlankAnswerBean by blankId
	 * @Title: findByBlankId
	 * @data:2015年3月20日下午2:48:17
	 * @author:zhangying
	 * @param blankId
	 * @return List<BlankAnswerBean>
	 */
	public List<BlankAnswerBean> findByBlankId(int blankId);
	
	/**
	 * find all BlankAnswerBeans
	 * @Title: findAll
	 * @data:2015年3月20日下午2:48:48
	 * @author:zhangying
	 * @return List<BlankAnswerBean>
	 */
	public List<BlankAnswerBean> findAll();
	
	/**
	 * update a BlankAnswerBean
	 * @Title: update
	 * @data:2015年3月20日下午2:49:54
	 * @author:zhangying
	 * @param updateInstance void
	 */
	public void update(BlankAnswerBean updateInstance);
	
	

}
