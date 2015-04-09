/*  
 * @(#) TeacherAction.java Create on 2015年3月25日 下午2:57:23   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.action;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.test_online.base.BaseAction;
import com.test_online.dao.BankDao;
import com.test_online.dao.BlankDao;
import com.test_online.dao.ChooseDao;
import com.test_online.dao.JudgeDao;
import com.test_online.dao.SimpleDao;
import com.test_online.dao.UserDao;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.global.GlobalConstants;
import com.test_online.module.UserBean;
import com.test_online.service.BankService;
import com.test_online.service.BlankService;
import com.test_online.service.ChooseService;
import com.test_online.service.JudgeService;
import com.test_online.service.PaperService;
import com.test_online.service.SimpleService;
import com.test_online.service.UserPaperService;
import com.test_online.service.UserService;
import com.test_online.util.AjaxResponse;
import com.test_online.util.CommonSendMeg;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年3月25日
 */
public class TeacherAction extends BaseAction{

<<<<<<< HEAD
	/**the id to identify the class*/
	private static final long serialVersionUID = -9158950056807772557L;
	
	/**the controller to identify the blankDao*/
	@Autowired
	private BlankService blankService;
	
	/**the controller to identify the userDao*/
	@Autowired
	private UserService userService;
	
	/**the controller to identify the bankDao*/
	@Autowired
	private BankService bankService;
	
	/**the controller to identify the chooseDao*/
	@Autowired
	private ChooseService chooseService;
	
	/**the controller to identify the paperDao*/
	@Autowired
	private PaperService paperService;
	
	/**the controller to indentify the simpleDao*/
	@Autowired
	private SimpleService simpleService;
	
	/**the controller to identify the judgeDao*/
	@Autowired
	private JudgeService judgeService;
	
	/**the controller to identify the userPaperDao*/
=======
	private static final long serialVersionUID = -9158950056807772557L;
	
	@Autowired
	private BlankService blankService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BankService bankService;
	
	@Autowired
	private ChooseService chooseService;
	
	@Autowired
	private PaperService paperService;
	
	@Autowired
	private SimpleService simpleService;
	
	@Autowired
	private JudgeService judgeService;
	
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	@Autowired
	private UserPaperService userPaperService;
	
