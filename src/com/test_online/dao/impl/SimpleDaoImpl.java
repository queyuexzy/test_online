package com.test_online.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test_online.base.BaseDao;
import com.test_online.dao.SimpleDao;
import com.test_online.module.SimpleBean;

/**
 * A data access object (DAO) providing persistence and search support for
 * SimpleBean entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.online.module.SimpleBean
 * @author MyEclipse Persistence Tools
 */
@Repository
public class SimpleDaoImpl extends BaseDao<SimpleBean> implements SimpleDao{

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#save(java.lang.Object)
	 * @param transientInstance
	 * @date: 2015年3月23日下午5:33:26
	 * @author: zhangying
	 */
	@Override
	public void save(SimpleBean transientInstance) {
		super.save(transientInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#delete(java.lang.Object)
	 * @param persistentInstance
	 * @date: 2015年3月23日下午5:33:37
	 * @author: zhangying
	 */
	@Override
	public void delete(SimpleBean persistentInstance) {
		super.delete(persistentInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.SimpleDao#findById(java.lang.Integer)
	 * @param id
	 * @return
	 * @date: 2015年3月23日下午5:33:42
	 * @author: zhangying
	 */
	@Override
	public SimpleBean findById(java.lang.Integer id) {
		return super.findById(SimpleBean.class, id);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.SimpleDao#findByBankId(int)
	 * @param bankId
	 * @return
	 * @date: 2015年3月23日下午5:33:48
	 * @author: zhangying
	 */
	@Override
	public List<SimpleBean> findByBankId(int bankId) {
		return findByProperty("SimpleBean",BANK_ID, bankId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.SimpleDao#findByPaperId(int)
	 * @param paperId
	 * @return
	 * @date: 2015年3月23日下午5:33:55
	 * @author: zhangying
	 */
	@Override
	public List<SimpleBean> findByPaperId(int paperId) {
		return findByProperty("SimpleBean",PAPER_ID, paperId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.SimpleDao#findByUseStatus(boolean)
	 * @param useStatus
	 * @return
	 * @date: 2015年3月23日下午5:34:02
	 * @author: zhangying
	 */
	@Override
	public List<SimpleBean> findByUseStatus(boolean useStatus) {
		return findByProperty("SimpleBean",USE_STATUS, useStatus);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#findAll()
	 * @return
	 * @date: 2015年3月23日下午5:34:08
	 * @author: zhangying
	 */
	@Override
	public List<SimpleBean> findAll() {
		return super.findAll("SimpleBean");
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#update(java.lang.Object)
	 * @param updateInstance
	 * @date: 2015年3月23日下午5:34:17
	 * @author: zhangying
	 */
	@Override
	public void update(SimpleBean updateInstance){
		super.update(updateInstance);
	}
}