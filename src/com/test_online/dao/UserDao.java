/*  
 * @(#) UserDao.java Create on 2015年3月20日 下午2:11:10   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao;

import java.util.List;

import com.test_online.module.UserBean;

/**
 * 
 * @author zhangying
 * @date   2015年3月20日
 */
public interface UserDao {

	// property constants
	public static final String ID = "id";
	public static final String NAME = "name";
	public static final String PASSWORD = "password";
	public static final String TEAM_STATUS = "teamStatus";
	public static final String AGE = "age";
	public static final String BIRTHDAY = "birthday";
	public static final String ADDRESS = "address";
	public static final String TEL = "tel";
	public static final String EMAIL = "email";
	public static final String REMARK = "remark";
	
	
	public static final int STATUS_ADMIN = 0;
	public static final int STATUS_TEACHER = 1;
	public static final int STATUS_STUDENT = 2;
	
	/**
	 * save a UserBean
	 * @Title: save
	 * @data:2015年3月24日上午10:07:36
	 * @author:zhangying
	 * @param transientInstance void
	 */
	public void save(UserBean transientInstance);
	
	/**
	 * delete a UserBean
	 * @Title: delete
	 * @data:2015年3月24日上午10:07:50
	 * @author:zhangying
	 * @param persistentInstance void
	 */
	public void delete(UserBean persistentInstance);
	
	/**
	 * find a UserBean instance by id
	 * @Title: findById
	 * @data:2015年3月24日上午10:08:03
	 * @author:zhangying
	 * @param id
	 * @return UserBean
	 */
	public UserBean findById(java.lang.Integer id);
	
	/**
	 * find a list of UserBean instances by teamStatus
	 * @Title: findByTeamStatus
	 * @data:2015年3月24日上午10:08:18
	 * @author:zhangying
	 * @param teamStatus
	 * @return List<UserBean>
	 */
	public List<UserBean> findByTeamStatus(int teamStatus);
	
	/**
	 * find all UserBean instances
	 * @Title: findAll
	 * @data:2015年3月24日上午10:08:40
	 * @author:zhangying
	 * @return List<UserBean>
	 */
	public List<UserBean> findAll();
	
	/**
	 * update a UserBean instance
	 * @Title: update
	 * @data:2015年3月24日上午10:08:57
	 * @author:zhangying
	 * @param updateInstance void
	 */
	public void update(UserBean updateInstance);
}
