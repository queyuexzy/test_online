/*  
 * @(#) Test.java Create on 2015年3月16日 上午10:33:48   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.test_online.dao.BankDao;
import com.test_online.dao.BlankAnswerDao;
import com.test_online.dao.BlankDao;
import com.test_online.dao.ChooseAnswerDao;
import com.test_online.dao.ChooseDao;
import com.test_online.dao.JudgeAnswerDao;
import com.test_online.dao.JudgeDao;
import com.test_online.dao.PaperDao;
import com.test_online.dao.SimpleAnswerDao;
import com.test_online.dao.SimpleDao;

/**
 * 
 * @author zhangying
 * @date   2015年3月16日
 */
public class Test {
	
	@Autowired
	private BankDao bankDao;
	
	@Autowired
	private BlankAnswerDao blankAnswerDao;
	
	@Autowired
	private BlankDao blankDao;
	
	@Autowired
	private ChooseAnswerDao chooseAnswerDao;
	
	@Autowired
	private ChooseDao chooseDao;
	
	@Autowired
	private JudgeAnswerDao judgeAnswerDao;
	
	@Autowired
	private JudgeDao judgeDao;
	
	@Autowired
	private PaperDao paperDao;
	
	@Autowired
	private SimpleAnswerDao simpleAnswerDao;
	
	@Autowired
	private SimpleDao simpleDao;
	
	
//	
//	public String toTeacher(){
//		
//		return TOTEACHER;
//	}
	
