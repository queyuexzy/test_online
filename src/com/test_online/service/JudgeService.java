/*  
 * @(#) JudgeService.java Create on 2015年3月24日 上午9:40:32   
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
public interface JudgeService {
	
	/**
	 * get judges by team id
	 * @Title: getJudgeByTeamId
	 * @data:2015年3月30日上午11:11:41
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException FlexiGrid
	 */
	public FlexiGrid getJudgeByTeamId(RequestParameter param) throws RequestParameterException;
	
	/**
	 * add a judge bean to the database
	 * @Title: addJudge
	 * @data:2015年3月30日上午11:29:28
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse addJudge(RequestParameter param) throws RequestParameterException;
	
	/**
	 * get a judge bean by id
	 * @Title: addJudgeById
	 * @data:2015年3月30日上午11:41:15
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse getJudgeById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * update a JudgeBean in the database
	 * @Title: updateJudge
	 * @data:2015年3月30日上午11:57:12
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updateJudge(RequestParameter param) throws RequestParameterException;
	
	/**
	 * delte a JudgeBean in the database
	 * @Title: deleteJudge
	 * @data:2015年3月30日下午12:45:08
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse deleteJudge(RequestParameter param) throws RequestParameterException;
	
	/**
	 * update Judge bean in the database
	 * @Title: updateJudgeBankById
	 * @data:2015年3月30日下午1:08:51
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updateJudgeBankById(RequestParameter param) throws RequestParameterException;
	
	/**
	 * unuse the paper property by id
	 * @Title: unusePaperById
	 * @data:2015年3月30日下午1:16:25
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse unusePaperById(RequestParameter param) throws RequestParameterException;

	/**
	 * update the paper property in the database for JudgeBean
	 * @Title: updatePaperById
	 * @data:2015年3月30日下午1:25:52
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updatePaperById(RequestParameter param)throws RequestParameterException;

	/**
	 * reuse the judge bean bu id 
	 * @Title: reuseJudgeById
	 * @data:2015年3月30日下午1:33:17
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse reuseJudgeById(RequestParameter param)throws RequestParameterException;
	
}
