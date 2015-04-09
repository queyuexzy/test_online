<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="/WEB-INF/page/include/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看应试者成绩</title>
<link rel="stylesheet" href="<%=path%>/style/css/style.css"
	type="text/css">
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery/jqueryHelper.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery/jquery.json-2.2.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/js/jqueryui/ui-tabs/ui.tabs.css" />
<script type="text/javascript"
	src="<%=path%>/js/jqueryui/ui-tabs/ui.tabs.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/js/jquery-flexigrid/css/gray/flexigrid.css" />
<script type="text/javascript"
	src="<%=path%>/js/jquery-flexigrid/flexigrid.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/mJs/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=path%>/js/jcrop/jquery.Jcrop.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/js/jcrop/jquery.Jcrop.css" />

<style type="text/css">
th,div {
	font-size: 12;
}

input[type="text"] {
	width: 45px;
}
</style>
</head>

<body style="overflow:hidden;"
	onload="nocontextmenu();norightclick(this);onKeyDown();">

	<div>
		<table class="tableC" cellspacing="0" cellpadding="0"
			style="width:100%;">
			<thead class="tableC" cellpadding="0" cellspacing="0"
				style="width:100%">
				<tr>
					<th><span id="studentToIndexMainTitle">您好，欢迎您过来阅卷</span></th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="studentScoreDiv" style="height:600px;">
		<table id="studentScoreFlexiGrid"></table>
	</div>
	<div id="studentScoreInfoDiv" class="divPopup">
		<table class="tableC" cellspacing="0" cellpadding="0"
			style="width:100%;">
			<thead class="tableC" cellpadding="0" cellspacing="0"
				style="width:100%">
				<tr>
					<th><span id="studentToIndexMainTitle">您好,欢迎您查看具体信息</span> <input
						type="button" class="inputB" value="关闭"
						onclick="showCustomDiv(false,'studentScoreInfoDiv');" /></th>
				</tr>
			</thead>
		</table>
		<table id="studentScoreInfoFlexiGrid"></table>
	</div>

	<script type="text/javascript">
		var teamName = "<%=((UserBean) session
					.getAttribute(GlobalConstants.CURRENT_USER)).getName()%>";
		var teamId = "<%=((UserBean) session
					.getAttribute(GlobalConstants.CURRENT_USER)).getId()%>";
		$(document).ready(function(){
			setStudentToIndexMainTitle();
			initStudentScoreInfoFlexiGrid();
			initStudentScoreFlexiGrid();
		});


		// document.onkeydown(function(){
		// 	if (event.keyCode==116){
		// 		event.keyCode = 0;
		// 		event.cancelBubble = true;
		// 		}
		// 	return false;
		// });
		// //禁止右键弹出菜单
		// document.oncontextmenu(function(){
		// 	return false;
		// }); 



		function setStudentToIndexMainTitle(){
			$("#studentToIndexMainTitle").text("您好, " + teamName + "欢迎您查看学生成绩");
		}

		/*
		 *find the rows in user_paper_relation which the score is null(because this is the rows which has not being went over)
		 */
		function initStudentScoreFlexiGrid(){
			$("#studentScoreFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findStudentScoreInfoByTeamIdNotWentOver",
				addparams : [{name : "teamId", value : teamId}],
				dataType : "json",
				rp : 15,
				useRp : false,
				colModel : [{
					display : "姓名",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row._userName;
					}
				},{
					display : "学号",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.userId;
					}
				},{
					display : "试卷名",
					width : 100,
					align : "center",
					render : function(val, row) {
						return "<a href='javascript:;' onclick='showStudentScoreInfoDiv(" + row.paperId + "," + row.userId + "," + row.id +")'>" + row._paperName + "</a>";
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

		/*
		 *the flexigrid in which the teacher will give point to the student
		 */
		/*the num to count how many rows in the flexigrid*/ 
		var maxId;
		function initStudentScoreInfoFlexiGrid(){
				$("#studentScoreInfoFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/student/student_findSimpleBlankByUserIdPaperId",
				dataType : "json",
				rp : 15,
				useRp : false,
				autoload : false,
				colModel : [{
					display : "序号：",
					width : 100,
					align : "center",
					render : function(val, row) {
						maxId = row.id;
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
						return "<input id='problemScore" + row.id + "'type='text' width='5'/>";
					}
				},{
					display : "操作：",
					width : 100,
					align : "center",
					render : function(val, row) {
						return "<input id='scoreSubmitButton" + row.id + "' type='button' class='inputB' value='提交' onclick='updateScoreByProblemIdProblemType(" + row.id + ",\"" + row.problemType + "\"," + row.problemId +")'/>";
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

		var globalUserPaperId;
		var globalUserId;
		function showStudentScoreInfoDiv(paperId,userId,id){
			showCustomDiv(true,"studentScoreInfoDiv");
			globalUserPaperId = id;
			globalUserId = userId;

			$("#studentScoreInfoFlexiGrid").flexOptions({
				newp : 1,
				addparams : [{name : "paperId",value : paperId},{name : "userId",value : userId}]
			}).flexReload();
		}

		/*used to count how many times the function was used to know if we need to update the scores in user_paper_relation*/
		var idInFunction = 0;
		function updateScoreByProblemIdProblemType(id,problemType,problemId){
			$("#scoreSubmitButton" + id).attr("disabled",true);
			idInFunction++;
			$.ajax({
				url : path + "/student/student_updateScoreInBlankSimple",
				data : {
					userId : globalUserId,
					problemType : problemType,
					problemId : problemId,
					score : $("#problemScore" + id).val()
				},
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

							if(idInFunction >= maxId){
								$.ajax({
									url : path + "/student/student_updateScoreInUserPaper",
									data : {
										id : globalUserPaperId
									},
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
						}
					}
				},
				error : function(){
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
				}
			});



		}

		  var oLastBtn=0,bIsMenu=false;
		  if(window.Event)
		  {
		  document.captureEvents(Event.MOUSEUP);
		  }
		   
		  function nocontextmenu()
		  {
		  event.cancelBubble=true;
		  event.returnValue=false;
		  return false;
		  }

		  function norightclick(e)
		  {
		  if(window.Event)
		  {
		  if(e.which!=1)
		  {
		  return false;  
		  }
		  }
		  else if(event.button!=1)   
		  {
		  event.cancelBubble=true;
		  event.returnValue=false;
		  return false;
		  }
		  }
		 
		  document.oncontextmenu=nocontextmenu;
		  document.onmousedown=norightclick;
		 
		  function  onKeyDown()
		  {
		  if((event.altKey)||((event.keyCode==8)&&(event.srcElement.type!="text"&&event.srcElement.type!="textarea"&&event.srcElement.type!="password"))||((event.ctrlKey)&&((event.keyCode==78)||(event.keyCode==82)))||(event.keyCode==116))
		  {
		   event.keyCode=0;
		   event.returnValue=false;
		  }
		  
		  if(event.ctrlKey){  
	          event.returnValue=false;  
	      }  
	      if(window.event.keyCode==116||window.event.keyCode==117){  
	  		window.event.keyCode=0;
	 		window.event.returnValue=false; //禁止F5
	 	  }
		  }
		 
		   // document.onkeydown(function(){
			  //  if(event.ctrlKey){  
			  //         event.returnValue=false;  
			  //     }  
			  //     if(window.event.keyCode==116||window.event.keyCode==117){  
			  // 		window.event.keyCode=0;
			 	// 	window.event.returnValue=false; //禁止F5
			 	//   }
		   // });
		</script>
</body>

</html>
