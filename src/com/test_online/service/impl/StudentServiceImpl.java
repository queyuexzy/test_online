/*  
 * @(#) StudentServiceImpl.java Create on 2015年3月30日 下午5:40:11   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test_online.base.BaseAction.RequestParameter;
import com.test_online.base.BaseAction.RequestParameterException;
import com.test_online.dao.BlankAnswerDao;
import com.test_online.dao.BlankDao;
import com.test_online.dao.ChooseAnswerDao;
import com.test_online.dao.ChooseDao;
import com.test_online.dao.JudgeAnswerDao;
import com.test_online.dao.JudgeDao;
import com.test_online.dao.PaperDao;
import com.test_online.dao.SimpleAnswerDao;
import com.test_online.dao.SimpleDao;
import com.test_online.dao.UserDao;
import com.test_online.dao.UserPaperDao;
import com.test_online.flexigrid.bean.Addparams;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.module.BlankAnswerBean;
import com.test_online.module.BlankBean;
import com.test_online.module.ChooseAnswerBean;
import com.test_online.module.ChooseBean;
import com.test_online.module.JudgeAnswerBean;
import com.test_online.module.JudgeBean;
import com.test_online.module.PaperBean;
import com.test_online.module.ProblemBean;
import com.test_online.module.SimpleAnswerBean;
import com.test_online.module.SimpleBean;
import com.test_online.module.StudentScoreBean;
import com.test_online.module.UserBean;
import com.test_online.module.UserPaperBean;
import com.test_online.service.StudentService;
import com.test_online.util.AjaxResponse;
import com.test_online.util.JackJson;

/**
 * 
 * @author zhangying
 * @date   2015年3月30日
 */
