/*  
 * @(#) UserPaperDaoImpl.java Create on 2015年3月31日 上午10:38:43   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test_online.base.BaseDao;
import com.test_online.dao.UserPaperDao;
import com.test_online.module.UserPaperBean;

/**
 * 
 * @author zhangying
 * @date   2015年3月31日
 */
@Repository
public class UserPaperDaoImpl extends BaseDao<UserPaperBean> implements UserPaperDao{

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.UserPaperDao#findUserPaperByUserId(int)
	 * @param userId
	 * @return
	 * @date: 2015年3月31日上午10:45:34
	 * @author: zhangying
	 */
	@Override
	public List<UserPaperBean> findUserPaperByUserId(int userId) {
		return super.findByProperty("UserPaperBean", USER_ID, userId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.UserPaperDao#findUserPaperByPaperId(int)
	 * @param userId
	 * @return
	 * @date: 2015年3月31日下午3:51:55
	 * @author: zhangying
	 */
	@Override
	public List<UserPaperBean> findUserPaperByPaperId(int paperId) {
		return super.findByProperty("UserPaperBean", PAPER_ID, paperId);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#save(java.lang.Object)
	 * @param userPaper
	 * @date: 2015年4月1日下午4:29:59
	 * @author: zhangying
	 */
	@Override
	public void save(UserPaperBean userPaper){
		super.save(userPaper);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.UserPaperDao#findById(int)
	 * @param id
	 * @date: 2015年4月2日下午3:59:23
	 * @author: zhangying
	 */
	@Override
	public UserPaperBean findById(int id) {
		return super.findById(UserPaperBean.class, id);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#update(java.lang.Object)
	 * @param userPaper
	 * @date: 2015年4月2日下午4:15:23
	 * @author: zhangying
	 */
	@Override
	public void update(UserPaperBean userPaper){
		super.update(userPaper);
	}

}
