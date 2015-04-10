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

	/**the serial id to identify the class*/
	private static final long serialVersionUID = -3088541514701721252L;
	
	/**the service to control the userDao*/
	@Autowired
	private UserService userService;
	
	/**
	 * to konw the role of the user and to put the user into the session
	 * @Title: login
	 * @data:2015年4月9日下午2:11:06
	 * @author:zhangying void
	 */
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
	

	/**
	 * to register a user into the user_info
	 * @Title: register
	 * @data:2015年4月9日下午2:12:41
	 * @author:zhangying void
	 */


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
	

	/**
	 * to know the id if exist when we are not focus on the textarea
	 * @Title: idIfExist
	 * @data:2015年4月9日下午2:13:09
	 * @author:zhangying void
	 */


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
	

	/**
	 * remove all the attribute in session
	 * @Title: logout
	 * @data:2015年4月9日下午2:14:13
	 * @author:zhangying
	 * @return String
	 */


	public String logout(){
		
		ServletActionContext.getRequest().getSession().invalidate();
		
		return LOGOUT;
	}
	

	/**
	 * validate if the id is legal
	 * @Title: validateId
	 * @data:2015年4月9日下午2:14:43
	 * @author:zhangying
	 * @param id
	 * @return boolean
	 */


	public boolean validateId(String id){
		return id != null && id.length() > 0 && StringUtils.isNumeric(id);
	}
	

	/**
	 * validate if the name is legal
	 * @Title: validateName
	 * @data:2015年4月9日下午2:14:58
	 * @author:zhangying
	 * @param name
	 * @return boolean
	 */


	public boolean validateName(String name){
		return true;
	}
	

	/**
	 * validate if the password is legal
	 * @Title: validatePassword
	 * @data:2015年4月9日下午2:15:12
	 * @author:zhangying
	 * @param password
	 * @return boolean
	 */


	public boolean validatePassword(String password){
		return password != null && password.length() > 0 && StringUtils.isNumeric(password);
	}
	

	/**
	 * validate if the teamStatus id legal
	 * @Title: validateTeamStatus
	 * @data:2015年4月9日下午2:15:25
	 * @author:zhangying
	 * @param teamStatus
	 * @return boolean
	 */


	public boolean validateTeamStatus(String teamStatus){
		return teamStatus != null && teamStatus.length() > 0 && StringUtils.isNumeric(teamStatus);
	}
	

	/**
	 * validate if the age is legal
	 * @Title: validateAge
	 * @data:2015年4月9日下午2:15:49
	 * @author:zhangying
	 * @param age
	 * @return boolean
	 */


	public boolean validateAge(String age){
		return true;
	}
	

	/**
	 * valite if the birthday is legal
	 * @Title: validateBirthday
	 * @data:2015年4月9日下午2:16:03
	 * @author:zhangying
	 * @param birthday
	 * @return boolean
	 */


	public boolean validateBirthday(String birthday){
		return true;
	}
	

	/**
	 * validate if the address is legal
	 * @Title: validateAddress
	 * @data:2015年4月9日下午2:16:20
	 * @author:zhangying
	 * @param address
	 * @return boolean
	 */


	public boolean validateAddress(String address){
		return true;
	}
	

	/**
	 * validate if the tel is legal
	 * @Title: validateTel
	 * @data:2015年4月9日下午2:16:33
	 * @author:zhangying
	 * @param tel
	 * @return boolean
	 */


	public boolean validateTel(String tel){
		return tel != null && tel.length() > 0 && StringUtils.isNumeric(tel);
	}
	

	/**
	 * validate if the email is legal
	 * @Title: validateEmail
	 * @data:2015年4月9日下午2:16:50
	 * @author:zhangying
	 * @param email
	 * @return boolean
	 */


	public boolean validateEmail(String email){
		return email != null && email.length() > 0;
	}
	

	/**
	 * validate if the remark is legal
	 * @Title: validateRemark
	 * @data:2015年4月9日下午2:17:04
	 * @author:zhangying
	 * @param remark
	 * @return boolean
	 */


	public boolean validateRemark(String remark){
		return true;
	}
}
