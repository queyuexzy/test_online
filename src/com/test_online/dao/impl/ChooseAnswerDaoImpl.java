package com.test_online.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test_online.base.BaseDao;
import com.test_online.dao.ChooseAnswerDao;
import com.test_online.module.ChooseAnswerBean;

/**
 * A data access object (DAO) providing persistence and search support for
 * ChooseAnswerBean entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.online.module.ChooseAnswerBean
 * @author MyEclipse Persistence Tools
 */
@Repository
public class ChooseAnswerDaoImpl extends BaseDao<ChooseAnswerBean> implements ChooseAnswerDao {

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#save(java.lang.Object)
	 * @param transientInstance
	 * @date: 2015年3月23日下午2:59:23
	 * @author: zhangying
	 */
	@Override
	public void save(ChooseAnswerBean transientInstance) {
		super.save(transientInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#delete(java.lang.Object)
	 * @param persistentInstance
	 * @date: 2015年3月23日下午2:59:27
	 * @author: zhangying
	 */
	@Override
	public void delete(ChooseAnswerBean persistentInstance) {
		super.delete(persistentInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.ChooseAnswerDao#findById(java.lang.Integer)
	 * @param id
	 * @return
	 * @date: 2015年3月23日下午2:59:30
	 * @author: zhangying
	 */
	@Override
	public ChooseAnswerBean findById(java.lang.Integer id) {
		return super.findById(ChooseAnswerBean.class, id);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.ChooseAnswerDao#findByUserId(int)
	 * @param userId
	 * @return
	 * @date: 2015年3月23日下午2:59:34
	 * @author: zhangying
	 */
	@Override
	public List<ChooseAnswerBean> findByUserId(int userId) {
		return findByProperty("ChooseAnswerBean",USER_ID, userId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.ChooseAnswerDao#findByChooseId(java.lang.Object)
	 * @param chooseId
	 * @return
	 * @date: 2015年3月23日下午2:59:37
	 * @author: zhangying
	 */
	@Override
	public List<ChooseAnswerBean> findByChooseId(Object chooseId) {
		return findByProperty("ChooseAnswerBean",CHOOSE_ID, chooseId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#findAll()
	 * @return
	 * @date: 2015年3月23日下午2:59:40
	 * @author: zhangying
	 */
	@Override
	public List<ChooseAnswerBean> findAll() {
		return super.findAll("ChooseAnswerBean");
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#update(java.lang.Object)
	 * @param updateInstance
	 * @date: 2015年3月23日下午2:59:44
	 * @author: zhangying
	 */
	@Override
	public void update(ChooseAnswerBean updateInstance){
		super.update(updateInstance);
	}
}