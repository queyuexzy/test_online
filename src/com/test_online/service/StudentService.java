/*  
 * @(#) StudentService.java Create on 2015年3月30日 下午5:38:53   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.service;

import com.test_online.base.BaseAction.RequestParameter;
import com.test_online.base.BaseAction.RequestParameterException;
import com.test_online.flexigrid.bean.FlexiGrid;
import com.test_online.util.AjaxResponse;

/**
 * 
 * @author zhangying
 * @date   2015年3月30日
 */
public interface StudentService {

	/**
	 * search the Scores info for the table#studentToIndexFlexiGrid
	 * @Title: searchScoresByUserId
	 * @data:2015年3月31日上午9:14:47
	 * @author:zhangying
	 * @param param
	 * @throws RequestParameterException void
	 */
	public FlexiGrid searchScoresByUserId(RequestParameter param) throws RequestParameterException;
	
	
	/**
	 * search for the table#studentScoreInfoFlexiGrid
	 * @Title: searchStudentScoreInfoByUserIdPaperId
	 * @data:2015年3月31日下午12:13:15
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException FlexiGrid
	 */
	public FlexiGrid searchStudentScoreInfoByUserIdPaperId(RequestParameter param) throws RequestParameterException;

	/**
	 * get the problems for the paper in the StartExam.jsp#problemsDiv
	 * @Title: getProblemsByPaperId
	 * @data:2015年4月1日下午1:24:24
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public FlexiGrid getProblemsByPaperId(RequestParameter param) throws RequestParameterException;
	
	
	/**
	 * add the answer to the **_answer_info,user_paper_info,need to give the score for the judge and choose
	 * @Title: addAnswerToTable
	 * @data:2015年4月1日下午3:57:55
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse addAnswerToTable(RequestParameter param) throws RequestParameterException;


	/**
	 * get the problem by BankId and useStatus is false
	 * @Title: getProblemsByBankIdUseStatus
	 * @data:2015年4月2日上午10:51:52
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException FlexiGrid
	 */
	public FlexiGrid getProblemsByBankIdUseStatus(RequestParameter param) throws RequestParameterException;

	/**
	 * validate the test answer by problemId and problemType
	 * @Title: validateAnswerByProblemIdProblemType
	 * @data:2015年4月2日上午11:25:00
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse validateAnswerByProblemIdProblemType(RequestParameter param)throws RequestParameterException;

	/**
	 * find the simples and the blanks by userId and the paperId to let the teacher go over the paper
	 * @Title: findSimpleBlankByUserIdPaperId
	 * @data:2015年4月2日下午2:23:52
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException FlexiGrid
	 */
	public FlexiGrid findSimpleBlankByUserIdPaperId(RequestParameter param)throws RequestParameterException;
	
	/**
	 * update scores in the blank_answer_info and the simple_answer_info
	 * @Title: updateScoreInBlankSimple
	 * @data:2015年4月2日下午3:43:26
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updateScoreInBlankSimple(RequestParameter param)throws RequestParameterException;


	/**
	 * update the score in user_paper_relation
	 * @Title: updateScoreInUserPaper
	 * @data:2015年4月2日下午3:52:17
	 * @author:zhangying
	 * @param param
	 * @return
	 * @throws RequestParameterException AjaxResponse
	 */
	public AjaxResponse updateScoreInUserPaper(RequestParameter param) throws RequestParameterException;

}
