/*  
 * @(#) BlankDao.java Create on 2015年3月20日 下午2:09:07   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao;

import java.util.List;

import com.test_online.module.BlankBean;

/**
 * 
 * @author zhangying
 * @date   2015年3月20日
 */
public interface BlankDao {
	// property constants
	public static final String ID = "id";
	public static final String BANK_ID = "bankId";
	public static final String PAPER_ID = "paperId";
	public static final String TOPIC = "topic";
	public static final String ANSWER = "answer";
	public static final String USE_STATUS = "useStatus";
	public static final String REMARK = "remark";
	public static final String SCORE = "score";
	
	
	/**
	 * save a BlankBean instance
	 * @Title: save
	 * @data:2015年3月23日下午2:29:51
	 * @author:zhangying
	 * @param transientInstance void
	 */
	public void save(BlankBean transientInstance);
	
	/**
	 * delete a BlankBean instance
	 * @Title: delete
	 * @data:2015年3月23日下午2:30:09
	 * @author:zhangying
	 * @param persistentInstance void
	 */
	public void delete(BlankBean persistentInstance);
	
	/**
	 * find a BlankBean instance by id
	 * @Title: findById
	 * @data:2015年3月23日下午2:30:28
	 * @author:zhangying
	 * @param id
	 * @return BlankBean
	 */
	public BlankBean findById(java.lang.Integer id);
	
	/**
	 * find a list of BlankBean instance by bankId
	 * @Title: findByBankId
	 * @data:2015年3月23日下午2:30:44
	 * @author:zhangying
	 * @param bankId
	 * @return List<BlankBean>
	 */
	public List<BlankBean> findByBankId(int bankId);
	
	/**
	 * find a list of BlankBean by paperId
	 * @Title: findByPaperId
	 * @data:2015年3月23日下午2:31:17
	 * @author:zhangying
	 * @param paperId
	 * @return List<BlankBean>
	 */
	public List<BlankBean> findByPaperId(int paperId);
	
	/**
	 * find a list of BlankBean by useStatus
	 * @Title: findByUseStatus
	 * @data:2015年3月23日下午2:31:40
	 * @author:zhangying
	 * @param useStatus
	 * @return List<BlankBean>
	 */
	public List<BlankBean> findByUseStatus(boolean useStatus);
	
	/**
	 * find all BlankBean
	 * @Title: findAll
	 * @data:2015年3月23日下午2:32:10
	 * @author:zhangying
	 * @return List<BlankBean>
	 */
	public List<BlankBean> findAll();
	
	/**
	 * update a BlankBean instance
	 * @Title: update
	 * @data:2015年3月23日下午2:38:59
	 * @author:zhangying
	 * @param updateInstance void
	 */
	public void update(BlankBean updateInstance);
}
