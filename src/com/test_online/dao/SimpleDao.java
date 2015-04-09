/*  
 * @(#) SimpleDao.java Create on 2015年3月20日 下午2:10:56   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao;

import java.util.List;

import com.test_online.module.SimpleBean;

/**
 * 
 * @author zhangying
 * @date   2015年3月20日
 */
public interface SimpleDao {
	
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
	 * save a SimpleBean instance
	 * @Title: save
	 * @data:2015年3月23日下午5:30:52
	 * @author:zhangying
	 * @param transientInstance void
	 */
	public void save(SimpleBean transientInstance);
	
	/**
	 * delete a SimpleBean instance
	 * @Title: delete
	 * @data:2015年3月23日下午5:31:09
	 * @author:zhangying
	 * @param persistentInstance void
	 */
	public void delete(SimpleBean persistentInstance);
	
	/**
	 * find a SimpleBean instance by id
	 * @Title: findById
	 * @data:2015年3月23日下午5:31:26
	 * @author:zhangying
	 * @param id
	 * @return SimpleBean
	 */
	public SimpleBean findById(java.lang.Integer id);
	
	/**
	 * find a list of SimpleBean by bankId
	 * @Title: findByBankId
	 * @data:2015年3月23日下午5:31:42
	 * @author:zhangying
	 * @param bankId
	 * @return List<SimpleBean>
	 */
	public List<SimpleBean> findByBankId(int bankId);
	
	/**
	 * find a list of SimpleBean by paperId
	 * @Title: findByPaperId
	 * @data:2015年3月23日下午5:32:03
	 * @author:zhangying
	 * @param paperId
	 * @return List<SimpleBean>
	 */
	public List<SimpleBean> findByPaperId(int paperId);
	
	/**
	 * find a list of SimpleBean by useStatus
	 * @Title: findByUseStatus
	 * @data:2015年3月23日下午5:32:24
	 * @author:zhangying
	 * @param useStatus
	 * @return List<SimpleBean>
	 */
	public List<SimpleBean> findByUseStatus(boolean useStatus);
	
	/**
	 * find all SimpleBean instances
	 * @Title: findAll
	 * @data:2015年3月23日下午5:32:44
	 * @author:zhangying
	 * @return List<SimpleBean>
	 */
	public List<SimpleBean> findAll();
	
	/**
	 * update a SimpleBean 
	 * @Title: update
	 * @data:2015年3月23日下午5:33:00
	 * @author:zhangying
	 * @param updateInstance void
	 */
	public void update(SimpleBean updateInstance);

}
