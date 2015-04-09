/*  
 * @(#) LoginAction.java Create on 2015年3月17日 下午4:15:43   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.action;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.test_online.base.BaseAction;
import com.test_online.dao.UserDao;
import com.test_online.global.GlobalConstants;
import com.test_online.module.UserBean;
import com.test_online.service.UserService;
import com.test_online.util.AjaxResponse;
import com.test_online.util.CommonSendMeg;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年3月17日
 */
public class LoginAction extends BaseAction{
	private static final long serialVersionUID = -3088541514701721252L;
	
	@Autowired
	private UserService userService;
	
	public void login(){
		AjaxResponse ajaxResponse;
		try {
			RequestParameter parameter = this.extractParameter(new String[]{
					UserDao.ID,
					UserDao.PASSWORD
					
			});
			ajaxResponse = userService.validateUser(parameter);
			
			if(ajaxResponse.getCode() > 0){
				UserBean user = userService.getUserById(Integer.parseInt(getFromRequestParameter(UserDao.ID)));
				putToSession(GlobalConstants.CURRENT_USER, user);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
			
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
	public void register(){
		AjaxResponse ajaxResponse;
		
		try {
			RequestParameter parameter = this.extractParameter(new String[]{
					UserDao.ID,
					UserDao.NAME,
					UserDao.PASSWORD,
					UserDao.AGE,
					UserDao.BIRTHDAY,
					UserDao.ADDRESS,
					UserDao.TEL,
					UserDao.EMAIL,
					UserDao.REMARK
			});
			
			ajaxResponse = userService.register(parameter);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
	public void idIfExist(){
		AjaxResponse ajaxResponse;
		
		try {
			RequestParameter parameter = this.extractParameter(new String[]{
					UserDao.ID
			});
			
			ajaxResponse = userService.idIfExist(parameter);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
	public String logout(){
		
		ServletActionContext.getRequest().getSession().invalidate();
		
		return LOGOUT;
	}
	
	public boolean validateId(String id){
		return id != null && id.length() > 0 && StringUtils.isNumeric(id);
	}
	
	public boolean validateName(String name){
		return true;
	}
	
	public boolean validatePassword(String password){
		return password != null && password.length() > 0 && StringUtils.isNumeric(password);
	}
	
	public boolean validateTeamStatus(String teamStatus){
		return teamStatus != null && teamStatus.length() > 0 && StringUtils.isNumeric(teamStatus);
	}
	
	public boolean validateAge(String age){
		return true;
	}
	
	public boolean validateBirthday(String birthday){
		return true;
	}
	
	public boolean validateAddress(String address){
		return true;
	}
	
	public boolean validateTel(String tel){
		return tel != null && tel.length() > 0 && StringUtils.isNumeric(tel);
	}
	
	public boolean validateEmail(String email){
		return email != null && email.length() > 0;
	}
	
	public boolean validateRemark(String remark){
		return true;
	}
}
