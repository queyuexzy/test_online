package com.test_online.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test_online.base.BaseDao;
import com.test_online.dao.JudgeDao;
import com.test_online.module.JudgeBean;

/**
 * A data access object (DAO) providing persistence and search support for
 * JudgeBean entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.online.module.JudgeBean
 * @author MyEclipse Persistence Tools
 */
@Repository
public class JudgeDaoImpl extends BaseDao<JudgeBean> implements JudgeDao{

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#save(java.lang.Object)
	 * @param transientInstance
	 * @date: 2015年3月23日下午4:34:27
	 * @author: zhangying
	 */
	@Override
	public void save(JudgeBean transientInstance) {
		super.save(transientInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#delete(java.lang.Object)
	 * @param persistentInstance
	 * @date: 2015年3月23日下午4:34:39
	 * @author: zhangying
	 */
	@Override
	public void delete(JudgeBean persistentInstance) {
		super.delete(persistentInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.JudgeDao#findById(java.lang.Integer)
	 * @param id
	 * @return
	 * @date: 2015年3月23日下午4:34:46
	 * @author: zhangying
	 */
	@Override
	public JudgeBean findById(java.lang.Integer id) {
		return super.findById(JudgeBean.class, id);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.JudgeDao#findByBankId(int)
	 * @param bankId
	 * @return
	 * @date: 2015年3月23日下午4:34:52
	 * @author: zhangying
	 */
	@Override
	public List<JudgeBean> findByBankId(int bankId) {
		return findByProperty("JudgeBean",BANK_ID, bankId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.JudgeDao#findByPaperId(int)
	 * @param paperId
	 * @return
	 * @date: 2015年3月23日下午4:34:59
	 * @author: zhangying
	 */
	@Override
	public List<JudgeBean> findByPaperId(int paperId) {
		return findByProperty("JudgeBean",PAPER_ID, paperId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.JudgeDao#findByUseStatus(boolean)
	 * @param useStatus
	 * @return
	 * @date: 2015年3月23日下午4:35:05
	 * @author: zhangying
	 */
	@Override
	public List<JudgeBean> findByUseStatus(boolean useStatus) {
		return findByProperty("JudgeBean",USE_STATUS, useStatus);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#findAll()
	 * @return
	 * @date: 2015年3月23日下午4:35:11
	 * @author: zhangying
	 */
	@Override
	public List<JudgeBean> findAll() {
		return super.findAll("JudgeBean");
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#update(java.lang.Object)
	 * @param updateInstance
	 * @date: 2015年3月23日下午4:35:18
	 * @author: zhangying
	 */
	@Override
	public void update(JudgeBean updateInstance){
		super.update(updateInstance);
	}
}