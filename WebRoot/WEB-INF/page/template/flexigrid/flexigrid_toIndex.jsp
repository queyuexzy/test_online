<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<html>
	<head>
		<%@include file="/WEB-INF/page/include/head.jsp"%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>FlexiGrid Template</title>
		<script type="text/javascript" src="<%=path%>/js/jquery/jquery.json-2.2.js"></script>
		<link rel="stylesheet"  type="text/css" href="<%=path%>/js/jquery-flexigrid/css/gray/flexigrid.css" />
		<script type="text/javascript" src="<%=path%>/js/jquery-flexigrid/flexigrid.js"></script>
	</head>
	<body>
		<div>
			<form onsubmit="searchPersonFlexiGrid(); return false;">
				<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
					<!-- 标题 -->
					<thead>
						<tr>
							<th colspan="100">
								FlexiGrid Template
								<input type="button" class="inputB" value="新增Person" onclick="showAddPersonDiv()" />
							</th>
						</tr>
					</thead>
					<!-- 查询条件 -->
					<tbody>
						<tr>
							<td>姓名：</td>
							<td><input id="name" type="text" value="" /></td>
							<td>性别：</td>
							<td>
								<select id="gender" onchange="searchPersonFlexiGrid()">
									<option value="">全部</option>
									<option value="Male">男</option>
									<option value="Female">女</option>
								</select>
							</td>
							<td>
								<input type="submit" class="inputB" value="查询" />
								<input type="button" class="inputB" value="清空" onclick="resetPersonFlexiGrid(true)" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>

		<!-- flexiGrid -->
		<div>
			<table id="personFlexiGrid"></table>
		</div>

		<!-- add/edit div -->
		<div id="personDiv" class="divPopup" style="height: auto; width: 400px;">
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<tr>
					<th colspan="2">
						<span id="personDivTitle"></span>
					</th>
				</tr>
				<tr>
					<td style="width:25%;">姓名：</td>
					<td style="width:75%;"><input id="personDivName" type="text" style="width:90%;" /></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td>
						<select id="personDivGender" style="width:90%;">
							<option value="Male">男</option>
							<option value="Female">女</option>
							<option value="Secret">保密</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input id="personDivAge" type="text" style="width:90%;" /></td>
				</tr>
				<tr>
					<td>薪金：</td>
					<td><input id="personDivSalary" type="text" style="width:90%;" /></td>
				</tr>
				<tr>
					<td>备注：</td>
					<td>
						<textarea id="personDivRemark" style="width:90%;" rows="5"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="personDivConfirm" type="button" class="inputB" value="确定" />
						<input id="personDivCancel" type="button" class="inputB" value="取消" onclick="showCustomDiv(false, 'personDiv', 1);" />
					</td>
				</tr>
			</table>
		</div>

		<script type="text/javascript">
			// Web page initialize function
			$(document).ready(function() {
				initPersonFlexiGrid();
			});

			/*
			 * Search
			 * Initialize the table#personFlexiGrid
			 */
			function initPersonFlexiGrid() {
				$("#personFlexiGrid").flexigrid({
					url : path + "/templateFlexiGrid/flexigrid_searchPersonForFlexigrid?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					dataType : "json",
					rp : 15,
					useRp : false,
					colModel : [{
							display : "姓名",
							width : 150,
							align : "left",
							render : function(val, row) {
								return row.name;
							}
						},{
							display : "性别",
							width : 100,
							align : "left",
							render : function (val, row) {
								if (row.gender == "Male") {
									return "男";
								} else if (row.gender == "Female") {
									return "女";
								} else {
									return "保密";
								}
							}
						},{
							display : "年龄",
							width : 50,
							align : "right",
							render : function (val, row) {
								return row.age + "";
							}
						},{
							display : "薪金",
							width : 100,
							align : "right",
							render : function (val, row) {
								return "￥" + row.salary;
							}
						},{
							display : "备注",
							width : 100,
							align : "left",
							render : function(val, row) {
								if (row.remark != null) {
									return row.remark.replace(/</g, "&lt;");
								} else {
									return "";
								}
							}
						},{
							display : "操作",
							width : 150,
							align : "center",
							render : function(val, row) {
								var editButton = "<input type='button' class='inputB' value='修改' onclick='showEditPersonDiv(" + row.id + ")' />";
								var deleteButton = "<input type='button' class='inputB' value='删除' onclick='deletePerson(" + row.id + ",\"" + row.name + "\")' />";
								var result = editButton + deleteButton;
								return result;
							}
						}],
					width : "auto",
					height : "400",
					showToggleBtn : false,
					showTableToggleBtn : false,
					onSubmit : function() {
						showWaitDiv(true);
						return true;
					},
					onSuccess : function(grid, data) {
						showWaitDiv(false);
						return true;
					},
					onError : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						return true;
					}
				});
			}

			/**
			 * Reset the table#personFlexiGrid
			 */
			function resetPersonFlexiGrid(search) {
				$("#name").val("");
				$("#gender").val("");

				if (search) {
					$("#personFlexiGrid").flexOptions({
						newp : 1,
						addparams : [],
						sortname : null,
						sortorder : null
					}).flexReload();
				}
			}

			/**
			 * Search the table#personFlexiGrid
			 */
			function searchPersonFlexiGrid() {
				var params = new Array;

				var name = $("#name").val();
				if (name.trim().length > 0) {
					params.push({name : "name", value : name.trim()});
				}
				
				var gender = $("#gender").val();
				if (gender.length > 0) {
					params.push({name : "gender", value : gender});	
				}

				$("#personFlexiGrid").flexOptions({
						newp : 1,
						addparams : params
				}).flexReload();
			}

			/*
			 * show add person div.
			 */
			function showAddPersonDiv() {
				$("#personDivTitle").text("新增Person");
				$("#personDivName").val("");
				$("#personDivName").removeAttr('readonly');
				$("#personDivGender").val("Male");
				$("#personDivAge").val("20");
				$("#personDivSalary").val("100000");
				$("#personDivConfirm")[0].onclick = function() {
					addPerson();
				};
				showCustomDiv(true, 'personDiv');
			}

			/**
			 * Insert
			 * Add person.
			 */ 
			function addPerson() {
				var name = $("#personDivName").val();
				var gender = $("#personDivGender").val();
				var age = $("#personDivAge").val();
				var salary = $("#personDivSalary").val();

				// Maybe there's some data verification here.
				if (name.trim() == "") {
					alert("请填入姓名！");
					return;
				}

				if (age.trim() == "") {
					alert("请填入年龄!");
					return;
				}

				if (salary.trim() == "") {
					alert("请填入薪金！");
					return;
				}

				$.ajax({
					url : path + "/templateFlexiGrid/flexigrid_addPerson?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						name : name,
						gender : gender,
						age : age,
						salary : salary
					},
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showCustomDiv(false, 'personDiv', 1);
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code < 0) {
								alert(data.message);
								showWaitDiv(false);
								showCustomDiv(true, 'personDiv');
							} else {
								popUp(data.message);
								showWaitDiv(false);
								$("#personFlexiGrid").flexOptions({
									newp : 1,
									sortname : "createTime",
									sortorder : "desc"
								}).flexReload();
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true, 'personDiv');
					}
				});
			}

			/**
			 * Search
			 * show edit person div.
			 */
			function showEditPersonDiv(id) {
				$.ajax({
					url : path + "/templateFlexiGrid/flexigrid_getPersonById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : id
					},
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code < 0) {
								alert(data.message);
								showWaitDiv(false);
								$("#personFlexiGrid").flexReload();
							} else {
								var person = data.data;
								$("#personDivTitle").text("修改Person");
								$("#personDivName").val(person.name);
								$("#personDivName").attr('readonly', 'readonly');
								$("#personDivGender").val(person.gender);
								$("#personDivAge").val(person.age);
								$("#personDivSalary").val(person.salary);
								$("#personDivConfirm")[0].onclick = function() {
									editPerson(id, person);
								};
								showWaitDiv(false);
								showCustomDiv(true, 'personDiv');
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true, 'personDiv');
					}
				});			
			}

			/**
			 * Update
			 * edit person.
			 */
			function editPerson(id, oldPerson) {
				var gender = $("#personDivGender").val();
				var age = $("#personDivAge").val();
				var salary = $("#personDivSalary").val();
				var remark = $("#personDivRemark").val();

				// Maybe there's some data verification here.
				if (age.trim() == "") {
					alert("请填入年龄!");
					return;
				}

				if (salary.trim() == "") {
					alert("请填入薪金！");
					return;
				}

				var changed = false;
				var data = {id : id};
				if (gender != person.gender) {
					data.gender = gender;
					changed = true;
				}

				if (age != person.age) {
					data.age = age;
					changed = true;
				}

				if (salary != person.salary) {
					data.salary = salary;
					changed = true;
				}

				if (!changed) {
					showCustomDiv(false, 'personDiv', 1);
					return;
				}

				$.ajax({
					url : path + "/templateFlexiGrid/flexigrid_updatePersonById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : data,
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showCustomDiv(false, 'personDiv', 1);
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code < 0) {
								alert(data.message);
								showWaitDiv(false);
								
								if (data.code == -201) {
									$("#personFlexiGrid").flexReload();
								} else {
									showCustomDiv(true, 'personDiv');
								}
							} else {
								popUp(data.message);
								showWaitDiv(false);
								$("#personFlexiGrid").flexOptions({
									newp : 1,
									sortname : "updateTime",
									sortorder : "desc"
								}).flexReload();
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true, 'personDiv');
					}
				});
			}

			/**
			 * Update
			 * Delete person
			 */
			function deletePerson(id, name) {
				if (confirm("确定要删除" + name + "吗？")){
					$.ajax({
					url : path + "/templateFlexiGrid/flexigrid_deletePersonById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : id
					},
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code < 0) {
								alert(data.message);
							} else {
								popUp(data.message);
							}
							showWaitDiv(false);
							$("#personFlexiGrid").flexReload();
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});
				}
			}
		</script>
	</body>
</html>