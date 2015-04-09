package com.test_online.module;


/**
 * PaperBean entity. @author MyEclipse Persistence Tools
 */

public class PaperBean implements java.io.Serializable {
	private static final long serialVersionUID = 8296608615963284500L;

	// Fields
	private Integer id;
	private String name;
	private String examPaper;
	private String createTime;
	private String updateTime;
	private String remark;
	private int teamId;
	
	private String _teamName;

	// Constructors

	/** default constructor */
	public PaperBean() {
	}

	/** minimal constructor */
	public PaperBean(String name, String examPaper, String createTime, String updateTime) {
		this.name = name;
		this.examPaper = examPaper;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	/** full constructor */
	public PaperBean(String name, String examPaper, String createTime, String updateTime, String remark) {
		this.name = name;
		this.examPaper = examPaper;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.remark = remark;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public String get_teamName() {
		return _teamName;
	}

	public void set_teamName(String _teamName) {
		this._teamName = _teamName;
	}

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getExamPaper() {
		return this.examPaper;
	}

	public void setExamPaper(String examPaper) {
		this.examPaper = examPaper;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}