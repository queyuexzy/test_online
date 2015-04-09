package com.test_online.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test_online.base.BaseDao;
import com.test_online.dao.BlankAnswerDao;
import com.test_online.module.BlankAnswerBean;

/**
 * A data access object (DAO) providing persistence and search support for
 * BlankAnswerBean entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.online.module.BlankAnswerBean
 * @author MyEclipse Persistence Tools
 */
@Repository
public class BlankAnswerDaoImpl extends BaseDao<BlankAnswerBean> implements BlankAnswerDao{
	@Override
	public void save(BlankAnswerBean transientInstance) {
		super.save(transientInstance);
	}

	@Override
	public void delete(BlankAnswerBean persistentInstance) {
		super.delete(persistentInstance);
	}

	@Override
	public BlankAnswerBean findById(java.lang.Integer id) {
		return super.findById(BlankAnswerBean.class,id);
	}

	@Override
	public List<BlankAnswerBean> findAll() {
		return super.findAll("BlankAnswerBean");
	}

	@Override
	public void update(BlankAnswerBean updateInstance) {
		super.update(updateInstance);
	}
	
	@Override
	public List<BlankAnswerBean> findByUserId(int userId) {
		return findByProperty("BlankAnswerBean",USER_ID, userId);
	}

	@Override
	public List<BlankAnswerBean> findByBlankId(int blankId) {
		return findByProperty("BlankAnswerBean",BLANK_ID, blankId);
	}
}