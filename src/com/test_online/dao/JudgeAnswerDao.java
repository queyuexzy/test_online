/*  
 * @(#) JudgeAnswerDao.java Create on 2015年3月20日 下午2:10:07   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao;

import java.util.List;

import com.test_online.module.JudgeAnswerBean;

/**
 * 
 * @author zhangying
 * @date   2015年3月20日
 */
public interface JudgeAnswerDao {
	
	// property constants
	public static final String USER_ID = "userId";
	public static final String JUDGE_ID = "judgeId";
	public static final String ANSWER = "answer";
	public static final String SCORE = "score";
	public static final String REMARK = "remark";
	
	/**
	 * save a JudgeAnswerBean instance
	 * @Title: save
	 * @data:2015年3月23日下午4:07:55
	 * @author:zhangying
	 * @param transientInstance void
	 */
	public void save(JudgeAnswerBean transientInstance);
	
	/**
	 * delete a JudgeAnswerBean
	 * @Title: delete
	 * @data:2015年3月23日下午4:08:17
	 * @author:zhangying
	 * @param persistentInstance void
	 */
	public void delete(JudgeAnswerBean persistentInstance);
	
	/**
	 * find a JudgeAnswerBean by id
	 * @Title: findById
	 * @data:2015年3月23日下午4:08:48
	 * @author:zhangying
	 * @param id
	 * @return JudgeAnswerBean
	 */
	public JudgeAnswerBean findById(java.lang.Integer id);
	
	/**
	 * find a list of JudgeAnswerBean by userId
	 * @Title: findByUserId
	 * @data:2015年3月23日下午4:09:04
	 * @author:zhangying
	 * @param userId
	 * @return List<JudgeAnswerBean>
	 */
	public List<JudgeAnswerBean> findByUserId(int userId);
	
	/**
	 * find a JudgeAnswerBean by judgeId
	 * @Title: findByJudgeId
	 * @data:2015年3月23日下午4:09:27
	 * @author:zhangying
	 * @param judgeId
	 * @return List<JudgeAnswerBean>
	 */
	public List<JudgeAnswerBean> findByJudgeId(int judgeId);
	
	/**
	 * find all JudgeAnswerBean instances
	 * @Title: findAll
	 * @data:2015年3月23日下午4:09:53
	 * @author:zhangying
	 * @return List<JudgeAnswerBean>
	 */
	public List<JudgeAnswerBean> findAll();
	
	/**
	 * update a JudgeAnswerBean instance
	 * @Title: update
	 * @data:2015年3月23日下午4:10:11
	 * @author:zhangying
	 * @param updateInstance void
	 */
	public void update(JudgeAnswerBean updateInstance);

}
