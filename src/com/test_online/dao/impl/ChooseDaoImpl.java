package com.test_online.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test_online.base.BaseDao;
import com.test_online.dao.ChooseDao;
import com.test_online.module.ChooseBean;

/**
 * A data access object (DAO) providing persistence and search support for
 * ChooseBean entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.online.module.ChooseBean
 * @author MyEclipse Persistence Tools
 */
@Repository
public class ChooseDaoImpl extends BaseDao<ChooseBean> implements ChooseDao{

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#save(java.lang.Object)
	 * @param transientInstance
	 * @date: 2015年3月23日下午3:32:57
	 * @author: zhangying
	 */
	@Override
	public void save(ChooseBean transientInstance) {
		super.save(transientInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#delete(java.lang.Object)
	 * @param persistentInstance
	 * @date: 2015年3月23日下午3:33:14
	 * @author: zhangying
	 */
	@Override
	public void delete(ChooseBean persistentInstance) {
		super.delete(persistentInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.ChooseDao#findById(java.lang.Integer)
	 * @param id
	 * @return
	 * @date: 2015年3月23日下午3:33:22
	 * @author: zhangying
	 */
	@Override
	public ChooseBean findById(java.lang.Integer id) {
		return super.findById(ChooseBean.class, id);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.ChooseDao#findByBankId(int)
	 * @param bankId
	 * @return
	 * @date: 2015年3月23日下午3:33:35
	 * @author: zhangying
	 */
	@Override
	public List<ChooseBean> findByBankId(int bankId) {
		return findByProperty("ChooseBean",BANK_ID, bankId);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.ChooseDao#findByPaperId(int)
	 * @param paperId
	 * @return
	 * @date: 2015年3月23日下午3:33:44
	 * @author: zhangying
	 */
	@Override
	public List<ChooseBean> findByPaperId(int paperId) {
		return findByProperty("ChooseBean",PAPER_ID, paperId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.ChooseDao#findByUseStatus(boolean)
	 * @param useStatus
	 * @return
	 * @date: 2015年3月23日下午3:33:54
	 * @author: zhangying
	 */
	@Override
	public List<ChooseBean> findByUseStatus(boolean useStatus) {
		return findByProperty("ChooseBean",USE_STATUS, useStatus);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#findAll()
	 * @return
	 * @date: 2015年3月23日下午3:34:05
	 * @author: zhangying
	 */
	@Override
	public List<ChooseBean> findAll() {
		return super.findAll("ChooseBean");
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#update(java.lang.Object)
	 * @param updateInstance
	 * @date: 2015年3月23日下午3:34:13
	 * @author: zhangying
	 */
	@Override
	public void update(ChooseBean updateInstance){
		super.update(updateInstance);
	}
}