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
						<span id="studentToIndexMainTitle">您好，欢迎您参加考试</span>
					</th>
				</tr>
			</thead>
		</table>
		<table id="paperInfoFlexiGrid"></table>
  	</div>


  	<script type="text/javascript">
  	
  	var userId = "<%=((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getId()%>";

  	$(document).ready(function(){
  		initPaperInfoFlexiGrid();
  	});

  	function initPaperInfoFlexiGrid(){
		$("#paperInfoFlexiGrid").flexigrid({
		url : "http://localhost:8080/test_online/student/student_findPaperInfo",
		dataType : "json",
		addparams : [{name : "userId",value : userId}],
		rp : 15,
		useRp : false,
		colModel : [{
			display : "试卷号：",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.id;
			}
		},{
			display : "试卷名：",
			width : 200,
			align : "center",
			render : function(val, row) {
				return row.name;
			}
		},{
			display : "公司号：",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.teamId;
			}
		},{
			display : "公司名：",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row._teamName;
			}
		},{
			display : "备注：",
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
				return "点击合适的考卷进行考试<br/>" + "<input type='button' class='inputB' value='开始考试' onclick='window.open(\"<%=path%>/page/student/startExam.jsp?paperId=" + row.id + "\")'>";
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



  	</script>
  </body>
</html>
