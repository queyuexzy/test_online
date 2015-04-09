/*  
 * @(#) UserPaperService.java Create on 2015年3月31日 下午3:40:40   
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
 * @date   2015年3月31日
 */
public interface UserPaperService {

	/**
	 * find in the user_paper_relation by teamId
	 * @Title: findUserPapersByTeamId
	 * @data:2015年3月31日下午3:43:43
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException FlexiGrid
	 */
	public FlexiGrid findUserPapersByTeamId(RequestParameter param) throws RequestParameterException;
	
	/**
	 * find the rows in table#user_paper_relation which has not being went over
	 * @Title: findUserPapersByTeamIdNotWentOver
	 * @data:2015年4月2日下午1:54:16
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException FlexiGrid
	 */
	public FlexiGrid findUserPapersByTeamIdNotWentOver(RequestParameter param) throws RequestParameterException;
	
}
