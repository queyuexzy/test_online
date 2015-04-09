/*  
 * @(#) StudentAction.java Create on 2015年3月30日 下午5:31:10   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.action;

<<<<<<< HEAD
=======
import java.util.List;

>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.test_online.base.BaseAction;
<<<<<<< HEAD
import com.test_online.dao.BlankAnswerDao;
import com.test_online.dao.BlankDao;
=======
import com.test_online.base.BaseAction.RequestParameter;
import com.test_online.base.BaseAction.RequestParameterException;
import com.test_online.dao.BlankAnswerDao;
import com.test_online.dao.BlankDao;
import com.test_online.dao.PaperDao;
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
import com.test_online.dao.UserDao;
import com.test_online.dao.UserPaperDao;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.global.GlobalConstants;
<<<<<<< HEAD
=======
import com.test_online.module.ProblemBean;
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
import com.test_online.module.UserBean;
import com.test_online.service.PaperService;
import com.test_online.service.StudentService;
import com.test_online.service.UserService;
import com.test_online.util.AjaxResponse;
import com.test_online.util.CommonSendMeg;
import com.test_online.util.JackJson;

/**
<<<<<<< HEAD
 * control the studentToIndex.jsp
=======
 * 
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
 * @author zhangying
 * @date   2015年3月30日
 */
public class StudentAction extends BaseAction {

<<<<<<< HEAD
	/**the serial id to identify the class*/
	private static final long serialVersionUID = 3529179930353104041L;
	
	/**the controller which use studentDao*/
	@Autowired
	private StudentService studentService;
	
	/**the controller which use userDao*/
	@Autowired
	private UserService userService;
	
	/**the controller which use paperDao*/
	@Autowired
	private PaperService paperService;
	
	/**
	 * get the scores by userId for table#studentScoreFlexiGrid
	 * @Title: searchScoresByUserId
	 * @data:2015年4月9日下午2:20:27
	 * @author:zhangying void
	 */
=======
	private static final long serialVersionUID = 3529179930353104041L;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PaperService paperService;
	
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
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
	
<<<<<<< HEAD
	/**
	 * get the score for a student in the paper
	 * @Title: findStudentScoreInfoByUserIdPaperId
	 * @data:2015年4月9日下午2:21:16
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
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
	
<<<<<<< HEAD
	/**
	 * to use when the edit user info in the session
	 * @Title: updateStudentInSession
	 * @data:2015年4月9日下午2:21:58
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
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
<<<<<<< HEAD
	 * find all papers which the user can join exam
=======
	 * find all papers which the user can join test
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
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
	
<<<<<<< HEAD
	/**
	 * get all the problem in the paper
	 * @Title: findProblemsByPaperId
	 * @data:2015年4月9日下午2:22:55
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
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
	
<<<<<<< HEAD
	/**
	 * find all the team info when exam
	 * @Title: findUserByTeamStatus
	 * @data:2015年4月9日下午2:23:31
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
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
	
<<<<<<< HEAD
	/**
	 * add the answer to the table
	 * @Title: addAnswerToTable
	 * @data:2015年4月9日下午2:25:30
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
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
	
<<<<<<< HEAD
	/**
	 * find the problem by bankId and useStatus is false,which to use the test
	 * @Title: findProblemsByBankIdUseStatus
	 * @data:2015年4月9日下午2:26:10
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
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
	
<<<<<<< HEAD
	/**
	 * validate the Answer and know the right answer,to use when alert the problem info
	 * @Title: validateAnswerByProblemIdProblemType
	 * @data:2015年4月9日下午2:27:05
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
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
	
<<<<<<< HEAD
	/**
	 * find all the blank and simple problems,to use when the teacher give point
	 * @Title: findSimpleBlankByUserIdPaperId
	 * @data:2015年4月9日下午2:29:04
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
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
	
<<<<<<< HEAD
	/**
	 * update the simple score and blank score,use when the teacher give the point
	 * @Title: updateScoreInBlankSimple
	 * @data:2015年4月9日下午2:31:04
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
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
	
<<<<<<< HEAD
	/**
	 * count the socre in the user_info
	 * @Title: updateScoreInUserPaper
	 * @data:2015年4月9日下午2:32:08
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
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
	
<<<<<<< HEAD
	/**
	 * validate if the score if legal
	 * @Title: validateScore
	 * @data:2015年4月9日下午2:33:06
	 * @author:zhangying
	 * @param score
	 * @return boolean
	 */
	public boolean validateScore(String score){
		return score != null && StringUtils.isNumeric(score);
	}
	
