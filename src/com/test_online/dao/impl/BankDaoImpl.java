package com.test_online.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test_online.base.BaseDao;
import com.test_online.dao.BankDao;
import com.test_online.module.BankBean;

/**
 * A data access object (DAO) providing persistence and search support for
 * BankBean entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.online.module.BankBean
 * @author MyEclipse Persistence Tools
 */
@Repository
public class BankDaoImpl extends BaseDao<BankBean> implements BankDao{
	
	@Override
	public void save(BankBean transientInstance) {
		super.save(transientInstance);
	}

	@Override
	public void delete(BankBean persistentInstance) {
		super.delete(persistentInstance);
	}

	@Override
	public BankBean findById(java.lang.Integer id) {
		return super.findById(BankBean.class, id);
	}

	@Override
	public List<BankBean> findAll() {
		return super.findAll("BankBean");
	}

	@Override
	public void update(BankBean updateInstance) {
		super.update(updateInstance);
	}

	@Override
	public List<BankBean> findByTeamId(int teamId) {
		return super.findByProperty("BankBean",TEAM_ID, teamId);
	}
}