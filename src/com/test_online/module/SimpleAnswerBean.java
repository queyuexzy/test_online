package com.test_online.module;

/**
 * SimpleAnswerBean entity. @author MyEclipse Persistence Tools
 */

public class SimpleAnswerBean implements java.io.Serializable {

	private static final long serialVersionUID = -4590162319222459568L;
	// Fields

	private Integer id;
	private Integer userId;
	private Integer simpleId;
	private String answer;
	private Integer score;
	private String remark;
	
	private String _paperName;
	private int _paperScore;
	private int _userScore;
	private String _simpleTopic;
	private String _rightAnswer;
	private int _simpleScore;

	// Constructors

	/** default constructor */
	public SimpleAnswerBean() {
	}

	/** minimal constructor */
	public SimpleAnswerBean(Integer userId, Integer simpleId, String answer) {
		this.userId = userId;
		this.simpleId = simpleId;
		this.answer = answer;
	}

	/** full constructor */
	public SimpleAnswerBean(Integer userId, Integer simpleId, String answer, Integer score, String remark) {
		this.userId = userId;
		this.simpleId = simpleId;
		this.answer = answer;
		this.score = score;
		this.remark = remark;
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

	public String get_simpleTopic() {
		return _simpleTopic;
	}

	public void set_simpleTopic(String _simpleTopic) {
		this._simpleTopic = _simpleTopic;
	}

	public String get_rightAnswer() {
		return _rightAnswer;
	}

	public void set_rightAnswer(String _rightAnswer) {
		this._rightAnswer = _rightAnswer;
	}

	public int get_paperScore() {
		return _paperScore;
	}

	public void set_paperScore(int _paperScore) {
		this._paperScore = _paperScore;
	}

	public int get_userScore() {
		return _userScore;
	}

	public void set_userScore(int _userScore) {
		this._userScore = _userScore;
	}

	public int get_simpleScore() {
		return _simpleScore;
	}

	public void set_simpleScore(int _simpleScore) {
		this._simpleScore = _simpleScore;
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

	public Integer getSimpleId() {
		return this.simpleId;
	}

	public void setSimpleId(Integer simpleId) {
		this.simpleId = simpleId;
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