package com.test_online.module;

/**
 * JudgeAnswerBean entity. @author MyEclipse Persistence Tools
 */

public class JudgeAnswerBean implements java.io.Serializable {

	private static final long serialVersionUID = 3851439689136747817L;
	// Fields

	private Integer id;
	private Integer userId;
	private Integer judgeId;
	private String answer;
	private Integer score;
	private String remark;
	
	private String _paperName;
	private String _paperScore;
	private String _userScore;
	private String _judgeTopic;
	private String _rightAnswer;
	private String _judgeScore;

	// Constructors

	/** default constructor */
	public JudgeAnswerBean() {
	}

	

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getJudgeId() {
		return this.judgeId;
	}

	public void setJudgeId(Integer judgeId) {
		this.judgeId = judgeId;
	}

	public String get_paperName() {
		return _paperName;
	}

	public void set_paperName(String _paperName) {
		this._paperName = _paperName;
	}

	public String get_paperScore() {
		return _paperScore;
	}

	public void set_paperScore(String _paperScore) {
		this._paperScore = _paperScore;
	}

	public String get_userScore() {
		return _userScore;
	}

	public void set_userScore(String _userScore) {
		this._userScore = _userScore;
	}

	public String get_judgeTopic() {
		return _judgeTopic;
	}

	public void set_judgeTopic(String _judgeTopic) {
		this._judgeTopic = _judgeTopic;
	}

	public String get_rightAnswer() {
		return _rightAnswer;
	}

	public void set_rightAnswer(String _rightAnswer) {
		this._rightAnswer = _rightAnswer;
	}

	public String get_judgeScore() {
		return _judgeScore;
	}

	public void set_judgeScore(String _judgeScore) {
		this._judgeScore = _judgeScore;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}