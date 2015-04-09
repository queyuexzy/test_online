/*  
 * @(#) SimpleAnswerDao.java Create on 2015年3月20日 下午2:10:41   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao;

import java.util.List;

import com.test_online.module.SimpleAnswerBean;

/**
 * 
 * @author zhangying
 * @date   2015年3月20日
 */
public interface SimpleAnswerDao {
	// property constants
	public static final String USER_ID = "userId";
	public static final String SIMPLE_ID = "simpleId";
	public static final String ANSWER = "answer";
	public static final String SCORE = "score";
	public static final String REMARK = "remark";
	
	/**
	 * save a SimpleAnswerBean instance
	 * @Title: save
	 * @data:2015年3月23日下午5:14:12
	 * @author:zhangying
	 * @param transientInstance void
	 */
	public void save(SimpleAnswerBean transientInstance);
	
	/**
	 * delete a SimpleAnswerBean instance
	 * @Title: delete
	 * @data:2015年3月23日下午5:14:33
	 * @author:zhangying
	 * @param persistentInstance void
	 */
	public void delete(SimpleAnswerBean persistentInstance);
	
	/**
	 * find a SimpleAnswerBean by id
	 * @Title: findById
	 * @data:2015年3月23日下午5:14:52
	 * @author:zhangying
	 * @param id
	 * @return SimpleAnswerBean
	 */
	public SimpleAnswerBean findById(java.lang.Integer id);
	
	/**
	 * find a list of SimpleAnswerBean by id
	 * @Title: findByUserId
	 * @data:2015年3月23日下午5:15:15
	 * @author:zhangying
	 * @param userId
	 * @return List<SimpleAnswerBean>
	 */
	public List<SimpleAnswerBean> findByUserId(int userId);
	
	/**
	 * find a list of SimpleAnswerBean by simpleId
	 * @Title: findBySimpleId
	 * @data:2015年3月23日下午5:15:51
	 * @author:zhangying
	 * @param simpleId
	 * @return List<SimpleAnswerBean>
	 */
	public List<SimpleAnswerBean> findBySimpleId(int simpleId);
	
	/**
	 * find all SimpleAnswerBean instances
	 * @Title: findAll
	 * @data:2015年3月23日下午5:16:16
	 * @author:zhangying
	 * @return List<SimpleAnswerBean>
	 */
	public List<SimpleAnswerBean> findAll();
	
	/**
	 * update a SimpleAnswerBean instance
	 * @Title: update
	 * @data:2015年3月23日下午5:16:35
	 * @author:zhangying
	 * @param updateInstance void
	 */
	public void update(SimpleAnswerBean updateInstance);
}
