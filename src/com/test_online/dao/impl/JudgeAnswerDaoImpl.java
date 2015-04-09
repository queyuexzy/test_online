package com.test_online.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test_online.base.BaseDao;
import com.test_online.dao.JudgeAnswerDao;
import com.test_online.module.JudgeAnswerBean;

/**
 * A data access object (DAO) providing persistence and search support for
 * JudgeAnswerBean entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.online.module.JudgeAnswerBean
 * @author MyEclipse Persistence Tools
 */
@Repository
public class JudgeAnswerDaoImpl extends BaseDao<JudgeAnswerBean> implements JudgeAnswerDao{

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#save(java.lang.Object)
	 * @param transientInstance
	 * @date: 2015年3月23日下午4:10:34
	 * @author: zhangying
	 */
	@Override
	public void save(JudgeAnswerBean transientInstance) {
		super.save(transientInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#delete(java.lang.Object)
	 * @param persistentInstance
	 * @date: 2015年3月23日下午4:10:49
	 * @author: zhangying
	 */
	@Override
	public void delete(JudgeAnswerBean persistentInstance) {
		super.delete(persistentInstance);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.JudgeAnswerDao#findById(java.lang.Integer)
	 * @param id
	 * @return
	 * @date: 2015年3月23日下午4:10:56
	 * @author: zhangying
	 */
	@Override
	public JudgeAnswerBean findById(java.lang.Integer id) {
		return super.findById(JudgeAnswerBean.class, id);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.JudgeAnswerDao#findByUserId(int)
	 * @param userId
	 * @return
	 * @date: 2015年3月23日下午4:11:02
	 * @author: zhangying
	 */
	@Override
	public List<JudgeAnswerBean> findByUserId(int userId) {
		return findByProperty("JudgeAnswerBean",USER_ID, userId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.dao.JudgeAnswerDao#findByJudgeId(int)
	 * @param judgeId
	 * @return
	 * @date: 2015年3月23日下午4:11:09
	 * @author: zhangying
	 */
	@Override
	public List<JudgeAnswerBean> findByJudgeId(int judgeId) {
		return findByProperty("JudgeAnswerBean",JUDGE_ID, judgeId);
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#findAll()
	 * @return
	 * @date: 2015年3月23日下午4:11:16
	 * @author: zhangying
	 */
	@Override
	public List<JudgeAnswerBean> findAll() {
		return super.findAll("JudgeAnswerBean");
	}

	/*
	 * (non-Javadoc)
	 * @see com.test_online.base.BaseDao#update(java.lang.Object)
	 * @param updateInstance
	 * @date: 2015年3月23日下午4:11:22
	 * @author: zhangying
	 */
	@Override
	public void update(JudgeAnswerBean updateInstance){
		super.update(updateInstance);
	}
}