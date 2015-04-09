/*  
 * @(#) AdminService.java Create on 2015年4月7日 上午9:44:19   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.service;

import com.test_online.base.BaseAction.RequestParameter;
import com.test_online.base.BaseAction.RequestParameterException;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.util.AjaxResponse;

/**
 * 
 * @author zhangying
 * @date   2015年4月7日
 */
public interface AdminService {

	/**
	 * find all the team info in the user_info(the teamStatus is 2)
	 * @Title: findTeams
	 * @data:2015年4月7日上午9:46:28
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException FlexiGrid
	 */
	public FlexiGrid findTeams(RequestParameter param) throws RequestParameterException;
	
	/**
	 * delete the bank by bankId
	 * @Title: deleteBankById
	 * @data:2015年4月7日上午11:33:51
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse deleteBankById(RequestParameter param) throws RequestParameterException;

	/**
	 * delete a row in the user_info by id
	 * @Title: deleteTeamById
	 * @data:2015年4月7日下午2:03:45
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException Object
	 */
	public AjaxResponse deleteTeamById(RequestParameter param)throws RequestParameterException;

	/**
	 * add a row in the bank_info
	 * @Title: addBank
	 * @data:2015年4月7日下午2:52:29
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException Object
	 */
	public AjaxResponse addBank(RequestParameter param)throws RequestParameterException;

	/**
	 * add a row in the user_info
	 * @Title: addTeam
	 * @data:2015年4月7日下午4:10:14
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse addTeam(RequestParameter param)throws RequestParameterException;
}
