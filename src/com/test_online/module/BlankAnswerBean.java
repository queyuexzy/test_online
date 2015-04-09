package com.test_online.module;

/**
 * BlankAnswerBean entity. @author MyEclipse Persistence Tools
 */

public class BlankAnswerBean implements java.io.Serializable {

	private static final long serialVersionUID = -2257570543327140326L;
	// Fields

	private Integer id;
	private Integer userId;
	private Integer blankId;
	private String answer;
	private Integer score;
	private String remark;
	
	private String _paperName;
	private int _paperScore;
	private int _userScore;
	private String _blankTopic;
	private String _rightAnswer;
	private int _blankScore;

	// Constructors

	/** default constructor */
	public BlankAnswerBean() {
	}

	/** minimal constructor */
	public BlankAnswerBean(Integer userId, Integer blankId, String answer) {
		this.userId = userId;
		this.blankId = blankId;
		this.answer = answer;
	}

	/** full constructor */
	public BlankAnswerBean(Integer userId, Integer blankId, String answer, Integer score, String remark) {
		this.userId = userId;
		this.blankId = blankId;
		this.answer = answer;
		this.score = score;
		this.remark = remark;
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

	public String get_paperName() {
		return _paperName;
	}

	public void set_paperName(String _paperName) {
		this._paperName = _paperName;
	}

	public String get_blankTopic() {
		return _blankTopic;
	}

	public void set_blankTopic(String _blankTopic) {
		this._blankTopic = _blankTopic;
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

	public int get_blankScore() {
		return _blankScore;
	}

	public void set_blankScore(int _blankScore) {
		this._blankScore = _blankScore;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getBlankId() {
		return this.blankId;
	}

	public void setBlankId(Integer blankId) {
		this.blankId = blankId;
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