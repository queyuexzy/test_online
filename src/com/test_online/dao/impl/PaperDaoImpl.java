package com.test_online.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test_online.base.BaseDao;
import com.test_online.dao.PaperDao;
import com.test_online.module.PaperBean;

/**
 * A data access object (DAO) providing persistence and search support for
 * PaperBean entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.online.module.PaperBean
 * @author MyEclipse Persistence Tools
 */
@Repository
public class PaperDaoImpl extends BaseDao<PaperBean> implements PaperDao{

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#save(java.lang.Object)
	 * @param transientInstance
	 * @date: 2015年3月23日下午4:50:51
	 * @author: zhangying
	 */
	@Override
	public void save(PaperBean transientInstance) {
		super.save(transientInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#delete(java.lang.Object)
	 * @param persistentInstance
	 * @date: 2015年3月23日下午4:51:14
	 * @author: zhangying
	 */
	@Override
	public void delete(PaperBean persistentInstance) {
		super.delete(persistentInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.PaperDao#findById(java.lang.Integer)
	 * @param id
	 * @return
	 * @date: 2015年3月23日下午4:51:20
	 * @author: zhangying
	 */
	@Override
	public PaperBean findById(java.lang.Integer id) {
		return super.findById(PaperBean.class, id);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.PaperDao#findByExamPaper(java.lang.String)
	 * @param examPaper
	 * @return
	 * @date: 2015年3月23日下午4:51:26
	 * @author: zhangying
	 */
	@Override
	public List<PaperBean> findByExamPaper(String examPaper) {
		return findByProperty("PaperBean",EXAM_PAPER, examPaper);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#findAll()
	 * @return
	 * @date: 2015年3月23日下午4:51:32
	 * @author: zhangying
	 */
	@Override
	public List<PaperBean> findAll() {
		return super.findAll("PaperBean");
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#update(java.lang.Object)
	 * @param updateInstance
	 * @date: 2015年3月23日下午4:51:44
	 * @author: zhangying
	 */
	@Override
	public void update(PaperBean updateInstance){
		super.update(updateInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.PaperDao#findByTeamId(int)
	 * @param teamId
	 * @return
	 * @date: 2015年3月27日下午1:30:37
	 * @author: zhangying
	 */
	@Override
	public List<PaperBean> findByTeamId(int teamId) {
		
		return findByProperty("PaperBean",TEAM_ID, teamId);
	}
}