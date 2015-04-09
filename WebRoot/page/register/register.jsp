<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
    	<%@include file="/WEB-INF/page/include/head.jsp"%>
   		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
		<title>欢迎注册在线考试系统</title>
    </head>
  
  	<style type="text/css">
  	div {
	    position:absolute;
	    top:20%;
	    left:30%;
	    margin:-100px 0 0 -100px;
	    width:500px;
	    height:auto;
	} 
	span{
		color: red;
	}
	th {
		font-size: 12;
	}
  	</style>
	<body>
		<div>
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th colspan='100'>欢迎注册在线考试系统</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<th>账号：</th>
						<th><input type="text" id="id" style="width:90%" onblur="idIfExist()"><span>*</span><br/><span id="idIfExist"><span></th>
					</tr>
					<tr>
						<th>密码：</th>
						<th><input type="password" id="password" style="width:90%"><span>*</span></th>
					</tr>
					<tr>
						<th>重复密码：</th>
						<th><input type="password" id="repassword" style="width:90%"><span>*</span></th>
					</tr>
					<tr>
						<th>姓名：</th>
						<th><input type="text" id="name" style="width:90%"></th>
					</tr>
					<tr>
						<th>年龄：</th>
						<th><input type="text" id="age" style="width:90%"></th>
					</tr>
					<tr>
						<th>出生日期：</th>
						<th><input type="text" id="birthday" style="width:90%"></th>
					</tr>
					<tr>
						<th>地址：</th>
						<th><input type="text" id="address" style="width:90%"></th>
					</tr>
					<tr>
						<th>联系电话：</th>
						<th><input type="text" id="tel" style="width:90%"><span>*</span></th>
					</tr>
					<tr>
						<th>邮箱：</th>
						<th><input type="text" id="email" style="width:90%"><span>*</span></th>
					</tr>
					<tr>
						<th>备注：</th>
						<th><input type="text" id="remark" style="width:90%"></th>
					</tr>
					<tr>
						<th colspan="100">
							<input type="button" class="inputB" style="width:35%" value="确定" onclick="register()">
							<input type="button" id="resetButton" class="inputB" style="width:35%" value="重置">
						</th>
					</tr>
				</tbody>
			</table>
		</div>


		<script type="text/javascript">

		function idIfExist(){
			var id = $("#id").val();
			if(!id){
				alert("账号不能为空！");
				return;
			}

			$.ajax({
					url : "http://localhost:8080/test_online/login/login_idIfExist",
					data : {
						id : id
					},
					type : "post",
					dataType : "json",
					beforeSend : function(){
					},
					success : function(data){
						if(ajaxResponseValidate(data)){
							if(data.code <= 0){
								$("#idIfExist").text("您输入的账号已被注册，请重新输入!");
							}else{
								$("#idIfExist").text("");
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					}
				});
		}

		function register(){
			var id = $("#id").val();
			var password = $("#password").val();
			var repassword = $("#repassword").val();
			var name = $("#name").val();
			var age = $("#age").val();
			var birthday = $("#birthday").val();
			var address = $("#address").val();
			var tel = $("#tel").val();
			var email = $("#email").val();
			var remark = $("#remark").val();

			if(password == "" || password == null){
				alert("密码不能为空！");
			}

			if(password != repassword){
				alert("您两次输入的密码不同！");
			}

			if(tel == "" || tel == null){
				alert("联系电话不能为空！");
			}

			if(email == "" || email == null){
				alert("邮箱不能为空！");
			}

			$.ajax({
					url : "http://localhost:8080/test_online/login/login_register",
					data : {
						id : id,
						password : password,
						repassword : repassword,
						name : name,
						age : age,
						birthday : birthday,
						address : address,
						tel : tel,
						email : email,
						remark : remark
					},
					type : "post",
					dataType : "json",
					beforeSend : function(){
					},
					success : function(data){
						if(ajaxResponseValidate(data)){
							if(data.code <= 0){
								
							}else{
								alert("注册成功，请到邮箱确认！");
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					}
				});




		}

		</script>
	</body>
</html>
