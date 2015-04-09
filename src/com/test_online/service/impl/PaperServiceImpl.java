/*  
 * @(#) PaperServiceImpl.java Create on 2015年3月24日 上午9:44:56   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test_online.base.BaseAction.RequestParameter;
import com.test_online.base.BaseAction.RequestParameterException;
import com.test_online.dao.PaperDao;
import com.test_online.dao.UserDao;
import com.test_online.dao.UserPaperDao;
import com.test_online.flexigrid.bean.Addparams;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.module.PaperBean;
import com.test_online.module.UserBean;
import com.test_online.module.UserPaperBean;
import com.test_online.service.PaperService;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年3月24日
 */
@Service
public class PaperServiceImpl implements PaperService{

	@Autowired
	private PaperDao paperDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private UserPaperDao userPaperDao;
	
	
	@Override
	public FlexiGrid findPapersByTeamId(RequestParameter param) throws RequestParameterException {
		String flexString = param.get(FlexiGrid.KEY_QUERY_JSON);
		
		FlexiGrid flexiGrid = JackJson.fromJsonToObject(flexString, FlexiGrid.class);
		List<PaperBean> papers = null;
		List<Addparams> params = flexiGrid.getAddparams();
		for(Addparams addparam : params){
			if(addparam != null){
				if(PaperDao.TEAM_ID.equals(addparam.getName()) && addparam.getValue() != null && addparam.getValue() != ""){
					String teamId = (String) addparam.getValue();
					papers = paperDao.findByTeamId(Integer.parseInt(teamId));
				}
			}
		}
		if(papers != null){
			flexiGrid.setRows(papers);
			flexiGrid.setTotal((long) papers.size());
		}
		return flexiGrid;
	}


	@Override
	public FlexiGrid findAllPapers(RequestParameter param) throws RequestParameterException {
		String flexString = param.get(FlexiGrid.KEY_QUERY_JSON);
		
		FlexiGrid flexiGrid = JackJson.fromJsonToObject(flexString, FlexiGrid.class);
		
		Integer userId = null;
		List<Addparams> addparams = flexiGrid.getAddparams();
		if(addparams != null){
			for(Addparams addparam : addparams){
				if(addparam != null){
					if(UserPaperDao.USER_ID.equals(addparam.getName())){
						userId = Integer.parseInt(addparam.getValue().toString());
					}
				}
			}
		}
		
		List<PaperBean> papers = paperDao.findByExamPaper("Y");
		List<UserPaperBean> examedPaper = null;
		if(userId != null){
			examedPaper = userPaperDao.findUserPaperByUserId(userId);
		}
		if(examedPaper != null){
			for(UserPaperBean userPaper : examedPaper){
				for(Iterator<PaperBean> iter = papers.iterator();iter.hasNext();){
					PaperBean paper = iter.next();
					if(userPaper != null){
						if(paper != null){
							if(userPaper.getPaperId() == paper.getId()){
								iter.remove();
							}
						}
					}
				}
			}
			
		}
		for(PaperBean paper : papers){
			if(paper != null){
				Integer teamId = paper.getTeamId();
				if(teamId != null){
					UserBean user = userDao.findById(teamId);
					if(user != null){
						paper.set_teamName(user.getName());
					}
				}
			}
		}
	
		if(papers != null){
			flexiGrid.setRows(papers);
			flexiGrid.setTotal((long) papers.size());
		}
		return flexiGrid;
	}

}
