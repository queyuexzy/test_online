/*  
 * @(#) UserServiceImpl.java Create on 2015年3月18日 上午11:21:56   
 *   
 * Copyright 2015 by xl.   
 */

package com.test_online.service.impl;

import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test_online.base.BaseAction.RequestParameter;
import com.test_online.base.BaseAction.RequestParameterException;
import com.test_online.dao.BankDao;
import com.test_online.dao.UserDao;
import com.test_online.flexigrid.bean.Addparams;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.mail.MailHelper;
import com.test_online.module.BankBean;
import com.test_online.module.UserBean;
import com.test_online.service.UserService;
import com.test_online.util.AjaxResponse;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date 2015年3月18日
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BankDao bankDao;

	@Override
	public AjaxResponse validateUser(RequestParameter parameter) throws RequestParameterException {
		AjaxResponse ajaxResponse;

		String password = parameter.get(UserDao.PASSWORD);
		int id = Integer.parseInt(parameter.get(UserDao.ID));

		UserBean user = userDao.findById(id);

		if (user == null) {
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		} else {
			if (password.equals(user.getPassword())) {
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
				if (user.getTeamStatus() == UserDao.STATUS_ADMIN) {
					ajaxResponse.setData(UserDao.STATUS_ADMIN);
				} else if (user.getTeamStatus() == UserDao.STATUS_TEACHER) {
					ajaxResponse.setData(UserDao.STATUS_TEACHER);
				} else {
					ajaxResponse.setData(UserDao.STATUS_STUDENT);
				}
			} else {
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_ID_AND_PASSWORD_NOT_MATCH);
			}
		}

		return ajaxResponse;
	}

	@Override
	public UserBean getUserById(int id) {

		UserBean user = userDao.findById(id);

		if (user != null) {
			return user;
		}

		return null;
	}

	@Override
	public AjaxResponse register(RequestParameter parameter) throws RequestParameterException {
		AjaxResponse ajaxResponse;
		String id = parameter.get(UserDao.ID);
		String name = parameter.get(UserDao.NAME);
		String password = parameter.get(UserDao.PASSWORD);
		String age = parameter.get(UserDao.AGE);
		String birthday = parameter.get(UserDao.BIRTHDAY);
		String address = parameter.get(UserDao.ADDRESS);
		String tel = parameter.get(UserDao.TEL);
		String email = parameter.get(UserDao.EMAIL);
		String remark = parameter.get(UserDao.REMARK);

		UserBean user = new UserBean();
		user.setId(Integer.parseInt(id));
		user.setName(name);
		user.setPassword(password);
		user.setTeamStatus(2);
		user.setAge(Integer.parseInt(age));
		user.setBirthday(birthday);
		user.setAddress(address);
		user.setTel(tel);
		user.setEmail(email);
		user.setRemark(remark);

		userDao.save(user);
		
		try {
			MailHelper.sendMail(email, "您好，您已注册在线考试系统！您的账号是：" + id + "您的密码是：" + password);
		} catch (Exception e) {
			e.printStackTrace();
			userDao.delete(user);
			return new AjaxResponse(AjaxResponse.AJAX_CODE_ILLEGAL_PARAM);
		}

		ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);

		return ajaxResponse;
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.UserService#updateUser(com.test_online.base.BaseAction.RequestParameter)
	 * @param parameter
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月7日上午9:05:34
	 * @author: zhangying
	 */
	@Override
	public UserBean updateUser(RequestParameter parameter) throws RequestParameterException {
		String id = parameter.get(UserDao.ID);
		String name = parameter.get(UserDao.NAME);
		String password = parameter.get(UserDao.PASSWORD);
		String age = parameter.get(UserDao.AGE);
		String birthday = parameter.get(UserDao.BIRTHDAY);
		String address = parameter.get(UserDao.ADDRESS);
		String tel = parameter.get(UserDao.TEL);
		String email = parameter.get(UserDao.EMAIL);
		String remark = parameter.get(UserDao.REMARK);

		UserBean user = userDao.findById(Integer.parseInt(id));
		user.setName(name);
		user.setPassword(password);
		user.setAge(Integer.parseInt(age));
		user.setBirthday(birthday);
		user.setAddress(address);
		user.setTel(tel);
		user.setEmail(email);
		user.setRemark(remark);
		
		userDao.update(user);
		return user;
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.UserService#getUserByTeamStatus(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月2日上午9:56:35
	 * @author: zhangying
	 */
	@Override
	public FlexiGrid getUserByTeamStatus(RequestParameter param) throws RequestParameterException {

		String queryString = param.get(FlexiGrid.KEY_QUERY_JSON);
		FlexiGrid flexigrid = JackJson.fromJsonToObject(queryString, FlexiGrid.class);
		
		List<Addparams> addparams = flexigrid.getAddparams();
		
		Integer teamStatus = null;
		
		if(addparams != null){
			for(Addparams addparam : addparams){
				if(addparam != null){
					if(UserDao.TEAM_STATUS.equals(addparam.getName())){
						teamStatus = Integer.parseInt(addparam.getValue().toString()) ;
					}
				}
			}
		}
		
		if(teamStatus != null){
			List<UserBean> users = userDao.findByTeamStatus(1);
			if(users != null){
				for(UserBean user : users){
					if(user != null){
						Integer teamId = user.getId();
						List<BankBean> banks = bankDao.findByTeamId(teamId);
						if(banks != null){
							user.set_sumBanks(banks.size());
						}else{
							user.set_sumBanks(0);
						}
						
					}
				}
				
				flexigrid.setRows(users);
				flexigrid.setTotal((long)users.size());
			}
		}
		
		return flexigrid;
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.UserService#idIfExist(com.test_online.base.BaseAction.RequestParameter)
	 * @param parameter
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月3日下午2:42:53
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse idIfExist(RequestParameter parameter) throws RequestParameterException {
		
		int id = Integer.parseInt(parameter.get(UserDao.ID));
		
		List<UserBean> users = userDao.findAll();
		
		for(UserBean user : users){
			if(id == user.getId()){
				return new AjaxResponse(AjaxResponse.AJAX_CODE_ILLEGAL_PARAM);
			}
		}
		
		return new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
	}
}
