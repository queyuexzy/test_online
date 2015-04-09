<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
<head>
	<%@include file="/WEB-INF/page/include/head.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>品牌专区 模板管理</title>
	<script type="text/javascript" src="<%=path%>/js/jquery/jquery.json-2.2.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path%>/js/jqueryui/ui-tabs/ui.tabs.css"/>
	<script type="text/javascript" src="<%=path%>/js/jqueryui/ui-tabs/ui.tabs.js"></script>
	<link rel="stylesheet"  type="text/css" href="<%=path%>/js/jquery-flexigrid/css/gray/flexigrid.css" />
	<script type="text/javascript" src="<%=path%>/js/jquery-flexigrid/flexigrid.js"></script>
	<script type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=path%>/js/mJs/ajaxfileupload.js"></script>
</head>
<body style="overflow:hidden;">
	<div>
		<ul id="brandTemplateTabs">
			<li><a href='#brandTemplateTab'><span>模板管理</span></a></li>
		</ul>

		<div id="brandTemplateTab">
			<form onsubmit="addBrandTemplate(); return false;">
				<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
					<thead>
						<tr>
							<th colspan="10">
								模板管理
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="text-align:right; width:60px;">模板名称：</td>
							<td style="width:100px;">
								<input id="brandTemplateDivAddName" type="text" value="" style="width:100px;"/>
							</td>
							<td>
								<input type="submit" class="inputB" value="添加" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<form onsubmit="searchBrandTemplateFlexiGrid(); return false;">
				<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
					<tbody>
						<tr>
							<td style="text-align:right; width:60px;">模板名称：</td>
							<td style="width:100px;">
								<input id="brandTemplateDivSearchName" type="text" value="" style="width:100px;"/>
							</td>
							<td style="text-align:right; width:60px;">频道名称：</td>
							<td style="width:100px;">
								<select id="brandTemplateDivSearchChannel" style="width:100px;">
									<!-- Options will be appended dynamically by JavaScript after page has been loaded  -->
								</select>
							</td>
							<td>
								<input type="submit" class="inputB" value="搜索" />
								<input type="button" class="inputB" value="重置" onclick="resetBrandTemplateFlexiGrid()" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>

			<div>
				<table id="brandTemplateFlexiGrid"></table>
			</div>
		</div>
	</div>

	<!-- Add/Edit brandTemplate div-->
	<div id="brandTemplateEditDiv" class="divPopup" style="height: auto; width: 400px;">
		<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
			<thead>
				<tr>
					<th colspan="2">
						<span id="brandTemplateEditDivMainTitle"></span>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align:right; width:65px;">模板名称：</td>
					<td style="width:335px;">
						<input id="brandTemplateEditDivName" type="text" length="64" style="width:90%;" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="brandTemplateEditDivConfirm" type="button" class="inputB" value="确定" />
						<input id="brandTemplateEditDivCancel" type="button" class="inputB" value="取消" onclick="showCustomDiv(false, 'brandTemplateEditDiv', 1);" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- Edit template's preview image div -->
	<div id="brandTemplatePreviewImageEditDiv" class="divPopup" style="height: auto; width: 400px;">
		<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
			<thead>
				<tr>
					<th colspan="2">
						<span id="brandTemplatePreviewImageEditDivMainTitle"></span>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align:right; width:65px;">预览图片：</td>
					<td style="width:335px;">
						<input id="brandTemplatePreviewImageEditDivPreviewImage" type="file" style="width:90%;" name="previewImage" />
						
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="brandTemplatePreviewImageEditDivConfirm" type="button" class="inputB" value="上传" />
						<input id="brandTemplatePreviewImageEditDivCancel" type="button" class="inputB" value="取消" onclick="showCustomDiv(false, 'brandTemplatePreviewImageEditDiv', 1);" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- Edit template's content div -->
	<div id="brandTemplateContentEditDiv" class="divPopup" style="height: auto; width: 400px;">
		<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
			<thead>
				<tr>
					<th colspan="2">
						<span id="brandTemplateContentEditDivMainTitle"></span>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align:right; width:65px;">预览图片：</td>
					<td style="width:335px;">
						<input id="brandTemplateContentEditDivContent" type="file" style="width:90%;" name="content" />
						
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="brandTemplateContentEditDivConfirm" type="button" class="inputB" value="上传" />
						<input id="brandTemplateContentEditDivCancel" type="button" class="inputB" value="取消" onclick="showCustomDiv(false, 'brandTemplateContentEditDiv', 1);" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- Edit template's channel div -->
	<div id="brandTemplateChannelEditDiv" class="divPopup" style="height: auto; width: 400px;">
		<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
			<thead>
				<tr>
					<th colspan="2">
						<span id="brandTemplateChannelEditDivMainTitle"></span>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align:right; width:65px;">选择频道：</td>
					<td style="width:335px;" id="brandTemplateChannelEditDivChannelCheckboxScope">
						<!-- Will be appended dynamically by JavaScript -->
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="brandTemplateChannelEditDivConfirm" type="button" class="inputB" value="确定" />
						<input id="brandTemplateChannelEditDivCancel" type="button" class="inputB" value="取消" onclick="showCustomDiv(false, 'brandTemplateChannelEditDiv', 1);" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- Template's block div -->
	<div id="brandTemplateBlockDiv" class="divPopup" style="height: auto; width: 800px;">
		<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
			<thead>
				<tr>
					<th colspan="4">
						<span id="brandTemplateBlockDivTitle"></span>
						<input type="button" class="inputB divPopupClose" value="关闭" onclick="showCustomDiv(false, 'brandTemplateBlockDiv', 1);"/>
					</th>
				</tr>
			</thead>
		</table>

		<form id="brandTemplateBlockDivAddForm">
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<tbody>
					<tr>
						<td style="width:80px;">模板块名称：</td>
						<td style="width:261px;">
							<input id="brandTemplateBlockDivAddName" type="text" value="" style="width:95%;" />
						</td>
						<td style="text-align:left;">
							<input id="brandTemplateBlockDivAddButton" type="submit" value="添加" class="inputB" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>

		<form id="brandTemplateBlockDivSearchForm">
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<tbody>
					<tr>
						<td style="width:80px;">模板块名称：</td>
						<td style="width:200px;">
							<input id="brandTemplateBlockDivSearchName" type="text" value="" style="width:95%;" />
						</td>
						<td style="text-align:left;">
							<input type="submit" class="inputB" value="搜索" />
							<input id="brandTemplateBlockDivReset" type="button" class="inputB" value="重置"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>

		<div>
			<table id="brandTemplateBlockFlexiGrid"></table>
		</div>
	</div>

	<!-- Add/Edit template's block div-->
	<div id="brandTemplateBlockEditDiv" class="divPopup" style="height: auto; width: 400px;">
		<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
			<thead>
				<tr>
					<th colspan="2">
						<span id="brandTemplateBlockEditDivTitle"></span>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align:right; width:65px;">块名称：</td>
					<td style="width:335px;">
						<input id="brandTemplateBlockEditDivName" type="text" value="" length="255" style="width:90%;" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="brandTemplateBlockEditDivConfirm" type="button" class="inputB" value="确定" />
						<input type="button" class="inputB" value="取消" onclick="showCustomDiv(false, 'brandTemplateBlockEditDiv', 1); showCustomDiv(true, 'brandTemplateBlockDiv');" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- Pop-up div on hover preview image.  -->
	<div id="onHoverPopUpDiv" class="divPopup">
		<img src="" style="width: 100%;" />
	</div>

	<script type="text/javascript">
		//Web page initialize function
		$(document).ready(function() {
			$("#brandTemplateTabs").tabs(1, {
				fxSlide : true,
				fxFade : true,
				fxSpeed : 'normal'
			});

			fetchAllChannels();
			initBrandTemplateFlexiGrid();
			initBrandTemplateBlockFlexiGrid();
		});

		/*
		 * Fetch all channels.
		 */
		function fetchAllChannels() {
			// TODO
			$.ajax({
				url : path + "/brandTemplate/brandTemplate_getAllBrandChannelList?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : {
					//Note that '0' is not meaningful, just in order to pass the parameter check.
					templateId : 0
				},
				type : "post",
				dataType : "json",
				beforeSend : function() {
					// showWaitDiv(true);
				},
				success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code <= 0) {
							alert(data.message);
							showWaitDiv(false);
						} else {
							$("#brandTemplateDivSearchChannel").append("<option value='all'>全部</option>");
							var channelArray = data.data;
							for (var i = 0; i < channelArray.length; i++) {
								$("#brandTemplateDivSearchChannel").append("<option value='" + channelArray[i].id + "'>" + channelArray[i].name + "</option>");
							}
							// showWaitDiv(false);
						}
					}
				},
				error : function() {
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
				}
			});
		}

		/* 
		 * Initialize the table brandTemplateFlexiGrid
		 */
		function initBrandTemplateFlexiGrid() {
			$("#brandTemplateFlexiGrid").flexigrid({
				url : path + "/brandTemplate/brandTemplate_searchBrandTemplateForFlexigrid?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				dataType : "json",
				rp : 15,
				sortname : "updateTime",
				sortorder : "desc",
				useRp : false,
				colModel : [{
					display : "模板名称",
					width : 100,
					align : "center",
					render : function(val, row) {
						if (row.contentId) {
							return row.name;
						}
						else {
							return "<p>" + row.name + "</p><p><font color='red'>未上传模板</font></p>"; 
						}
					}
				},{
					display : "预览图片",
					width : 100,
					align : "center",
					render : function(val, row) {
						if (row.previewImage == null || row.previewImage == "") {
							return "<font color='red'>未上传预览</font>";
						}
						else {
							return "<img src=\"data:image/gif;base64," + row.previewImage + "\" width='100%' class='onHoverShowImg' />";
						}
					}
				},{
					display : "所属频道",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row._channelNames;
					}
				},{
					display : "操作",
					width : 250,
					align : "center",
					render : function(val, row) {
						var editButton = "<input type='button' class='inputB' value='编辑' onclick='showBrandTemplateEditDiv(\"edit\",\"" + row.id + "\")' />";
						var editPreviewImageButton = "<input type='button' class='inputB' value='上传预览' onclick='showBrandTemplatePreviewImageEditDiv(\"" + row.id + "\", \"" + row.name + "\")' />";
						var editContentButton = "<input type='button' class='inputB' value='上传模板' onclick='showBrandTemplateContentEditDiv(\"" + row.id + "\", \"" + row.name + "\")' />";
						var editChannelButton = "<input type='button' class='inputB' value='管理频道' onclick='showBrandTemplateChannelEditDiv(\"" + row.id + "\", \"" + row.name + "\")' />";
						var editBlockButton = "<input type='button' class='inputB' value='管理模板块' onclick='showBrandTemplateBlockDiv(\"" + row.id + "\", \"" + row.name + "\")' />";
						return editButton + editPreviewImageButton + editContentButton + editChannelButton + editBlockButton;
					}
				},{
					display : "最后更新人",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row._updateUserName;
					}
				},{
					display : "最后更新时间",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.updateTime.substring(0, 19);
					}
				},{
					display : "删除",
					width : 60,
					align : "center",
					render : function(val, row) {
						var deleteButton = "<input type='button' class='inputB' value='删除' onclick='deleteBrandTemplate(\"" + row.id + "\", \"" + row.name + "\")' />";
						return deleteButton;
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
					var x = 10;
					var y = 10;

					$("img.onHoverShowImg").hover(function (event) {
						$("#onHoverPopUpDiv img").attr("src", $(this).attr("src"));
						$("#onHoverPopUpDiv").css({
							top : (event.pageY + y) + "px", 
							left : (event.pageX + x) + "px"
						}).show("fast");
					}, function (event) {
						$("#onHoverPopUpDiv").hide();
					});

					$("img.onHoverShowImg").mousemove(function (event) {
						$("#onHoverPopUpDiv").css({
							top : (event.pageY + y) + "px", 
							left : (event.pageX + x) + "px"
						});
					});

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

		/**
		 *	Search table brandTemplateFlexiGrid.
		 */
		function searchBrandTemplateFlexiGrid() {
			var params = new Array();

			var name = $("#brandTemplateDivSearchName").val().trim();
			if (name != "") {
				params.push({name : "name", value : name});
			}

			var channelId = $("#brandTemplateDivSearchChannel").val().trim();
			if (channelId != "all") {
				params.push({ name: "channelId", value: channelId });
			}

			$("#brandTemplateFlexiGrid").flexOptions({
				newp : 1,
				addparams : params
			}).flexReload();
		}

		/**
		 *	Reset table brandTemplateFlexiGrid.
		 */
		function resetBrandTemplateFlexiGrid() {
			$("#brandTemplateDivSearchName").val("");
			$("#brandTemplateDivSearchChannel").val("all");
			$("#brandTemplateDivAddName").val("");

			$("#brandTemplateFlexiGrid").flexOptions({
				newp : 1,
				addparams : []
			}).flexReload();
		}

		/**
		 * Show the brandTemplateEdit div.
		 */
		function showBrandTemplateEditDiv(mode, templateId) {
			if (mode = "edit") {
				$.ajax({
					url : path + "/brandTemplate/brandTemplate_getBrandTemplateById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : templateId
					},
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code <= 0) {
								alert(data.message);
								showWaitDiv(false);
								$("#brandTemplateFlexiGrid").flexReload();
							} else {
								var template = data.data;
								$("#brandTemplateEditDivMainTitle").text("修改模板");
								$("#brandTemplateEditDivName").val(template.name);
								$("#brandTemplateEditDivConfirm")[0].onclick = function() {
									editBrandTemplate(templateId, template);
								}
								showWaitDiv(false);
								showCustomDiv(true, "brandTemplateEditDiv");
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});
			}
		}

		/**
		 *	Add brandTemplate.
		 */
		function addBrandTemplate() {
			var data = {};
			var name = $("#brandTemplateDivAddName").val().trim();
			if (name == "") {
				alert("模板名称不能为空！");
				return;
			}
			data.name = name;

			$.ajax({
				url : path + "/brandTemplate/brandTemplate_addBrandTemplate?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : data,
				type : "post",
				dataType : "json",
				beforeSend : function() {
					showWaitDiv(true);
				},
				success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code <= 0) {
							alert("模板的名称已存在!请检查.");
							showWaitDiv(false);
						}
						else {
							$("#brandTemplateDivAddName").val("");
							$("#brandTemplateDivSearchName").val("");
							$("#brandTemplateDivSearchChannel").val("all");
							showWaitDiv(false);
							$("#brandTemplateFlexiGrid").flexOptions({
								newp : 1,
								sortname : "updateTime",
								sortorder : "desc",
								addparams : [] 
							}).flexReload();
						}	
					}
				},
				error : function() {
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
				}
			});
		}

		/**
		 *	Edit brand template.
		 */
		function editBrandTemplate(templateId, oldTemplate) {
			var changed = false;
			var data = { id : templateId };

			var name = $("#brandTemplateEditDivName").val().trim();
			if (name == "") {
				alert("请输入模板名称!");
				return;
			}
			data.name = name;
			if (name != oldTemplate.name) {
				changed = true;
			}

			if (!changed) {
				showCustomDiv(false, "brandTemplateEditDiv", 1);
				return;
			}

			$.ajax({
				url : path + "/brandTemplate/brandTemplate_updateBrandTemplateById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : data,
				type : "post",
				dataType : "json",
				beforeSend : function() {
					showCustomDiv(false, "brandTemplateEditDiv", 1);
					showWaitDiv(true);
				},
				success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code <= 0) {
							alert("模板的名称已存在!请检查.");
							showWaitDiv(false);
							showCustomDiv(true, "brandTemplateEditDiv");
						} else {
							showWaitDiv(false);
							$("#brandTemplateDivSearchName").val("");
							$("#brandTemplateDivSearchChannel").val("all");
							$("#brandTemplateFlexiGrid").flexOptions({
								newp : 1,
								sortname : "updateTime",
								sortorder : "desc",  
								addparams : []
							}).flexReload();
						}
					}
				},
				error : function() {
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
				}
			});
		}

		/*
		 * Delete brand template.
		 */
		function deleteBrandTemplate(id, name) {
			if (confirm("确定要删除模板 “" + name + "” 吗？")) {
				$.ajax({
					url : path + "/brandTemplate/brandTemplate_deleteBrandTemplateById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : id
					},
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code <= 0) {
								alert(data.message);
								showWaitDiv(false);
							} else {
								showWaitDiv(false);
								$("#brandTemplateFlexiGrid").flexReload();
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}
				});
			}
		}

		/*
		 * show brandTemplatePreviewImageEdit div.
		 */
		function showBrandTemplatePreviewImageEditDiv(templateId, templateName) {
			$("#brandTemplatePreviewImageEditDivMainTitle").text("上传模板“" + templateName +"”的预览图片.");
			$("#brandTemplatePreviewImageEditDivPreviewImage").val("");
			$("#brandTemplatePreviewImageEditDivConfirm").off();
			$("#brandTemplatePreviewImageEditDivConfirm").click(function () {
				editBrandTemplatePreviewImage(templateId);
			});
			showCustomDiv(true, "brandTemplatePreviewImageEditDiv");
		}

		/*
		 * edit previewImage of template.
		 */
		 function editBrandTemplatePreviewImage(templateId) {
		 	var previewImage = $("#brandTemplatePreviewImageEditDivPreviewImage").val();
			if (previewImage == ""){
				alert("请先选择一个预览图片！");
				return;
			}

			showCustomDiv(false, "brandTemplatePreviewImageEditDiv", 1);
			showWaitDiv(true);

			$.ajaxFileUpload({
	        	url : path + "/brandTemplate/brandTemplate_updateBrandTemplatePreviewImageById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
	        	type : "post",
	        	data : {
	        		id : templateId
	        	},
	        	dataType : "json",
	        	timeout : 10000,
	            fileElementId : "brandTemplatePreviewImageEditDivPreviewImage",// 文件类型的id
	            success : function (data) {
	            	if(ajaxResponseValidate(data)) {
	            		if(data.code <= 0) {
	            			alert(data.message);
	            			showWaitDiv(false);
		            		showCustomDiv(true, "brandTemplatePreviewImageEditDiv");
	            		}
	            		else {
	            			showWaitDiv(false);
	            			$("#brandTemplateFlexiGrid").flexReload();
	            		}
	            	}
	            },
	            error : function(){
					alert('<%=AjaxResponse.getAjaxErrorInfo()%>');
					showWaitDiv(false);
            		showCustomDiv(true, "brandTemplatePreviewImageEditDiv");
				}
	        });
		 }

		/*
		 * show brandTemplateContentEdit div.
		 */
		function showBrandTemplateContentEditDiv(templateId, templateName) {
			$("#brandTemplateContentEditDivMainTitle").text("上传模板“" + templateName +"”的模板文件.");
			$("#brandTemplateContentEditDivContent").val("");
			$("#brandTemplateContentEditDivConfirm").off();
			$("#brandTemplateContentEditDivConfirm").click(function () {
				editBrandTemplateContent(templateId);
			});
			showCustomDiv(true, "brandTemplateContentEditDiv");
		}

		/*
		 * edit previewImage of template.
		 */
		function editBrandTemplateContent(templateId) {
		 	var content = $("#brandTemplateContentEditDivContent").val();
			if (content == ""){
				alert("请先选择一个预览文件！");
				return;
			}

			showCustomDiv(false, "brandTemplateContentEditDiv", 1);
			showWaitDiv(true);

			$.ajaxFileUpload({
	        	url : path + "/brandTemplate/brandTemplate_updateBrandTemplateContentById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
	        	type : "post",
	        	data : {
	        		templateId : templateId
	        	},
	        	dataType : "json",
	        	timeout : 10000,
	            fileElementId : "brandTemplateContentEditDivContent",// 文件类型的id
	            success : function (data) {
	            	if(ajaxResponseValidate(data)) {
	            		if (data.code == -203) {
	            			//the template file doesn't validated
	            			alert("上传的模板文件不满足要求：文件中的模板部分HTML代码和对应的JavaScript代码必须处于同一“<!-- TEMPLATE_START -->”与“<!-- TEMPLATE_END -->”之间！");
	            			showWaitDiv(false);
		            		showCustomDiv(true, "brandTemplateContentEditDiv");
	            		}
	            		else if(data.code <= 0) {
	            			alert(data.message);
	            			showWaitDiv(false);
		            		showCustomDiv(true, "brandTemplateContentEditDiv");
	            		}
	            		else {
	            			showWaitDiv(false);
	            			$("#brandTemplateFlexiGrid").flexReload();
	            		}
	            	}
	            },
	            error : function(){
					alert('<%=AjaxResponse.getAjaxErrorInfo()%>');
					showWaitDiv(false);
	        		showCustomDiv(true, "brandTemplateContentEditDiv");
				}
	        });
		}

		/*
		 * show brandTemplateChannelEditDiv
		 */
		function showBrandTemplateChannelEditDiv(templateId, templateName) {
			$.ajax({
				url : path + "/brandTemplate/brandTemplate_getAllBrandChannelList?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : {
					templateId : templateId
				},
				type : "post",
				dataType : "json",
				beforeSend : function() {
					showWaitDiv(true);
				},
				success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code <= 0) {
							alert(data.message);
							showWaitDiv(false);
							$("#brandTemplateFlexiGrid").flexReload();
						} else {
							$("#brandTemplateChannelEditDivMainTitle").text("管理模板“" + templateName +"”的所属频道.");
							// display all checkboxs
							var channelArray = data.data;
							var htmlScript = "<fieldset style=\"border:0\">";

							// for (var i = 0; i < channelArray.length; i++) {
							// 	var channel = channelArray[i];
							// 	if (i % 3 == 0) {
							// 		htmlScript += "<p>";
							// 	}
							// 	if (channel._selectedFlag) {
							// 		htmlScript += "<input type='checkbox' name='channelIds' value='" + channel.id + "' checked='checked' />" + channel.name;
							// 	}
							// 	else {
							// 		htmlScript += "<input type='checkbox' name='channelIds' value='" + channel.id + "' />" + channel.name;
							// 	}
							// 	if ((i + 1) % 3 == 0) {
							// 		htmlScript += "</p>"
							// 	}
							// }
							// if ((i + 1) % 3 != 0) {
							// 	htmlScript += "</p>";
							// }

							var numsPerCol = 3;
							for (var i = 0; i < channelArray.length; i++) {
								var channel = channelArray[i];
								if (i % numsPerCol == 0) {
									htmlScript += "<div style=\"float:left; margin-left: 20px;\">"
								}
								if (channel._selectedFlag) {
									htmlScript += "<input type='radio' style=\"vertical-align:middle;\" name='channelIds' value='" + channel.id + "' checked='checked' />" + "<label style=\"vertical-align:middle; margin-left:2px; line-height:20px;\">" + channel.name + "</label>";
								}
								else {
									htmlScript += "<input type='radio' style=\"vertical-align:middle;\" name='channelIds' value='" + channel.id + "' />" + "<label style=\"vertical-align:middle; margin-left:2px; line-height:20px;\">" + channel.name + "</label>";
								}
								if ((i + 1) % numsPerCol == 0) {
									htmlScript += "</div>"
								}
								else {
									htmlScript += "<br/>";
								}
							}
							htmlScript += "</fieldset>";
							$("#brandTemplateChannelEditDivChannelCheckboxScope").empty();
							$("#brandTemplateChannelEditDivChannelCheckboxScope").append(htmlScript);
							$("#brandTemplateChannelEditDivConfirm")[0].onclick = function() {
								editBrandTemplateChannel(templateId, channelArray);
							}
							showWaitDiv(false);
							showCustomDiv(true, "brandTemplateChannelEditDiv");
						}
					}
				},
				error : function() {
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
				}
			});
		}

		/*
		 * edit template's channel.
		 */
		function editBrandTemplateChannel(templateId, oldChannelArray) {
			var data = {
				templateId : templateId
			};
			var channelIds = [  ];
			var changed = false;
			$("#brandTemplateChannelEditDivChannelCheckboxScope :radio[name=channelIds]").each(function (index) {
				var checked = $(this).attr("checked") == "checked" ? true : false;
				if (checked) {
					channelIds.push($(this).val());
				}
				if (checked != oldChannelArray[index]._selectedFlag) {
					changed = true;
				}
			});

			if (! changed) {
				showCustomDiv(false, "brandTemplateChannelEditDiv", 1);
				return;
			}

			data.channelIds = channelIds.toString();
			$.ajax({
				url : path + "/brandTemplate/brandTemplate_updateBrandTemplateChannelByTemplateId?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : data,
				type : "post",
				dataType : "json",
				beforeSend : function() {
					showCustomDiv(false, "brandTemplateChannelEditDiv", 1);
					showWaitDiv(true);
				},
				success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code == -203) {
							// It's not allowed to update a template's channel when the template is being used by one or more product.
							alert("当模板被产品使用时，不允许修改模板的频道！");
							showWaitDiv(false);
							showCustomDiv(true, "brandTemplateChannelEditDiv");
						}
						else if (data.code <= 0) {
							alert(data.message);
							showWaitDiv(false);
							showCustomDiv(true, "brandTemplateChannelEditDiv");
						} 
						else {
							showWaitDiv(false);
							$("#brandTemplateDivSearchName").val("");
							$("#brandTemplateDivSearchChannel").val("all");
							$("#brandTemplateFlexiGrid").flexOptions({
								newp : 1,
								sortname : "updateTime",
								sortorder : "desc",  
								addparams : []
							}).flexReload();
						}
					}
				},
				error : function() {
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
					showCustomDiv(true, "brandTemplateChannelEditDiv");
				}
			});
		}

		/*
		 * Initialize the brandTemplateBlockFlexiGrid
		 */
		function initBrandTemplateBlockFlexiGrid() {
			$("#brandTemplateBlockFlexiGrid").flexigrid({
				url : path + "/brandTemplate/brandTemplate_searchBrandTemplateBlockForFlexigrid?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				dataType : "json",
				autoload : false,
				rp : 15,
				useRp : false,
				sortname : "idx",
				sortorder : "asc",
				colModel : [{
					display : "排序",
					width : 50,
					align : "center",
					render : function(val, row) {
						var htmlScript = "<select id=\"brandTemplateBlockIdx_" + row.id + "\" onchange=\"updateBrandTemplateBlockIdxById(" + row.id + ")\">";
						for (var i = 1; i <= row._total; i++) {
							htmlScript += "<option value=\"" + i + "\"";
							if (i == row.idx) {
								htmlScript += " selected=\"selected\""	
							}
							htmlScript += ">" + i + "</option>";
						}
						htmlScript += "</select>"
						return htmlScript;
					}
				},{
					display : "模板块名称",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.name;
					}
				},{
					display : "更新人",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row._updateUserName;
					}
				},{
					display : "更新时间",
					width : 150,
					align : "center",
					render : function(val, row) {
						return row.updateTime.substring(0, 19);
					}
				},{
					display : "操作",
					width : 180,
					align : "center",
					render : function(val, row) {
						var editButton = "<input type='button' class='inputB' value='修改' onclick='showBrandTemplateBlockEditDiv(\"edit\", \"" + row.templateId + "\", \"" + row.id + "\")' />";
						var deleteButton = "<input type='button' class='inputB' value='删除' onclick='deleteBrandTemplateBlock(\"" + row.id + "\", \"" + row.name + "\")' />";
						return editButton + deleteButton;
					}
				}],
				width : "auto",
				height : "370",
				showToggleBtn : false,
				showTableToggleBtn : false,
				singleSelect : true,
				onSubmit : function() {
					var brandTemplateBlockDiv = $("#brandTemplateBlockDiv")[0];
					if (brandTemplateBlockDiv.style.display == "display") {
						showCustomDiv(false, "brandTemplateBlockDiv", 1);
					}
					showWaitDiv(true);
					return true;
				},
				onSuccess : function(grid, data) {
					showWaitDiv(false);
					var brandTemplateBlockDiv = $("#brandTemplateBlockDiv")[0];
					if (brandTemplateBlockDiv.style.display == "" || brandTemplateBlockDiv.style.display == "none") {
						showCustomDiv(true, 'brandTemplateBlockDiv');
					}
					$("#brandTemplateBlockDivAddName").select();
					return true;
				},
				onError : function() {
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
					return true;
				}
			});
		}

		/**
		 * Search the table brandTemplateBlockFlexiGrid
		 */
		function searchBrandTemplateBlockFlexiGrid(templateId) {
			var params = new Array();
			params.push({name : "templateId", value : templateId});

			var name = $("#brandTemplateBlockDivSearchName").val().trim();
			if (name != "") {
				params.push({name : "name", value : name});
			}

			$("#brandTemplateBlockFlexiGrid").flexOptions({
				newp : 1,
				addparams : params
			}).flexReload();
		}

		/**
		 * Reset the table brandTemplateBlockFlexiGrid
		 */
		function resetBrandTemplateBlockFlexiGrid(templateId) {
			$("#brandTemplateBlockDivAddName").val("");
			$("#brandTemplateBlockDivSearchName").val("");
			$("#brandTemplateBlockDivAddName").select();

			var params = new Array;
			params.push({name : "templateId", value : templateId});

			$("#brandTemplateBlockFlexiGrid").flexOptions({
				newp : 1,
				addparams : params
			}).flexReload();
		}

		/*
		 * Show brandTemplateBlock div.
		 */
		function showBrandTemplateBlockDiv(templateId, templateName) {
			$("#brandTemplateBlockDivTitle").text("模板 “" + templateName + "” 的块列表");
			$("#brandTemplateBlockDivAddForm")[0].onsubmit = function() {
				addBrandTemplateBlock(templateId);
				return false;
			};
			$("#brandTemplateBlockDivAddName").val("");
			$("#brandTemplateBlockDivSearchName").val("");
			$("#brandTemplateBlockDivAddName").select();
			$("#brandTemplateBlockDivSearchForm")[0].onsubmit = function() {
				searchBrandTemplateBlockFlexiGrid(templateId);
				return false;
			};
			$("#brandTemplateBlockDivReset")[0].onclick = function() {
				resetBrandTemplateBlockFlexiGrid(templateId);
			}
			showWaitDiv(false);	
			searchBrandTemplateBlockFlexiGrid(templateId);
		}

		/*
		 *	Show the brandTemplateBlockEdit div
		 */
		function showBrandTemplateBlockEditDiv(mode, templateId, blockId) {
			if (mode == "add") {
				// $("#gsfocusHitEditDivTitle").text("新增命中词");
				// $("#gsfocusHitEditDivHit").val("");
				// $("#gsfocusHitEditDivDeadTime").val("");
				// $("#gsfocusHitEditDivConfirm")[0].onclick = function() {
				// 	addGsfocusHit(focusId);
				// }
				// showCustomDiv(true, "gsfocusHitEditDiv");
			} else if (mode = "edit") {
				$.ajax({
					url : path + "/brandTemplate/brandTemplate_getBrandTemplateBlockById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : blockId
					},
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showCustomDiv(false, "brandTemplateBlockDiv", 1);
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code <= 0) {
								alert(data.message);
								showWaitDiv(false);
								$("#brandTemplateBlockFlexiGrid").flexReload();
							} else {
								$("#brandTemplateBlockEditDivTitle").text("修改模板块");
								var block = data.data;
								showWaitDiv(false);

								$("#brandTemplateBlockEditDivName").val(block.name);
								$("#brandTemplateBlockEditDivConfirm")[0].onclick = function() {
									editBrandTemplateBlock(templateId, block);
								}
								showCustomDiv(true, "brandTemplateBlockEditDiv");
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true, 'brandTemplateBlockDiv');
					}
				});
			}
		}

		/*
		 * Add brand template block.
		 */
		function addBrandTemplateBlock(templateId) {
			var data = {templateId : templateId};
			var name = $("#brandTemplateBlockDivAddName").val().trim();
			if (name == "") {
				alert("模板块名称不能为空！");
				return;
			}
			data.name = name;

			$.ajax({
				url : path + "/brandTemplate/brandTemplate_addBrandTemplateBlock?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : data,
				type : "post",
				dataType : "json",
				beforeSend : function() {
					showCustomDiv(false, "brandTemplateBlockDiv", 1);
					showWaitDiv(true);
				},
				success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code <= 0) {
							showWaitDiv(false);
							alert("块名称已经存在于当前模板，请检查！");
							showCustomDiv(true, "brandTemplateBlockDiv");
						} else {
							showWaitDiv(false);
							$("#brandTemplateBlockDivAddName").val("");
							$("#brandTemplateBlockDivSearchName").val("");

							var params = new Array();
							params.push({name : "templateId", value : templateId});
							$("#brandTemplateBlockFlexiGrid").flexOptions({
								newp : 1,
								addparams : params,
							}).flexReload();
						}
					}
				},
				error : function() {
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
					showCustomDiv(true, "brandTemplateBlockDiv");
				}
			});
		}

		/*
		 * Edit template's block.
		 */
		function editBrandTemplateBlock(templateId, oldBlock) {
			var data = {
				id : oldBlock.id
			};

			var changed = false;
			var name = $("#brandTemplateBlockEditDivName").val().trim();
			if (name == "") {
				alert("模板块名称不能为空！");
				return;
			}
			data.name = name;
			if (name != oldBlock.name) {
				changed = true;
			}

			if (! changed) {
				showCustomDiv(false, "brandTemplateBlockEditDiv", 1);
				showCustomDiv(true, "brandTemplateBlockDiv");
				return;
			}

			$.ajax({
				url : path + "/brandTemplate/brandTemplate_updateBrandTemplateBlockById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : data,
				type : "post",
				dataType : "json",
				beforeSend : function() {
					showCustomDiv(false, 'brandTemplateBlockEditDiv', 1);
					showWaitDiv(true);
				},
				success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code <= 0) {
							alert("块名称已经存在于当前模板，请检查！");
							showWaitDiv(false);
							showCustomDiv(true, 'brandTemplateBlockEditDiv');
						}
						else {
							showWaitDiv(false);
							$("#brandTemplateBlockDivAddName").val("");
							$("#brandTemplateBlockDivSearchName").val("");

							var params = new Array();
							params.push({
								name : "templateId", 
								value : templateId
							});

							$("#brandTemplateBlockFlexiGrid").flexOptions({
								newp : 1,
								addparams : params
							}).flexReload();
						}
					}
				},
				error : function() {
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
					showCustomDiv(true, 'brandTemplateBlockEditDiv');
				}
			});
		}

		/*
		 * Delete brand template block.
		 */
		function deleteBrandTemplateBlock(blockId, blockName) {
			if (confirm("确定要删除模板块 “" + blockName + "” 吗？")) {
				$.ajax({
					url : path + "/brandTemplate/brandTemplate_deleteBrandTemplateBlockById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : blockId
					},
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showCustomDiv(false, 'brandTemplateBlockDiv', 1);
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code <= 0) {
								alert(data.message);
								showWaitDiv(false);
								showCustomDiv(true, "brandTemplateBlockDiv");
							} else {
								showWaitDiv(false);
								$("#brandTemplateBlockFlexiGrid").flexReload();
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true, "brandTemplateBlockDiv");
					}
				});
			}
		}

		/*
		 * Update brand template block idx by id.
		 */
		function updateBrandTemplateBlockIdxById(id) {
			var idx = $("#brandTemplateBlockIdx_" + id).val();
			var data = { 
					id : id, 
					idx : idx
			};
			
			$.ajax({
				url : path + "/brandTemplate/brandTemplate_updateBrandTemplateBlockIdxById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : data,
				type : "post",
				dataType : "json",
				beforeSend : function() {
					showCustomDiv(false, "brandTemplateBlockDiv", 1);
					showWaitDiv(true);
				},
				success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code <= 0) {
							alert(data.message);
							showWaitDiv(false);
							$("#brandTemplateBlockFlexiGrid").flexReload();
						} else {
							showWaitDiv(false);
							$("#brandTemplateBlockFlexiGrid").flexReload();
						}
					}
				},
				error : function() {
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
					$("#brandTemplateBlockFlexiGrid").flexReload();
				}
			});
		}
	</script>
</body>
</html>