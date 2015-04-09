package com.test_online.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test_online.base.BaseDao;
import com.test_online.dao.SimpleAnswerDao;
import com.test_online.module.SimpleAnswerBean;

/**
 * A data access object (DAO) providing persistence and search support for
 * SimpleAnswerBean entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.online.module.SimpleAnswerBean
 * @author MyEclipse Persistence Tools
 */
@Repository
public class SimpleAnswerDaoImpl extends BaseDao<SimpleAnswerBean> implements SimpleAnswerDao{
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#save(java.lang.Object)
	 * @param transientInstance
	 * @date: 2015年3月23日下午5:17:33
	 * @author: zhangying
	 */
	@Override
	public void save(SimpleAnswerBean transientInstance) {
		super.save(transientInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#delete(java.lang.Object)
	 * @param persistentInstance
	 * @date: 2015年3月23日下午5:17:46
	 * @author: zhangying
	 */
	@Override
	public void delete(SimpleAnswerBean persistentInstance) {
		super.delete(persistentInstance);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.SimpleAnswerDao#findById(java.lang.Integer)
	 * @param id
	 * @return
	 * @date: 2015年3月23日下午5:17:55
	 * @author: zhangying
	 */
	@Override
	public SimpleAnswerBean findById(java.lang.Integer id) {
		return super.findById(SimpleAnswerBean.class, id);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.SimpleAnswerDao#findByUserId(int)
	 * @param userId
	 * @return
	 * @date: 2015年3月23日下午5:18:02
	 * @author: zhangying
	 */
	@Override
	public List<SimpleAnswerBean> findByUserId(int userId) {
		return findByProperty("SimpleAnswerBean",USER_ID, userId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.SimpleAnswerDao#findBySimpleId(int)
	 * @param simpleId
	 * @return
	 * @date: 2015年3月23日下午5:18:10
	 * @author: zhangying
	 */
	@Override
	public List<SimpleAnswerBean> findBySimpleId(int simpleId) {
		return findByProperty("SimpleAnswerBean",SIMPLE_ID, simpleId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#findAll()
	 * @return
	 * @date: 2015年3月23日下午5:18:16
	 * @author: zhangying
	 */
	@Override
	public List<SimpleAnswerBean> findAll() {
		return super.findAll("SimpleAnswerBean");
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#update(java.lang.Object)
	 * @param updateInstance
	 * @date: 2015年3月23日下午5:18:23
	 * @author: zhangying
	 */
	@Override
	public void update(SimpleAnswerBean updateInstance){
		super.update(updateInstance);
	}
}