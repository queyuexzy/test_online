/*  
 * @(#) AdminServiceImpl.java Create on 2015年4月7日 上午9:44:54   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.xwork.time.FastDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test_online.base.BaseAction.RequestParameter;
import com.test_online.base.BaseAction.RequestParameterException;
import com.test_online.base.BaseService;
import com.test_online.dao.BankDao;
import com.test_online.dao.UserDao;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.module.BankBean;
import com.test_online.module.UserBean;
import com.test_online.service.AdminService;
import com.test_online.util.AjaxResponse;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年4月7日
 */
@Service
public class AdminServiceImpl extends BaseService implements AdminService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BankDao bankDao;

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.AdminService#findTeams(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月7日上午9:48:28
	 * @author: zhangying
	 */
	@Override
	public FlexiGrid findTeams(RequestParameter param) throws RequestParameterException {
		
		String queryString = param.get(FlexiGrid.KEY_QUERY_JSON);
		FlexiGrid flexiGrid = JackJson.fromJsonToObject(queryString, FlexiGrid.class);
		List<UserBean> teams = userDao.findByTeamStatus(1);
		if(teams != null){
			flexiGrid.setRows(teams);
			flexiGrid.setTotal((long)teams.size());
		}
		return flexiGrid;
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.AdminService#deleteBankById(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月7日上午11:34:23
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse deleteBankById(RequestParameter param) throws RequestParameterException {
		Integer id = Integer.parseInt(param.get(BankDao.ID));
		BankBean bank = bankDao.findById(id);
		bankDao.delete(bank);
		
		return new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.AdminService#deleteTeamById(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月7日下午2:04:26
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse deleteTeamById(RequestParameter param) throws RequestParameterException {
		Integer id = Integer.parseInt(param.get(BankDao.ID));
		UserBean user = userDao.findById(id);
		userDao.delete(user);
		
		return new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.AdminService#addBank(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月7日下午2:53:02
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse addBank(RequestParameter param) throws RequestParameterException {
		String name = param.get(BankDao.NAME);
		Integer teamId = Integer.parseInt(param.get(BankDao.TEAM_ID));
	
		BankBean bank = new BankBean();
		bank.setName(name);
		bank.setCreateTime(FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss").format(new Date()));
		bank.setTeamId(teamId);
		
		bankDao.save(bank);
		
		return new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.AdminService#addTeam(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月7日下午4:10:40
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse addTeam(RequestParameter param) throws RequestParameterException {

		String id = param.get(UserDao.ID);
		String tel = param.get(UserDao.TEL);
		String email = param.get(UserDao.EMAIL);
		
		UserBean user = new UserBean();
		user.setId(Integer.parseInt(id));
		user.setTel(tel);
		user.setEmail(email);
		user.setPassword("123456");
		user.setTeamStatus(1);
		
		userDao.save(user);
		return new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
	}

	
}
