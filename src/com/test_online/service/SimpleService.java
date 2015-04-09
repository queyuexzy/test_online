/*  
 * @(#) SimpleService.java Create on 2015年3月24日 上午9:41:19   
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
public interface SimpleService {

	/**
	 * get simples for table#simpleTabFlexiGrid
	 * @Title: getSimplesByTeamId
	 * @data:2015年3月27日下午5:29:26
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException FlexiGrid
	 */
	public FlexiGrid getSimplesByTeamId(RequestParameter param) throws RequestParameterException;
	
	
	/**
	 * add a Simple Bean to the database
	 * @Title: addService
	 * @data:2015年3月30日上午8:53:29
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse addSimple(RequestParameter param) throws RequestParameterException;
	
	/**
	 * get a Simple bean by id 
	 * @Title: getBlankById
	 * @data:2015年3月30日上午9:08:26
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse getSimpleById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * update a Simple bean
	 * @Title: updateSimple
	 * @data:2015年3月30日上午9:16:06
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updateSimple(RequestParameter param) throws RequestParameterException;
	
	/**
	 * delete a simple bean 
	 * @Title: deleteSimple
	 * @data:2015年3月30日上午9:27:38
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse deleteSimple(RequestParameter param) throws RequestParameterException;
	
	/**
	 * update a Simple bean in the database
	 * @Title: updateSimpleBankById
	 * @data:2015年3月30日上午10:03:44
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updateSimpleBankById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * update the paper property of the Simple bean for the SimpleBean
	 * @Title: updatePaperById
	 * @data:2015年3月30日上午10:17:58
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updatePaperById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * unuse the paper property by id for the Simple bean
	 * @Title: unusePaperById
	 * @data:2015年3月30日上午10:28:26
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse unusePaperById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * reuse the simple property of the Simple bean
	 * @Title: reuseSimpleById
	 * @data:2015年3月30日上午10:34:25
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse reuseSimpleById(RequestParameter param) throws RequestParameterException;
	
	
	
}
