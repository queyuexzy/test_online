<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
    	<%@include file="/WEB-INF/page/include/head.jsp"%>
   		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>应试者练习</title>
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
						<span id="studentTestMainTitle">您好，欢迎您参加在线练习</span>
					</th>
				</tr>
			</thead>
		</table>
		<!-- init the team info ,click the _sumBank will appear the Bankinfo -->
		<table id="userInfoFlexiGrid"></table>
  	</div>

	<div id="bankDiv" class="divPopup" style="width:600px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th>
							题库信息
							<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'bankDiv');">

						</th>
					</tr>
				</thead>
			</table>
			<table id="bankDivFlexiGrid"></table>
	</div>
  	<script type="text/javascript">
  	
  	var teamId = "<%=((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getId()%>";

  	$(document).ready(function(){
  		initUserInfoFlexiGrid();
  		initBankDivFlexiGrid();
  	});
  	
  	function showBanksDiv(teamId){
		showCustomDiv(true,"bankDiv");
		$("#bankDivFlexiGrid").flexOptions({
			newp : 1,
			addparams : [{name : "teamId",value : teamId}]
		}).flexReload();
	}

  	function initUserInfoFlexiGrid(){
		$("#userInfoFlexiGrid").flexigrid({
		url : "http://localhost:8080/test_online/student/student_findUserByTeamStatus",
		dataType : "json",
		addparams : [{name : "teamStatus",value : 1}],
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
				return row.name;
			}
		},{
			display : "公司题库数",
			width : 100,
			align : "center",
			render : function(val, row) {
				return "<a href='javascript:;' onclick='showBanksDiv(\"" + row.id + "\")'>" + row._sumBanks + "</a>";
			}
		},{
			display : "公司地址",
			width : 150,
			align : "center",
			render : function(val, row) {
				return row.address;
			}
		},{
			display : "公司电话",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.tel;
			}
		},{
			display : "公司邮箱",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.email;
			}
		},{
			display : "备注",
			width : 150,
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
		}
		});
	}
  	
  	function initBankDivFlexiGrid(){
		$("#bankDivFlexiGrid").flexigrid({
		url : "http://localhost:8080/test_online/teacher/teacher_findBanksByTeamId",
		dataType : "json",
		rp : 15,
		useRp : false,
		colModel : [{
			display : "题库名称",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.name;
			}
		},{
			display : "创建时间",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.createTime;
			}
		},{
			display : "上次更新时间",
			width : 100,
			align : "center",
			render : function(val, row) {
				return row.updateTime;
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

				return "<input type='button' class='inputB' value='开始测试' onclick='window.open(\"<%=path%>/page/student/startTest.jsp?bankId=" + row.id + "\")'/>";

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
