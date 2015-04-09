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
    </head>
  
  	<style type="text/css">
  	a{
  		font-size: 23px;
  	}

  	</style>
	<body style="overflow:hidden;">
		<br/><br/><br/><br/><br/><br/><br/><br/><br/>
	  	<a href="javascript:;" onclick="clickFunction()">修改信息</a> <br/><br/><br/><br/><br/><br/>

	  	<a href="javascript:;">进行考试</a> <br/><br/><br/><br/><br/><br/>

	  	<a href="javascript:;">进行练习</a> <br/><br/><br/><br/><br/><br/>

	  	<a href="javascript:;">查询成绩</a> <br/><br/><br/><br/><br/><br/>

	  	<script type="text/javascript">

	  	function clickFunction(){
	  		window.open("<%=path%>/page/student/studentRight.jsp");
	  	}



	  	</script>

	</body>
</html>
