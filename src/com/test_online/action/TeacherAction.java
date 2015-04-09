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
	
	
	
	public boolean validateBankId(String bankId){
		return bankId != null && bankId.length() > 0 && StringUtils.isNumeric(bankId);
	}
	
	public boolean validateTopic(String topic){
		return topic != null && topic.length() > 0;
	}
	
	public boolean validateAnswer(String answer){
		return answer != null && answer.length() > 0;
	}
	
	public boolean validateTeamId(String teamId){
		return teamId != null && teamId.length() > 0 && StringUtils.isNumeric(teamId);
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
	
	public boolean validateTeamStatus(String teamStatus){
		return teamStatus != null && (teamStatus.equals("0") || teamStatus.equals("1") || teamStatus.equals("2"));
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
	
	public boolean validateOptionA(String optionA){
		return optionA != null && optionA.length() > 0;
	}
	
	public boolean validateOptionB(String optionB){
		return optionB != null && optionB.length() > 0;
	}
	
	public boolean validateOptionC(String optionC){
		return optionC != null && optionC.length() > 0;
	}
	
	public boolean validateOptionD(String optionD){
		return optionD != null && optionD.length() > 0;
	}
	
	public boolean validatePaperId(String paperId){
		return paperId != null && paperId.length() > 0 && StringUtils.isNumeric(paperId);
	}
	
	public boolean validateScore(String score){
		return score != null && score.length() > 0 && StringUtils.isNumeric(score);
	}

}
