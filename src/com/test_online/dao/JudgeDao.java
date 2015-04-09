/*  
 * @(#) JudgeDao.java Create on 2015年3月20日 下午2:09:55   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao;

import java.util.List;

import com.test_online.module.JudgeBean;

/**
 * 
 * @author zhangying
 * @date   2015年3月20日
 */
public interface JudgeDao {
	
	// property constants
	public static final String ID = "id";
	public static final String BANK_ID = "bankId";
	public static final String PAPER_ID = "paperId";
	public static final String TOPIC = "topic";
	public static final String ANSWER = "answer";
	public static final String USE_STATUS = "useStatus";
	public static final String REMARK = "remark";
	
	public static final String SCORE = "score";
	
	public static final int ANSWER_TRUE = 1;
	public static final int ANSWER_FALSE = 0;

	
	/**
	 * save a JudgeBean instance
	 * @Title: save
	 * @data:2015年3月23日下午4:32:11
	 * @author:zhangying
	 * @param transientInstance void
	 */
	public void save(JudgeBean transientInstance);
	
	/**
	 * delete a JudgeBean instance
	 * @Title: delete
	 * @data:2015年3月23日下午4:32:24
	 * @author:zhangying
	 * @param persistentInstance void
	 */
	public void delete(JudgeBean persistentInstance);
	
	/**
	 * find a JudgeBean instance by id
	 * @Title: findById
	 * @data:2015年3月23日下午4:32:36
	 * @author:zhangying
	 * @param id
	 * @return JudgeBean
	 */
	public JudgeBean findById(java.lang.Integer id);
	
	/**
	 * find a list of JudgeBean instance by bankId
	 * @Title: findByBankId
	 * @data:2015年3月23日下午4:32:50
	 * @author:zhangying
	 * @param bankId
	 * @return List<JudgeBean>
	 */
	public List<JudgeBean> findByBankId(int bankId);
	
	/**
	 * find a list of JudgeBean by paperId
	 * @Title: findByPaperId
	 * @data:2015年3月23日下午4:33:13
	 * @author:zhangying
	 * @param paperId
	 * @return List<JudgeBean>
	 */
	public List<JudgeBean> findByPaperId(int paperId);
	
	/**
	 * find a list of JudgeBean instance by useStatus
	 * @Title: findByUseStatus
	 * @data:2015年3月23日下午4:33:32
	 * @author:zhangying
	 * @param useStatus
	 * @return List<JudgeBean>
	 */
	public List<JudgeBean> findByUseStatus(boolean useStatus);
	
	/**
	 * find all JudgeBean instances
	 * @Title: findAll
	 * @data:2015年3月23日下午4:33:55
	 * @author:zhangying
	 * @return List<JudgeBean>
	 */
	public List<JudgeBean> findAll();
	
	/**
	 * update a JudgeBean instance
	 * @Title: update
	 * @data:2015年3月23日下午4:34:11
	 * @author:zhangying
	 * @param updateInstance void
	 */
	public void update(JudgeBean updateInstance);

}