	/**
	 * find the blanks by teamId
	 * @Title: findBlanksByTeamId
	 * @data:2015年3月26日上午10:50:48
	 * @author:zhangying void
	 */
	public void findBlanksByTeamId(){
		
		FlexiGrid flexigrid;
		
		try {
			RequestParameter param = this.extractParameter(new String[]{
					FlexiGrid.KEY_QUERY_JSON
			});
			
			flexigrid = blankService.getBlankByTeamId(param);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
		} catch (RequestParameterException e) {

			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
			e.printStackTrace();
		}
		
	}
	
<<<<<<< HEAD
	/**
	 * find all the simples for the team
	 * @Title: findSimplesByTeamId
	 * @data:2015年4月9日下午2:41:19
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void findSimplesByTeamId(){
		FlexiGrid flexigrid;
		
		try {
			RequestParameter param = this.extractParameter(new String[]{
					FlexiGrid.KEY_QUERY_JSON
			});
			
			flexigrid = simpleService.getSimplesByTeamId(param);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
		} catch (RequestParameterException e) {

			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
			e.printStackTrace();
		}
	}
	
<<<<<<< HEAD
	/**
	 * find all the judges for the team
	 * @Title: findJudgesByTeamId
	 * @data:2015年4月9日下午2:41:46
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void findJudgesByTeamId(){
		FlexiGrid flexigrid;
		
		try {
			RequestParameter param = this.extractParameter(new String[]{
					FlexiGrid.KEY_QUERY_JSON
			});
			
			flexigrid = judgeService.getJudgeByTeamId(param);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
		} catch (RequestParameterException e) {

			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
			e.printStackTrace();
		}
	}
	
	/**
	 * update the teacher info in the session and the database
	 * @Title: updateTeacherInSession
	 * @data:2015年3月26日上午10:51:07
	 * @author:zhangying void
	 */
	public void updateTeacherInSession(){
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
	
<<<<<<< HEAD
	/**
	 * get all banks for the team
	 * @Title: getBanksByTeamId
	 * @data:2015年4月9日下午2:42:39
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void getBanksByTeamId(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter parameter = this.extractParameter(new String[]{
				BankDao.TEAM_ID
			});
			ajaxResponse = bankService.getBankInfoByTeamId(parameter);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}

<<<<<<< HEAD
	/**
	 * add a blank in the bank
	 * @Title: addBlank
	 * @data:2015年4月9日下午2:42:31
	 * @author:zhangying void
	 */
=======
	
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void addBlank(){
		try {
			AjaxResponse ajaxResponse;
			
			RequestParameter param = this.extractParameter(new String[]{
					BlankDao.BANK_ID,
					BlankDao.TOPIC,
					BlankDao.ANSWER,
					BlankDao.REMARK,
					BlankDao.SCORE
			});
			
			ajaxResponse = blankService.addBlank(param);
			
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_REPEAT);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * add a simple in the bank
	 * @Title: addSimple
	 * @data:2015年4月9日下午2:43:36
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void addSimple(){
		try {
			AjaxResponse ajaxResponse;
			
			RequestParameter param = this.extractParameter(new String[]{
					SimpleDao.BANK_ID,
					SimpleDao.TOPIC,
					SimpleDao.ANSWER,
					SimpleDao.REMARK,
					SimpleDao.SCORE
			});
			
			ajaxResponse = simpleService.addSimple(param);
			
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_REPEAT);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * adda judge in the bank
	 * @Title: addJudge
	 * @data:2015年4月9日下午2:44:02
	 * @author:zhangying void
	 */
=======
	
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void addJudge(){
		try {
			AjaxResponse ajaxResponse;
			
			RequestParameter param = this.extractParameter(new String[]{
					JudgeDao.BANK_ID,
					JudgeDao.TOPIC,
					JudgeDao.ANSWER,
					JudgeDao.REMARK,
					JudgeDao.SCORE
			});
			
			ajaxResponse = judgeService.addJudge(param);
			
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_REPEAT);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * delte a blank
	 * @Title: deleteBlank
	 * @data:2015年4月9日下午2:44:14
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void deleteBlank(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				BlankDao.ID	
			});
			ajaxResponse = blankService.deleteBlank(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * delete a simple
	 * @Title: deleteSimple
	 * @data:2015年4月9日下午2:44:38
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void deleteSimple(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				SimpleDao.ID	
			});
			ajaxResponse = simpleService.deleteSimple(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * delete a judge
	 * @Title: deleteJudge
	 * @data:2015年4月9日下午2:44:51
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void deleteJudge(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				JudgeDao.ID	
			});
			ajaxResponse = judgeService.deleteJudge(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * get a blank by its id
	 * @Title: getBlankById
	 * @data:2015年4月9日下午2:44:59
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void getBlankById(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				BlankDao.ID
			});
			
			ajaxResponse = blankService.getBlankById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * get a simple by its id
	 * @Title: getSimpleById
	 * @data:2015年4月9日下午2:45:13
	 * @author:zhangying void
	 */
=======
	
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void getSimpleById(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				SimpleDao.ID
			});
			
			ajaxResponse = simpleService.getSimpleById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * get a judge by its id
	 * @Title: getJudgeById
	 * @data:2015年4月9日下午2:45:23
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void getJudgeById(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				JudgeDao.ID
			});
			
			ajaxResponse = judgeService.getJudgeById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * update a blank into .(the name is not correct)
	 * @Title: updateBank
	 * @data:2015年4月9日下午2:45:33
	 * @author:zhangying void
	 */
=======
	
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void updateBank(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				BlankDao.ID,
				BlankDao.BANK_ID,
				BlankDao.TOPIC,
				BlankDao.ANSWER,
				BlankDao.REMARK,
				BlankDao.SCORE
			});
			
			ajaxResponse = blankService.updateBlank(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * update the simple 
	 * @Title: updateSimple
	 * @data:2015年4月9日下午2:46:16
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void updateSimple(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				SimpleDao.ID,
				SimpleDao.BANK_ID,
				SimpleDao.TOPIC,
				SimpleDao.ANSWER,
				SimpleDao.REMARK,
				SimpleDao.SCORE
			});
			
			ajaxResponse = simpleService.updateSimple(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * update the judge
	 * @Title: updateJudge
	 * @data:2015年4月9日下午2:46:37
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void updateJudge(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				JudgeDao.ID,
				JudgeDao.BANK_ID,
				JudgeDao.TOPIC,
				JudgeDao.ANSWER,
				JudgeDao.REMARK,
				JudgeDao.SCORE
				
			});
			
