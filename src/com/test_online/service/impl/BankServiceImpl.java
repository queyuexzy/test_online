/*  
 * @(#) BankServiceImpl.java Create on 2015年3月24日 上午9:42:03   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test_online.base.BaseAction.RequestParameter;
import com.test_online.base.BaseAction.RequestParameterException;
import com.test_online.dao.BankDao;
import com.test_online.flexigrid.bean.Addparams;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.module.BankBean;
import com.test_online.module.BlankBean;
import com.test_online.module.PaperBean;
import com.test_online.service.BankService;
import com.test_online.util.AjaxResponse;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年3月24日
 */
@Service
public class BankServiceImpl implements BankService{

	@Autowired
	private BankDao bankDao;
	
	@Override
	public AjaxResponse getBankInfoByTeamId(RequestParameter param) throws RequestParameterException {

		AjaxResponse ajaxResponse = null;
		
		String teamId = param.get(BankDao.TEAM_ID);
		
		List<BankBean> banks = bankDao.findByTeamId(Integer.parseInt(teamId));
		
		if(banks != null){
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			ajaxResponse.setData(banks);
		}
		return ajaxResponse;
	}

	@Override
	public FlexiGrid getBanksByTeamId(RequestParameter param) throws RequestParameterException {
		String flexigridParams = param.get(FlexiGrid.KEY_QUERY_JSON);
		
		FlexiGrid params = JackJson.fromJsonToObject(flexigridParams, FlexiGrid.class);
		
		List<Addparams> addparams = params.getAddparams();

		String teamId = "-1";
		
		for(Addparams addparam : addparams){
			if(BankDao.TEAM_ID.equals(addparam.getName()) && addparam.getValue() != null){
				teamId = addparam.getValue().toString();
			}
		}
		
		List<BankBean> banks = bankDao.findByTeamId(Integer.parseInt(teamId));
		
		if(banks != null){
			params.setTotal((long)banks.size());
			params.setRows(banks);
			
			return params;
		}
		return params;
	}

}