	/**
	 * validate if the id is legal
	 * @Title: validateId
	 * @data:2015年4月9日下午2:33:23
	 * @author:zhangying
	 * @param id
	 * @return boolean
	 */
=======
	public boolean validateScore(String score){
		return score != null && StringUtils.isNumeric(score);
	}
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateId(String id){
		return id != null && id.length() > 0 && StringUtils.isNumeric(id);
	}
	
<<<<<<< HEAD
	/**
	 * validate if the name is legal
	 * @Title: validateName
	 * @data:2015年4月9日下午2:33:38
	 * @author:zhangying
	 * @param name
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateName(String name){
		return true;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the password is legal
	 * @Title: validatePassword
	 * @data:2015年4月9日下午2:33:49
	 * @author:zhangying
	 * @param password
	 * @return boolean
	 */
	public boolean validatePassword(String password){
		return password != null && password.length() > 6 && password.length() < 25; 
	}
	
	/**
	 * validate if the age is legal
	 * @Title: validateAge
	 * @data:2015年4月9日下午2:34:09
	 * @author:zhangying
	 * @param age
	 * @return boolean
	 */
=======
	public boolean validatePassword(String password){
		return password != null && password.length() > 6 && password.length() < 25; 
	}
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateAge(String age){
		return (age == null ) || (age != null && Integer.parseInt(age) > 0 && Integer.parseInt(age) < 200);
	}
	
<<<<<<< HEAD
	/**
	 * validate if the birthday is legal
	 * @Title: validateBirthday
	 * @data:2015年4月9日下午2:34:20
	 * @author:zhangying
	 * @param birthday
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateBirthday(String birthday){
		return true;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the address is legal
	 * @Title: validateAddress
	 * @data:2015年4月9日下午2:34:33
	 * @author:zhangying
	 * @param address
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateAddress(String address){
		return true;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the tel is legal
	 * @Title: validateTel
	 * @data:2015年4月9日下午2:34:47
	 * @author:zhangying
	 * @param tel
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateTel(String tel){
		return tel != null && tel.length() == 11 && StringUtils.isNumeric(tel);
	}
	
<<<<<<< HEAD
	/**
	 * validate if the email if legal
	 * @Title: validateEmail
	 * @data:2015年4月9日下午2:34:58
	 * @author:zhangying
	 * @param email
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateEmail(String email){
		return email != null && email.length() > 0;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the remark is legal
	 * @Title: validateRemark
	 * @data:2015年4月9日下午2:35:20
	 * @author:zhangying
	 * @param remark
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateRemark(String remark){
		return true;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the userId is legal
	 * @Title: validateUserId
	 * @data:2015年4月9日下午2:35:34
	 * @author:zhangying
	 * @param userId
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateUserId(String userId){
		return userId != null && userId.length() > 0 && StringUtils.isNumeric(userId);
	}
	
<<<<<<< HEAD
	/**
	 * validate if the paperId is legal
	 * @Title: validatePaperId
	 * @data:2015年4月9日下午2:35:46
	 * @author:zhangying
	 * @param paperId
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validatePaperId(String paperId){
		return paperId != null && paperId.length() > 0 && StringUtils.isNumeric(paperId);
	}
	
<<<<<<< HEAD
	/**
	 * validate if the problemId is legal
	 * @Title: validateProblemId
	 * @data:2015年4月9日下午2:36:11
	 * @author:zhangying
	 * @param problemId
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateProblemId(String problemId){
		return problemId != null && problemId.length() > 0 && StringUtils.isNumeric(problemId);
	}
	
<<<<<<< HEAD
	/**
	 * validate if the problemType is legal
	 * @Title: validateProblemType
	 * @data:2015年4月9日下午2:36:24
	 * @author:zhangying
	 * @param problemType
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateProblemType(String problemType){
		return problemType != null && problemType.length() > 0;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the answer is legal
	 * @Title: validateAnswer
	 * @data:2015年4月9日下午2:36:39
	 * @author:zhangying
	 * @param answer
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateAnswer(String answer){
		return answer != null && answer.length() > 0;
	}
		
}
