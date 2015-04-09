package com.test_online.module;

import java.sql.Timestamp;

/**
 * BankBean entity. @author MyEclipse Persistence Tools
 */

public class BankBean implements java.io.Serializable {

	private static final long serialVersionUID = -343532284931244944L;
	// Fields
	private Integer id;
	private Integer teamId;
	private String name;
	private String createTime;
	private String updateTime;
	private String remark;

	// Constructors

	/** default constructor */
	public BankBean() {
	}

	/** minimal constructor */
	public BankBean(Integer teamId, String name, String createTime, String updateTime) {
		this.teamId = teamId;
		this.name = name;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	/** full constructor */
	public BankBean(Integer teamId, String name, String createTime, String updateTime, String remark) {
		this.teamId = teamId;
		this.name = name;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.remark = remark;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTeamId() {
		return this.teamId;
	}

	public void setTeamId(Integer teamId) {
		this.teamId = teamId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
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