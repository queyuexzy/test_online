package com.test_online.module;

/**
 * UserPaperRelation entity. @author MyEclipse Persistence Tools
 */

public class UserPaperBean{

	// Fields

		private Integer id;
		private Integer userId;
		private Integer paperId;
		private Integer score;
		private String remark;
		
		private String _userName;
		private String _paperName;
		
		
		

		// Property accessors

		public String get_userName() {
			return _userName;
		}

		public void set_userName(String _userName) {
			this._userName = _userName;
		}

		public String get_paperName() {
			return _paperName;
		}

		public void set_paperName(String _paperName) {
			this._paperName = _paperName;
		}

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

		public Integer getPaperId() {
			return this.paperId;
		}

		public void setPaperId(Integer paperId) {
			this.paperId = paperId;
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