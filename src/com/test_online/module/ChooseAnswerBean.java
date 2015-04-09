package com.test_online.module;

/**
 * ChooseAnswerBean entity. @author MyEclipse Persistence Tools
 */

public class ChooseAnswerBean implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 6937134770533296358L;
	private Integer id;
	private Integer userId;
	private Integer chooseId;
	private String answer;
	private Integer score;
	private String remark;
	
	private String _paperName;
	private int _paperScore;
	private int _userScore;
	private String _chooseTopic;
	private String _rightAnswer;
	private int _chooseScore;

	// Constructors

	/** default constructor */
	public ChooseAnswerBean() {
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

	public String get_chooseTopic() {
		return _chooseTopic;
	}

	public void set_chooseTopic(String _chooseTopic) {
		this._chooseTopic = _chooseTopic;
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

	public int get_chooseScore() {
		return _chooseScore;
	}

	public void set_chooseScore(int _chooseScore) {
		this._chooseScore = _chooseScore;
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

	public Integer getChooseId() {
		return this.chooseId;
	}

	public void setChooseId(Integer chooseId) {
		this.chooseId = chooseId;
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