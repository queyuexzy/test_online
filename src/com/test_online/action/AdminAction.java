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

	private static final long serialVersionUID = -3746493544765899393L;
	
	@Autowired
	private AdminService adminService;

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
	
	public boolean validateId(String id){
		return id != null && id.length() > 0 && StringUtils.isNumeric(id);
	}
	
	public boolean validateName(String name){
		return name != null && name.length() > 0;
	}
	
	public boolean validateTeamId(String teamId){
		return teamId != null && teamId.length() > 0;
	}
	
	public boolean validateTel(String tel){
		return tel != null && tel.length() > 0;
	}
	
	public boolean validateEmail(String email){
		return email != null && email.length() > 0;
	}
}
