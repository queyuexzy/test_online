package com.test_online.module;

/**
 * ChooseBean entity. @author MyEclipse Persistence Tools
 */

public class ChooseBean implements java.io.Serializable {
	private static final long serialVersionUID = -6678565605510569035L;

	// Fields
	private Integer id;
	private Integer bankId;
	private Integer paperId;
	private String topic;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private String answer;
	private Boolean useStatus;
	private String remark;
	
	private Integer score;

	private String _bankName;
	private String _paperName;
	// Constructors

	/** default constructor */
	public ChooseBean() {
	}

	/** minimal constructor */
	public ChooseBean(Integer bankId, String topic, String optionA, String optionB, String optionC, String optionD, String answer) {
		this.bankId = bankId;
		this.topic = topic;
		this.optionA = optionA;
		this.optionB = optionB;
		this.optionC = optionC;
		this.optionD = optionD;
		this.answer = answer;
	}

	/** full constructor */
	public ChooseBean(Integer bankId, Integer paperId, String topic, String optionA, String optionB, String optionC, String optionD, String answer, Boolean useStatus, String remark) {
		this.bankId = bankId;
		this.paperId = paperId;
		this.topic = topic;
		this.optionA = optionA;
		this.optionB = optionB;
		this.optionC = optionC;
		this.optionD = optionD;
		this.answer = answer;
		this.useStatus = useStatus;
		this.remark = remark;
	}

	// Property accessors

	
	public Integer getId() {
		return this.id;
	}

	public String get_bankName() {
		return _bankName;
	}

	public void set_bankName(String _bankName) {
		this._bankName = _bankName;
	}

	public String get_paperName() {
		return _paperName;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public void set_paperName(String _paperName) {
		this._paperName = _paperName;
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

	public String getOptionA() {
		return this.optionA;
	}

	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}

	public String getOptionB() {
		return this.optionB;
	}

	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}

	public String getOptionC() {
		return this.optionC;
	}

	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}

	public String getOptionD() {
		return this.optionD;
	}

	public void setOptionD(String optionD) {
		this.optionD = optionD;
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