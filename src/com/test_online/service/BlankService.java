/*  
 * @(#) BlankService.java Create on 2015年3月24日 上午9:39:31   
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
public interface BlankService {

	/**
	 * get the Blank by teamId
	 * @Title: getBlankByTeamId
	 * @data:2015年3月25日下午2:42:07
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public FlexiGrid getBlankByTeamId(RequestParameter param) throws RequestParameterException;
	
	/**
	 * add a blank bean to the database
	 * @Title: addBlank
	 * @data:2015年3月26日下午3:04:04
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse addBlank(RequestParameter param) throws RequestParameterException;
	
	/**
	 * delete a bankbean
	 * @Title: deleteBlank
	 * @data:2015年3月26日下午3:49:51
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws ReflectiveOperationException AjaxResponse
	 */
	public AjaxResponse deleteBlank(RequestParameter param) throws RequestParameterException;
	
	/**
	 * get Blank bean by id
	 * @Title: getBlankById
	 * @data:2015年3月26日下午4:31:03
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse getBlankById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * update the blank bean
	 * @Title: updateBlank
	 * @data:2015年3月26日下午4:47:38
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updateBlank(RequestParameter param) throws RequestParameterException;
	
	
	/**
	 * update the bank for the blank
	 * @Title: updateBlankBankById
	 * @data:2015年3月27日下午4:03:29
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updateBlankBankById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * update paper by id for the blank bean
	 * @Title: updatePaperById
	 * @data:2015年3月27日下午4:50:35
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updatePaperById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * unuse the paper by id for the blank bean
	 * @Title: unusePaperById
	 * @data:2015年3月27日下午4:59:54
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse unusePaperById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * reuse the blank by id for the blankbean
	 * @Title: reuseBlankById
	 * @data:2015年3月27日下午5:14:55
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse reuseBlankById(RequestParameter param) throws RequestParameterException;
	
	
}
