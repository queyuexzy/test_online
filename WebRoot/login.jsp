<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import = "com.test_online.dao.UserDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>湖北工业大学在线考试系统</title>
		<script type="text/javascript" src="<%=path%>/js/common.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery/jqueryHelper.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery/jquery.json-2.2.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/style/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/style/css/style.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/style/css/styles.css">

		<style type="text/css">
		em {color: red;}
		</style>
		
	</head>
  
  <body class="bodyIndex"	onkeypress="if (event.keyCode == 13) {$('input#submitButton').click()}"	style="overflow: hidden;">
    <div class="login">
    	<div class="login-header">
				<div class="login-logo"></div>
				<div class="login-title">在线考试系统</div>
		</div>

		<form class="form-horizontal" style="width: 700px;">
			<div class="form-group">
				<label class="col-sm-3 control-label">登陆账号：</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="id" value="" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">登陆密码：</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="password"  value=""/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<font color="red" id="errorInfo"></font>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<input type="button" class="btn btn-primary" onclick="login()" id="submitButton" style="width: 120px" value="登录" />
					<input type="button" class="btn btn-primary" onclick="register()" id="registerButton" style="width: 120px" value="注册" />
				</div>
			</div>
		</form>
    	<div class="loginFoot">
				<label> <span id="currentTime"></span></label> Copyright &copy; 2015 All Rights Reserved
		</div>
    </div>
    
    <script type="text/javascript">
    	var path = "http://localhost:8080/test_online/page/";
    	$(document).ready(function(){
    		window.setTimeout("refreshTime()",1000);
    	});
	
    	$("#showIndex2").unbind();
    	$("#showIndex2").click(function(){
    		window.top.location = "index2.jsp";
    	});
    	
    	function refreshTime(){
    		$("span#currentTime").html(new Date().toLocaleString());
    		window.setTimeout("refreshTime()",1000);
    	}
    	
    	// $('input:radio:checked').val();
    	function login(){
    		if(!($("#id").val())){
    			alert("请输入账号！");
    			return;
    		}
    		if(!($("#password").val())){
    			alert("请输入密码！");
    			return;
    		}
			
    		validateUser();
    	}
    	
    	function register(){
    		
    		window.open(path + "register/register.jsp");
    		
    	}

    	function validateUser(){

    		$.ajax({
				url : "http://localhost:8080/test_online/login/login_login",
				data : {
					id : $("#id").val(),
					password : $("#password").val()
				},
				type : "post",
				dataType : "json",
				beforeSend : function() {
					$("#errorInfo").attr("color", "green");
					$("#errorInfo").html("正在登陆请稍后......");
				},
				success : function(data) {
					var page = data.data;
					if(page == "<%=UserDao.STATUS_ADMIN%>"){
						window.top.location = path + "admin/adminToIndex.jsp";
					}else if(page == "<%= UserDao.STATUS_TEACHER%>"){
						window.top.location = path + "teacher/teacherToIndex.jsp";
					}else if(page == "<%= UserDao.STATUS_STUDENT%>"){
						window.top.location = path + "student/studentToIndex.jsp";
					}else{
						$("#errorInfo").attr("color", "red");
						$("#errorInfo").html("账号或密码输入有误！");
					}
					
				},
				error : function(data){
					alert(data.data);
				}
			});

    	}
    </script>
  </body>
</html>
