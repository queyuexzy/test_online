/*  
 * @(#) SimpleServiceImpl.java Create on 2015年3月24日 上午9:45:29   
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
import com.test_online.dao.PaperDao;
import com.test_online.dao.SimpleAnswerDao;
import com.test_online.dao.SimpleDao;
import com.test_online.flexigrid.bean.Addparams;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.module.BankBean;
import com.test_online.module.PaperBean;
import com.test_online.module.SimpleAnswerBean;
import com.test_online.module.SimpleBean;
import com.test_online.service.SimpleService;
import com.test_online.util.AjaxResponse;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年3月24日
 */
@Service
public class SimpleServiceImpl implements SimpleService{

	@Autowired
	private SimpleDao simpleDao;
	
	@Autowired
	private BankDao bankDao;
	
	@Autowired
	private PaperDao paperDao;
	
	@Autowired
	private SimpleAnswerDao simpleAnswerDao;
	
	@Override
	public FlexiGrid getSimplesByTeamId(RequestParameter param) throws RequestParameterException {
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
			List<SimpleBean> simples = new ArrayList<SimpleBean>();
			
			for(BankBean bank : banks){
				int bankId = bank.getId();
				List<SimpleBean> tempSimples = simpleDao.findByBankId(bankId);
				for(SimpleBean simple : tempSimples){
					Integer paperId = simple.getPaperId();
					if(paperId != null){
						PaperBean paper = paperDao.findById(paperId);
						if(paper != null){
							simple.set_paperName(paper.getName());
						}
					}
					simple.set_bankName(bank.getName());
					simples.add(simple);
				}
			}
			params.setTotal((long)simples.size());
			params.setRows(simples);
			
			return params;
		}
		return params;
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.SimpleService#addSimple(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年3月30日上午8:57:24
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse addSimple(RequestParameter param) throws RequestParameterException {
		
		String bankId = param.get(SimpleDao.BANK_ID);
		String topic = param.get(SimpleDao.TOPIC);
		String answer = param.get(SimpleDao.ANSWER);
		String remark = param.get(SimpleDao.REMARK);
		String score = param.get(SimpleDao.SCORE);
		
		SimpleBean simple = new SimpleBean();
		simple.setBankId(Integer.parseInt(bankId));
		simple.setAnswer(answer);
		simple.setRemark(remark);
		simple.setTopic(topic);
		simple.setUseStatus(false);
		simple.setScore(Integer.parseInt(score));
		
		simpleDao.save(simple);
		
		AjaxResponse ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS); 
		
		return ajaxResponse;
	}

	@Override
	public AjaxResponse getSimpleById(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse;
		
		String id = param.get(SimpleDao.ID);
		
		SimpleBean blank = simpleDao.findById(Integer.parseInt(id));
		
		if(blank != null){
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			ajaxResponse.setData(blank);
		}else{
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		return ajaxResponse;
	}

	@Override
	public AjaxResponse updateSimple(RequestParameter param) throws RequestParameterException {
		String id = param.get(SimpleDao.ID);
		String bankId = param.get(SimpleDao.BANK_ID);
		String answer = param.get(SimpleDao.ANSWER);
		String remark = param.get(SimpleDao.REMARK);
		String topic = param.get(SimpleDao.TOPIC);
		String score = param.get(SimpleDao.SCORE);
		
		SimpleBean simple = simpleDao.findById(Integer.parseInt(id));
		simple.setId(Integer.parseInt(id));
		simple.setBankId(Integer.parseInt(bankId));
		simple.setAnswer(answer);
		simple.setRemark(remark);
		simple.setTopic(topic);
		simple.setUseStatus(false);
		simple.setScore(Integer.parseInt(score));
		
		simpleDao.update(simple);
		
		AjaxResponse ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS); 
		
		return ajaxResponse;
	}

	@Override
	public AjaxResponse deleteSimple(RequestParameter param) throws RequestParameterException {
		String id = param.get(SimpleDao.ID);
		
		SimpleBean simple = simpleDao.findById(Integer.parseInt(id));
		
		if(simple == null){
			
			return new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		
		simpleDao.delete(simple);
		
		List<SimpleAnswerBean> simpleAnswers = simpleAnswerDao.findBySimpleId(Integer.parseInt(id));
		
		if(simpleAnswers != null){
			for(SimpleAnswerBean simpleAnswer : simpleAnswers){
				if(simpleAnswer != null){
					simpleAnswerDao.delete(simpleAnswer);
				}
			}
		}
		
		return new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
	}

	@Override
	public AjaxResponse updateSimpleBankById(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse;
		
		String id = param.get(SimpleDao.ID);
		String bankId = param.get(SimpleDao.BANK_ID);
		
		SimpleBean simple = simpleDao.findById(Integer.parseInt(id));
		
		if(simple != null){
			simple.setBankId(Integer.parseInt(bankId));
			simpleDao.update(simple);
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
		
		SimpleBean simple = simpleDao.findById(Integer.parseInt(id));
		
		if(simple != null){
			simple.setPaperId(Integer.parseInt(paperId));
			simpleDao.update(simple);
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
		
		SimpleBean simple = simpleDao.findById(Integer.parseInt(id));
		
		if(simple != null){
			simple.setPaperId(null);
			simple.setUseStatus(false);
			simpleDao.update(simple);
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			
		}else{
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		return ajaxResponse;
	}

	@Override
	public AjaxResponse reuseSimpleById(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse;
		
		String id = param.get(BlankDao.ID);
		
		SimpleBean simple = simpleDao.findById(Integer.parseInt(id));
		
		if(simple != null){
			simple.setUseStatus(true);
			simpleDao.update(simple);
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			
		}else{
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		return ajaxResponse;
	}

}
