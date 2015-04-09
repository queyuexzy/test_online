/*  
 * @(#) PaperDao.java Create on 2015年3月20日 下午2:10:22   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.dao;

import java.util.List;

import com.test_online.module.PaperBean;

/**
 * 
 * @author zhangying
 * @date   2015年3月20日
 */
public interface PaperDao {
	
	// property constants
	public static final String ID = "id";
	public static final String TEAM_ID = "teamId";
	public static final String NAME = "name";
	public static final String EXAM_PAPER = "examPaper";
	public static final String UPDATE_TIME = "updateTime";
	public static final String CREATE_TIME = "createTime";
	public static final String REMARK = "remark";
	
	/**
	 * save a PaperBean instance
	 * @Title: save
	 * @data:2015年3月23日下午4:48:58
	 * @author:zhangying
	 * @param transientInstance void
	 */
	public void save(PaperBean transientInstance);
	
	/**
	 * delete a PaperBean instance
	 * @Title: delete
	 * @data:2015年3月23日下午4:49:11
	 * @author:zhangying
	 * @param persistentInstance void
	 */
	public void delete(PaperBean persistentInstance);
	
	/**
	 * find a PapaerBean instance by id
	 * @Title: findById
	 * @data:2015年3月23日下午4:49:30
	 * @author:zhangying
	 * @param id
	 * @return PaperBean
	 */
	public PaperBean findById(java.lang.Integer id);
	
	/**
	 * find a list of PaperBean by examPaper
	 * @Title: findByExamPaper
	 * @data:2015年3月23日下午4:49:48
	 * @author:zhangying
	 * @param examPaper
	 * @return List<PaperBean>
	 */
	public List<PaperBean> findByExamPaper(String examPaper);
	
	/**
	 * find all PaperBean instances
	 * @Title: findAll
	 * @data:2015年3月23日下午4:50:12
	 * @author:zhangying
	 * @return List<PaperBean>
	 */
	public List<PaperBean> findAll();
	
	/**
	 * update a PaperBean
	 * @Title: update
	 * @data:2015年3月23日下午4:50:29
	 * @author:zhangying
	 * @param updateInstance void
	 */
	public void update(PaperBean updateInstance);
	
	/**
	 * find a list of paperbean by teamId
	 * @Title: findByTeamId
	 * @data:2015年3月27日下午1:30:13
	 * @author:zhangying
	 * @param teamId
	 * @return List<PaperBean>
	 */
	public List<PaperBean> findByTeamId(int teamId);

}
