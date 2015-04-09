<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    	<%@include file="/WEB-INF/page/include/head.jsp"%>
   		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>欢迎您，系统管理员</title>
		<link rel="stylesheet" href="<%=path%>/style/css/style.css"	type="text/css">
		<script type="text/javascript" src="<%=path%>/js/common.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery/jqueryHelper.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery/jquery.json-2.2.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/js/jqueryui/ui-tabs/ui.tabs.css"/>
		<script type="text/javascript" src="<%=path%>/js/jqueryui/ui-tabs/ui.tabs.js"></script>
		<link rel="stylesheet"  type="text/css" href="<%=path%>/js/jquery-flexigrid/css/gray/flexigrid.css" />
		<script type="text/javascript" src="<%=path%>/js/jquery-flexigrid/flexigrid.js"></script>
		<script type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=path%>/js/mJs/ajaxfileupload.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jcrop/jquery.Jcrop.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/js/jcrop/jquery.Jcrop.css" />
		
		<style type="text/css">
			th,div {
 			 font-size: 12;
		}
		</style>
    </head>
  
  <body style="overflow:hidden;">

  	<div>
  		<table class="tableC" style="width:100%;">
  			<thead>
  				<tr>
  					<th col="100">
  						<span id="adminToIndexMainTitle"></span>
  						<input type="button" class="inputB" value="修改个人信息" onclick="showAdminInfoEditDiv()"/>
  						<input type="button" class="inputB" value="增加团队信息" onclick="showAddTeamDiv()"/>
  					</th>
  				</tr>
  			</thead>
  		</table>

  		<table id="teamInfoFlexiGrid"></table>

  	</div>

  	<div id="adminInfoEditDiv" class="divPopup" style="width:400px;">
		<table class="tableC" style="width:100%;">
			<thead>
				<tr>
					<th colspan="100"> <span>修改个人信息<span></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<th>
						账号：
					</th>
					<th>
						<input id="adminIdEditDiv" type="text" style="width:90%;" readonly="readonly"/>
					</th>
				</tr>
				<tr>
					<th>
						姓名：
					</th>
					<th>
						<input id="adminNameEditDiv" type="text" style="width:90%;"/>
					</th>
				</tr>
				<tr>
					<th>
						密码：
					</th>
					<th>
						<input id="adminPasswordEditDiv" type="password" style="width:90%;"/>
					</th>
				</tr>
				<tr>
					<th>
						重复密码：
					</th>
					<th>
						<input id="adminRepasswordEditDiv" type="password" style="width:90%;"/>
					</th>
				</tr>
				<tr>
					<th>
						年龄：
					</th>
					<th>
						<input id="adminAgeEditDiv" type="text" style="width:90%;"/>
					</th>
				</tr>
				<tr>
					<th>
						生日：
					</th>
					<th>
						<input id="adminBirthdayEditDiv" type="text" onclick="WdatePicker()" readonly="readonly" style="width:90%;"/>
					</th>
				</tr>
				<tr>
					<th>
						地址：
					</th>
					<th>
						<input id="adminAddressEditDiv" type="text" style="width:90%;"/>
					</th>
				</tr>
				<tr>
					<th>
						电话：
					</th>
					<th>
						<input id="adminTelEditDiv" type="text" style="width:90%;"/>
					</th>
				</tr>
				<tr>
					<th>
						邮箱：
					</th>
					<th>
						<input id="adminEmailEditDiv" type="text" style="width:90%;"/>
					</th>
				</tr>
				<tr>
					<th>
						备注：
					</th>
					<th>
						<input id="adminRemarkEditDiv" type="text" style="width:90%;"/>
					</th>
				</tr>
				<tr>
					<th colspan="100">
						<input id="editAdminDivConfirmButton" type="button" class="inputB" value="确定" style="width:25%;"/>
						<input type="button" class="inputB" value="取消" style="width:25%;" onclick="showCustomDiv(false,'adminInfoEditDiv');"/>
					</th>
				</tr>
			</tbody>
		</table>
	</div>

	<div id="editBankDiv" class="divPopup" style="width:600px;">
		<table class="tableC" style="width:100%;">
			<thead>
				<tr>
					<th>
						题库信息
						<input type="button" class="inputB" value="增加题库" onclick="showCustomDiv(false,'editBankDiv');showCustomDiv(true,'addBankDiv');$('#addBankName').val('')"/>
						<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'editBankDiv');$('#bankDivFlexiGrid').flexReload();"/>
					</th>
				</tr>
			</thead>
		</table>
		<table id="bankDivFlexiGrid"></table>
	</div>

	<div id="addBankDiv" class="divPopup" style="width:400px;">
		<table class="tableC" style="width:100%;">
			<tbody>
				<tr>
					<th colspan="100">
						增加题库
						<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'addBankDiv');showCustomDiv(true,'editBankDiv');$('#bankDivFlexiGrid').flexReload();"/>
					</th>
				</tr>
				<tr>
					<th>
						题库名称：
					</th>
					<th>
						<input id="addBankName" type="text" style="width:90%"/>
					</th>					
				</tr>
				<tr>
					<th colspan="100">
						<input type="button" value="确定" class="inputB" onclick="addBank();"/>
						<input type="button" value="取消" class="inputB" onclick="$('#addBankName').val('')"/>
					</th>				
				</tr>
			</tbody>
		</table>
	</div>

	<div id="addTeamDiv" class="divPopup" style="width:600px;">
		<table class="tableC" style="width:100%;">
			<thead>
				<tr>
					<th colspan="2">
						增加团队信息
						<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'addTeamDiv');$('#teamInfoFlexiGrid').flexReload();"/>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>账号：</th>
					<th><input id="teamId" type="text" style="width:90%;"/></th>
				</tr>
				<tr>
					<th>联系电话：</th>
					<th><input id="teamTel" type="text" style="width:90%;"/></th>
				</tr>
				<tr>
					<th>邮箱：</th>
					<th><input id="teamEmail" type="text" style="width:90%;"/></th>
				</tr>
				<tr>
					<th colspan="2">
						<input id="addTeamDivConfirmButton" type="button" class="inputB" value="确定"/>
						<input type="button" class="inputB" value="取消" onclick="showCustomDiv(false,'addTeamDiv')"/>
					</th>
				</tr>
			</tbody>
		</table>
	</div>




    <script type="text/javascript">
    var adminId = "<%=((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getId()%>";
    var adminName = "<%=((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getName()%>";
    $(document).ready(function(){
    	$("#adminToIndexMainTitle").text("您好," + adminName);
  		initTeamInfoFlexiGrid();
  		initBankDivFlexiGrid();
  	});

  	function initTeamInfoFlexiGrid(){
		$("#teamInfoFlexiGrid").flexigrid({
		url : "http://localhost:8080/test_online/admin/admin_findTeams",
		dataType : "json",
		rp : 15,
		useRp : false,
		colModel : [{
			display : "公司号",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.id;
			}
		},{
			display : "公司名",
			width : 100,
			align : "center",
			render : function(val, row) {
				if(row.name){
					return "<a href='javascript:;' onclick='showEditBankDiv(" + row.id + ")'>" + row.name + "</a>";
				}else{
					return "该公司未登陆！";
				}
				
			}
		},{
			display : "公司信息",
			width : 200,
			align : "left",
			render : function(val, row) {
				return "公司成立年限：" + (row.age == null ? "" : row.age) + "<br/>公司成立时间：" + (row.birthday == null ? "" : row.birthday.substring(0,10)) + "<br/>公司地址：" + (row.address == null ? "" : row.age);
			}
		},{
			display : "公司联系方式",
			width : 200,
			align : "left",
			render : function(val, row) {
				return "公司电话：" + row.tel + "<br/>公司邮箱：" + row.email;
			}
		},{
			display : "备注",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.remark;
			}
		},{
			display : "操作：",
			width : 100,
			align : "center",
			render : function(val, row) {
				return "<input type='button' class='inputB' value='删除' onclick='deleteTeam(" + row.id + ")'>";
			}
		}],
		width : "auto",
		height : "370",
		showToggleBtn : false,
		showTableToggleBtn : false,
		singleSelect : true,
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
		}
		});
	}

	function showAdminInfoEditDiv(){
		showCustomDiv(true,"adminInfoEditDiv");

		var id = "<%= ((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getId()%>";
		var name = "<%= ((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getName()%>";
		var password = "<%= ((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getPassword()%>";
		var repassword = "<%= ((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getPassword()%>";
		var age = "<%= ((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getAge()%>";
		var birthday = "<%= ((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getBirthday()%>";
		var address = "<%= ((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getAddress()%>";
		var tel = "<%= ((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getTel()%>";
		var email = "<%= ((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getEmail()%>";
		var remark = "<%= ((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getRemark()%>";

		var user = {};
		user.id = id;
		user.name = name;
		user.password = password;
		user.age = age;
		user.birthday = birthday;
		user.address = address;
		user.tel = tel;
		user.email = email;
		user.remark = remark;


		$("#adminIdEditDiv").val(id);
		$("#adminNameEditDiv").val(name == null ? "" : name);
		$("#adminPasswordEditDiv").val(password);
		$("#adminRepasswordEditDiv").val(repassword);
		$("#adminAgeEditDiv").val(age == null ? "" : age);
		$("#adminBirthdayEditDiv").val(birthday == null ? "" : birthday);
		$("#adminAddressEditDiv").val(address == null ? "" : address);
		$("#adminTelEditDiv").val(tel);
		$("#adminEmailEditDiv").val(email);
		$("#adminRemarkEditDiv").val(remark == null ? "" : remark);


		$("#editAdminDivConfirmButton").unbind();
		$("#editAdminDivConfirmButton").click(function(){
			editAdmin(user);
		});
	}

	function editAdmin(user){
		var id = $("#adminIdEditDiv").val();
		var name = $("#adminNameEditDiv").val();
		var password = $("#adminPasswordEditDiv").val();
		var repassword = $("#adminRepasswordEditDiv").val();
		var age = $("#adminAgeEditDiv").val();
		var birthday = $("#adminBirthdayEditDiv").val();
		var address = $("#adminAddressEditDiv").val();
		var tel = $("#adminTelEditDiv").val();
		var email = $("#adminEmailEditDiv").val();
		var remark = $("#adminRemarkEditDiv").val();

		var data = {id : id};

		if((password.length < 6) || (password.length > 25)){
			alert("密码必须大于6位小于25位！");
			return;
		}
		if(password != repassword){
			alert("前后输入的密码不一致！");
			return;
		}
		if(tel == null || tel == ""){
			alert("电话号码不能为空！");
			return;
		}
		if(email == null || email == ""){
			alert("邮箱地址不能为空！");
			return;
		}

		var changed = false;

		if(name == null || name == ""){
			if(user.name != null || user.name != ""){
				changed = true;
			}
		}else{
			data.name = name;
			if(name != user.name){
				changed = true;
			}
		}

		data.password = password;
		if(password != user.password){
			changed = true;
		}

		if(age == null || age == ""){
			if(user.age != null || user.age != ""){
				changed = true;
			}
		}else{
			data.age = age;
			if(age != user.age){
				changed = true;
			}
		}

		if(birthday == null || birthday == ""){
			if(user.birthday != null || user.birthday != ""){
				changed = true;
			}
		}else{
			data.birthday = birthday;
			if(birthday != user.birthday){
				changed = true;
			}
		}

		if(address == null || address == ""){
			if(user.address != null || user.address != ""){
				changed = true;
			}
		}else{
			data.address = address;
			if(address != user.address){
				changed = true;
			}
		}

		data.tel = tel;
		if(tel != user.tel){
			changed = true;
		}

		data.email = email;
		if(email != user.email){
			changed = true;
		}

		if(remark == null || remark == ""){
			if(user.remark != null || user.remark != ""){
				changed = true;
			}
		}else{
			data.remark = remark;
			if(remark != user.remark){
				changed = true;
			}
		}
		
		if(changed == false){
			showCustomDiv(false,"studentInfoEditDiv");
			return;
		}


		$.ajax({
			url : path + "/student/student_updateStudentInSession",
			data : data,
			type : "post",
			dataType : "json",
			beforeSend : function(){
				showCustomDiv(false,"adminInfoEditDiv",1);
				showWaitDiv(true);
			},
			success : function(data){
				if(ajaxResponseValidate(data)){
					if(data.code <= 0){
						alert(data.message);
						showWaitDiv(false);
					}else{
						showWaitDiv(false);
						location.reload();
						alert("操作成功！");
					}
				}
			},
			error : function(){
				alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
				showWaitDiv(false);
			}
		});
	}

	function showEditBankDiv(teamId){
		globalTeamId = teamId;
		showCustomDiv(true,"editBankDiv");
		$("#bankDivFlexiGrid").flexOptions({
			newp : 1,
			addparams : [{name : "teamId",value : teamId}]

		}).flexReload();
	}

	function initBankDivFlexiGrid(){
		$("#bankDivFlexiGrid").flexigrid({
		url : "http://localhost:8080/test_online/teacher/teacher_findBanksByTeamId",
		dataType : "json",
		autoload : false,
		rp : 15,
		useRp : false,
		colModel : [{
			display : "题库名称：",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.name;
			}
		},{
			display : "创建时间：",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.createTime.substring(0,19);
			}
		},{
			display : "上次更新时间：",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.updateTime.substring(0,19);
			}
		},{
			display : "备注",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.remark;
			}
		},{
			display : "操作",
			width : 100,
			align : "center",
			render : function(val, row) {
				return "<input type='button' class='inputB' value='删除' onclick='deleteBank(" + row.id + ")'/>";
			}
		}],
		width : "auto",
		height : "370",
		showToggleBtn : false,
		showTableToggleBtn : false,
		singleSelect : true,
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
		}
	});
	}

	function deleteBank(bankId){
		if(!confirm("您确定要删除本题库信息吗？")){
			return;
		}

		$.ajax({
				url : path + "/admin/admin_deleteBankById",
				data : {
					id : bankId
				},
				type : "post",
				dataType : "json",
				beforeSend : function(){
					showWaitDiv(true);
				},
				success : function(data){
					if(ajaxResponseValidate(data)){
						if(data.code <= 0){
							alert(data.message);
							showWaitDiv(false);
						}else{
							showWaitDiv(false);
							alert("操作成功！");
							$("#bankDivFlexiGrid").flexReload();
						}
					}
				},
				error : function(){
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
				}
			});
	}

	function deleteTeam(teamId){
		if(!confirm("您确定要删除该条信息吗？")){
			return;
		}

		$.ajax({
			url : path + "/admin/admin_deleteTeamById",
			data : {
				id : teamId
			},
			type : "post",
			dataType : "json",
			beforeSend : function(){
				showWaitDiv(true);
			},
			success : function(data){
				if(ajaxResponseValidate(data)){
					if(data.code <= 0){
						alert(data.message);
						showWaitDiv(false);
					}else{
						showWaitDiv(false);
						alert("操作成功！");
						$("#teamInfoFlexiGrid").flexReload();
					}
				}
			},
			error : function(){
				alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
				showWaitDiv(false);
			}
		});
	}

	var globalTeamId;
	function addBank(){
		var name = $("#addBankName").val();
		if(name == null || name == ""){
			alert("姓名不能为空！");
			return;
		}
		$.ajax({
			url : path + "/admin/admin_addBank",
			data : {
				name : name,
				teamId : globalTeamId
			},
			type : "post",
			dataType : "json",
			beforeSend : function(){
				showWaitDiv(true);
			},
			success : function(data){
				if(ajaxResponseValidate(data)){
					if(data.code <= 0){
						alert(data.message);
						showWaitDiv(false);
					}else{
						showWaitDiv(false);
						alert("操作成功！");
						showCustomDiv(false,"addBankDiv");
						showCustomDiv(true,"editBankDiv");
						$("#bankDivFlexiGrid").flexReload();
					}
				}
			},
			error : function(){
				alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
				showWaitDiv(false);
			}
		});
	}

	function showAddTeamDiv(){
		showCustomDiv(true,"addTeamDiv");

		$("teamId").val("");
		$("#teamEmail").val("");
		$("#teamTel").val("");

		$("#addTeamDivConfirmButton").unbind();
		$("#addTeamDivConfirmButton").click(function(){

			var id = $("#teamId").val();
			var password = $("#teamPassword").val();
			var repassword = $("#teamRepassword").val();
			var email = $("#teamEmail").val();
			var tel = $("#teamTel").val();

			if(id == null || id == ""){
				alert("账号不能为空！")
				return; 
			}

			$.ajax({
			url : path + "/admin/admin_addTeam",
			data : {
				id : id,
				email : email,
				tel : tel
			},
			type : "post",
			dataType : "json",
			beforeSend : function(){
				showWaitDiv(true);
			},
			success : function(data){
				if(ajaxResponseValidate(data)){
					if(data.code <= 0){
						alert(data.message);
						showWaitDiv(false);
					}else{
						showWaitDiv(false);
						alert("操作成功！");
						showCustomDiv(false,"addTeamDiv");
						$("#teamInfoFlexiGrid").flexReload();
					}
				}
			},
			error : function(){
				alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
				showWaitDiv(false);
			}
		});
		});
	}
    </script>
  </body>
</html>
