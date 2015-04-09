/*  
 * @(#) BankService.java Create on 2015年3月24日 上午9:38:48   
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
public interface BankService {

	/**
	 * get the bankInfo by id
	 * @Title: getBankInfoByTeamId
	 * @data:2015年3月26日下午2:38:56
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse getBankInfoByTeamId(RequestParameter param) throws RequestParameterException;
	
	/**
	 * get banks for the flexigrid#updateBankFlexiGrid
	 * @Title: getBanksByTeamId
	 * @data:2015年3月27日上午11:35:50
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException FlexiGrid
	 */
	public FlexiGrid getBanksByTeamId(RequestParameter param) throws RequestParameterException;
}
