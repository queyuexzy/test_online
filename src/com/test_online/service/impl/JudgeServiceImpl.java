/*  
 * @(#) JudgeServiceImpl.java Create on 2015年3月24日 上午9:44:45   
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
import com.test_online.dao.JudgeAnswerDao;
import com.test_online.dao.JudgeDao;
import com.test_online.dao.PaperDao;
import com.test_online.flexigrid.bean.Addparams;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.module.BankBean;
import com.test_online.module.JudgeAnswerBean;
import com.test_online.module.JudgeBean;
import com.test_online.module.PaperBean;
import com.test_online.service.JudgeService;
import com.test_online.util.AjaxResponse;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年3月24日
 */
@Service
public class JudgeServiceImpl implements JudgeService{

	@Autowired
	private JudgeDao judgeDao;
	
	@Autowired
	private BankDao bankDao;
	
	@Autowired
	private PaperDao paperDao;
	
	@Autowired
	private JudgeAnswerDao judgeAnswerDao;
	
	@Override
	public FlexiGrid getJudgeByTeamId(RequestParameter param) throws RequestParameterException {
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
			List<JudgeBean> judges = new ArrayList<JudgeBean>();
			
			for(BankBean bank : banks){
				int bankId = bank.getId();
				List<JudgeBean> tempBlanks = judgeDao.findByBankId(bankId);
				for(JudgeBean judge : tempBlanks){
					Integer paperId = judge.getPaperId();
					if(paperId != null){
						PaperBean paper = paperDao.findById(paperId);
						if(paper != null){
							judge.set_paperName(paper.getName());
						}
					}
					judge.set_bankName(bank.getName());
					judges.add(judge);
				}
			}
			params.setTotal((long)judges.size());
			params.setRows(judges);
			
			return params;
		}
		return params;
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.JudgeService#addJudge(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年3月30日上午11:30:37
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse addJudge(RequestParameter param) throws RequestParameterException {
		String bankId = param.get(JudgeDao.BANK_ID);
		String topic = param.get(JudgeDao.TOPIC);
		String answer = param.get(JudgeDao.ANSWER);
		String remark = param.get(JudgeDao.REMARK);
		String score = param.get(JudgeDao.SCORE);
		
		JudgeBean judge = new JudgeBean();
		judge.setBankId(Integer.parseInt(bankId));
		if(Integer.parseInt(answer) == JudgeDao.ANSWER_FALSE){
			judge.setAnswer("N");
		}
		if(Integer.parseInt(answer) == JudgeDao.ANSWER_TRUE){
			judge.setAnswer("Y");
		}
		judge.setRemark(remark);
		judge.setTopic(topic);
		judge.setUseStatus(false);
		judge.setScore(Integer.parseInt(score));
		
		judgeDao.save(judge);
		
		AjaxResponse ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS); 
		
		return ajaxResponse;
	}
 
	@Override
	public AjaxResponse getJudgeById(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse;
		
		String id = param.get(JudgeDao.ID);
		
		JudgeBean judge = judgeDao.findById(Integer.parseInt(id));
		
		if(judge != null){
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			ajaxResponse.setData(judge);
		}else{
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		return ajaxResponse;
	}

	@Override
	public AjaxResponse updateJudge(RequestParameter param) throws RequestParameterException {
		String id = param.get(JudgeDao.ID);
		String bankId = param.get(JudgeDao.BANK_ID);
		String answer = param.get(JudgeDao.ANSWER);
		String remark = param.get(JudgeDao.REMARK);
		String topic = param.get(JudgeDao.TOPIC);
		String score = param.get(JudgeDao.SCORE);
		
		JudgeBean judge = judgeDao.findById(Integer.parseInt(id));
		judge.setId(Integer.parseInt(id));
		judge.setBankId(Integer.parseInt(bankId));
		if(Integer.parseInt(answer) == JudgeDao.ANSWER_FALSE){
			judge.setAnswer("N");
		}
		if(Integer.parseInt(answer) == JudgeDao.ANSWER_TRUE){
			judge.setAnswer("Y");
		}
		
		judge.setRemark(remark);
		judge.setTopic(topic);
		judge.setUseStatus(false);
		judge.setScore(Integer.parseInt(score));
		
		judgeDao.update(judge);
		
		AjaxResponse ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS); 
		
		return ajaxResponse;
	}

	@Override
	public AjaxResponse deleteJudge(RequestParameter param) throws RequestParameterException {
		String id = param.get(BlankDao.ID);
		
		JudgeBean judge = judgeDao.findById(Integer.parseInt(id));
		
		if(judge == null){
			
			return new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		
		judgeDao.delete(judge);
		
		List<JudgeAnswerBean> judgeAnswers = judgeAnswerDao.findByJudgeId(Integer.parseInt(id));
		if(judgeAnswers != null){
			for(JudgeAnswerBean judgeAnswer : judgeAnswers){
				if(judgeAnswer != null){
					judgeAnswerDao.delete(judgeAnswer);
				}
			}
		}
		
		return new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
	}

	@Override
	public AjaxResponse updateJudgeBankById(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse;
		
		String id = param.get(JudgeDao.ID);
		String bankId = param.get(JudgeDao.BANK_ID);
		
		JudgeBean judge = judgeDao.findById(Integer.parseInt(id));
		
		if(judge != null){
			judge.setBankId(Integer.parseInt(bankId));
			judgeDao.update(judge);
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			
		}else{
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		return ajaxResponse;
	}

	@Override
	public AjaxResponse unusePaperById(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse;
		
		String id = param.get(BlankDao.ID);
		
		JudgeBean judge = judgeDao.findById(Integer.parseInt(id));
		
		if(judge != null){
			judge.setPaperId(null);
			judge.setUseStatus(false);
			judgeDao.update(judge);
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			
		}else{
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		return ajaxResponse;
	}

	@Override
	public AjaxResponse updatePaperById(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse;
		
		String id = param.get(BlankDao.ID);
		String paperId = param.get(BlankDao.PAPER_ID);
		
		JudgeBean judge = judgeDao.findById(Integer.parseInt(id));
		
		if(judge != null){
			judge.setPaperId(Integer.parseInt(paperId));
			judgeDao.update(judge);
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			
		}else{
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		return ajaxResponse;
	}

	@Override
	public AjaxResponse reuseJudgeById(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse;
		
		String id = param.get(BlankDao.ID);
		
		JudgeBean judge = judgeDao.findById(Integer.parseInt(id));
		
		if(judge != null){
			judge.setUseStatus(true);
			judgeDao.update(judge);
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			
		}else{
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		return ajaxResponse;
	}
}