			ajaxResponse = judgeService.updateJudge(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * find all the chooses by teamId
	 * @Title: findChoosesByTeamId
	 * @data:2015年4月9日下午2:46:45
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void findChoosesByTeamId(){
		FlexiGrid flexigrid;
		
		try {
			RequestParameter param = this.extractParameter(new String[]{
					FlexiGrid.KEY_QUERY_JSON
			});
			
			flexigrid = chooseService.getChooseByTeamId(param);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
		} catch (RequestParameterException e) {

			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
			e.printStackTrace();
		}
	}
	
<<<<<<< HEAD
	/**
	 * add a choose in the bank
	 * @Title: addChoose
	 * @data:2015年4月9日下午2:47:00
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void addChoose(){
		try {
			AjaxResponse ajaxResponse;
			
			RequestParameter param = this.extractParameter(new String[]{
					ChooseDao.BANK_ID,
					ChooseDao.TOPIC,
					ChooseDao.ANSWER,
					ChooseDao.REMARK,
					ChooseDao.OPTION_A,
					ChooseDao.OPTION_B,
					ChooseDao.OPTION_C,
					ChooseDao.OPTION_D,
					ChooseDao.SCORE
			});
			
			ajaxResponse = chooseService.addChoose(param);
			
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_REPEAT);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * update a choose
	 * @Title: updateChoose
	 * @data:2015年4月9日下午2:47:13
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void updateChoose(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				ChooseDao.ID,
				ChooseDao.BANK_ID,
				ChooseDao.TOPIC,
				ChooseDao.ANSWER,
				ChooseDao.REMARK,
				ChooseDao.OPTION_A,
				ChooseDao.OPTION_B,
				ChooseDao.OPTION_C,
				ChooseDao.OPTION_D,
				ChooseDao.SCORE
			});
			
			ajaxResponse = chooseService.updateChoose(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * delete a choose
	 * @Title: deleteChoose
	 * @data:2015年4月9日下午2:47:25
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void deleteChoose(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				ChooseDao.ID	
			});
			ajaxResponse = chooseService.deleteChoose(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * get the choose by id
	 * @Title: getChooseById
	 * @data:2015年4月9日下午2:47:33
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void getChooseById(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				ChooseDao.ID
			});
			
			ajaxResponse = chooseService.getChooseById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * reuse the choose when it is modified
	 * @Title: reuseChoose
	 * @data:2015年4月9日下午2:47:45
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void reuseChoose(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				ChooseDao.ID
			});
			
			ajaxResponse = chooseService.reuseChooseById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * reuse the blank when it is modified
	 * @Title: reuseBlank
	 * @data:2015年4月9日下午2:48:06
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void reuseBlank(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				BlankDao.ID
			});
			
			ajaxResponse = blankService.reuseBlankById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * reuse the simple when it is modified
	 * @Title: reuseSimple
	 * @data:2015年4月9日下午2:48:23
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void reuseSimple(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				SimpleDao.ID
			});
			
			ajaxResponse = simpleService.reuseSimpleById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * reuse the judge when it is modified
	 * @Title: reuseJudge
	 * @data:2015年4月9日下午2:48:37
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void reuseJudge(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				JudgeDao.ID
			});
			
			ajaxResponse = judgeService.reuseJudgeById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * find all banks for the team
	 * @Title: findBanksByTeamId
	 * @data:2015年4月9日下午2:48:53
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void findBanksByTeamId(){
		FlexiGrid flexigrid;
		
		try {
			RequestParameter param = this.extractParameter(new String[]{
					FlexiGrid.KEY_QUERY_JSON
			});
			
			flexigrid = bankService.getBanksByTeamId(param);
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
		} catch (RequestParameterException e) {

			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
			e.printStackTrace();
		}
	}
	
<<<<<<< HEAD
	/**
	 * change the bank for the choose
	 * @Title: updateBankForChoose
	 * @data:2015年4月9日下午2:49:19
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void updateBankForChoose(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				ChooseDao.ID,
				ChooseDao.BANK_ID
			});
			ajaxResponse = chooseService.updateChooseBankById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * change the bank for the blank
	 * @Title: updateBankForBlank
	 * @data:2015年4月9日下午2:49:40
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void updateBankForBlank(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				ChooseDao.ID,
				ChooseDao.BANK_ID
			});
			ajaxResponse = blankService.updateBlankBankById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * change the bank for the simple
	 * @Title: updateBankForSimple
	 * @data:2015年4月9日下午2:49:55
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void updateBankForSimple(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				SimpleDao.ID,
				SimpleDao.BANK_ID
			});
			ajaxResponse = simpleService.updateSimpleBankById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * change the bank for the judge
	 * @Title: updateBankForJudge
	 * @data:2015年4月9日下午2:50:12
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void updateBankForJudge(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				JudgeDao.ID,
				JudgeDao.BANK_ID
			});
			ajaxResponse = judgeService.updateJudgeBankById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * let the choose to be tested
	 * @Title: unusePaperForChoose
	 * @data:2015年4月9日下午2:50:30
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void unusePaperForChoose(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				ChooseDao.ID,
			});
			ajaxResponse = chooseService.unusePaperById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * let the blank to be tested
	 * @Title: unusePaperForBlank
	 * @data:2015年4月9日下午2:51:26
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void unusePaperForBlank(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				BlankDao.ID,
			});
			ajaxResponse = blankService.unusePaperById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * let the simple to be tested
	 * @Title: unusePaperForSimple
	 * @data:2015年4月9日下午2:51:40
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void unusePaperForSimple(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				SimpleDao.ID,
			});
			ajaxResponse = simpleService.unusePaperById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * let the judge to be tested
	 * @Title: unusePaperForJudge
	 * @data:2015年4月9日下午2:51:57
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void unusePaperForJudge(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				JudgeDao.ID,
			});
			ajaxResponse = judgeService.unusePaperById(param);
			if(ajaxResponse == null){
				ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_FAIL);
			}
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * find all papers for the team
	 * @Title: findPapersByTeamId
	 * @data:2015年4月9日下午2:52:11
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void findPapersByTeamId(){
		try {
			FlexiGrid flexigrid;
			RequestParameter param = this.extractParameter(new String[]{
				FlexiGrid.KEY_QUERY_JSON
			});
			flexigrid = paperService.findPapersByTeamId(param);
			
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * change the paper for the choose
	 * @Title: updatePaperForChoose
	 * @data:2015年4月9日下午2:52:29
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void updatePaperForChoose(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				ChooseDao.ID,
				ChooseDao.PAPER_ID
			});
			ajaxResponse = chooseService.updatePaperById(param);
			
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * change the paper for the blank
	 * @Title: updatePaperForBlank
	 * @data:2015年4月9日下午2:52:47
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void updatePaperForBlank(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				BlankDao.ID,
				BlankDao.PAPER_ID
			});
			ajaxResponse = blankService.updatePaperById(param);
			
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * change the simple for the paper
	 * @Title: updatePaperForSimple
	 * @data:2015年4月9日下午2:52:58
	 * @author:zhangying void
	 */
=======
	
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void updatePaperForSimple(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				SimpleDao.ID,
				SimpleDao.PAPER_ID
			});
			ajaxResponse = simpleService.updatePaperById(param);
			
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * change the paper for the judge
	 * @Title: updatePaperForJudge
	 * @data:2015年4月9日下午2:53:12
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void updatePaperForJudge(){
		try {
			AjaxResponse ajaxResponse;
			RequestParameter param = this.extractParameter(new String[]{
				JudgeDao.ID,
				JudgeDao.PAPER_ID
			});
			ajaxResponse = judgeService.updatePaperById(param);
			
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(ajaxResponse));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * find the student score which has join their paper exam
	 * @Title: findStudentScoreInfoByTeamId
	 * @data:2015年4月9日下午2:53:24
	 * @author:zhangying void
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void findStudentScoreInfoByTeamId(){
		try {
			FlexiGrid flexigrid;
			RequestParameter param = this.extractParameter(new String[]{
				FlexiGrid.KEY_QUERY_JSON
			});
			flexigrid = userPaperService.findUserPapersByTeamId(param);
			
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * find the student scores which have not been went over
	 * @Title: findStudentScoreInfoByTeamIdNotWentOver
	 * @data:2015年4月9日下午2:54:16
	 * @author:zhangying void
	 */
=======
	
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public void findStudentScoreInfoByTeamIdNotWentOver(){
		try {
			FlexiGrid flexigrid;
			RequestParameter param = this.extractParameter(new String[]{
				FlexiGrid.KEY_QUERY_JSON
			});
			flexigrid = userPaperService.findUserPapersByTeamIdNotWentOver(param);
			
			
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(flexigrid));
		} catch (RequestParameterException e) {
			e.printStackTrace();
			CommonSendMeg.writeMsg(JackJson.fromObjectToJson(e.getMessage()));
		}
	}
	
<<<<<<< HEAD
	/**
	 * validate if the id is legal
	 * @Title: validateBankId
	 * @data:2015年4月9日下午2:55:10
	 * @author:zhangying
	 * @param bankId
	 * @return boolean
	 */
=======
	
	
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateBankId(String bankId){
		return bankId != null && bankId.length() > 0 && StringUtils.isNumeric(bankId);
	}
	
<<<<<<< HEAD
	/**
	 * validate if the topic is legal
	 * @Title: validateTopic
	 * @data:2015年4月9日下午2:55:25
	 * @author:zhangying
	 * @param topic
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateTopic(String topic){
		return topic != null && topic.length() > 0;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the answer is legal
	 * @Title: validateAnswer
	 * @data:2015年4月9日下午2:55:48
	 * @author:zhangying
	 * @param answer
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateAnswer(String answer){
		return answer != null && answer.length() > 0;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the teamId is legal
	 * @Title: validateTeamId
	 * @data:2015年4月9日下午2:56:00
	 * @author:zhangying
	 * @param teamId
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateTeamId(String teamId){
		return teamId != null && teamId.length() > 0 && StringUtils.isNumeric(teamId);
	}
	
<<<<<<< HEAD
	/**
	 * validate if the id is legal
	 * @Title: validateId
	 * @data:2015年4月9日下午2:56:13
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
	 * validate if the name if legal
	 * @Title: validateName
	 * @data:2015年4月9日下午2:56:23
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
	 * @data:2015年4月9日下午2:56:34
	 * @author:zhangying
	 * @param password
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validatePassword(String password){
		return password != null && password.length() > 6 && password.length() < 25; 
	}
	
<<<<<<< HEAD
	/**
	 * validate if the teamStatus id legal
	 * @Title: validateTeamStatus
	 * @data:2015年4月9日下午2:56:47
	 * @author:zhangying
	 * @param teamStatus
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateTeamStatus(String teamStatus){
		return teamStatus != null && (teamStatus.equals("0") || teamStatus.equals("1") || teamStatus.equals("2"));
	}
	
<<<<<<< HEAD
	/**
	 * validate if the age is legal
	 * @Title: validateAge
	 * @data:2015年4月9日下午2:57:03
	 * @author:zhangying
	 * @param age
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateAge(String age){
		return (age == null ) || (age != null && Integer.parseInt(age) > 0 && Integer.parseInt(age) < 200);
	}
	
<<<<<<< HEAD
	/**
	 * validate if the birthday is legal
	 * @Title: validateBirthday
	 * @data:2015年4月9日下午2:57:15
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
	 * @data:2015年4月9日下午2:57:33
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
	 * @data:2015年4月9日下午2:57:49
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
	 * validate if the email is legal
	 * @Title: validateEmail
	 * @data:2015年4月9日下午2:58:01
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
	 * @data:2015年4月9日下午2:58:13
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
	 * validate if the optionA is legal
	 * @Title: validateOptionA
	 * @data:2015年4月9日下午2:58:33
	 * @author:zhangying
	 * @param optionA
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateOptionA(String optionA){
		return optionA != null && optionA.length() > 0;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the optionB id legal
	 * @Title: validateOptionB
	 * @data:2015年4月9日下午2:59:06
	 * @author:zhangying
	 * @param optionB
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateOptionB(String optionB){
		return optionB != null && optionB.length() > 0;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the optionC is legal
	 * @Title: validateOptionC
	 * @data:2015年4月9日下午2:59:25
	 * @author:zhangying
	 * @param optionC
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateOptionC(String optionC){
		return optionC != null && optionC.length() > 0;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the optionD is legal
	 * @Title: validateOptionD
	 * @data:2015年4月9日下午2:59:39
	 * @author:zhangying
	 * @param optionD
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateOptionD(String optionD){
		return optionD != null && optionD.length() > 0;
	}
	
<<<<<<< HEAD
	/**
	 * validate if the paperId is legal
	 * @Title: validatePaperId
	 * @data:2015年4月9日下午2:59:54
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
	 * validate if the score is legal
	 * @Title: validateScore
	 * @data:2015年4月9日下午3:00:08
	 * @author:zhangying
	 * @param score
	 * @return boolean
	 */
=======
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	public boolean validateScore(String score){
		return score != null && score.length() > 0 && StringUtils.isNumeric(score);
	}

}
