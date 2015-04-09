<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import = "com.test_online.global.GlobalConstants" %>
<%@page import = "com.test_online.util.AjaxResponse" %>
<%@page import = "com.test_online.module.UserBean"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
    	<%@include file="/WEB-INF/page/include/head.jsp"%>
   		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>教师登陆</title>
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
		#blankTab div {
  			font-size: 13px;
		}

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
							<span id="teacherMainTitle">您好</span>
							<input type="button" class="inputB" value="修改个人信息" onclick="showTeacherInfoEditDiv()"/>
							<input id="brandOrderProductAddButton" type="button" class="inputB" value="查看学生成绩" onclick="window.open('<%=path%>/page/teacher/studentScore.jsp')"/>
							<input id="brandOrderProductAddButton" type="button" class="inputB" value="阅卷" onclick="window.open('<%=path%>/page/teacher/overPaper.jsp')"/>
						</th>
					</tr>
				</thead>
			</table>
		</div>

		<div>
			<ul id="tabs">
				<li><a href="#chooseTab"><span>选择题目</span></a></li>
				<li><a href="#blankTab"><span>填空题目</span></a></li>
				<li><a href="#simpleTab"><span>简答题目</span></a></li>
				<li><a href="#judgeTab"><span>判断题目</span></a></li>
			</ul>

			<div id="chooseTab" style="height:400px;">
				<table class="tableC" style="width:100%;">
					<tr>
						<th colspan="100">
							<input type="button" class="inputB" value="增加题目" onclick="showChooseInfoEditDiv('add')"/>
						</th>
					</tr>

				</table>
				<table id="chooseTabFlexiGrid"></table>
			</div>

			<div id="blankTab" style="height:400px;">
				<table class="tableC" style="width:100%;">
					<tr>
						<th colspan="100">
							<input type="button" class="inputB" value="增加题目" onclick="showBlankInfoEditDiv('add')"/>
						</th>
					</tr>

				</table>
				<table id="blankTabFlexiGrid"></table>
			</div>

			<div id="simpleTab" style="height:400px;">
				<table class="tableC" style="width:100%;">
					<tr>
						<th colspan="100">
							<input type="button" class="inputB" value="增加题目" onclick="showSimpleInfoEditDiv('add')"/>
						</th>
					</tr>

				</table>
				<table id="simpleTabFlexiGrid"></table>
			</div>

			<div id="judgeTab" style="height:400px;">
				<table class="tableC" style="width:100%;">
					<tr>
						<th colspan="100">
							<input type="button" class="inputB" value="增加题目" onclick="showJudgeInfoEditDiv('add')"/>
						</th>
					</tr>

				</table>
				<table id="judgeTabFlexiGrid"></table>
			</div>
		</div>

		<div id="teacherInfoEditDiv" class="divPopup" style="width:400px;">
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
							<input id="teacherIdEditDiv" type="text" style="width:90%;" readonly="readonly"/>
						</th>
					</tr>
					<tr>
						<th>
							姓名：
						</th>
						<th>
							<input id="teacherNameEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							密码：
						</th>
						<th>
							<input id="teacherPasswordEditDiv" type="password" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							重复密码：
						</th>
						<th>
							<input id="teacherRepasswordEditDiv" type="password" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							年龄：
						</th>
						<th>
							<input id="teacherAgeEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							生日：
						</th>
						<th>
							<input id="teacherBirthdayEditDiv" type="text" onclick="WdatePicker()" readonly="readonly" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							地址：
						</th>
						<th>
							<input id="teacherAddressEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							电话：
						</th>
						<th>
							<input id="teacherTelEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							邮箱：
						</th>
						<th>
							<input id="teacherEmailEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							备注：
						</th>
						<th>
							<input id="teacherRemarkEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th colspan="100">
							<input id="editTeacherDivConfirmButton" type="button" class="inputB" value="确定" style="width:25%;"/>
							<input id="editTeacherDivCancelButton" type="button" class="inputB" value="取消" style="width:25%;"/>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="blankInfoEditDiv" class="divPopup" style="width:600px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th colspan="100"> <span id="blankInfoEditDivMainTitle"><span></th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<th>
							所属题库：
						</th>
						<th>
							<select id="blankBankNameEditDiv" style="width:90%;"></select>
						</th>
					</tr>
					<tr>
						<th>
							题目：
						</th>
						<th>
							<textarea id="blankTopicEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th>
							答案（多个填空请以“|”分开）：
						</th>
						<th>
							<textarea id="blankAnswerEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th>
							分数：
						</th>
						<th>
							<input id="blankScoreEditDiv" type="text" style="width:90%">
						</th>
					</tr>
					<tr>
						<th>
							备注：
						</th>
						<th>
							<textarea id="blankRemarkEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th colspan="100">
							<input id="editBlankDivConfirmButton" type="button" class="inputB" value="确定" style="width:25%;"/>
							<input id="editBlankDivCancelButton" type="button" class="inputB" value="取消" style="width:25%;"/>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="chooseInfoEditDiv" class="divPopup" style="width:600px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th colspan="100"> <span id="chooseInfoEditDivMainTitle"><span></th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<th>
							所属题库：
						</th>
						<th>
							<select id="chooseBankNameEditDiv" style="width:90%;"></select>
						</th>
					</tr>
					<tr>
						<th>
							题目：
						</th>
						<th>
							<textarea id="chooseTopicEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th>
							A选项：
						</th>
						<th>
							<textarea id="chooseOptionAEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th>
							B选项：
						</th>
						<th>
							<textarea id="chooseOptionBEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th>
							C选项：
						</th>
						<th>
							<textarea id="chooseOptionCEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th>
							D选项：
						</th>
						<th>
							<textarea id="chooseOptionDEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th>
							答案：
						</th>
						<th>
							A:<input name="chooseAnswerEditDiv" value="A" type="radio"/>
							B:<input name="chooseAnswerEditDiv" value="B" type="radio"/>
							C:<input name="chooseAnswerEditDiv" value="C" type="radio"/>
							D:<input name="chooseAnswerEditDiv" value="D" type="radio"/>
						</th>
					</tr>
					<tr>
						<th>
							分数：
						</th>
						<th>
							<input id="chooseScoreEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							备注：
						</th>
						<th>
							<textarea id="chooseRemarkEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th colspan="100">
							<input id="editChooseDivConfirmButton" type="button" class="inputB" value="确定" style="width:25%;"/>
							<input id="editChooseDivCancelButton" type="button" class="inputB" value="取消" style="width:25%;"/>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="simpleInfoEditDiv" class="divPopup" style="width:600px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th colspan="100"> <span id="simpleInfoEditDivMainTitle"><span></th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<th>
							所属题库：
						</th>
						<th>
							<select id="simpleBankNameEditDiv" style="width:90%;"></select>
						</th>
					</tr>
					<tr>
						<th>
							题目：
						</th>
						<th>
							<textarea id="simpleTopicEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th>
							答案：
						</th>
						<th>
							<textarea id="simpleAnswerEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th>
							分数：
						</th>
						<th>
							<input id="simpleScoreEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							备注：
						</th>
						<th>
							<textarea id="simpleRemarkEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th colspan="100">
							<input id="editSimpleDivConfirmButton" type="button" class="inputB" value="确定" style="width:25%;"/>
							<input id="editSimpleDivCancelButton" type="button" class="inputB" value="取消" style="width:25%;"/>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="judgeInfoEditDiv" class="divPopup" style="width:600px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th colspan="100"> <span id="judgeInfoEditDivMainTitle"><span></th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<th>
							所属题库：
						</th>
						<th>
							<select id="judgeBankNameEditDiv" style="width:90%;"></select>
						</th>
					</tr>
					<tr>
						<th>
							题目：
						</th>
						<th>
							<textarea id="judgeTopicEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th>
							答案：
						</th>
						<th>
							对：<input type="radio" name="judgeAnswerEditDiv" value="1">
							错：<input type="radio" name="judgeAnswerEditDiv" value="0">
						</th>
					</tr>
					<tr>
						<th>
							分数：
						</th>
						<th>
							<input id="judgeScoreEditDiv" type="text" style="width:90%;"/>
						</th>
					</tr>
					<tr>
						<th>
							备注：
						</th>
						<th>
							<textarea id="judgeRemarkEditDiv" rows="5" style="width:90%;">

							</textarea>
						</th>
					</tr>
					<tr>
						<th colspan="100">
							<input id="editJudgeDivConfirmButton" type="button" class="inputB" value="确定" style="width:25%;"/>
							<input id="editJudgeDivCancelButton" type="button" class="inputB" value="取消" style="width:25%;"/>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="updateChooseBankDiv" class="divPopup" style="width:600px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th>
							题库信息
							<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'updateChooseBankDiv');$('#chooseBankDivFlexiGrid').flexReload();">

						</th>
					</tr>
				</thead>
			</table>
			<table id="chooseBankDivFlexiGrid"></table>
		</div>

		<div id="updateBlankBankDiv" class="divPopup" style="width:600px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th>
							题库信息
							<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'updateBlankBankDiv');$('#blankTabFlexiGrid').flexReload();">

						</th>
					</tr>
				</thead>
			</table>
			<table id="blankBankDivFlexiGrid"></table>
		</div>

		<div id="updateSimpleBankDiv" class="divPopup" style="width:600px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th>
							题库信息
							<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'updateSimpleBankDiv');$('#simpleTabFlexiGrid').flexReload();">

						</th>
					</tr>
				</thead>
			</table>
			<table id="simpleBankDivFlexiGrid"></table>
		</div>

		<div id="updateJudgeBankDiv" class="divPopup" style="width:600px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th>
							题库信息
							<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'updateJudgeBankDiv');$('#judgeTabFlexiGrid').flexReload();">

						</th>
					</tr>
				</thead>
			</table>
			<table id="judgeBankDivFlexiGrid"></table>
		</div>

		<div id="updateChoosePaperDiv" class="divPopup" style="width:700px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th>
							试卷信息
							<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'updateChoosePaperDiv');$('#chooseTabFlexiGrid').flexReload();">

						</th>
					</tr>
				</thead>
			</table>
			<table id="choosePaperDivFlexiGrid"></table>
		</div>

		<div id="updateBlankPaperDiv" class="divPopup" style="width:700px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th>
							试卷信息
							<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'updateBlankPaperDiv');$('#blankTabFlexiGrid').flexReload();">

						</th>
					</tr>
				</thead>
			</table>
			<table id="blankPaperDivFlexiGrid"></table>
		</div>

		<div id="updateSimplePaperDiv" class="divPopup" style="width:700px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th>
							试卷信息
							<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'updateSimplePaperDiv');$('#simpleTabFlexiGrid').flexReload();">

						</th>
					</tr>
				</thead>
			</table>
			<table id="simplePaperDivFlexiGrid"></table>
		</div>

		<div id="updateJudgePaperDiv" class="divPopup" style="width:700px;">
			<table class="tableC" style="width:100%;">
				<thead>
					<tr>
						<th>
							试卷信息
							<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'updateJudgePaperDiv');$('#judgeTabFlexiGrid').flexReload();">

						</th>
					</tr>
				</thead>
			</table>
			<table id="judgePaperDivFlexiGrid"></table>
		</div>
		<script type="text/javascript">

			var teamId = "<%=((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getId()%>";
			var teacherName = "<%= ((UserBean)session.getAttribute(GlobalConstants.CURRENT_USER)).getName()%>";
		

			$(document).ready(function(){
				$("#tabs").tabs(1, {
					fxSlide : true,
					fxFade : true,
					fxSpeed : 'normal'
				});
				
				initBlankTabFlexiGrid();
				initChooseTabFlexiGrid();
				initChooseBankDivFlexiGrid();
				initBlankBankDivFlexiGrid();
				initChoosePaperDivFlexiGrid();
				initBlankPaperDivFlexiGrid();
				initSimpleTabFlexiGrid();
				initSimpleBankDivFlexiGrid();
				initSimplePaperDivFlexiGrid();
				initJudgeTabFlexiGrid();
				initJudgeBankDivFlexiGrid();
				initJudgePaperDivFlexiGrid();
				setTeacherMainTitle();
			});

			function setTeacherMainTitle(){
				$("#teacherMainTitle").text(teacherName + "老师，您好");
			}

			function initBlankTabFlexiGrid(){
				$("#blankTabFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findBlanksByTeamId",
				addparams : [{name : "teamId", value : teamId}],
				dataType : "json",
				rp : 15,
				useRp : false,
				colModel : [{
					display : "填空题目序号",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.id;
					}
				},{
					display : "题库名称",
					width : 100,
					align : "center",
					render : function(val, row) {
						return "<a href='javascript:;' onclick='showUpdateBlankBankDiv(" + row.id + "," + row.bankId + ")'>" + row._bankName + "</a>";
					}
				},{
					display : "试卷名称",
					width : 100,
					align : "center",
					render : function(val, row) {
						if(row.paperId == null){
							return "<a href='javascript:;' onclick='showUpdateBlankPaperDiv(" + row.id + "," + row.paperId + ")'>未选择试卷</a>"
						}
						return "<a href='javascript:;' onclick='showUpdateBlankPaperDiv(" + row.id + "," + row.paperId + ")'> " + row._paperName + " </a>";
					}
				},{
					display : "题目",
					width : 300,
					align : "center",
					render : function(val, row) {
						return row.topic;
					}
				},{
					display : "标准答案",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.answer;
					}
				},{
					display : "分数",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.score;
					}
				},{
					display : "是否使用",
					width : 100,
					align : "center",
					render : function(val, row) {
						if((row.useStatus == false ) && row.paperId != null){
							return "使用后有修改<br/>" + "<a href='javascript:;' onclick='reuseProblem(\"blank\"," + row.id + ")'>重新使用</a>";
						}
						return row.useStatus;
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
					width : 200,
					align : "center",
					render : function(val, row) {
						var deleteButton = "<input type='button' class='inputB' value='删除' onclick='deleteBlank(" + row.id + ")'/>";
						var modifyButton = "<input type='button' class='inputB' value='修改' onclick='showBlankInfoEditDiv(\"edit\"," + row.id + ")'/>";

						return deleteButton + modifyButton;

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

			function initSimpleTabFlexiGrid(){
				$("#simpleTabFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findSimplesByTeamId",
				addparams : [{name : "teamId", value : teamId}],
				dataType : "json",
				rp : 15,
				useRp : false,
				colModel : [{
					display : "简答题目序号",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.id;
					}
				},{
					display : "题库名称",
					width : 100,
					align : "center",
					render : function(val, row) {
						return "<a href='javascript:;' onclick='showUpdateSimpleBankDiv(" + row.id + "," + row.bankId + ")'>" + row._bankName + "</a>";
					}
				},{
					display : "试卷名称",
					width : 100,
					align : "center",
					render : function(val, row) {
						if(row.paperId == null){
							return "<a href='javascript:;' onclick='showUpdateSimplePaperDiv(" + row.id + "," + row.paperId + ")'>未选择试卷</a>"
						}
						return "<a href='javascript:;' onclick='showUpdateSimplePaperDiv(" + row.id + "," + row.paperId + ")'> " + row._paperName + " </a>";
					}
				},{
					display : "题目",
					width : 300,
					align : "center",
					render : function(val, row) {
						return row.topic;
					}
				},{
					display : "标准答案",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.answer;
					}
				},{
					display : "分数",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.score;
					}
				},{
					display : "是否使用",
					width : 100,
					align : "center",
					render : function(val, row) {
						if((row.useStatus == false ) && row.paperId != null){
							return "使用后有修改<br/>" + "<a href='javascript:;' onclick='reuseProblem(\"simple\"," + row.id + ")'>重新使用</a>";
						}
						return row.useStatus;
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
					width : 200,
					align : "center",
					render : function(val, row) {
						var deleteButton = "<input type='button' class='inputB' value='删除' onclick='deleteSimple(" + row.id + ")'/>";
						var modifyButton = "<input type='button' class='inputB' value='修改' onclick='showSimpleInfoEditDiv(\"edit\"," + row.id + ")'/>";

						return deleteButton + modifyButton;

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

			function initJudgeTabFlexiGrid(){
				$("#judgeTabFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findJudgesByTeamId",
				addparams : [{name : "teamId", value : teamId}],
				dataType : "json",
				rp : 15,
				useRp : false,
				colModel : [{
					display : "判断题目序号",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.id;
					}
				},{
					display : "题库名称",
					width : 100,
					align : "center",
					render : function(val, row) {
						return "<a href='javascript:;' onclick='showUpdateJudgeBankDiv(" + row.id + "," + row.bankId + ")'>" + row._bankName + "</a>";
					}
				},{
					display : "试卷名称",
					width : 100,
					align : "center",
					render : function(val, row) {
						if(row.paperId == null){
							return "<a href='javascript:;' onclick='showUpdateJudgePaperDiv(" + row.id + "," + row.paperId + ")'>未选择试卷</a>"
						}
						return "<a href='javascript:;' onclick='showUpdateJudgePaperDiv(" + row.id + "," + row.paperId + ")'> " + row._paperName + " </a>";
					}
				},{
					display : "题目",
					width : 300,
					align : "center",
					render : function(val, row) {
						return row.topic;
					}
				},{
					display : "标准答案",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.answer;
					}
				},{
					display : "分数",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.score;
					}
				},{
					display : "是否使用",
					width : 100,
					align : "center",
					render : function(val, row) {
						if((row.useStatus == false ) && row.paperId != null){
							return "使用后有修改<br/>" + "<a href='javascript:;' onclick='reuseProblem(\"judge\"," + row.id + ")'>重新使用</a>";
						}
						return row.useStatus;
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
					width : 200,
					align : "center",
					render : function(val, row) {
						var deleteButton = "<input type='button' class='inputB' value='删除' onclick='deleteJudge(" + row.id + ")'/>";
						var modifyButton = "<input type='button' class='inputB' value='修改' onclick='showJudgeInfoEditDiv(\"edit\"," + row.id + ")'/>";

						return deleteButton + modifyButton;

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

			function showTeacherInfoEditDiv(){
				showCustomDiv(true,"teacherInfoEditDiv");


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


				$("#teacherIdEditDiv").val(id);
				$("#teacherNameEditDiv").val(name);
				$("#teacherPasswordEditDiv").val(password);
				$("#teacherRepasswordEditDiv").val(repassword);
				$("#teacherAgeEditDiv").val(age);
				$("#teacherBirthdayEditDiv").val(birthday);
				$("#teacherAddressEditDiv").val(address);
				$("#teacherTelEditDiv").val(tel);
				$("#teacherEmailEditDiv").val(email);
				$("#teacherRemarkEditDiv").val(remark);


				$("#editTeacherDivConfirmButton").unbind();
				$("#editTeacherDivConfirmButton").click(function(){
					editTeacher(user);
				});

				$("#editTeacherDivCancelButton").unbind();
				$("#editTeacherDivCancelButton").click(function(){
					showCustomDiv(false,"teacherInfoEditDiv",1);
				});
			}

			function editTeacher(user){

				var id = $("#teacherIdEditDiv").val();
				var name = $("#teacherNameEditDiv").val();
				var password = $("#teacherPasswordEditDiv").val();
				var repassword = $("#teacherRepasswordEditDiv").val();
				var age = $("#teacherAgeEditDiv").val();
				var birthday = $("#teacherBirthdayEditDiv").val();
				var address = $("#teacherAddressEditDiv").val();
				var tel = $("#teacherTelEditDiv").val();
				var email = $("#teacherEmailEditDiv").val();
				var remark = $("#teacherRemarkEditDiv").val();

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
					showCustomDiv(false,"teacherInfoEditDiv");
					return;
				}


				$.ajax({
					url : path + "/teacher/teacher_updateTeacherInSession",
					data : data,
					type : "post",
					dataType : "json",
					beforeSend : function(){
						showCustomDiv(false,"teacherInfoEditDiv",1);
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

			function showBlankInfoEditDiv(mode,id){

				$.ajax({
					url : path + "/teacher/teacher_getBanksByTeamId",
					data : {
						teamId : teamId
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
								showCustomDiv(true,"blankInfoEditDiv");
								if(mode == 'add'){
									$("#blankInfoEditDivMainTitle").text("增加填空题目");
								}else{
									$("#blankInfoEditDivMainTitle").text("修改填空题目");
								}
								
								var select = $("#blankBankNameEditDiv");
								$("#blankBankNameEditDiv option").remove();
								var banks = data.data;

								for(var i = 0; i < banks.length; i++){
									select.append($("<option></option>").attr("value",banks[i].id).text(banks[i].name));
								}
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});

				if(mode == 'add'){

					$("#blankTopicEditDiv").val("");
					$("#blankAnswerEditDiv").val("");
					$("#blankRemarkEditDiv").val("");
					$("#blankScoreEditDiv").val("");
					$("#editBlankDivConfirmButton").unbind();
					$("#editBlankDivConfirmButton").click(function(){
						addBlank();
					});
					
				}else{

					$.ajax({
					url : path + "/teacher/teacher_getBlankById",
					data : {
						id : id
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
								var blank = data.data;

								$("#blankBankNameEditDiv").val(blank.bankId);
								$("#blankTopicEditDiv").val(blank.topic);
								$("#blankAnswerEditDiv").val(blank.answer);
								$("#blankRemarkEditDiv").val(blank.remark);

								$("#editBlankDivConfirmButton").unbind();
								$("#editBlankDivConfirmButton").click(function(){
									editBlank(blank);
								});

								showWaitDiv(false);
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
					});

					
				}

				$("#editBlankDivCancelButton").unbind();
				$("#editBlankDivCancelButton").click(function(){
					showCustomDiv(false,"blankInfoEditDiv");
					$("#blankTabFlexiGrid").flexReload();
				});
			}

			function showSimpleInfoEditDiv(mode,id){
				$.ajax({
					url : path + "/teacher/teacher_getBanksByTeamId",
					data : {
						teamId : teamId
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
								showCustomDiv(true,"simpleInfoEditDiv");
								if(mode == 'add'){
									$("#simpleInfoEditDivMainTitle").text("增加简答题目");
								}else{
									$("#simpleInfoEditDivMainTitle").text("修改简答题目");
								}
								
								var select = $("#simpleBankNameEditDiv");
								$("#simpleBankNameEditDiv option").remove();
								var banks = data.data;

								for(var i = 0; i < banks.length; i++){
									select.append($("<option></option>").attr("value",banks[i].id).text(banks[i].name));
								}
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});

				if(mode == 'add'){
					$("#simpleTopicEditDiv").val("");
					$("#simpleAnswerEditDiv").val("");
					$("#simpleRemarkEditDiv").val("");
					$("#simpleScoreEditDiv").val("");
					$("#editSimpleDivConfirmButton").unbind();
					$("#editSimpleDivConfirmButton").click(function(){
						addSimple();
					});
					
				}else{

					$.ajax({
					url : path + "/teacher/teacher_getSimpleById",
					data : {
						id : id
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
								var simple = data.data;

								$("#simpleBankNameEditDiv").val(simple.bankId);
								$("#simpleTopicEditDiv").val(simple.topic);
								$("#simpleAnswerEditDiv").val(simple.answer);
								$("#simpleRemarkEditDiv").val(simple.remark);
								$("#simpleScoreEditDiv").val(simple.score);

								$("#editSimpleDivConfirmButton").unbind();
								$("#editSimpleDivConfirmButton").click(function(){
									editSimple(simple);
								});

								showWaitDiv(false);
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
					});

					
				}

				$("#editSimpleDivCancelButton").unbind();
				$("#editSimpleDivCancelButton").click(function(){
					showCustomDiv(false,"simpleInfoEditDiv");
					$("#simpleTabFlexiGrid").flexReload();
				});
			}

			function showJudgeInfoEditDiv(mode,id){
				$.ajax({
					url : path + "/teacher/teacher_getBanksByTeamId",
					data : {
						teamId : teamId
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
								showCustomDiv(true,"judgeInfoEditDiv");
								if(mode == 'add'){
									$("#judgeInfoEditDivMainTitle").text("增加判断题目");
								}else{
									$("#judgeInfoEditDivMainTitle").text("修改判断题目");
								}
								
								var select = $("#judgeBankNameEditDiv");
								$("#judgeBankNameEditDiv option").remove();
								var judges = data.data;

								for(var i = 0; i < judges.length; i++){
									select.append($("<option></option>").attr("value",judges[i].id).text(judges[i].name));
								}
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});

				if(mode == 'add'){
					$("#judgeTopicEditDiv").val("");
					$("#judgeAnswerEditDiv").val("");
					$("#judgeRemarkEditDiv").val("");
					$("#judgeScoreEditDiv").val("");
					$("#editJudgeDivConfirmButton").unbind();
					$("#editJudgeDivConfirmButton").click(function(){
						addJudge();
					});
					
				}else{

					$.ajax({
					url : path + "/teacher/teacher_getJudgeById",
					data : {
						id : id
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
								var judge = data.data;

								$("#judgeBankNameEditDiv").val(judge.bankId);
								$("#judgeTopicEditDiv").val(judge.topic);

								if(judge.answer == true)
								{
									judge.answer = 1;
								}
								if(judge.answer == false){
									judge.answer = 0;
								}
								$("input[name='judgeAnswerEditDiv'][value="+ judge.answer +"]").attr("checked",true);
								$("#judgeRemarkEditDiv").val(judge.remark);
								$("#judgeScoreEditDiv").val(judge.score);

								$("#editJudgeDivConfirmButton").unbind();
								$("#editJudgeDivConfirmButton").click(function(){
									editJudge(judge);
								});

								showWaitDiv(false);
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
					});

					
				}

				$("#editJudgeDivCancelButton").unbind();
				$("#editJudgeDivCancelButton").click(function(){
					showCustomDiv(false,"judgeInfoEditDiv");
					$("#judgeTabFlexiGrid").flexReload();
				});
			}

			function addBlank(){
					var bankId = $("#blankBankNameEditDiv").val();
					var topic = $("#blankTopicEditDiv").val();
					var answer = $("#blankAnswerEditDiv").val();
					var remark = $("#blankRemarkEditDiv").val();
					var score = $("#blankScoreEditDiv").val();

					var param = {teamId : teamId};

					
					if(bankId == null || bankId == ""){
						alert("所属题库不能为空！");
						return;
					}

					if(topic == null || topic ==""){
						alert("题目不能为空！");
						return;
					}

					if(answer == null || answer == ""){
						alert("答案不能为空！");
						return;
					}

					if(score == null || score == ""){
						alert("得分不能为空！");
						return;
					}
					if(isNaN(score)){
					alert("请输入数字！");
					return;
					}
					if(parseInt(score) < 0){
						alert("您输入的分数不合法！");
						return;
					}

					param.bankId = bankId;
					param.topic = topic;
					param.answer = answer;
					param.remark = remark;
					param.score = score;



					$.ajax({
					url : path + "/teacher/teacher_addBlank",
					data : param,
					type : "post",
					dataType : "json",
					beforeSend : function(){
						showCustomDiv(false,"blankInfoEditDiv",1);
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
								$("#blankTabFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});
			}

			function addSimple(){
					var bankId = $("#simpleBankNameEditDiv").val();
					var topic = $("#simpleTopicEditDiv").val();
					var answer = $("#simpleAnswerEditDiv").val();
					var remark = $("#simpleRemarkEditDiv").val();
					var score = $("#simpleScoreEditDiv").val();

					var param = {teamId : teamId};

					
					if(bankId == null || bankId == ""){
						alert("所属题库不能为空！");
						return;
					}

					if(topic == null || topic ==""){
						alert("题目不能为空！");
						return;
					}

					if(answer == null || answer == ""){
						alert("答案不能为空！");
						return;
					}

					if(score == null || score == ""){
						alert("得分不能为空！");
						return;
					}

					if(isNaN(score)){
					alert("请输入数字！");
					return;
					}
					if(parseInt(score) < 0){
						alert("您输入的分数不合法！");
						return;
					}

					param.bankId = bankId;
					param.topic = topic;
					param.answer = answer;
					param.remark = remark;
					param.score = score;



					$.ajax({
					url : path + "/teacher/teacher_addSimple",
					data : param,
					type : "post",
					dataType : "json",
					beforeSend : function(){
						showCustomDiv(false,"simpleInfoEditDiv",1);
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
								$("#simpleTabFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});
			}

			function addJudge(){
					var bankId = $("#judgeBankNameEditDiv").val();
					var topic = $("#judgeTopicEditDiv").val();
					var answer = $("input[name='judgeAnswerEditDiv']:checked").val();
					var remark = $("#judgeRemarkEditDiv").val();
					var score = $("#judgeScoreEditDiv").val();

					var param = {teamId : teamId};

					
					if(bankId == null || bankId == ""){
						alert("所属题库不能为空！");
						return;
					}

					if(topic == null || topic ==""){
						alert("题目不能为空！");
						return;
					}

					if(answer == null || answer == ""){
						alert("答案不能为空！");
						return;
					}

					if(score == null || score == ""){
						alert("分数不能为空！");
						return;
					}

					if(isNaN(score)){
					alert("请输入数字！");
					return;
					}
					if(parseInt(score) < 0){
						alert("您输入的分数不合法！");
						return;
					}

					param.bankId = bankId;
					param.topic = topic;
					param.answer = answer;
					param.remark = remark;
					param.score = score;



					$.ajax({
					url : path + "/teacher/teacher_addJudge",
					data : param,
					type : "post",
					dataType : "json",
					beforeSend : function(){
						showCustomDiv(false,"judgeInfoEditDiv",1);
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
								$("#judgeTabFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});
			}
			function editBlank(blank){
				var bankId = $("#blankBankNameEditDiv").val();
				var topic = $("#blankTopicEditDiv").val();
				var answer = $("#blankAnswerEditDiv").val();
				var remark = $("#blankRemarkEditDiv").val();
				var score = $("#blankScoreEditDiv").val();

				if(bankId == null || bankId == ""){
					alert("题库不能为空！");
					return;
				}

				if(topic == null || topic == ""){
					alert("题目不能为空！");
					return;
				}

				if(answer == null || answer == ""){
					alert("答案不能为空！");
					return;
				}

				if(score == null || score == ""){
					alert("分数不能为空！");
					return;
				}

				if(isNaN(score)){
					alert("请输入数字！");
					return;
				}
				if(parseInt(score) < 0){
					alert("您输入的分数不合法！");
					return;
				}

				var param = {id : blank.id};

				var changed = false;

				param.bankId = bankId;
				if(bankId != blank.bankId){
					changed = true;
				}
				param.topic = topic;
				if(topic != blank.topic){
					changed = true;
				}

				param.answer = answer;
				if(answer != blank.answer){
					changed = true;
				}

				param.score = score;
				if(score != blank.score){
					changed = true;
				}

				if(remark == null || remark == ""){
					if(blank.remark != null || blank.remark != ""){
						changed = true;
					}
				}else{
					param.remark = remark;
					if(remark != param.remark){
						changed = true;
					}
				}

				$.ajax({
					url : path + "/teacher/teacher_updateBank",
					data : param,
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
								showCustomDiv(false,"blankInfoEditDiv");
								$("#blankTabFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
					});
			}

			function editSimple(simple){
				var bankId = $("#simpleBankNameEditDiv").val();
				var topic = $("#simpleTopicEditDiv").val();
				var answer = $("#simpleAnswerEditDiv").val();
				var remark = $("#simpleRemarkEditDiv").val();
				var score = $("#simpleScoreEditDiv").val();

				if(bankId == null || bankId == ""){
					alert("题库不能为空！");
					return;
				}

				if(topic == null || topic == ""){
					alert("题目不能为空！");
					return;
				}

				if(answer == null || answer == ""){
					alert("答案不能为空！");
					return;
				}

				if(score == null || score == ""){
					alert("分数不能为空！");
					return;
				}

				if(isNaN(score)){
					alert("请输入数字！");
					return;
				}
				if(parseInt(score) < 0){
					alert("您输入的分数不合法！");
					return;
				}


				var param = {id : simple.id};

				var changed = false;

				param.bankId = bankId;
				if(bankId != simple.bankId){
					changed = true;
				}
				param.topic = topic;
				if(topic != simple.topic){
					changed = true;
				}

				param.answer = answer;
				if(answer != simple.answer){
					changed = true;
				}

				param.score = score;
				if(score != simple.score){
					changed = true;
				}

				if(remark == null || remark == ""){
					if(simple.remark != null || simple.remark != ""){
						changed = true;
					}
				}else{
					param.remark = remark;
					if(remark != param.remark){
						changed = true;
					}
				}

				$.ajax({
					url : path + "/teacher/teacher_updateSimple",
					data : param,
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
								showCustomDiv(false,"simpleInfoEditDiv");
								$("#simpleTabFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
					});
			}

			function editJudge(judge){
				var bankId = $("#judgeBankNameEditDiv").val();
				var topic = $("#judgeTopicEditDiv").val();
				var answer = $("input[name='judgeAnswerEditDiv']:checked").val();
				var remark = $("#judgeRemarkEditDiv").val();
				var score = $("#judgeScoreEditDiv").val();

				if(bankId == null || bankId == ""){
					alert("题库不能为空！");
					return;
				}

				if(topic == null || topic == ""){
					alert("题目不能为空！");
					return;
				}

				if(answer == null || answer == ""){
					alert("答案不能为空！");
					return;
				}

				if(score == null || score == ""){
					alert("分数不能为空！");
					return;
				}

				if(isNaN(score)){
					alert("请输入数字！");
					return;
				}
				if(parseInt(score) < 0){
					alert("您输入的分数不合法！");
					return;
				}

				var param = {id : judge.id};

				var changed = false;

				param.bankId = bankId;
				if(bankId != judge.bankId){
					changed = true;
				}
				param.topic = topic;
				if(topic != judge.topic){
					changed = true;
				}

				param.answer = answer;
				if(answer != judge.answer){
					changed = true;
				}

				param.score = score;
				if(score != judge.score){
					changed = true;
				}

				if(remark == null || remark == ""){
					if(judge.remark != null || judge.remark != ""){
						changed = true;
					}
				}else{
					param.remark = remark;
					if(remark != param.remark){
						changed = true;
					}
				}

				$.ajax({
					url : path + "/teacher/teacher_updateJudge",
					data : param,
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
								showCustomDiv(false,"judgeInfoEditDiv");
								$("#judgeTabFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
					});
			}
			function deleteBlank(id){
				if(!confirm("您确定要删除吗？")){
					return;
				}
				$.ajax({
					url : path + "/teacher/teacher_deleteBlank",
					data : {
						id : id
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
								$("#blankTabFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});
			}

			function deleteSimple(id){
				if(!confirm("您确定要删除吗？")){
					return;
				}
				$.ajax({
					url : path + "/teacher/teacher_deleteSimple",
					data : {
						id : id
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
								$("#simpleTabFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});
			}

			function deleteJudge(id){
				if(!confirm("您确定要删除吗？")){
					return;
				}
				$.ajax({
					url : path + "/teacher/teacher_deleteJudge",
					data : {
						id : id
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
								$("#judgeTabFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});
			}

			function initChooseTabFlexiGrid(){
				$("#chooseTabFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findChoosesByTeamId",
				addparams : [{name : "teamId", value : teamId}],
				dataType : "json",
				rp : 15,
				useRp : false,
				colModel : [{
					display : "选择题目序号",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.id;
					}
				},{
					display : "题库名称",
					width : 100,
					align : "center",
					render : function(val, row) {
						return "<a href='javascript:;' onclick='showUpdateChooseBankDiv(" + row.id + "," + row.bankId + ")'>" + row._bankName + "</a>";
					}
				},{
					display : "试卷名称",
					width : 100,
					align : "center",
					render : function(val, row) {
						if(row.paperId == null){
							return "<a href='javascript:;' onclick='showUpdateChoosePaperDiv(" + row.id + "," + row.paperId + ")'>未选择试卷</a>"
						}
						return "<a href='javascript:;' onclick='showUpdateChoosePaperDiv(" + row.id + "," + row.paperId + ")'> " + row._paperName + " </a>";
					}
				},{
					display : "题目",
					width : 300,
					align : "left",
					render : function(val, row) {
						return "题目：" + row.topic + "<br/> A:" + row.optionA + "<br/> B:" + 
						row.optionB + "<br/> C:" + row.optionC + "<br/> D:" + row.optionD;
					}
				},{
					display : "标准答案",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.answer;
					}
				},{
					display : "分数",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.score;
					}
				},{
					display : "是否使用",
					width : 100,
					align : "center",
					render : function(val, row) {
						if((row.useStatus == false ) && row.paperId != null){
							return "使用后有修改<br/>" + "<a href='javascript:;' onclick='reuseProblem(\"choose\"," + row.id + ")'>重新使用</a>";
						}
						return row.useStatus;
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
					width : 200,
					align : "center",
					render : function(val, row) {
						var deleteButton = "<input type='button' class='inputB' value='删除' onclick='deleteChoose(" + row.id + ")'/>";
						var modifyButton = "<input type='button' class='inputB' value='修改' onclick='showChooseInfoEditDiv(\"edit\"," + row.id + ")'/>";
						return deleteButton + modifyButton;

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

			function showChooseInfoEditDiv(mode,id){

				$.ajax({
					url : path + "/teacher/teacher_getBanksByTeamId",
					data : {
						teamId : teamId
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
								showCustomDiv(true,"chooseInfoEditDiv");
								if(mode == 'add'){
									$("#chooseInfoEditDivMainTitle").text("增加选择题目");
								}else{
									$("#chooseInfoEditDivMainTitle").text("修改选择题目");
								}
								
								var select = $("#chooseBankNameEditDiv");
								$("#chooseBankNameEditDiv option").remove();
								var banks = data.data;

								for(var i = 0; i < banks.length; i++){
									select.append($("<option></option>").attr("value",banks[i].id).text(banks[i].name));
								}
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});

				if(mode == 'add'){
					$("#chooseTopicEditDiv").val("");
					$("input[name='chooseAnswerEditDiv'][value='A']").attr("checked",true);
					$("#chooseRemarkEditDiv").val("");
					$("#chooseOptionAEditDiv").val("");
					$("#chooseOptionBEditDiv").val("");
					$("#chooseOptionCEditDiv").val("");
					$("#chooseOptionDEditDiv").val("");
					$("#editChooseDivConfirmButton").unbind();
					$("#editChooseDivConfirmButton").click(function(){
						addChoose();
					});
					
				}else{

					$.ajax({
					url : path + "/teacher/teacher_getChooseById",
					data : {
						id : id
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
								var choose = data.data;

								$("#chooseBankNameEditDiv").val(choose.bankId);
								$("#chooseTopicEditDiv").val(choose.topic);
								$("input[name='chooseAnswerEditDiv'][value="+choose.answer+"]").attr("checked",true);
								$("#chooseRemarkEditDiv").val(choose.remark);
								$("#chooseOptionAEditDiv").val(choose.optionA);
								$("#chooseOptionBEditDiv").val(choose.optionB);
								$("#chooseOptionCEditDiv").val(choose.optionC);
								$("#chooseOptionDEditDiv").val(choose.optionD);

								$("#editChooseDivConfirmButton").unbind();
								$("#editChooseDivConfirmButton").click(function(){
									editChoose(choose);
								});

								showWaitDiv(false);
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
					});

					
				}

				$("#editChooseDivCancelButton").unbind();
				$("#editChooseDivCancelButton").click(function(){
					showCustomDiv(false,"chooseInfoEditDiv");
					$("#chooseTabFlexiGrid").flexReload();
				});
			}

			function addChoose(){
					var bankId = $("#chooseBankNameEditDiv").val();
					var topic = $("#chooseTopicEditDiv").val();
					var answer = $("input[name='chooseAnswerEditDiv']:checked").val();
					var remark = $("#chooseRemarkEditDiv").val();
					var score = $("#chooseScoreEditDiv").val();

					var optionA = $("#chooseOptionAEditDiv").val();
					var optionB = $("#chooseOptionBEditDiv").val();
					var optionC = $("#chooseOptionCEditDiv").val();
					var optionD = $("#chooseOptionDEditDiv").val();


					var param = {teamId : teamId};

					
					if(bankId == null || bankId == ""){
						alert("所属题库不能为空！");
						return;
					}

					if(topic == null || topic ==""){
						alert("题目不能为空！");
						return;
					}

					if(answer == null || answer == ""){
						alert("答案不能为空！");
						return;
					}

					if(optionA == null || optionA == ""){
						alert("A选项不能为空！");
						return;
					}

					if(optionB == null || optionB == ""){
						alert("B选项不能为空！");
						return;
					}

					if(optionC == null || optionC == ""){
						alert("C选项不能为空！");
						return;
					}

					if(optionD == null || optionD == ""){
						alert("D选项不能为空！");
						return;
					}
					if(score == null || score == ""){
						alert("得分不能为空！");
						return;
					}

					if(isNaN(score)){
					alert("请输入数字！");
					return;
					}
					if(parseInt(score) < 0){
						alert("您输入的分数不合法！");
						return;
					}


					param.bankId = bankId;
					param.topic = topic;
					param.answer = answer;
					param.remark = remark;
					param.optionA = optionA;
					param.optionB = optionB;
					param.optionC = optionC;
					param.optionD = optionD;
					param.score = score



					$.ajax({
					url : path + "/teacher/teacher_addChoose",
					data : param,
					type : "post",
					dataType : "json",
					beforeSend : function(){
						showCustomDiv(false,"chooseInfoEditDiv",1);
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
								$("#chooseTabFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});
			}

			function editChoose(choose){
				var bankId = $("#chooseBankNameEditDiv").val();
				var topic = $("#chooseTopicEditDiv").val();
				var answer = $("input[name='chooseAnswerEditDiv']:checked").val();
				var remark = $("#chooseRemarkEditDiv").val();
				var optionD = $("#chooseOptionDEditDiv").val();
				var optionC = $("#chooseOptionCEditDiv").val();
				var optionB = $("#chooseOptionBEditDiv").val();
				var optionA = $("#chooseOptionAEditDiv").val(); 
				var score = $("#chooseScoreEditDiv").val();


				if(bankId == null || bankId == ""){
					alert("题库不能为空！");
					return;
				}

				if(topic == null || topic == ""){
					alert("题目不能为空！");
					return;
				}

				if(optionD == null || optionD == ""){
					alert("D选项不能为空！");
					return;
				}

				if(optionC == null || optionC == ""){
					alert("C选项不能为空！");
					return;
				}

				if(optionB == null || optionB == ""){
					alert("B选项不能为空！");
					return;
				}

				if(optionA == null || optionA == ""){
					alert("A选项不能为空！");
					return;
				}

				if(answer == null || answer == ""){
					alert("答案不能为空！");
					return;
				}
				if(score == null || score == ""){
					alert("得分不能为空！");
					return;
				}

				if(isNaN(score)){
					alert("请输入数字！");
					return;
				}
				if(parseInt(score) < 0){
					alert("您输入的分数不合法！");
					return;
				}

				var param = {id : choose.id};

				var changed = false;

				param.bankId = bankId;
				if(bankId != choose.bankId){
					changed = true;
				}
				param.topic = topic;
				if(topic != choose.topic){
					changed = true;
				}

				param.answer = answer;
				if(answer != choose.answer){
					changed = true;
				}

				param.optionA = optionA;
				if(optionA != choose.optionA){
					changed = true;
				}

				param.optionB = optionB;
				if(optionB != choose.optionB){
					changed = true;
				}

				param.optionC = optionC;
				if(optionC != choose.optionC){
					changed = true;
				}

				param.optionD = optionD;
				if(optionD != choose.optionD){
					changed = true;
				}

				param.score = score;
				if(score != choose.score){
					changed = true;
				}

				if(remark == null || remark == ""){
					if(choose.remark != null || choose.remark != ""){
						changed = true;
					}
				}else{
					param.remark = remark;
					if(remark != param.remark){
						changed = true;
					}
				}

				$.ajax({
					url : path + "/teacher/teacher_updateChoose",
					data : param,
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
								showCustomDiv(false,"chooseInfoEditDiv");
								$("#chooseTabFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
					});
			}

			function deleteChoose(id){
				if(!confirm("您确定要删除吗？")){
					return;
				}
				$.ajax({
					url : path + "/teacher/teacher_deleteChoose",
					data : {
						id : id
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
								$("#chooseTabFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});

			}

			/*
			 *reuse the choose problem when the paper is not null but the useStatus is false
			 */
			function reuseProblem(type,id){
				if(!confirm("您确定重新使用吗？")){
					return;
				}
				var url;
				if(type == "choose"){
					url = path + "/teacher/teacher_reuseChoose";
				}else if(type == "blank"){
					url = path + "/teacher/teacher_reuseBlank";
				}else if(type == "simple"){
					url = path + "/teacher/teacher_reuseSimple";
				}else if(type == "judge"){
					url = path + "/teacher/teacher_reuseJudge";
				}
				$.ajax({
					url : url,
					data : {
						id : id
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
								if(type == "choose"){
									$("#chooseTabFlexiGrid").flexReload();
								}else if(type == "blank"){
									$("#blankTabFlexiGrid").flexReload();
								}else if(type == "simple"){
									$("#simpleTabFlexiGrid").flexReload();
								}else if(type == "judge"){
									$("#judgeTabFlexiGrid").flexReload();
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

			/*
			*update the bank info for the problem
			*/
			var globalBankId;
			var globalProblemId;
			function showUpdateChooseBankDiv(problemId,bankId){
				showCustomDiv(true,"updateChooseBankDiv");
				globalBankId = bankId;
				globalProblemId = problemId;
				$("#chooseBankDivFlexiGrid").flexReload();
			}

		

			/*
			 *init the bank info in the flexgrid
			 */
			function initChooseBankDivFlexiGrid(){
				$("#chooseBankDivFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findBanksByTeamId",
				addparams : [{name : "teamId", value : teamId}],
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
						return row.createTime;
					}
				},{
					display : "上次更新时间：",
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

						if(row.id == globalBankId){
							var modifyButton = "<input type='button' class='inputB' value='本题题库'/>";
						}else{
							var modifyButton = "<input type='button' class='inputB' value='设为题库' onclick='updateBank(\"choose\", " + row.id + ")'/>";
						}
						

						return modifyButton;

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

			function initSimpleBankDivFlexiGrid(){
				$("#simpleBankDivFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findBanksByTeamId",
				addparams : [{name : "teamId", value : teamId}],
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
						return row.createTime;
					}
				},{
					display : "上次更新时间：",
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

						if(row.id == globalBankId){
							var modifyButton = "<input type='button' class='inputB' value='本题题库'/>";
						}else{
							var modifyButton = "<input type='button' class='inputB' value='设为题库' onclick='updateBank(\"simple\", " + row.id + ")'/>";
						}
						

						return modifyButton;

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

			function initBlankBankDivFlexiGrid(){
				$("#blankBankDivFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findBanksByTeamId",
				addparams : [{name : "teamId", value : teamId}],
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
						return row.createTime;
					}
				},{
					display : "上次更新时间：",
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

						if(row.id == globalBankId){
							var modifyButton = "<input type='button' class='inputB' value='本题题库'/>";
						}else{
							var modifyButton = "<input type='button' class='inputB' value='设为题库' onclick='updateBank(\"blank\", " + row.id + ")'/>";
						}
						

						return modifyButton;

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

			function initJudgeBankDivFlexiGrid(){
				$("#judgeBankDivFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findBanksByTeamId",
				addparams : [{name : "teamId", value : teamId}],
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
						return row.createTime;
					}
				},{
					display : "上次更新时间：",
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

						if(row.id == globalBankId){
							var modifyButton = "<input type='button' class='inputB' value='本题题库'/>";
						}else{
							var modifyButton = "<input type='button' class='inputB' value='设为题库' onclick='updateBank(\"judge\", " + row.id + ")'/>";
						}
						

						return modifyButton;

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

			function showUpdateBlankBankDiv(problemId,bankId){
				showCustomDiv(true,"updateBlankBankDiv");
				globalBankId = bankId;
				globalProblemId = problemId;
				$("#blankBankDivFlexiGrid").flexReload();
			}

			function showUpdateSimpleBankDiv(problemId,bankId){
				showCustomDiv(true,"updateSimpleBankDiv");
				globalBankId = bankId;
				globalProblemId = problemId;
				$("#simpleBankDivFlexiGrid").flexReload();
			}

			function showUpdateJudgeBankDiv(problemId,bankId){
				showCustomDiv(true,"updateJudgeBankDiv");
				globalBankId = bankId;
				globalProblemId = problemId;
				$("#judgeBankDivFlexiGrid").flexReload();
			}

			/*
			 *update the bank for the problem
			 */
			function updateBank(type,bankId){
				var url;
				var data = {};
				if(!confirm("您确定要更换题库吗？")){
					return;
				}
				if(type == "choose"){
					url = path + "/teacher/teacher_updateBankForChoose";
				}else if(type == "blank"){
					url = path + "/teacher/teacher_updateBankForBlank";
				}else if(type == "simple"){
					url = path + "/teacher/teacher_updateBankForSimple";
				}else if(type == "judge"){
					url = path + "/teacher/teacher_updateBankForJudge";
				}

				$.ajax({
					url : url,
					data : {
						id : globalProblemId,
						bankId : bankId
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
								if(type == "choose"){
									$("#chooseTabFlexiGrid").flexReload();
								}else if(type == "blank"){
									$("#blankTabFlexiGrid").flexReload();
								}else if(type == "simple"){
									$("#simpleTabFlexiGrid").flexReload();
								}else if(type == "judge"){
									$("#judgeTabFlexiGrid").flexReload();
								}
								
							}
						}
						if(type == "choose"){
							showCustomDiv(false,"updateChooseBankDiv");
						}else if(type == "blank"){
							showCustomDiv(false,"updateBlankBankDiv");
						}else if(type == "simple"){
							showCustomDiv(false,"updateSimpleBankDiv");
						}else if(type == "judge"){
							showCustomDiv(false,"updateJudgeBankDiv");
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						if(type == "choose"){
							showCustomDiv(false,"updateChooseBankDiv");
						}else if(type == "blank"){
							showCustomDiv(false,"updateBlankBankDiv");
						}else if(type == "simple"){
							showCustomDiv(false,"updateSimpleBankDiv");
						}else if(type == "judge"){
							showCustomDiv(false,"updateJudgeBankDiv");
						}
					}
				});
			}

			var globalPaperId;
			function showUpdateChoosePaperDiv(problemId,paperId){
				globalProblemId = problemId;
				globalPaperId = paperId;
				showCustomDiv(true,"updateChoosePaperDiv");
				$("#choosePaperDivFlexiGrid").flexReload();
			}

			function showUpdateBlankPaperDiv(problemId,paperId){
				globalProblemId = problemId;
				globalPaperId = paperId;
				showCustomDiv(true,"updateBlankPaperDiv");
				$("#blankPaperDivFlexiGrid").flexReload();
			}

			function showUpdateSimplePaperDiv(problemId,paperId){
				globalProblemId = problemId;
				globalPaperId = paperId;
				showCustomDiv(true,"updateSimplePaperDiv");
				$("#simplePaperDivFlexiGrid").flexReload();
			}

			function showUpdateJudgePaperDiv(problemId,paperId){
				globalProblemId = problemId;
				globalPaperId = paperId;
				showCustomDiv(true,"updateJudgePaperDiv");
				$("#judgePaperDivFlexiGrid").flexReload();
			}

			/*
			 *init the paper info in the flexgrid
			 */
			function initChoosePaperDivFlexiGrid(){
				$("#choosePaperDivFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findPapersByTeamId",
				addparams : [{name : "teamId", value : teamId}],
				dataType : "json",
				autoload : false,
				rp : 15,
				useRp : false,
				colModel : [{
					display : "试卷名称：",
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
						return row.createTime;
					}
				},{
					display : "是否为考试试卷：",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.examPaper;
					}
				},{
					display : "上次更新时间：",
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

						if(row.id == globalPaperId){
							var modifyButton = "<input type='button' class='inputB' value='本题试卷' onclick='unusePaper(\"choose\")'/>";
						}else{
							var modifyButton = "<input type='button' class='inputB' value='设为试卷' onclick='updatePaper(\"choose\", " + row.id + ")'/>";
						}
						

						return modifyButton;

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

			function initBlankPaperDivFlexiGrid(){
				$("#blankPaperDivFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findPapersByTeamId",
				addparams : [{name : "teamId", value : teamId}],
				dataType : "json",
				autoload : false,
				rp : 15,
				useRp : false,
				colModel : [{
					display : "试卷名称：",
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
						return row.createTime;
					}
				},{
					display : "是否为考试试卷：",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.examPaper;
					}
				},{
					display : "上次更新时间：",
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

						if(row.id == globalPaperId){
							var modifyButton = "<input type='button' class='inputB' value='本题试卷' onclick='unusePaper(\"blank\")'/>";
						}else{
							var modifyButton = "<input type='button' class='inputB' value='设为试卷' onclick='updatePaper(\"blank\", " + row.id + ")'/>";
						}
						

						return modifyButton;

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

			function initSimplePaperDivFlexiGrid(){
				$("#simplePaperDivFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findPapersByTeamId",
				addparams : [{name : "teamId", value : teamId}],
				dataType : "json",
				autoload : false,
				rp : 15,
				useRp : false,
				colModel : [{
					display : "试卷名称：",
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
						return row.createTime;
					}
				},{
					display : "是否为考试试卷：",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.examPaper;
					}
				},{
					display : "上次更新时间：",
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

						if(row.id == globalPaperId){
							var modifyButton = "<input type='button' class='inputB' value='本题试卷' onclick='unusePaper(\"simple\")'/>";
						}else{
							var modifyButton = "<input type='button' class='inputB' value='设为试卷' onclick='updatePaper(\"simple\", " + row.id + ")'/>";
						}
						

						return modifyButton;

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

			function initJudgePaperDivFlexiGrid(){
				$("#judgePaperDivFlexiGrid").flexigrid({
				url : "http://localhost:8080/test_online/teacher/teacher_findPapersByTeamId",
				addparams : [{name : "teamId", value : teamId}],
				dataType : "json",
				autoload : false,
				rp : 15,
				useRp : false,
				colModel : [{
					display : "试卷名称：",
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
						return row.createTime;
					}
				},{
					display : "是否为考试试卷：",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.examPaper;
					}
				},{
					display : "上次更新时间：",
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

						if(row.id == globalPaperId){
							var modifyButton = "<input type='button' class='inputB' value='本题试卷' onclick='unusePaper(\"judge\")'/>";
						}else{
							var modifyButton = "<input type='button' class='inputB' value='设为试卷' onclick='updatePaper(\"judge\", " + row.id + ")'/>";
						}
						

						return modifyButton;

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

			function updatePaper(type,paperId){
				var url;
				var data = {};
				if(!confirm("您确定要让该题与该试卷关联吗？")){
					return;
				}
				if(type == "choose"){
					url = path + "/teacher/teacher_updatePaperForChoose";
				}else if(type == "blank"){
					url = path + "/teacher/teacher_updatePaperForBlank";
				}else if(type == "simple"){
					url = path + "/teacher/teacher_updatePaperForSimple";
				}else if(type == "judge"){
					url = path + "/teacher/teacher_updatePaperForJudge";
				}
				$.ajax({
					url : url,
					data : {
						id : globalProblemId,
						paperId : paperId
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
								if(type == "choose"){
									$("#chooseTabFlexiGrid").flexReload();
								}else if(type == "blank"){
									$("#blankTabFlexiGrid").flexReload();
								}else if(type == "simple"){
									$("#simpleTabFlexiGrid").flexReload();
								}else if(type == "judge"){
									$("#judgeTabFlexiGrid").flexReload();
								}
								
							}
						}

						if(type == "choose"){
							showCustomDiv(false,"updateChoosePaperDiv");
						}else if(type == "blank"){
							showCustomDiv(false,"updateBlankPaperDiv");
						}else if(type == "simple"){
							showCustomDiv(false,"updateSimplePaperDiv");
						}else if(type == "judge"){
							showCustomDiv(false,"updateJudgePaperDiv");
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						if(type == "choose"){
							showCustomDiv(false,"updateChoosePaperDiv");
						}else if(type == "blank"){
							showCustomDiv(false,"updateBlankPaperDiv");
						}else if(type == "blank"){
							showCustomDiv(false,"updateSimplePaperDiv");
						}else if(type == "judge"){
							showCustomDiv(false,"updateJudgePaperDiv");
						}
					}
				});
			}

			function unusePaper(type){
				var url;
				var data = {};
				if(!confirm("此次点击说明您想要废除该题和试卷的关联信息，点击“确定”继续，点击“取消”放弃")){
					return;
				}
				if(type == "choose"){
					url = path + "/teacher/teacher_unusePaperForChoose";
				} else if(type == "blank"){
					url = path + "/teacher/teacher_unusePaperForBlank";
				}else if(type == "simple"){
					url = path + "/teacher/teacher_unusePaperForSimple";
				}else if(type == "judge"){
					url = path + "/teacher/teacher_unusePaperForJudge";
				}
				$.ajax({
					url : url,
					data : {
						id : globalProblemId,
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
								if(type == "choose"){
									$("#chooseTabFlexiGrid").flexReload();
								}else if(type == "blank"){
									$("#blankTabFlexiGrid").flexReload();
								}else if(type == "simple"){
									$("#simpleTabFlexiGrid").flexReload();
								}else if(type == "judge"){
									$("#judgeTabFlexiGrid").flexReload();
								}
							}
						}
						if(type == "choose"){
							showCustomDiv(false,"updateChoosePaperDiv");
						}else if(type == "blank"){
							showCustomDiv(false,"updateBlankPaperDiv");
						}else if(type == "simple"){
							showCustomDiv(false,"updateSimplePaperDiv");
						}else if(type == "judge"){
							showCustomDiv(false,"updateJudgePaperDiv");
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						if(type == "choose"){
							showCustomDiv(false,"updateChoosePaperDiv");
						}else if(type == "blank"){
							showCustomDiv(false,"updateBlankPaperDiv");
						}else if(type == "simple"){
							showCustomDiv(false,"updateSimplePaperDiv");
						}else if(type == "judge"){
							showCustomDiv(false,"updateJudgePaperDiv");
						}
					}
				});
			}

			function isScore(score){
				if(isNaN(score)){
					alert("请输入数字！");
					return;
				}
				if(parseInt(score) < 0){
					alert("您输入的分数不合法！");
					return;
				}
			}
		</script>
	</body>
</html>
