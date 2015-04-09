/*  
 * @(#) StudentScoreBean.java Create on 2015年3月31日 下午12:09:21   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.module;

/**
 * 
 * @author zhangying
 * @date   2015年3月31日
 */
public class StudentScoreBean {

	private Integer id;
	private String topic;
	private String rightAnswer;
	private String answer;
	private Integer problemScore;
	private Integer score;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
	private Integer problemId;
	
	public Integer getProblemId() {
		return problemId;
	}
	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}
	private String problemType;
	
	
	public String getProblemType() {
		return problemType;
	}
	public void setProblemType(String problemType) {
		this.problemType = problemType;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getRightAnswer() {
		return rightAnswer;
	}
	public void setRightAnswer(String rightAnswer) {
		this.rightAnswer = rightAnswer;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getProblemScore() {
		return problemScore;
	}
	public void setProblemScore(Integer problemScore) {
		this.problemScore = problemScore;
	}
}
