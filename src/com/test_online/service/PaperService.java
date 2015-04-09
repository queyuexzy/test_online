/*  
 * @(#) PaperService.java Create on 2015年3月24日 上午9:40:45   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.service;

import com.test_online.base.BaseAction.RequestParameter;
import com.test_online.base.BaseAction.RequestParameterException;
import com.test_online.flexigrid.bean.FlexiGrid;

/**
 * 
 * @author zhangying
 * @date   2015年3月24日
 */
public interface PaperService {

	/**
	 * find the papers by teamId
	 * @Title: findPapersByTeamId
	 * @data:2015年3月27日下午1:27:05
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public FlexiGrid findPapersByTeamId(RequestParameter param) throws RequestParameterException;
	
	/**
	 * find all the papers for table#paperInfoflexiGrid
	 * @Title: findAllPapers
	 * @data:2015年3月31日下午5:13:29
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException FlexiGrid
	 */
	public FlexiGrid findAllPapers(RequestParameter param) throws RequestParameterException;
	
}
