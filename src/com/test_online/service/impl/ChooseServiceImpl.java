/*  
 * @(#) ChooseServiceImpl.java Create on 2015年3月24日 上午9:44:15   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test_online.base.BaseAction.RequestParameter;
import com.test_online.base.BaseAction.RequestParameterException;
import com.test_online.dao.BankDao;
import com.test_online.dao.BlankDao;
import com.test_online.dao.ChooseAnswerDao;
import com.test_online.dao.ChooseDao;
import com.test_online.dao.PaperDao;
import com.test_online.flexigrid.bean.Addparams;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.module.BankBean;
import com.test_online.module.ChooseAnswerBean;
import com.test_online.module.ChooseBean;
import com.test_online.module.PaperBean;
import com.test_online.service.ChooseService;
import com.test_online.util.AjaxResponse;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年3月24日
 */
@Service
public class ChooseServiceImpl implements ChooseService{

	@Autowired
	private ChooseDao chooseDao;
	
	@Autowired
	private BankDao bankDao;
	
	@Autowired
	private PaperDao paperDao;
	
	@Autowired
	private ChooseAnswerDao chooseAnswerDao;
	
	@Override
	public FlexiGrid getChooseByTeamId(RequestParameter param) throws RequestParameterException {
		String flexigridParams = param.get(FlexiGrid.KEY_QUERY_JSON);
		
		FlexiGrid params = JackJson.fromJsonToObject(flexigridParams, FlexiGrid.class);
		
		List<Addparams> addparams = params.getAddparams();

		String teamId = "-1";
		
		for(Addparams addparam : addparams){
			if(BankDao.TEAM_ID.equals(addparam.getName()) && addparam.getValue() != null){
				teamId = addparam.getValue().toString();
			}
		}
		
		List<BankBean> banks = bankDao.findByTeamId(Integer.parseInt(teamId));
		
		if(banks != null){
			List<ChooseBean> blanks = new ArrayList<ChooseBean>();
			
			for(BankBean bank : banks){
				int bankId = bank.getId();
				List<ChooseBean> tempChooses = chooseDao.findByBankId(bankId);
				for(ChooseBean choose : tempChooses){
					Integer paperId = choose.getPaperId();
					if(paperId != null){
						PaperBean paper = paperDao.findById(paperId);
						if(paper != null){
							choose.set_paperName(paper.getName());
						}
					}
					choose.set_bankName(bank.getName());
					blanks.add(choose);
				}
			}
			params.setTotal((long)blanks.size());
			params.setRows(blanks);
			
			return params;
		}
		return params;
	}

	@Override
	public AjaxResponse updateChoose(RequestParameter param) throws RequestParameterException {
		String id = param.get(ChooseDao.ID);
		String bankId = param.get(ChooseDao.BANK_ID);
		String answer = param.get(ChooseDao.ANSWER);
		String remark = param.get(ChooseDao.REMARK);
		String topic = param.get(ChooseDao.TOPIC);
		String optionA = param.get(ChooseDao.OPTION_A);
		String optionB = param.get(ChooseDao.OPTION_B);
		String optionC = param.get(ChooseDao.OPTION_C);
		String optionD = param.get(ChooseDao.OPTION_D);
		String score = param.get(ChooseDao.SCORE);
		
		ChooseBean choose = chooseDao.findById(Integer.parseInt(id));
		choose.setBankId(Integer.parseInt(bankId));
		choose.setAnswer(answer);
		choose.setRemark(remark);
		choose.setTopic(topic);
		choose.setUseStatus(false);
		choose.setOptionA(optionA);
		choose.setOptionB(optionB);
		choose.setOptionC(optionC);
		choose.setOptionD(optionD);
		choose.setScore(Integer.parseInt(score));
		
		chooseDao.update(choose);
		
		AjaxResponse ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS); 
		
