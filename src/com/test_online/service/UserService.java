/*  
 * @(#) UserService.java Create on 2015年3月18日 上午11:21:37   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.service;

import com.test_online.base.BaseAction.RequestParameter;
import com.test_online.base.BaseAction.RequestParameterException;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.module.UserBean;
import com.test_online.util.AjaxResponse;

/**
 * 
 * @author zhangying
 * @date   2015年3月18日
 */
public interface UserService {
	
	/**
	 * validate id the user exist
	 * @Title: validateUser
	 * @data:2015年3月18日下午1:55:49
	 * @author:zhangying
	 * @param id
	 * @param password
	 * @return boolean
	 */
	public AjaxResponse validateUser(RequestParameter parameter)throws RequestParameterException;
	
	/**
	 * get the user by id
	 * @Title: getUserById
	 * @data:2015年3月24日下午3:25:44
	 * @author:zhangying
	 * @param id
	 * @return UserBean
	 */
	public UserBean getUserById(int id);
	
	/**
	 * register a user
	 * @Title: register
	 * @data:2015年3月25日上午9:19:29
	 * @author:zhangying
	 * @param user void
	 */
	public AjaxResponse register(RequestParameter parameter)throws RequestParameterException;
	
	/**
	 * update a User in thd database
	 * @Title: updateUser
	 * @data:2015年3月26日上午10:57:32
	 * @author:zhangying
	 * @param parameter
	 * @return
	 * @throws RequestParameterException UserBean
	 */
	public UserBean updateUser(RequestParameter parameter) throws RequestParameterException;

	/**
	 * get the user list by teamStatus
	 * @Title: getUserByTeamStatus
	 * @data:2015年4月2日上午9:55:58
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException FlexiGrid
	 */
	public FlexiGrid getUserByTeamStatus(RequestParameter param) throws RequestParameterException;

	/**
	 * validate if the userId exist in the register.jsp
	 * @Title: idIfExist
	 * @data:2015年4月3日下午2:42:03
	 * @author:zhangying
	 * @param parameter
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse idIfExist(RequestParameter parameter) throws RequestParameterException;
}
