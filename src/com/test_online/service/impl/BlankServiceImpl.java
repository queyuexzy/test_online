/*  
 * @(#) BlankServiceImpl.java Create on 2015年3月24日 上午9:42:24   
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
import com.test_online.dao.BlankAnswerDao;
import com.test_online.dao.BlankDao;
import com.test_online.dao.PaperDao;
import com.test_online.flexigrid.bean.Addparams;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.module.BankBean;
import com.test_online.module.BlankAnswerBean;
import com.test_online.module.BlankBean;
import com.test_online.module.PaperBean;
import com.test_online.service.BlankService;
import com.test_online.util.AjaxResponse;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年3月24日
 */
@Service
public class BlankServiceImpl implements BlankService{

	@Autowired
	private BlankDao blankDao;
	
	@Autowired
	private BankDao bankDao;
	
	@Autowired
	private PaperDao paperDao;
	
	@Autowired
	private BlankAnswerDao blankAnswerDao;
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.BlankService#getBlankByTeamId(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年3月25日下午2:43:30
	 * @author: zhangying
	 */
	@Override
	public FlexiGrid getBlankByTeamId(RequestParameter param) throws RequestParameterException {
		
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
			List<BlankBean> blanks = new ArrayList<BlankBean>();
			
			for(BankBean bank : banks){
				int bankId = bank.getId();
				List<BlankBean> tempBlanks = blankDao.findByBankId(bankId);
				for(BlankBean blank : tempBlanks){
					Integer paperId = blank.getPaperId();
					if(paperId != null){
						PaperBean paper = paperDao.findById(paperId);
						if(paper != null){
							blank.set_paperName(paper.getName());
						}
					}
					blank.set_bankName(bank.getName());
					blanks.add(blank);
				}
			}
			params.setTotal((long)blanks.size());
			params.setRows(blanks);
			
			return params;
		}
		return params;
		
	
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.BlankService#addBlank(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年3月26日下午3:04:35
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse addBlank(RequestParameter param) throws RequestParameterException {

		String bankId = param.get(BlankDao.BANK_ID);
		String answer = param.get(BlankDao.ANSWER);
		String remark = param.get(BlankDao.REMARK);
		String topic = param.get(BlankDao.TOPIC);
		String score = param.get(blankDao.SCORE);
		
		BlankBean blank = new BlankBean();
		blank.setBankId(Integer.parseInt(bankId));
		blank.setAnswer(answer);
		blank.setRemark(remark);
		blank.setTopic(topic);
		blank.setUseStatus(false);
		blank.setScore(Integer.parseInt(score));
		
		blankDao.save(blank);
		
		AjaxResponse ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS); 
		
		return ajaxResponse;
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.BlankService#deleteBlank(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年3月26日下午3:54:22
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse deleteBlank(RequestParameter param) throws  RequestParameterException{

		String id = param.get(BlankDao.ID);
		
		BlankBean blank = blankDao.findById(Integer.parseInt(id));
		
		if(blank == null){
			
			return new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		
		blankDao.delete(blank);
		
		List<BlankAnswerBean> blankAnswers = blankAnswerDao.findByBlankId(Integer.parseInt(id));
		if(blankAnswers != null){
			for(BlankAnswerBean blankAnswer : blankAnswers){
				if(blankAnswer != null){
					blankAnswerDao.delete(blankAnswer);
				}
			}
		}
		
		return new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
		
	}

	@Override
	public AjaxResponse getBlankById(RequestParameter param) throws RequestParameterException {
		
		AjaxResponse ajaxResponse;
	
		String id = param.get(BlankDao.ID);
		
		BlankBean blank = blankDao.findById(Integer.parseInt(id));
		
		if(blank != null){
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			ajaxResponse.setData(blank);
		}else{
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		return ajaxResponse;
	}

	@Override
	public AjaxResponse updateBlank(RequestParameter param) throws RequestParameterException {
		String id = param.get(BlankDao.ID);
		String bankId = param.get(BlankDao.BANK_ID);
		String answer = param.get(BlankDao.ANSWER);
		String remark = param.get(BlankDao.REMARK);
		String topic = param.get(BlankDao.TOPIC);
		String score = param.get(BlankDao.SCORE);
		
		BlankBean blank = blankDao.findById(Integer.parseInt(id));
		blank.setId(Integer.parseInt(id));
		blank.setBankId(Integer.parseInt(bankId));
		blank.setAnswer(answer);
		blank.setRemark(remark);
		blank.setTopic(topic);
		blank.setUseStatus(false);
		blank.setScore(Integer.parseInt(score));
		
		blankDao.update(blank);
		
		AjaxResponse ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS); 
		
		return ajaxResponse;	
		
	}

	@Override
	public AjaxResponse updateBlankBankById(RequestParameter param) throws RequestParameterException {

		AjaxResponse ajaxResponse;
		
		String id = param.get(BlankDao.ID);
		String bankId = param.get(BlankDao.BANK_ID);
		
		BlankBean blank = blankDao.findById(Integer.parseInt(id));
		
		if(blank != null){
			blank.setBankId(Integer.parseInt(bankId));
			blankDao.update(blank);
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
		
		BlankBean blank = blankDao.findById(Integer.parseInt(id));
		
		if(blank != null){
			blank.setPaperId(Integer.parseInt(paperId));
			blankDao.update(blank);
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
		
		BlankBean blank = blankDao.findById(Integer.parseInt(id));
		
		if(blank != null){
			blank.setPaperId(null);
			blank.setUseStatus(false);
			blankDao.update(blank);
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			
		}else{
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		return ajaxResponse;
	}

	@Override
	public AjaxResponse reuseBlankById(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse;
		
		String id = param.get(BlankDao.ID);
		
		BlankBean blank = blankDao.findById(Integer.parseInt(id));
		
		if(blank != null){
			blank.setUseStatus(true);
			blankDao.update(blank);
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			
		}else{
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_RESULT_NOT_FOUND);
		}
		return ajaxResponse;
	}
}
