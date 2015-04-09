/*  
 * @(#) UserPaperDao.java Create on 2015年3月31日 上午10:38:25   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao;

import java.util.List;

import com.test_online.module.UserPaperBean;

/**
 * 
 * @author zhangying
 * @date   2015年3月31日
 */
public interface UserPaperDao {
	public static String ID = "id";
	public static String USER_ID = "userId";
	public static String PAPER_ID = "paperId";
	public static String SCORE = "score";
	public static String REMARK = "remark";
	
	/**
	 * find userPapers by userId
	 * @Title: findUserPaperByUserId
	 * @data:2015年3月31日上午10:45:08
	 * @author:zhangying
	 * @param userId
	 * @return List<UserPaperBean>
	 */
	public List<UserPaperBean> findUserPaperByUserId(int userId);
	
	/**
	 * find user_paper_relation by paperId
	 * @Title: findUserPaperByPaperId
	 * @data:2015年3月31日下午3:51:30
	 * @author:zhangying
	 * @param userId
	 * @return List<UserPaperBean>
	 */
	public List<UserPaperBean> findUserPaperByPaperId(int paperId);
	
	/**
	 * save a instance to the user_paper_relation
	 * @Title: save
	 * @data:2015年4月1日下午4:28:55
	 * @author:zhangying
	 * @param userPaper void
	 */
	public void save(UserPaperBean userPaper);
	
	/**
	 * find a instance in the user_paper_relation
	 * @Title: findById
	 * @data:2015年4月2日下午3:58:35
	 * @author:zhangying
	 * @param id void
	 */
	public UserPaperBean findById(int id);
	
	/**
	 * update a instance in the user_paper_relation
	 * @Title: update
	 * @data:2015年4月2日下午4:13:27
	 * @author:zhangying
	 * @param userpaper void
	 */
	public void update(UserPaperBean userPaper);
}
