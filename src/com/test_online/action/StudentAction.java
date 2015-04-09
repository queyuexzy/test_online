/*  
 * @(#) StudentAction.java Create on 2015年3月30日 下午5:31:10   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.action;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.test_online.base.BaseAction;
import com.test_online.base.BaseAction.RequestParameter;
import com.test_online.base.BaseAction.RequestParameterException;
import com.test_online.dao.BlankAnswerDao;
import com.test_online.dao.BlankDao;
import com.test_online.dao.PaperDao;
import com.test_online.dao.UserDao;
import com.test_online.dao.UserPaperDao;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.global.GlobalConstants;
import com.test_online.module.ProblemBean;
import com.test_online.module.UserBean;
import com.test_online.service.PaperService;
import com.test_online.service.StudentService;
import com.test_online.service.UserService;
import com.test_online.util.AjaxResponse;
import com.test_online.util.CommonSendMeg;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年3月30日
 */
public class StudentAction extends BaseAction {

	private static final long serialVersionUID = 3529179930353104041L;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PaperService paperService;
	
	public void searchScoresByUserId(){
		
		try {
			RequestParameter param = this.extractParameter(new String[]{
				FlexiGrid.KEY_QUERY_JSON
			});
			
			FlexiGrid flexigrid = studentService.searchScoresByUserId(param);
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
			
		} catch (RequestParameterException e) {
			e.printStackTrace();
			
			CommonSendMeg.writeMsg(JackJson.fromObjectHasDateToJson(e.getMessage()));
		}
	}
	
	public void findStudentScoreInfoByUserIdPaperId(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
				FlexiGrid.KEY_QUERY_JSON
			});
			
			FlexiGrid flexigrid = studentService.searchStudentScoreInfoByUserIdPaperId(param);
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
			
		} catch (RequestParameterException e) {
			e.printStackTrace();
			
			CommonSendMeg.writeMsg(JackJson.fromObjectHasDateToJson(e.getMessage()));
		}
	}
	
	public void updateStudentInSession(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
					
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
			UserBean user = userService.updateUser(param);
			removeUserFromSession();
			putToSession(GlobalConstants.CURRENT_USER, user);
			
			AjaxResponse ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
			
			
		} catch (RequestParameterException e) {
			e.printStackTrace();
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
	/**
	 * find all papers which the user can join test
	 * @Title: findPaperInfo
	 * @data:2015年3月31日下午5:12:47
	 * @author:zhangying void
	 */
	public void findPaperInfo(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
				FlexiGrid.KEY_QUERY_JSON
			});
			
			FlexiGrid flexigrid = paperService.findAllPapers(param);
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
			
		} catch (RequestParameterException e) {
			e.printStackTrace();
			
			CommonSendMeg.writeMsg(JackJson.fromObjectHasDateToJson(e.getMessage()));
		}
	}
	
	public void findProblemsByPaperId(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
				FlexiGrid.KEY_QUERY_JSON
			});
			
			FlexiGrid flexigrid = studentService.getProblemsByPaperId(param);
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
			
		} catch (RequestParameterException e) {
			e.printStackTrace();
			
			CommonSendMeg.writeMsg(JackJson.fromObjectHasDateToJson(e.getMessage()));
		}
	}
	
	public void findUserByTeamStatus(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
				FlexiGrid.KEY_QUERY_JSON
			});
			
			FlexiGrid flexigrid = userService.getUserByTeamStatus(param);
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
			
		} catch (RequestParameterException e) {
			e.printStackTrace();
			
			CommonSendMeg.writeMsg(JackJson.fromObjectHasDateToJson(e.getMessage()));
		}
	}
	
	public void addAnswerToTable(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
					
					BlankAnswerDao.USER_ID,
					BlankDao.PAPER_ID,
					"problemType",
					"problemId",
					"answer"
			});
			
			AjaxResponse ajaxResponse = studentService.addAnswerToTable(param);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
			
			
		} catch (RequestParameterException e) {
			e.printStackTrace();
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
	public void findProblemsByBankIdUseStatus(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
				FlexiGrid.KEY_QUERY_JSON
			});
			
			FlexiGrid flexigrid = studentService.getProblemsByBankIdUseStatus(param);
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
			
		} catch (RequestParameterException e) {
			e.printStackTrace();
			
			CommonSendMeg.writeMsg(JackJson.fromObjectHasDateToJson(e.getMessage()));
		}
	}
	
	public void validateAnswerByProblemIdProblemType(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
					"problemType",
					"problemId",
					"answer"
			});
			
			AjaxResponse ajaxResponse = studentService.validateAnswerByProblemIdProblemType(param);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
	public void findSimpleBlankByUserIdPaperId(){
		try {
			FlexiGrid flexigrid;
			RequestParameter param = this.extractParameter(new String[]{
				FlexiGrid.KEY_QUERY_JSON
			});
			flexigrid = studentService.findSimpleBlankByUserIdPaperId(param);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
	public void updateScoreInBlankSimple(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
					BlankAnswerDao.USER_ID,
					"problemType",
					"problemId",
					"score"
			});
			
			AjaxResponse ajaxResponse = studentService.updateScoreInBlankSimple(param);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
		
	}
	
	public void updateScoreInUserPaper(){
		try {
			RequestParameter param = this.extractParameter(new String[]{
					UserPaperDao.ID
			});
			
			AjaxResponse ajaxResponse = studentService.updateScoreInUserPaper(param);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
	public boolean validateScore(String score){
		return score != null && StringUtils.isNumeric(score);
	}
	public boolean validateId(String id){
		return id != null && id.length() > 0 && StringUtils.isNumeric(id);
	}
	
	public boolean validateName(String name){
		return true;
	}
	
	public boolean validatePassword(String password){
		return password != null && password.length() > 6 && password.length() < 25; 
	}
	public boolean validateAge(String age){
		return (age == null ) || (age != null && Integer.parseInt(age) > 0 && Integer.parseInt(age) < 200);
	}
	
	public boolean validateBirthday(String birthday){
		return true;
	}
	
	public boolean validateAddress(String address){
		return true;
	}
	
	public boolean validateTel(String tel){
		return tel != null && tel.length() == 11 && StringUtils.isNumeric(tel);
	}
	
	public boolean validateEmail(String email){
		return email != null && email.length() > 0;
	}
	
	public boolean validateRemark(String remark){
		return true;
	}
	
	public boolean validateUserId(String userId){
		return userId != null && userId.length() > 0 && StringUtils.isNumeric(userId);
	}
	
	public boolean validatePaperId(String paperId){
		return paperId != null && paperId.length() > 0 && StringUtils.isNumeric(paperId);
	}
	
	public boolean validateProblemId(String problemId){
		return problemId != null && problemId.length() > 0 && StringUtils.isNumeric(problemId);
	}
	
	public boolean validateProblemType(String problemType){
		return problemType != null && problemType.length() > 0;
	}
	
	public boolean validateAnswer(String answer){
		return answer != null && answer.length() > 0;
	}
		
}