@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private BlankDao blankDao;
	
	@Autowired
	private ChooseDao chooseDao;
	
	@Autowired
	private SimpleDao simpleDao;
	
	@Autowired
	private JudgeDao judgeDao;
	
	@Autowired
	private BlankAnswerDao blankAnswerDao;
	
	@Autowired
	private ChooseAnswerDao chooseAnswerDao;
	
	@Autowired
	private SimpleAnswerDao simpleAnswerDao;
	
	@Autowired
	private JudgeAnswerDao judgeAnswerDao;
	
	@Autowired
	private PaperDao paperDao;
	
	@Autowired
	private UserPaperDao userPaperDao;
	
	@Autowired
	private UserDao userDao;
	@Override
	public FlexiGrid searchScoresByUserId(RequestParameter param) throws RequestParameterException {

		String queryString = param.get(FlexiGrid.KEY_QUERY_JSON);
		FlexiGrid flexgrid = JackJson.fromJsonToObject(queryString, FlexiGrid.class);
		
		List<Addparams> params = flexgrid.getAddparams();
		if(params != null){
			for(Addparams addparam : params){
				if(UserPaperDao.USER_ID.equals(addparam.getName())){
					int userId = Integer.parseInt(addparam.getValue().toString());
					UserBean user = userDao.findById(userId);
					
					if(user != null){
						List<UserPaperBean> userPapers = userPaperDao.findUserPaperByUserId(userId);
						String userName = user.getName();
						
						for(UserPaperBean userPaper : userPapers){
							PaperBean paper = paperDao.findById(userPaper.getPaperId());
							userPaper.set_paperName(paper.getName());
							userPaper.set_userName(userName);
						}
						
						flexgrid.setRows(userPapers);
						flexgrid.setTotal((long)userPapers.size());
					}
				}
			}
		}
		
		return flexgrid;
	}
	@Override
	public FlexiGrid searchStudentScoreInfoByUserIdPaperId(RequestParameter param) throws RequestParameterException {
		
		List<StudentScoreBean> studentScores = new ArrayList<StudentScoreBean>();
		
		String queryString = param.get(FlexiGrid.KEY_QUERY_JSON);
		
		FlexiGrid flexigrid = JackJson.fromJsonToObject(queryString, FlexiGrid.class);
		
		List<Addparams> addparams = flexigrid.getAddparams();
		
		if(addparams != null){
			int userId = -1;
			int paperId = -1;
			for(Addparams addparam : addparams){
				if(addparam != null){
					if(UserPaperDao.USER_ID.equals(addparam.getName())){
						userId = Integer.parseInt(addparam.getValue().toString());
					}
					
					if(UserPaperDao.PAPER_ID.equals(addparam.getName())){
						paperId = Integer.parseInt(addparam.getValue().toString());
					}
				}
			}
			
			if(userId != -1 && paperId != -1){
				List<BlankAnswerBean> blankAnswers = blankAnswerDao.findByUserId(userId);
				List<BlankBean> blanks = blankDao.findByPaperId(paperId);
				
				List<ChooseAnswerBean> chooseAnswers = chooseAnswerDao.findByUserId(userId);
				List<ChooseBean> chooses = chooseDao.findByPaperId(paperId);
				
				List<SimpleAnswerBean> simpleAnswers = simpleAnswerDao.findByUserId(userId);
				List<SimpleBean> simples = simpleDao.findByPaperId(paperId);
				
				List<JudgeAnswerBean> judgeAnswers = judgeAnswerDao.findByUserId(userId);
				List<JudgeBean> judges = judgeDao.findByPaperId(paperId);
				
				int studentScoreSize = 0;
				
				for(ChooseAnswerBean chooseAnswer : chooseAnswers){
					for(ChooseBean choose : chooses){
						if(chooseAnswer.getChooseId() == choose.getId()){
							StudentScoreBean studentScore = new StudentScoreBean();
							studentScore.setTopic(choose.getTopic());
							studentScore.setOptionA(choose.getOptionA());
							studentScore.setOptionB(choose.getOptionB());
							studentScore.setOptionC(choose.getOptionC());
							studentScore.setOptionD(choose.getOptionD());
							studentScore.setProblemScore(choose.getScore());
							studentScore.setRightAnswer(choose.getAnswer());
							studentScore.setAnswer(chooseAnswer.getAnswer().toString());
							studentScore.setScore(chooseAnswer.getScore());
							studentScore.setId(++studentScoreSize);
							studentScores.add(studentScore);
						}
					}
				}
				
				for(JudgeAnswerBean judgeAnswer : judgeAnswers){
					for(JudgeBean judge : judges){
						if(judgeAnswer.getJudgeId() == judge.getId()){
							StudentScoreBean studentScore = new StudentScoreBean();
							studentScore.setTopic(judge.getTopic());
							studentScore.setOptionA("正确");
							studentScore.setOptionB("错误");
							studentScore.setOptionC("");
							studentScore.setOptionD("");
							studentScore.setProblemScore(judge.getScore());
							studentScore.setRightAnswer(judge.getAnswer().toString());
							studentScore.setAnswer(judgeAnswer.getAnswer().toString());
							studentScore.setScore(judgeAnswer.getScore());
							studentScore.setId(++studentScoreSize);
							studentScores.add(studentScore);
						}
					}
				}
				for(BlankAnswerBean blankAnswer : blankAnswers){
					for(BlankBean blank : blanks){
						if(blankAnswer.getBlankId() == blank.getId()){
							StudentScoreBean studentScore = new StudentScoreBean();
							studentScore.setTopic(blank.getTopic());
							studentScore.setProblemScore(blank.getScore());
							studentScore.setRightAnswer(blank.getAnswer());
							studentScore.setAnswer(blankAnswer.getAnswer());
							studentScore.setScore(blankAnswer.getScore());
							studentScore.setOptionA("");
							studentScore.setOptionB("");
							studentScore.setOptionC("");
							studentScore.setOptionD("");
							studentScore.setId(++studentScoreSize);
							studentScores.add(studentScore);
						}
					}
				}
				
				
				
				for(SimpleAnswerBean simpleAnswer : simpleAnswers){
					for(SimpleBean simple : simples){
						if(simpleAnswer.getSimpleId() == simple.getId()){
							StudentScoreBean studentScore = new StudentScoreBean();
							studentScore.setTopic(simple.getTopic());
							studentScore.setProblemScore(simple.getScore());
							studentScore.setRightAnswer(simple.getAnswer());
							studentScore.setAnswer(simpleAnswer.getAnswer().toString());
							studentScore.setScore(simpleAnswer.getScore());
							studentScore.setOptionA("");
							studentScore.setOptionB("");
							studentScore.setOptionC("");
							studentScore.setOptionD("");
							studentScore.setId(++studentScoreSize);
							studentScores.add(studentScore);
						}
					}
				}
				
				
				
				flexigrid.setRows(studentScores);
				flexigrid.setTotal((long)studentScores.size());
			}
		}
		flexigrid.setTotal((long)studentScores.size());
		return flexigrid;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.StudentService#getProblemsByPaperId(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月1日下午1:25:39
	 * @author: zhangying
	 */
	@Override
	public FlexiGrid getProblemsByPaperId(RequestParameter param) throws RequestParameterException {

		String quetyString = param.get(FlexiGrid.KEY_QUERY_JSON);
		FlexiGrid flexiGrid = JackJson.fromJsonToObject(quetyString, FlexiGrid.class);
		List<ProblemBean> problems = new ArrayList<ProblemBean>();
		
		int paperId = -1;
		
		List<Addparams> addparams = flexiGrid.getAddparams();
		if(addparams != null){
			for(Addparams addparam : addparams){
				if(addparam != null){
					if(PaperDao.ID.equals(addparam.getName())){
						paperId = Integer.parseInt(addparam.getValue().toString());
					}
				}
			}
		}
		
		if(paperId != -1){
			List<BlankBean> blanks = blankDao.findByPaperId(paperId);
			List<ChooseBean> chooses = chooseDao.findByPaperId(paperId);
			List<JudgeBean> judges = judgeDao.findByPaperId(paperId);
			List<SimpleBean> simples = simpleDao.findByPaperId(paperId);
			
			if(chooses != null){
				for(ChooseBean choose : chooses){
					if(choose != null){
						int size = problems.size();
						
						ProblemBean problem = new ProblemBean();
						
						problem.setId(++size);
						problem.setTopic(choose.getTopic());
						problem.setRemark(choose.getRemark());
						problem.setOptionA(choose.getOptionA());
						problem.setOptionB(choose.getOptionB());
						problem.setOptionC(choose.getOptionC());
						problem.setOptionD(choose.getOptionD());
						problem.setProblemType("choose");
						problem.setProblemId(choose.getId());
						problems.add(problem);
					}
				}
			}
			
			if(judges != null){
				for(JudgeBean judge : judges){
					if(judge != null){
						int size = problems.size();
						
						ProblemBean problem = new ProblemBean();
						
						problem.setId(++size);
						problem.setTopic(judge.getTopic());
						problem.setRemark(judge.getRemark());
						problem.setOptionA("正确");
						problem.setOptionB("错误");
						problem.setOptionC("");
						problem.setOptionD("");
						problem.setProblemType("judge");
						problem.setProblemId(judge.getId());
						problems.add(problem);
					}
				}
			}
			
			if(blanks != null){
				for(BlankBean blank : blanks){
					if(blank != null){
						int size = problems.size();
						
						ProblemBean problem = new ProblemBean();
						
						problem.setId(++size);
						problem.setTopic(blank.getTopic());
						problem.setRemark(blank.getRemark());
						problem.setOptionA("");
						problem.setOptionB("");
						problem.setOptionC("");
						problem.setOptionD("");
						problem.setProblemType("blank");
						problem.setProblemId(blank.getId());
						
						problems.add(problem);
					}
				}
			}
			
			
			
			
			
			if(simples != null){
				for(SimpleBean simple : simples){
					if(simple != null){
						int size = problems.size();
						
						ProblemBean problem = new ProblemBean();
						
						problem.setId(++size);
						problem.setTopic(simple.getTopic());
						problem.setRemark(simple.getRemark());
						problem.setOptionA("");
						problem.setOptionB("");
						problem.setOptionC("");
						problem.setOptionD("");
						problem.setProblemType("simple");
						problem.setProblemId(simple.getId());
						
						problems.add(problem);
					}
				}
			}
		}
		
		flexiGrid.setRows(problems);
		flexiGrid.setTotal((long)problems.size());
		
		return flexiGrid;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.StudentService#addAnswerToTable(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月1日下午4:00:20
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse addAnswerToTable(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse = null;
		
		String problemType = param.get("problemType");
		int id = Integer.parseInt(param.get("problemId"));
		String answer = param.get("answer");
		int paperId = Integer.parseInt(param.get(BlankDao.PAPER_ID));
		int userId = Integer.parseInt(param.get(BlankAnswerDao.USER_ID));
		
		List<UserPaperBean> userPaperByUserIds= userPaperDao.findUserPaperByUserId(userId);
		
		boolean isUsedPaper = false;
		for(UserPaperBean userPaper : userPaperByUserIds){
			if(userPaper.getPaperId() == paperId){
				isUsedPaper = true;
				break;
			}
		}
		
		if(isUsedPaper == false){
			UserPaperBean userPaper = new UserPaperBean();
			userPaper.setPaperId(paperId);
			userPaper.setUserId(userId);
			
			userPaperDao.save(userPaper);
		}
		
		
		if(problemType.equals("choose")){
			
			ChooseAnswerBean chooseAnswer = new ChooseAnswerBean();
			ChooseBean choose = chooseDao.findById(id);
			chooseAnswer.setUserId(userId);
			chooseAnswer.setChooseId(id);
			chooseAnswer.setAnswer(answer);
			
			if(choose != null){
				String rightAnswer = choose.getAnswer();
				if(rightAnswer != null){
					if(rightAnswer.equals(answer)){
						chooseAnswer.setScore(choose.getScore());
					}else{
						chooseAnswer.setScore(0);
					}
				}
			}
			chooseAnswerDao.save(chooseAnswer);
		}else if(problemType.equals("judge")){
			JudgeAnswerBean judgeAnswer = new JudgeAnswerBean();
			JudgeBean judge = judgeDao.findById(id);
			judgeAnswer.setUserId(userId);
			judgeAnswer.setJudgeId(id);
			judgeAnswer.setAnswer(answer);
			
			if(judge != null){
				String rightAnswer = judge.getAnswer();
				if(rightAnswer != null){
					if(rightAnswer.equals(answer)){
						judgeAnswer.setScore(judge.getScore());
					}else{
						judgeAnswer.setScore(0);
					}
				}
			}
			judgeAnswerDao.save(judgeAnswer);
		}else if(problemType.equals("simple")){
			SimpleAnswerBean simpleAnswer = new SimpleAnswerBean();
			simpleAnswer.setUserId(userId);
			simpleAnswer.setSimpleId(id);
			simpleAnswer.setAnswer(answer);
			simpleAnswerDao.save(simpleAnswer);
		}else{
			BlankAnswerBean blankAnswer = new BlankAnswerBean();
			blankAnswer.setUserId(userId);
			blankAnswer.setBlankId(id);
			blankAnswer.setAnswer(answer);
			blankAnswerDao.save(blankAnswer);
		}
		
		ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
		
		return ajaxResponse;
		
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.StudentService#getProblemsByBankIdUseStatus(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月2日上午10:52:46
	 * @author: zhangying
	 */
	@Override
	public FlexiGrid getProblemsByBankIdUseStatus(RequestParameter param) throws RequestParameterException {
		String queryString = param.get(FlexiGrid.KEY_QUERY_JSON);
		
		FlexiGrid flexiGrid = JackJson.fromJsonToObject(queryString, FlexiGrid.class);
		
		List<Addparams> addparams = flexiGrid.getAddparams();
		
		Integer bankId = null;
		if(addparams != null){
			for(Addparams addparam : addparams){
				if(addparam != null){
					if(BlankDao.BANK_ID.endsWith(addparam.getName())){
						bankId = Integer.parseInt(addparam.getValue().toString());
					}
				}
			}
		}
		
		if(bankId != null){
			List<ProblemBean> problems = new ArrayList<ProblemBean>();
			
			List<BlankBean> blanks = blankDao.findByBankId(bankId);
			List<ChooseBean> chooses = chooseDao.findByBankId(bankId);
			List<JudgeBean> judges = judgeDao.findByBankId(bankId);
			List<SimpleBean> simples = simpleDao.findByBankId(bankId);
			
			for(Iterator<ChooseBean> iter = chooses.iterator();iter.hasNext();){
				ChooseBean choose = iter.next();
				if(choose.getUseStatus() == false){
					iter.remove();
					continue;
				}
				
				Integer size = problems.size();
				ProblemBean problem = new ProblemBean();
				problem.setId(++size);
				problem.setOptionA(choose.getOptionA());
				problem.setOptionB(choose.getOptionB());
				problem.setOptionC(choose.getOptionC());
				problem.setOptionD(choose.getOptionD());
				problem.setProblemType("choose");
				problem.setProblemId(choose.getId());
				problem.setRemark(choose.getRemark());
				problem.setTopic(choose.getTopic());
				
				problems.add(problem);
			}
			
			for(Iterator<JudgeBean> iter = judges.iterator();iter.hasNext();){
				JudgeBean judge = iter.next();
				if(judge.getUseStatus() == false){
					iter.remove();
					continue;
				}
				
				Integer size = problems.size();
				ProblemBean problem = new ProblemBean();
				problem.setId(++size);
				problem.setOptionA("正确");
				problem.setOptionB("错误");
				problem.setOptionC("");
				problem.setOptionD("");
				problem.setProblemType("judge");
				problem.setProblemId(judge.getId());
				problem.setRemark(judge.getRemark());
				problem.setTopic(judge.getTopic());
				
				problems.add(problem);
			}
			
			for(Iterator<BlankBean> iter = blanks.iterator();iter.hasNext();){
				BlankBean blank = iter.next();
				if(blank.getUseStatus() == false){
					iter.remove();
					continue;
				}
				
				Integer size = problems.size();
				ProblemBean problem = new ProblemBean();
				problem.setId(++size);
				problem.setOptionA("");
				problem.setOptionB("");
				problem.setOptionC("");
				problem.setOptionD("");
				problem.setProblemType("blank");
				problem.setProblemId(blank.getId());
				problem.setRemark(blank.getRemark());
				problem.setTopic(blank.getTopic());
				
				problems.add(problem);
			}
			
			for(Iterator<SimpleBean> iter = simples.iterator();iter.hasNext();){
				SimpleBean simple = iter.next();
				if(simple.getUseStatus() == false){
					iter.remove();
					continue;
				}
				
				Integer size = problems.size();
				ProblemBean problem = new ProblemBean();
				problem.setId(++size);
				problem.setOptionA("");
				problem.setOptionB("");
				problem.setOptionC("");
				problem.setOptionD("");
				problem.setProblemType("simple");
				problem.setProblemId(simple.getId());
				problem.setRemark(simple.getRemark());
				problem.setTopic(simple.getTopic());
				
				problems.add(problem);
			}
			
			flexiGrid.setRows(problems);
			flexiGrid.setTotal((long)problems.size());
		}
		
		
		return flexiGrid;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.StudentService#validateAnswerByProblemIdProblemType(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月2日上午11:25:59
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse validateAnswerByProblemIdProblemType(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse = null;
		
		String problemType = param.get("problemType");
		int id = Integer.parseInt(param.get("problemId"));
		String answer = param.get("answer");
		
		if("choose".equals(problemType)){
			ChooseBean choose = chooseDao.findById(id);
			if(choose != null){
				if(answer.equals(choose.getAnswer())){
					ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
				}else{
					ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_ILLEGAL_PARAM);
				}
				ajaxResponse.setData(choose);
			}
		}else if("judge".equals(problemType)){
			JudgeBean judge = judgeDao.findById(id);
			if(judge != null){
				if(answer.equals(judge.getAnswer())){
					ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
				}else{
					ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_ILLEGAL_PARAM);
				}
				ajaxResponse.setData(judge);
			}
		}else if("simple".equals(problemType)){
			SimpleBean simple = simpleDao.findById(id);
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			ajaxResponse.setData(simple);
			
		}else{
			BlankBean blank = blankDao.findById(id);
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
			ajaxResponse.setData(blank);
		}
		
		return ajaxResponse;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.StudentService#findSimpleBlankByUserIdPaperId(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月2日下午2:24:51
	 * @author: zhangying
	 */
	@Override
	public FlexiGrid findSimpleBlankByUserIdPaperId(RequestParameter param) throws RequestParameterException {

		String queryString = param.get(FlexiGrid.KEY_QUERY_JSON);
		FlexiGrid flexiGrid = JackJson.fromJsonToObject(queryString, FlexiGrid.class);
		List<Addparams> addparams = flexiGrid.getAddparams();
		
		Integer paperId = null;
		Integer userId = null;
		
		if(addparams != null){
			for(Addparams addparam : addparams){
				if(addparam != null){
					if(BlankDao.PAPER_ID.equals(addparam.getName())){
						paperId = Integer.parseInt(addparam.getValue().toString());
					}
					if(BlankAnswerDao.USER_ID.equals(addparam.getName())){
						userId = Integer.parseInt(addparam.getValue().toString());
					}
				}
			}
		}
		
		if(paperId != null && userId != null){
			List<BlankBean> blanks = blankDao.findByPaperId(paperId);
			List<BlankAnswerBean> blankAnswerBeans = blankAnswerDao.findByUserId(userId);
			
			List<SimpleBean> simples = simpleDao.findByPaperId(paperId);
			List<SimpleAnswerBean> simpleAnswerBeans = simpleAnswerDao.findByUserId(userId);
			
			List<StudentScoreBean> studentScores = new ArrayList<StudentScoreBean>();
			
			if(blankAnswerBeans != null){
				for(BlankAnswerBean blankAnswer : blankAnswerBeans){
					if(blankAnswer != null){
						for(BlankBean blank : blanks){
							if(blank != null){
								if(blankAnswer.getBlankId() == blank.getId()){
									int size = studentScores.size();
									StudentScoreBean studentScore = new StudentScoreBean();
									studentScore.setAnswer(blankAnswer.getAnswer());
									studentScore.setId(++size);
									studentScore.setProblemType("blank");
									studentScore.setRightAnswer(blank.getAnswer());
									studentScore.setTopic(blank.getTopic());
									studentScore.setProblemId(blank.getId());
									studentScore.setProblemScore(blank.getScore());
									studentScores.add(studentScore);
									continue;
								}
							}
						}
					}
				}
			}
			
			if(simpleAnswerBeans != null){
				for(SimpleAnswerBean simpleAnswer : simpleAnswerBeans){
					if(simpleAnswer != null){
						for(SimpleBean simple : simples){
							if(simple != null){
								if(simpleAnswer.getSimpleId() == simple.getId()){
									int size = studentScores.size();
									StudentScoreBean studentScore = new StudentScoreBean();
									studentScore.setAnswer(simpleAnswer.getAnswer());
									studentScore.setId(++size);
									studentScore.setProblemType("simple");
									studentScore.setRightAnswer(simple.getAnswer());
									studentScore.setTopic(simple.getTopic());
									studentScore.setProblemId(simple.getId());
									studentScore.setProblemScore(simple.getScore());
									studentScores.add(studentScore);
									continue;
								}
							}
						}
					}
				}
			}
			flexiGrid.setRows(studentScores);
			flexiGrid.setTotal((long)studentScores.size());
		}
		return flexiGrid;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.StudentService#updateScoreInBlankSimple(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月2日下午3:44:16
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse updateScoreInBlankSimple(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse = null;
		
		String problemType = param.get("problemType");
		int id = Integer.parseInt(param.get("problemId"));
		int score = Integer.parseInt(param.get("score"));
		int userId = Integer.parseInt(param.get(BlankAnswerDao.USER_ID));
		
		if("blank".equals(problemType)){
			List<BlankAnswerBean> blankAnswersByBlankId = blankAnswerDao.findByBlankId(id);
			List<BlankAnswerBean> blankAnswersByUserId = blankAnswerDao.findByUserId(userId);
			if(blankAnswersByBlankId != null){
				if(blankAnswersByUserId != null){
					for(BlankAnswerBean blankAnswerByBlankId : blankAnswersByBlankId){
						for(BlankAnswerBean blankAnswerByUserId : blankAnswersByUserId){
							if(blankAnswerByBlankId.getId() == blankAnswerByUserId.getId()){
								blankAnswerByBlankId.setScore(score);
								blankAnswerDao.update(blankAnswerByBlankId);
							}
						}
					}
				}
			}
		}else{
			List<SimpleAnswerBean> simpleAnswersByBlankId = simpleAnswerDao.findBySimpleId(id);
			List<SimpleAnswerBean> simpleAnswersByUserId = simpleAnswerDao.findByUserId(userId);
			if(simpleAnswersByBlankId != null){
				if(simpleAnswersByUserId != null){
					for(SimpleAnswerBean simpleAnswerByBlankId : simpleAnswersByBlankId){
						for(SimpleAnswerBean simpleAnswerByUserId : simpleAnswersByUserId){
							if(simpleAnswerByBlankId.getId() == simpleAnswerByUserId.getId()){
								simpleAnswerByBlankId.setScore(score);
								simpleAnswerDao.update(simpleAnswerByBlankId);
							}
						}
					}
				}
			}
		}
		ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
		
		return ajaxResponse;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.test_online.service.StudentService#updateScoreInUserPaper(com.test_online.base.BaseAction.RequestParameter)
	 * @param param
	 * @return
	 * @throws RequestParameterException
	 * @date: 2015年4月2日下午3:56:38
	 * @author: zhangying
	 */
	@Override
	public AjaxResponse updateScoreInUserPaper(RequestParameter param) throws RequestParameterException {
		AjaxResponse ajaxResponse = null;
		
		String userPaperId = param.get(UserPaperDao.ID);
		
		UserPaperBean userPaper = userPaperDao.findById(Integer.parseInt(userPaperId));
		
		if(userPaper != null){
			int paperId = userPaper.getPaperId();
			int userId = userPaper.getUserId();
			int score = 0;
			
			List<BlankBean> blanks = blankDao.findByPaperId(paperId);
			List<BlankAnswerBean> blankAnswers = blankAnswerDao.findByUserId(userId);
			for(BlankAnswerBean blankAnswer : blankAnswers){
				for(BlankBean blank : blanks){
					if(blankAnswer.getBlankId() == blank.getId()){
						score += blankAnswer.getScore();
					}
				}
			}
			
			List<ChooseBean> chooses = chooseDao.findByPaperId(paperId);
			List<ChooseAnswerBean> chooseAnswers = chooseAnswerDao.findByUserId(userId);
			for(ChooseAnswerBean chooseAnswer : chooseAnswers){
				for(ChooseBean choose : chooses){
					if(chooseAnswer.getChooseId() == choose.getId()){
						score += chooseAnswer.getScore();
					}
				}
			}
			
			List<SimpleBean> simples = simpleDao.findByPaperId(paperId);
			List<SimpleAnswerBean> simpleAnswers = simpleAnswerDao.findByUserId(userId);
			for(SimpleAnswerBean simpleAnswer : simpleAnswers){
				for(SimpleBean simple : simples){
					if(simpleAnswer.getSimpleId() == simple.getId()){
						score += simpleAnswer.getScore();
					}
				}
			}
			
			List<JudgeBean> judges = judgeDao.findByPaperId(paperId);
			List<JudgeAnswerBean> judgeAnswers = judgeAnswerDao.findByUserId(userId);
			for(JudgeAnswerBean judgeAnswer : judgeAnswers){
				for(JudgeBean judge : judges){
					if(judgeAnswer.getJudgeId() == judge.getId()){
						score += judgeAnswer.getScore();
					}
				}
			}
			
			userPaper.setScore(score);
			userPaperDao.update(userPaper);
			ajaxResponse = new AjaxResponse(AjaxResponse.AJAX_CODE_SUCCESS);
		}
		
	
		
		return ajaxResponse;
	}
}