	public void toUser(){
		
//		BankBean bank = new BankBean(2,"1",FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss").format(new Date()),FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss").format(new Date()),"1");
//		BankBean bank2 = new BankBean(2,"1",FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss").format(new Date()),FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss").format(new Date()),"1");
//		bankDao.save(bank);
//		bankDao.save(bank2);
//		
//		BankBean bean = bankDao.findById(1);
//		bean.setName("zhangying");
//		bankDao.update(bean);
//		
//		bankDao.findAll();
//		
//		bankDao.findByTeamId(1);
//		
//		bankDao.delete(bank2);
//		
//		System.out.println("to user");
//		
//		BlankAnswerBean blankAnswer = new BlankAnswerBean(1, 1, "1", 1, "1");
//		BlankAnswerBean blankAnswer2 = new BlankAnswerBean(1, 1, "1", 1, "1");
//		
//		blankAnswerDao.save(blankAnswer);
//		blankAnswerDao.save(blankAnswer2);
//		
//		blankAnswerDao.findByBlankId(1);
//		blankAnswerDao.findById(1);
//		blankAnswerDao.findAll();
//		blankAnswerDao.findByUserId(1);
//		
//		blankAnswerDao.delete(blankAnswer2);
//		blankAnswerDao.save(blankAnswer2);
//		
//		blankAnswer2.setAnswer("张颖");
//		blankAnswerDao.update(blankAnswer2);
		
		/*
		 * 
		 
		BlankBean blankBean = new BlankBean(1,1,"1","1",false,"1");
		BlankBean blankBean2 = new BlankBean(1,1,"1","1",false,"1");
		
		blankDao.save(blankBean);
		blankDao.save(blankBean2);
		blankBean.setPaperId(123);
		blankDao.update(blankBean);
		
		blankDao.findAll();
		blankDao.findByPaperId(1);
		blankDao.findByBankId(1);
		blankDao.findByUseStatus(false);
		blankDao.findById(1);
		
		blankDao.delete(blankBean);
		
		*/
		
		
		/*
		 * 
		 
		ChooseAnswerBean chooseAnswerBean = new ChooseAnswerBean(1, 1, false, 1, "1");
		ChooseAnswerBean chooseAnswerBean2 = new ChooseAnswerBean(1, 1, false, 1, "1");
		
		chooseAnswerDao.save(chooseAnswerBean);
		chooseAnswerDao.save(chooseAnswerBean2);
		
		chooseAnswerBean.setAnswer(true);
		chooseAnswerDao.update(chooseAnswerBean);
		
		chooseAnswerDao.findAll();
		chooseAnswerDao.findByChooseId(1);
		chooseAnswerDao.findById(1);
		chooseAnswerDao.findByUserId(1);
		
		chooseAnswerDao.delete(chooseAnswerBean);
		*/
		
		
		
		/*
		 * 
		ChooseBean chooseBean = new ChooseBean(1,1,"1","1","1","1","1","A",false,"1");
		ChooseBean chooseBean2 = new ChooseBean(1,1,"1","1","1","1","1","A",false,"1");
		
		chooseDao.save(chooseBean);
		chooseDao.save(chooseBean2);
		
		chooseBean.setAnswer("D");
		chooseDao.update(chooseBean);

		chooseDao.findAll();
		chooseDao.findByBankId(1);
		chooseDao.findById(1);
		chooseDao.findByPaperId(1);
		chooseDao.findByUseStatus(false);
		
		chooseDao.delete(chooseBean);
		*/
		
		/*
		 * 
		JudgeAnswerBean judgeAnswerBean = new JudgeAnswerBean(1,1,true,1,"1");
		JudgeAnswerBean judgeAnswerBean2 = new JudgeAnswerBean(1,1,true,1,"1");
		
		judgeAnswerDao.save(judgeAnswerBean);
		judgeAnswerDao.save(judgeAnswerBean2);
		
		judgeAnswerBean.setAnswer(false);
		judgeAnswerDao.update(judgeAnswerBean);
		
		judgeAnswerDao.findAll();
		judgeAnswerDao.findById(1);
		judgeAnswerDao.findByJudgeId(1);
		judgeAnswerDao.findByUserId(1);
		
		judgeAnswerDao.delete(judgeAnswerBean);
		*/
		
		/*
		JudgeBean judgeBean = new JudgeBean(1,1,"zhangying","zhangying",true,"zhangying");
		JudgeBean judgeBean2 = new JudgeBean(1,1,"zhangying","zhangying",true,"zhangying");
		judgeDao.save(judgeBean);
		judgeDao.save(judgeBean2);
		
		judgeBean.setAnswer("a");
		judgeDao.update(judgeBean);
		
		judgeDao.findAll();
		judgeDao.findByBankId(1);
		judgeDao.findById(1);
		judgeDao.findByPaperId(1);
		judgeDao.findByUseStatus(true);
		
		judgeDao.delete(judgeBean);
		*/
		
		/*
		PaperBean paperBean = new PaperBean("zhangying","N",FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss").format(new Date()),FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss").format(new Date()),"zhangying");
		PaperBean paperBean2 = new PaperBean("zhangying","N",FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss").format(new Date()),FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss").format(new Date()),"zhangying");
		paperDao.save(paperBean);
		paperDao.save(paperBean2);
		
		paperBean.setName("1");
		paperDao.update(paperBean);
		
		paperDao.findAll();
		paperDao.findByExamPaper("N");
		paperDao.findById(1);
		paperDao.delete(paperBean);
		*/
		
		/*
		SimpleAnswerBean simpleAnswerBean = new SimpleAnswerBean(1,1,"zhangying",1,"zhangying");
		SimpleAnswerBean simpleAnswerBean2 = new SimpleAnswerBean(1,1,"zhangying",1,"zhangying");
		
		simpleAnswerDao.save(simpleAnswerBean);
		simpleAnswerDao.save(simpleAnswerBean2);
		
		simpleAnswerBean.setScore(100);
		simpleAnswerDao.update(simpleAnswerBean);
		
		simpleAnswerDao.findAll();
		simpleAnswerDao.findById(1);
		simpleAnswerDao.findBySimpleId(1);
		simpleAnswerDao.findByUserId(1);
		
		simpleAnswerDao.delete(simpleAnswerBean);
		*/
		
		/*
		SimpleBean simpleBean = new SimpleBean(1,1,"zhangying","zhangying",false,"zhangying");
		SimpleBean simpleBean2 = new SimpleBean(1,1,"zhangying","zhangying",false,"zhangying");
		
		simpleDao.save(simpleBean);
		simpleDao.save(simpleBean2);
		
		simpleBean.setAnswer("A");
		simpleDao.update(simpleBean);
		
		simpleDao.findAll();
		simpleDao.findByBankId(1);
		simpleDao.findById(1);
		simpleDao.findByPaperId(1);
		simpleDao.findByUseStatus(false);
		
		simpleDao.delete(simpleBean);
		*/
	}
}
