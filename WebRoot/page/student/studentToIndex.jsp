<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
    	<%@include file="/WEB-INF/page/include/head.jsp"%>
   		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>应试者登陆</title>
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
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<thead class="tableC" cellpadding="0" cellspacing="0" style="width:100%">
					<tr>
						<th>
							<span id="studentToIndexMainTitle">您好</span>
							<input type="button" class="inputB" value="修改个人信息" onclick="showStudentInfoEditDiv()"/>
							<input id="brandOrderProductAddButton" type="button" class="inputB" value="考试" onclick="window.open('<%=path%>/page/student/studentExam.jsp')"/>
							<input id="brandOrderProductAddButton" type="button" class="inputB" value="练习" onclick="window.open('<%=path%>/page/student/studentTest.jsp')"/>
							
						</th>
					</tr>
				</thead>
			</table>
		</div>

		<div id="studentScoreDiv" style="height:600px;">
			<table id="studentScoreFlexiGrid"></table>
		</div>

		<div id="studentScoreInfoDiv" class="divPopup" style="width:770px"> 
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<thead class="tableC" cellpadding="0" cellspacing="0" style="width:100%">
					<tr>
						<th>
							<span id="studentToIndexMainTitle">您好,欢迎您查看具体信息</span>
							<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'studentScoreInfoDiv');"/>
						</th>
					</tr>
				</thead>
			</table>
			<table id="studentScoreInfoFlexiGrid"></table>
		</div>
		<div id="studentInfoEditDiv" class="divPopup" style="width:400px;">
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
							<input id="studentIdEditDiv" type="text" style="width:90%;" readonly="readonly"/>
						</th>
					</tr>
					<tr>
						<th>
							姓名：
						</th>
						<th>
							<input id="studentNameEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							密码：
						</th>
						<th>
							<input id="studentPasswordEditDiv" type="password" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							重复密码：
						</th>
						<th>
							<input id="studentRepasswordEditDiv" type="password" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							年龄：
						</th>
						<th>
							<input id="studentAgeEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							生日：
						</th>
						<th>
							<input id="studentBirthdayEditDiv" type="text" onclick="WdatePicker()" readonly="readonly" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							地址：
						</th>
						<th>
							<input id="studentAddressEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							电话：
						</th>
						<th>
							<input id="studentTelEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							邮箱：
						</th>
						<th>
							<input id="studentEmailEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							备注：
						</th>
						<th>
							<input id="studentRemarkEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th colspan="100">
							<input id="editStudentDivConfirmButton" type="button" class="inputB" value="确定" style="width:25%;"/>
							<input id="editStudentDivCancelButton" type="button" class="inputB" value="取消" style="width:25%;"/>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<script type="text/javascript">
		var studentName = "<%=((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getName()%>";
		var studentId = "<%=((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getId()%>";
		$(document).ready(function(){
			setStudentToIndexMainTitle();
			initStudentScoreFlexiGrid();
			initStudentScoreInfoFlexiGrid();
		});

		function setStudentToIndexMainTitle(){
			$("#studentToIndexMainTitle").text("您好, " + studentName);
		}

		function initStudentScoreFlexiGrid(){
			$("#studentScoreFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/student/student_searchScoresByUserId",
				addparams : [{name : "userId", value : studentId}],
				dataType : "json",
				rp : 15,
				useRp : false,
				colModel : [{
					display : "姓名",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row._userName
					}
				},{
					display : "学号",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.userId
					}
				},{
					display : "试卷名",
					width : 100,
					align : "center",
					render : function(val, row) {
						return "<a href='javascript:;' onclick='showStudentScoreInfoDiv(" + row.paperId + ")'>" + row._paperName + "</a>";
					}
				},{
					display : "得分",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.score;
					}
				},{
					display : "备注",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.remark;
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
					return true;
				}
			});
		}

		function initStudentScoreInfoFlexiGrid(){
				$("#studentScoreInfoFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/student/student_findStudentScoreInfoByUserIdPaperId",
				dataType : "json",
				autoload : false,
				rp : 15,
				useRp : false,
				colModel : [{
					display : "序号：",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.id;
					}
				},{
					display : "题目：",
					width : 200,
					align : "center",
					render : function(val, row) {
						return row.topic;
					}
				},{
					display : "正确答案：",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.rightAnswer;
					}
				},{
					display : "您的答案：",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.answer;
					}
				},{
					display : "本题分数：",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.problemScore;
					}
				},{
					display : "您的分数：",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.score;
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

		function showStudentScoreInfoDiv(paperId){
			showCustomDiv(true,"studentScoreInfoDiv");


			// $("#brandHitProductFlexiGrid").flexOptions({
			// 					newp : 1,
			// 					addparams : params
			// 				}).flexReload();
			$("#studentScoreInfoFlexiGrid").flexOptions({
				newp : 1,
				addparams : [{name : "paperId",value : paperId},{name : "userId",value : studentId}]
			}).flexReload();
		}

		function showStudentInfoEditDiv(){
				showCustomDiv(true,"studentInfoEditDiv");


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


				$("#studentIdEditDiv").val(id);
				$("#studentNameEditDiv").val(name);
				$("#studentPasswordEditDiv").val(password);
				$("#studentRepasswordEditDiv").val(repassword);
				$("#studentAgeEditDiv").val(age);
				$("#studentBirthdayEditDiv").val(birthday);
				$("#studentAddressEditDiv").val(address);
				$("#studentTelEditDiv").val(tel);
				$("#studentEmailEditDiv").val(email);
				$("#studentRemarkEditDiv").val(remark);


				$("#editStudentDivConfirmButton").unbind();
				$("#editStudentDivConfirmButton").click(function(){
					editTeacher(user);
				});

				$("#editStudentDivCancelButton").unbind();
				$("#editStudentDivCancelButton").click(function(){
					showCustomDiv(false,"studentInfoEditDiv",1);
				});
			}

			function editTeacher(user){

				var id = $("#studentIdEditDiv").val();
				var name = $("#studentNameEditDiv").val();
				var password = $("#studentPasswordEditDiv").val();
				var repassword = $("#studentRepasswordEditDiv").val();
				var age = $("#studentAgeEditDiv").val();
				var birthday = $("#studentBirthdayEditDiv").val();
				var address = $("#studentAddressEditDiv").val();
				var tel = $("#studentTelEditDiv").val();
				var email = $("#studentEmailEditDiv").val();
				var remark = $("#studentRemarkEditDiv").val();

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
						showCustomDiv(false,"studentInfoEditDiv",1);
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

		</script>
 	</body>

</html>
