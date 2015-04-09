package com.test_online.module;

/**
 * JudgeBean entity. @author MyEclipse Persistence Tools
 */

public class JudgeBean implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer bankId;
	private Integer paperId;
	private String topic;
	private String answer;
	private Boolean useStatus;
	private String remark;
	private Integer score;
	
	private String _paperName;
	private String _bankName;

	// Constructors

	/** default constructor */
	public JudgeBean() {
	}

	

	// Property accessors

	
	public Integer getId() {
		return this.id;
	}

	public String get_paperName() {
		return _paperName;
	}

	public void set_paperName(String _paperName) {
		this._paperName = _paperName;
	}

	public String get_bankName() {
		return _bankName;
	}

	public void set_bankName(String _bankName) {
		this._bankName = _bankName;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getBankId() {
		return this.bankId;
	}

	public void setBankId(Integer bankId) {
		this.bankId = bankId;
	}

	public Integer getPaperId() {
		return this.paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	public String getTopic() {
		return this.topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Boolean getUseStatus() {
		return this.useStatus;
	}

	public void setUseStatus(Boolean useStatus) {
		this.useStatus = useStatus;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}