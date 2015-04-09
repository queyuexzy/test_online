/*  
 * @(#) UserPaperServiceImpl.java Create on 2015年3月31日 下午3:41:14   
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
import com.test_online.dao.PaperDao;
import com.test_online.dao.UserDao;
import com.test_online.dao.UserPaperDao;
import com.test_online.flexigrid.bean.Addparams;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.module.PaperBean;
import com.test_online.module.UserBean;
import com.test_online.module.UserPaperBean;
import com.test_online.service.UserPaperService;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年3月31日
 */
@Service
public class UserPaperServiceImpl implements UserPaperService {

	@Autowired
	private UserPaperDao userPaperDao;
	
	@Autowired
	private PaperDao paperDao;
	
	@Autowired
	private UserDao userDao;
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.UserPaperService#findUserPapersByTeamId(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年3月31日下午3:44:16
	 * @author: zhangying
	 */
	@Override
	public FlexiGrid findUserPapersByTeamId(RequestParameter param) throws RequestParameterException {
		
		String queryString = param.get(FlexiGrid.KEY_QUERY_JSON);
		
		FlexiGrid flexiGrid = JackJson.fromJsonToObject(queryString, FlexiGrid.class);
		
		List<Addparams> addparams = flexiGrid.getAddparams();
		
		int teamId = -1;
		
		if(addparams != null){
			for(Addparams addparam : addparams){
				if(addparam != null){
					if(PaperDao.TEAM_ID.equals(addparam.getName())){
						teamId = Integer.parseInt(addparam.getValue().toString());
					}
				}
			}
		}
		
		if(teamId != -1){
			List<PaperBean> papers = paperDao.findByTeamId(teamId);
			List<UserPaperBean> userPapers = new ArrayList<UserPaperBean>();
			UserBean user = userDao.findById(teamId);
			if(user != null){
				if(papers != null){
					for(PaperBean paper : papers){
						if(paper != null){
							List<UserPaperBean> userPapersTemp = userPaperDao.findUserPaperByPaperId(paper.getId());
							if(userPapersTemp != null){
								for(UserPaperBean userPaper : userPapersTemp){
									if(userPaper != null){
										UserBean userInUserPaper = userDao.findById(userPaper.getUserId());
										if(userInUserPaper != null){
											
											userPaper.set_userName(userInUserPaper.getName());
										}
										userPaper.set_paperName(paper.getName());
										userPapers.add(userPaper);
									}
								}
							}
						}
					}
				}
			}
			
			flexiGrid.setRows(userPapers);
			flexiGrid.setTotal((long)userPapers.size());
		}
		return flexiGrid;
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.UserPaperService#findUserPapersByTeamIdNotWentOver(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月2日下午1:55:35
	 * @author: zhangying
	 */
	@Override
	public FlexiGrid findUserPapersByTeamIdNotWentOver(RequestParameter param) throws RequestParameterException {
		String queryString = param.get(FlexiGrid.KEY_QUERY_JSON);
		
		FlexiGrid flexiGrid = JackJson.fromJsonToObject(queryString, FlexiGrid.class);
		
		List<Addparams> addparams = flexiGrid.getAddparams();
		
		int teamId = -1;
		
		if(addparams != null){
			for(Addparams addparam : addparams){
				if(addparam != null){
					if(PaperDao.TEAM_ID.equals(addparam.getName())){
						teamId = Integer.parseInt(addparam.getValue().toString());
					}
				}
			}
		}
		
		if(teamId != -1){
			List<PaperBean> papers = paperDao.findByTeamId(teamId);
			List<UserPaperBean> userPapers = new ArrayList<UserPaperBean>();
			UserBean user = userDao.findById(teamId);
			if(user != null){
				if(papers != null){
					for(PaperBean paper : papers){
						if(paper != null){
							List<UserPaperBean> userPapersTemp = userPaperDao.findUserPaperByPaperId(paper.getId());
							if(userPapersTemp != null){
								for(UserPaperBean userPaper : userPapersTemp){
									if(userPaper != null){
										UserBean userInUserPaper = userDao.findById(userPaper.getUserId());
										if(userInUserPaper != null){
											userPaper.set_userName(userInUserPaper.getName());
										}
										userPaper.set_paperName(paper.getName());
										if(userPaper.getScore() == null){
											userPapers.add(userPaper);
										}
									}
								}
							}
						}
					}
				}
			}
			
			flexiGrid.setRows(userPapers);
			flexiGrid.setTotal((long)userPapers.size());
		}
		return flexiGrid;
	}
}
