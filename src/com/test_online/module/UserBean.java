package com.test_online.module;

/**
 * UserBean entity. @author MyEclipse Persistence Tools
 */

public class UserBean implements java.io.Serializable {
	private static final long serialVersionUID = 8804070789124304200L;

	// Fields
	private Integer id;
	private String name;
	private String password;
	private int teamStatus;
	private Integer age;
	private String birthday;
	private String address;
	private String tel;
	private String email;
	private String remark;
	
	private Integer _sumBanks;

	// Constructors

	/** default constructor */
	public UserBean() {
	}

	/** minimal constructor */
	public UserBean(Integer id, String password, int teamStatus, String tel, String email) {
		this.id = id;
		this.password = password;
		this.teamStatus = teamStatus;
		this.tel = tel;
		this.email = email;
	}

	/** full constructor */
	public UserBean(Integer id,String name, String password, int teamStatus, Integer age, String birthday, String address, String tel, String email, String remark) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.teamStatus = teamStatus;
		this.age = age;
		this.birthday = birthday;
		this.address = address;
		this.tel = tel;
		this.email = email;
		this.remark = remark;
	}

	// Property accessors

	
	public String getName() {
		return this.name;
	}

	public Integer get_sumBanks() {
		return _sumBanks;
	}

	public void set_sumBanks(Integer _sumBanks) {
		this._sumBanks = _sumBanks;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getTeamStatus() {
		return this.teamStatus;
	}

	public void setTeamStatus(int teamStatus) {
		this.teamStatus = teamStatus;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getBirthday() {
		return this.birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}