package com.test_online.dao.impl;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.test_online.base.BaseDao;
import com.test_online.dao.UserDao;
import com.test_online.mail.MailHelper;
import com.test_online.module.UserBean;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserBean entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.online.module.UserBean
 * @author MyEclipse Persistence Tools
 */
@Repository
public class UserDaoImpl extends BaseDao<UserBean> implements UserDao{

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#save(java.lang.Object)
	 * @param transientInstance
	 * @date: 2015年3月24日上午10:09:16
	 * @author: zhangying
	 */
	@Override
	public void save(UserBean transientInstance) {
		super.save(transientInstance);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#delete(java.lang.Object)
	 * @param persistentInstance
	 * @date: 2015年3月24日上午10:09:30
	 * @author: zhangying
	 */
	@Override
	public void delete(UserBean persistentInstance) {
		super.delete(persistentInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.UserDao#findById(java.lang.Integer)
	 * @param id
	 * @return
	 * @date: 2015年3月24日上午10:09:36
	 * @author: zhangying
	 */
	@Override
	public UserBean findById(java.lang.Integer id) {
		return super.findById(UserBean.class, id);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.UserDao#findByTeamStatus(int)
	 * @param teamStatus
	 * @return
	 * @date: 2015年3月24日上午10:09:43
	 * @author: zhangying
	 */
	@Override
	public List<UserBean> findByTeamStatus(int teamStatus) {
		return findByProperty("UserBean",TEAM_STATUS, teamStatus);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#findAll()
	 * @return
	 * @date: 2015年3月24日上午10:09:50
	 * @author: zhangying
	 */
	@Override
	public List<UserBean> findAll() {
		return super.findAll("UserBean");
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#update(java.lang.Object)
	 * @param updateInstance
	 * @date: 2015年3月24日上午10:09:56
	 * @author: zhangying
	 */
	@Override
	public void update(UserBean updateInstance){
		super.update(updateInstance);
	}
}