/*  
 * @(#) ChooseDao.java Create on 2015年3月20日 下午2:09:34   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao;

import java.util.List;

import com.test_online.module.ChooseBean;

/**
 * 
 * @author zhangying
 * @date   2015年3月20日
 */
public interface ChooseDao {
	// property constants
	public static final String ID = "id";
	public static final String BANK_ID = "bankId";
	public static final String PAPER_ID = "paperId";
	public static final String TOPIC = "topic";
	public static final String OPTION_A = "optionA";
	public static final String OPTION_B = "optionB";
	public static final String OPTION_C = "optionC";
	public static final String OPTION_D = "optionD";
	public static final String ANSWER = "answer";
	public static final String USE_STATUS = "useStatus";
	public static final String REMARK = "remark";
	public static final String SCORE = "score";
	
	/**
	 * save a ChooseBean instance
	 * @Title: save
	 * @data:2015年3月23日下午3:28:31
	 * @author:zhangying
	 * @param transientInstance void
	 */
	public void save(ChooseBean transientInstance);
	
	/**
	 * delete a ChooseBean instance
	 * @Title: delete
	 * @data:2015年3月23日下午3:28:50
	 * @author:zhangying
	 * @param persistentInstance void
	 */
	public void delete(ChooseBean persistentInstance);
	
	/**
	 * find a ChooseBean instance by id
	 * @Title: findById
	 * @data:2015年3月23日下午3:29:09
	 * @author:zhangying
	 * @param id
	 * @return ChooseBean
	 */
	public ChooseBean findById(java.lang.Integer id);
	
	/**
	 * find a list of ChooseBean instances by bankId
	 * @Title: findByBankId
	 * @data:2015年3月23日下午3:29:25
	 * @author:zhangying
	 * @param bankId
	 * @return List<ChooseBean>
	 */
	public List<ChooseBean> findByBankId(int bankId);
	
	/**
	 * find a list of ChooseBean instances by paperId
	 * @Title: findByPaperId
	 * @data:2015年3月23日下午3:29:56
	 * @author:zhangying
	 * @param paperId
	 * @return List<ChooseBean>
	 */
	public List<ChooseBean> findByPaperId(int paperId);
	
	/**
	 * find a list of ChooseBean by useStatus
	 * @Title: findByUseStatus
	 * @data:2015年3月23日下午3:30:27
	 * @author:zhangying
	 * @param useStatus
	 * @return List<ChooseBean>
	 */
	public List<ChooseBean> findByUseStatus(boolean useStatus);
	
	/**
	 * find all ChooseBean instances
	 * @Title: findAll
	 * @data:2015年3月23日下午3:31:19
	 * @author:zhangying
	 * @return List<ChooseBean>
	 */
	public List<ChooseBean> findAll();
	
	/**
	 * update a ChooseBean instance
	 * @Title: update
	 * @data:2015年3月23日下午3:31:37
	 * @author:zhangying
	 * @param updateInstance void
	 */
	public void update(ChooseBean updateInstance);
	
	
}
