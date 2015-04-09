<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
    	<%@include file="/WEB-INF/page/include/head.jsp"%>
   		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>应试者考试</title>
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
		div #problemsFlexigrid{
 			 font-size: 12;
		}

		div {
  			font-size: 12px;
		}
		</style>
    </head>
  
  <body style="overflow:scroll;">
    
  	<div style="width:100%;height:800px;">
		<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
			<thead class="tableC" cellpadding="0" cellspacing="0" style="width:100%">
				<tr>
					<th>
						<span id="startExamTimeDiv"></span>
					</th>
				</tr>
			</thead>
		</table>
		<table id="problemsFlexigrid"></table>
	</div>

  	<script type="text/javascript">
  	$(document).ready(function(){
  		window.setTimeout("refreshTime()",1000);
  		initProblemsFlexigrid();
  	});
  	var minute = 0;
  	var second = 0;
  	var paperId = "<%=request.getParameter("paperId")%>";
  	var userId = "<%=((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getId()%>";
  	var maxSize = 0;
  	function refreshTime(){
  		if(second < 59){
  			$("span#startExamTimeDiv").html("考试时间60min，已用时长" + minute + " : " + second);
  			second ++;
  		}else{
  			second = 0;
  		}
  		if(minute < 60){
  			$("span#startExamTimeDiv").html("考试时间60min，已用时长" + minute + " : " + second);
  			if(second == 59){
  				minute ++;
  			}
  		}

  		if(minute == 60 && second == 59){
  			alert("自动交卷！");
  			return;
  		}
		
		window.setTimeout("refreshTime()",1000);
    }

    function initProblemsFlexigrid(){
    	$("#problemsFlexigrid").flexigrid({
				url : "http://localhost:8080/test_online/student/student_findProblemsByPaperId",
				dataType : "json",
				addparams : [{name : "id" ,value : paperId}],
				rp : 15,
				useRp : false,
				colModel : [{
					display : "题目号：",
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
					display : "答案：",
					width : 200,
					align : "left",
					render : function(val, row) {

						if(row.optionA != "" && row.optionB != "" && row.optionC != "" && row.optionD != "")
						{
							return "<input type='radio' value='A' name='problem" + row.id + "'>" + row.optionA + "<br/>" + "<input type='radio' value='B' name='problem" + row.id + "'>" + row.optionB + "<br/>" + "<input type='radio' value='C' name='problem" + row.id + "'>" + row.optionC + "<br/>" + "<input type='radio' value='D' name='problem" + row.id + "'>" +row.optionD;
						}

						if(row.optionA != "" && row.optionB != "" && row.optionC == "" && row.optionD == ""){
							return "<input type='radio' value='1' name='problem" + row.id + "'>" + row.optionA + "<br/>" + "<input type='radio' value='0' name='problem" + row.id + "'>" + row.optionB;
						}
						return "<textarea id='problem" + row.id + "' rows='3'> </textarea>";
					}
				},{
					display : "操作",
					width : 100,
					align : "center",
					render : function(val, row) {
						maxSize = row.id;
						return "<input id=" + row.id + "button type='button' value='提交' class='inputB' onclick='problemSubmitButton(\"" + row.problemType + "\"," + row.problemId + "," + row.id + ")'>";
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

    var maxSizeInFunction = 0;
    function problemSubmitButton(problemType,problemId,id){
    	maxSizeInFunction ++;
    	$("#" + id + "button").attr("disabled",true);

    	var value;

    	if(problemType == "simple" || problemType == "blank"){
    		value = $("#problem" + id).val();
    	}else{
    		value = $("input[name='problem" + id + "']:checked").val()
    	}

    	$.ajax({
					url : path + "/student/student_addAnswerToTable",
					data : {
						userId : userId,
						paperId : paperId,
						problemType : problemType,
						problemId : problemId,
						answer : value
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
								alert("提交成功");
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});
    	if(maxSizeInFunction >= maxSize){
    		alert("恭喜您，点击“确定”结束考试！");
    		window.close("<%=path%>/page/student/startExam.jsp");
    	}

    }
  	</script>
  </body>
</html>
