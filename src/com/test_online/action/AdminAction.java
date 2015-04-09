/*  
 * @(#) AdminAction.java Create on 2015年4月7日 上午9:13:38   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.action;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.test_online.base.BaseAction;
import com.test_online.dao.BankDao;
import com.test_online.dao.BlankDao;
import com.test_online.dao.UserDao;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.service.AdminService;
import com.test_online.util.CommonSendMeg;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年4月7日
 */
public class AdminAction extends BaseAction{
<<<<<<< HEAD
	/**the serial id which can identify the class*/
	private static final long serialVersionUID = -3746493544765899393L;
	
	/**the service to control adminDao*/
	@Autowired
	private AdminService adminService;

	/**
	 * find all the team(the teamStatus of which is 1).
	 * @Title: findTeams
	 * @data:2015年4月9日下午2:04:38
	 * @author:zhangying void
	 */
=======

	private static final long serialVersionUID = -3746493544765899393L;
	
	@Autowired
	private AdminService adminService;

>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void findTeams(){
		
		try {
			RequestParameter param = this.extractParameter(new String[]{
				FlexiGrid.KEY_QUERY_JSON
			});
			
			FlexiGrid flexiGrid = adminService.findTeams(param);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexiGrid));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * delete a bank by id for the team
	 * @Title: deleteBankById
	 * @data:2015年4月9日下午2:05:21
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void deleteBankById(){
		
		try {
			RequestParameter param = this.extractParameter(new String[]{
				BlankDao.ID	
			});
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(adminService.deleteBankById(param)));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * delete a team 
	 * @Title: deleteTeamById
	 * @data:2015年4月9日下午2:06:23
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void deleteTeamById(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
				UserDao.ID	
			});
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(adminService.deleteTeamById(param)));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * add a bank for the team
	 * @Title: addBank
	 * @data:2015年4月9日下午2:06:46
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void addBank(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
				BankDao.NAME,
				BankDao.TEAM_ID
			});
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(adminService.addBank(param)));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * the admin add a team 
	 * @Title: addTeam
	 * @data:2015年4月9日下午2:07:06
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void addTeam(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
				UserDao.ID,
				UserDao.EMAIL,
				UserDao.TEL
			});
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(adminService.addTeam(param)));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * validate if the id is legal
	 * @Title: validateId
	 * @data:2015年4月9日下午2:07:26
	 * @author:zhangying
	 * @param id
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateId(String id){
		return id != null && id.length() > 0 && StringUtils.isNumeric(id);
	}
	
<<<<<<< HEAD
	/**
	 * validate if the name is legal 
	 * @Title: validateName
	 * @data:2015年4月9日下午2:07:53
	 * @author:zhangying
	 * @param name
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateName(String name){
		return name != null && name.length() > 0;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the teamId is legal
	 * @Title: validateTeamId
	 * @data:2015年4月9日下午2:08:06
	 * @author:zhangying
	 * @param teamId
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateTeamId(String teamId){
		return teamId != null && teamId.length() > 0;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the tel is legal
	 * @Title: validateTel
	 * @data:2015年4月9日下午2:08:21
	 * @author:zhangying
	 * @param tel
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateTel(String tel){
		return tel != null && tel.length() > 0;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the email is legal
	 * @Title: validateEmail
	 * @data:2015年4月9日下午2:08:37
	 * @author:zhangying
	 * @param email
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateEmail(String email){
		return email != null && email.length() > 0;
	}
}
