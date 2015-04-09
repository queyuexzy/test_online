/*  
 * @(#) BankDao.java Create on 2015年3月20日 下午1:52:36   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao;

import java.util.List;

import com.test_online.module.BankBean;


/**
 * 
 * @author zhangying
 * @date   2015年3月20日
 */
public interface BankDao {
	// property constants
	public static final String ID = "id";
	public static final String TEAM_ID = "teamId";
	public static final String NAME = "name";
	public static final String REMARK = "remark";
	
	/**
	 * save a BankBean
	 * @Title: save
	 * @data:2015年3月20日下午2:31:03
	 * @author:zhangying
	 * @param transientInstance void
	 */
	public void save(BankBean transientInstance);
	
	/**
	 * delete a BankBean
	 * @Title: delete
	 * @data:2015年3月20日下午2:31:21
	 * @author:zhangying
	 * @param persistentInstance void
	 */
	public void delete(BankBean persistentInstance);
	
	/**
	 * find a BankBean by id
	 * @Title: findById
	 * @data:2015年3月20日下午2:31:32
	 * @author:zhangying
	 * @param id
	 * @return BankBean
	 */
	public BankBean findById(java.lang.Integer id);
	
	/**
	 * find a list of BankBean by teamId
	 * @Title: findByTeamId
	 * @data:2015年3月20日下午3:16:56
	 * @author:zhangying
	 * @param teamId
	 * @return List<BankBean>
	 */
	public List<BankBean> findByTeamId(int teamId);
	
	/**
	 * find all BankBean
	 * @Title: findAll
	 * @data:2015年3月20日下午2:31:48
	 * @author:zhangying
	 * @return List<BankBean>
	 */
	public List<BankBean> findAll();
	
	/**
	 * update a BankBean
	 * @Title: udpate
	 * @data:2015年3月20日下午2:32:10
	 * @author:zhangying
	 * @param updateInstance void
	 */
	public void update(BankBean updateInstance);
}
