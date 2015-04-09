/*  
 * @(#) ChooseService.java Create on 2015年3月24日 上午9:40:04   
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
 * @date   2015年3月24日
 */
public interface ChooseService {

	/**
	 * get choose by teamId
	 * @Title: getChooseByTeamId
	 * @data:2015年3月26日下午5:22:04
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException FlexiGrid
	 */
	public FlexiGrid getChooseByTeamId(RequestParameter param) throws RequestParameterException;
	
	/**
	 * update a choose bean 
	 * @Title: updateChoose
	 * @data:2015年3月26日下午5:48:27
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updateChoose(RequestParameter param) throws RequestParameterException;
	
	/**
	 * add a choose bean to the database
	 * @Title: addChoose
	 * @data:2015年3月27日上午9:18:48
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse addChoose(RequestParameter param) throws RequestParameterException;
	
	/**
	 * delete a choose Bean from the database
	 * @Title: deleteChoose
	 * @data:2015年3月27日上午9:45:47
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse deleteChoose(RequestParameter param) throws RequestParameterException;
	
	/**
	 * get a choose bean by id
	 * @Title: getChooseById
	 * @data:2015年3月27日上午10:08:11
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse getChooseById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * reuse the choose by id
	 * @Title: reuseChooseById
	 * @data:2015年3月27日上午10:51:16
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse reuseChooseById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * update the bank info for the choose problem
	 * @Title: updateChooseBankById
	 * @data:2015年3月27日下午12:40:12
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updateChooseBankById(RequestParameter param) throws RequestParameterException;

	/**
	 * update the paper info for the choose
	 * @Title: updatePaperById
	 * @data:2015年3月27日下午2:42:38
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updatePaperById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * unuse the bank by id
	 * @Title: unuseBankById
	 * @data:2015年3月27日下午3:44:29
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse unusePaperById(RequestParameter param) throws RequestParameterException;
}