		return ajaxResponse;
	}

	@Override
	public AjaxResponse addChoose(RequestParameter param) throws RequestParameterException {
		String bankId = param.get(BlankDao.BANK_ID);
		String answer = param.get(BlankDao.ANSWER);
		String remark = param.get(BlankDao.REMARK);
		String topic = param.get(BlankDao.TOPIC);
		String optionA = param.get(ChooseDao.OPTION_A);
		String optionB = param.get(ChooseDao.OPTION_B);
		String optionC = param.get(ChooseDao.OPTION_C);
		String optionD = param.get(ChooseDao.OPTION_D);
		String score = param.get(ChooseDao.SCORE);
		
		ChooseBean choose = new ChooseBean();
		choose.setBankId(Integer.parseInt(bankId));
		choose.setAnswer(answer);
		choose.setRemark(remark);
		choose.setTopic(topic);
		choose.setOptionA(optionA);
		choose.setOptionB(optionB);
		choose.setOptionC(optionC);
		choose.setOptionD(optionD);
		choose.setUseStatus(false);
		choose.setScore(Integer.parseInt(score));
		
		chooseDao.save(choose);
		
		AjaxResponse ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS); 
		
		return ajaxResponse;
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.ChooseService#deleteChoose(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年3月27日上午9:46:36
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse deleteChoose(RequestParameter param) throws RequestParameterException {
		String id = param.get(BlankDao.ID);
		
		ChooseBean choose = chooseDao.findById(Integer.parseInt(id));
		
		if(choose == null){
			
			return new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		
		chooseDao.delete(choose);
		
		List<ChooseAnswerBean> chooseAnswers = chooseAnswerDao.findByChooseId(Integer.parseInt(id));
		if(chooseAnswers != null){
			for(ChooseAnswerBean chooseAnswer : chooseAnswers){
				if(chooseAnswer != null){
					chooseAnswerDao.delete(chooseAnswer);
				}
			}
		}
		
		
		return new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
	}

	@Override
	public AjaxResponse getChooseById(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse;
		
		String id = param.get(BlankDao.ID);
		
		ChooseBean choose = chooseDao.findById(Integer.parseInt(id));
		
		if(choose != null){
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			ajaxResponse.setData(choose);
		}else{
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		return ajaxResponse;
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.ChooseService#reuseChooseById(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年3月27日下午12:43:27
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse reuseChooseById(RequestParameter param) throws RequestParameterException {

		String id = param.get(ChooseDao.ID);
		ChooseBean choose = chooseDao.findById(Integer.parseInt(id));
		choose.setUseStatus(true);
		chooseDao.update(choose);
		AjaxResponse ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
		return ajaxResponse;
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.ChooseService#updateChooseBankById(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年3月27日下午12:43:23
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse updateChooseBankById(RequestParameter param) throws RequestParameterException {

		AjaxResponse ajaxResponse;
		String chooseId = param.get(ChooseDao.ID);
		String bankId = param.get(ChooseDao.BANK_ID);
		
		ChooseBean choose = chooseDao.findById(Integer.parseInt(chooseId));
		
		if(choose != null){
			choose.setBankId(Integer.parseInt(bankId));
			choose.setUseStatus(false);
		}
		
		chooseDao.update(choose);
		
		ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
		
		return ajaxResponse;
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.ChooseService#updatePaperById(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年3月27日下午2:44:52
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse updatePaperById(RequestParameter param) throws RequestParameterException {

		AjaxResponse ajaxResponse;
		
		String chooseId = param.get(ChooseDao.ID);
		String paperId = param.get(ChooseDao.PAPER_ID);
		
		ChooseBean choose = chooseDao.findById(Integer.parseInt(chooseId));
		if(choose != null){
			choose.setPaperId(Integer.parseInt(paperId));
			choose.setUseStatus(false);
		}
		
		chooseDao.update(choose);
		
		ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
		
		return ajaxResponse;
	}

	@Override
	public AjaxResponse unusePaperById(RequestParameter param) throws RequestParameterException {

		AjaxResponse ajaxResponse = null;
		
		String id = param.get(ChooseDao.ID);
		
		ChooseBean choose = chooseDao.findById(Integer.parseInt(id));
		
		if(choose != null){
			choose.setPaperId(null);
			choose.setUseStatus(false);
			chooseDao.update(choose);
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
		}
		return ajaxResponse;
	}

}
