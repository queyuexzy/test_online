/*  
 * @(#) ProblemBean.java Create on 2015年4月1日 下午1:17:26   
 *   
 * Copyright 2015 by xl.   
 */


package com.test_online.module;

/**
 * 
 * @author zhangying
 * @date   2015年4月1日
 */
public class ProblemBean {

	private int id;
	private String topic;
	private String optionA;
	private String optionB;
	private String OptionC;
	private String OptionD;
	private String remark;
	private String problemType;
	private int problemId;
	
	
	public int getProblemId() {
		return problemId;
	}
	public void setProblemId(int problemId) {
		this.problemId = problemId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
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
		return OptionC;
	}
	public void setOptionC(String optionC) {
		OptionC = optionC;
	}
	public String getOptionD() {
		return OptionD;
	}
	public void setOptionD(String optionD) {
		OptionD = optionD;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getProblemType() {
		return problemType;
	}
	public void setProblemType(String problemType) {
		this.problemType = problemType;
	}
}
