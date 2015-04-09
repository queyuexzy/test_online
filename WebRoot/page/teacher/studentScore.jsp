<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
    	<%@include file="/WEB-INF/page/include/head.jsp"%>
   		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>查看应试者成绩</title>
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
							<span id="studentToIndexMainTitle">您好，欢迎您查看学生成绩</span>
						</th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="studentScoreDiv" style="height:600px;">
			<table id="studentScoreFlexiGrid"></table>
		</div>
		<div id="studentScoreInfoDiv" class="divPopup"> 
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
		
		<script type="text/javascript">
		var teamName = "<%=((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getName()%>";
		var teamId = "<%=((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getId()%>";
		$(document).ready(function(){
			setStudentToIndexMainTitle();
			initStudentScoreInfoFlexiGrid();
			initStudentScoreFlexiGrid();
		});

		function setStudentToIndexMainTitle(){
			$("#studentToIndexMainTitle").text("您好, " + teamName + "欢迎您查看学生成绩");
		}

		function initStudentScoreFlexiGrid(){
			$("#studentScoreFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findStudentScoreInfoByTeamId",
				addparams : [{name : "teamId", value : teamId}],
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
						return "<a href='javascript:;' onclick='showStudentScoreInfoDiv(" + row.paperId + "," + row.userId +")'>" + row._paperName + "</a>";
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
				rp : 15,
				useRp : false,
				autoload : false,
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
						if(row.optionA != "" && row.optionB != "" && row.optionC != "" && row.optionD != "")
						{
							return row.topic + "<br/> <input type='radio' value='A' name='problem" + row.id + "'>" + row.optionA + "<br/>" + "<input type='radio' value='B' name='problem" + row.id + "'>" + row.optionB + "<br/>" + "<input type='radio' value='C' name='problem" + row.id + "'>" + row.optionC + "<br/>" + "<input type='radio' value='D' name='problem" + row.id + "'>" +row.optionD;
						}

						if(row.optionA != "" && row.optionB != "" && row.optionC == "" && row.optionD == ""){
							return row.topic + "<br/> <input type='radio' value='1' name='problem" + row.id + "'>" + row.optionA + "<br/>" + "<input type='radio' value='0' name='problem" + row.id + "'>" + row.optionB;
						}
						return row.topic + "<br/><textarea id='problem" + row.id + "' rows='3'> </textarea>";
					}
				},{
					display : "正确答案：",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.rightAnswer;
					}
				},{
					display : "学生答案：",
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
					display : "学生分数：",
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

		function showStudentScoreInfoDiv(paperId,userId){
			showCustomDiv(true,"studentScoreInfoDiv");

			$("#studentScoreInfoFlexiGrid").flexOptions({
				newp : 1,
				addparams : [{name : "paperId",value : paperId},{name : "userId",value : userId}]
			}).flexReload();
		}

		</script>
 	</body>

</html>
