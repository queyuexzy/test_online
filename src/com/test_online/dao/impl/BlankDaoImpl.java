package com.test_online.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test_online.base.BaseDao;
import com.test_online.dao.BlankDao;
import com.test_online.module.BlankBean;

/**
 * A data access object (DAO) providing persistence and search support for
 * BlankBean entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.online.module.BlankBean
 * @author MyEclipse Persistence Tools
 */
@Repository
public class BlankDaoImpl extends BaseDao<BlankBean> implements BlankDao {
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#save(java.lang.Object)
	 * @param transientInstance
	 * @date: 2015年3月23日下午2:32:33
	 * @author: zhangying
	 */
	@Override
	public void save(BlankBean transientInstance) {
		super.save(transientInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#delete(java.lang.Object)
	 * @param persistentInstance
	 * @date: 2015年3月23日下午2:32:38
	 * @author: zhangying
	 */
	@Override
	public void delete(BlankBean persistentInstance) {
		super.delete(persistentInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.BlankDao#findById(java.lang.Integer)
	 * @param id
	 * @return
	 * @date: 2015年3月23日下午2:32:43
	 * @author: zhangying
	 */
	@Override
	public BlankBean findById(java.lang.Integer id) {
		return super.findById(BlankBean.class, id);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.BlankDao#findByBankId(int)
	 * @param bankId
	 * @return
	 * @date: 2015年3月23日下午2:32:47
	 * @author: zhangying
	 */
	@Override
	public List<BlankBean> findByBankId(int bankId) {
		return findByProperty("BlankBean",BANK_ID, bankId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.BlankDao#findByPaperId(int)
	 * @param paperId
	 * @return
	 * @date: 2015年3月23日下午2:32:51
	 * @author: zhangying
	 */
	@Override
	public List<BlankBean> findByPaperId(int paperId) {
		return findByProperty("BlankBean",PAPER_ID, paperId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.BlankDao#findByUseStatus(int)
	 * @param useStatus
	 * @return
	 * @date: 2015年3月23日下午2:32:55
	 * @author: zhangying
	 */
	@Override
	public List<BlankBean> findByUseStatus(boolean useStatus) {
		return findByProperty("BlankBean",USE_STATUS, useStatus);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#findAll()
	 * @return
	 * @date: 2015年3月23日下午2:33:00
	 * @author: zhangying
	 */
	@Override
	public List<BlankBean> findAll() {
		return super.findAll("BlankBean");
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#update(java.lang.Object)
	 * @param updateInstance
	 * @date: 2015年3月23日下午2:41:33
	 * @author: zhangying
	 */
	@Override
	public void update(BlankBean updateInstance){
		super.update(updateInstance);
	}
}