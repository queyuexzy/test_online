/*  
 * @(#) ChooseAnswerDao.java Create on 2015年3月20日 下午2:09:24   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao;

import java.util.List;

import com.test_online.module.ChooseAnswerBean;

/**
 * 
 * @author zhangying
 * @date   2015年3月20日
 */
public interface ChooseAnswerDao {

	// property constants
	public static final String USER_ID = "userId";
	public static final String CHOOSE_ID = "chooseId";
	public static final String ANSWER = "answer";
	public static final String SCORE = "score";
	public static final String REMARK = "remark";
	
	/**
	 * save a ChooseAnswerBean instance
	 * @Title: save
	 * @data:2015年3月23日下午2:56:05
	 * @author:zhangying
	 * @param transientInstance void
	 */
	public void save(ChooseAnswerBean transientInstance);
	
	/**
	 * delete a ChooseAnswerBean instance
	 * @Title: delete
	 * @data:2015年3月23日下午2:56:35
	 * @author:zhangying
	 * @param persistentInstance void
	 */
	public void delete(ChooseAnswerBean persistentInstance);
	
	/**
	 * find a ChooseAnswerBean instance by id
	 * @Title: findById
	 * @data:2015年3月23日下午2:56:52
	 * @author:zhangying
	 * @param id
	 * @return ChooseAnswerBean
	 */
	public ChooseAnswerBean findById(java.lang.Integer id);
	
	/**
	 * find a list of ChooseAnswerBean by userId
	 * @Title: findByUserId
	 * @data:2015年3月23日下午2:57:23
	 * @author:zhangying
	 * @param userId
	 * @return List<ChooseAnswerBean>
	 */
	public List<ChooseAnswerBean> findByUserId(int userId);
	
	/**
	 * find a list of ChooseAnswerBean by chooseId
	 * @Title: findByChooseId
	 * @data:2015年3月23日下午2:57:51
	 * @author:zhangying
	 * @param chooseId
	 * @return List<ChooseAnswerBean>
	 */
	public List<ChooseAnswerBean> findByChooseId(Object chooseId);
	
	/**
	 * find all ChooseAnswerbean
	 * @Title: findAll
	 * @data:2015年3月23日下午2:58:22
	 * @author:zhangying
	 * @return List<ChooseAnswerBean>
	 */
	public List<ChooseAnswerBean> findAll();
	
	/**
	 * update a ChooseAnswerBean
	 * @Title: update
	 * @data:2015年3月23日下午2:58:48
	 * @author:zhangying
	 * @param updateInstance void
	 */
	public void update(ChooseAnswerBean updateInstance);
}
