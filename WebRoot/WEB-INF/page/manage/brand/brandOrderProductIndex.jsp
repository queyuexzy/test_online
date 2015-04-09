<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
	<head>
		<%@include file="/WEB-INF/page/include/head.jsp"%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>产品管理</title>
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
	<body style="overflow:hidden;">
		<div>
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<thead>
					<tr>
						<th id="brandOrderProductTitle">
						</th>
					</tr>
				<thead>
			</table>
		</div>
		<div>
			<ul id="brandOrderProductTabs">
				<li><a href="#brandOrderProductTab"><span>产品管理</span></a></li>
			</ul>

			<div id="brandOrderProductTab">
				<form onsubmit="searchBrandOrderProductFlexiGrid();return false;">
					<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
						<thead class="tableC" cellpadding="0" cellspacing="0" style="width:100%">
							<tr>
								<th colspan="100">
									产品管理
									<input id="brandOrderProductAddButton" type="button" class="inputB" value="增加产品" onclick="showBrandOrderProductEditDiv('add')"/>
								</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td style="text-align:right; width:60px;">产品名称：</td>
								<td style="width:100px;">
									<input id="brandOrderProductName" type="text" value="" style="width:100px;"/>
								</td>
								<td>
									<input type="submit" class="inputB" value="搜索" />
									<input type="button" class="inputB" value="重置" onclick="resetBrandOrderProductFlexiGrid()"/>
								</td>
							</tr>


						</tbody>

					</table>
				</form>
				<div>
					<table id="brandOrderProductFlexiGrid"></table>
				</div>
			</div>
		</div>
		<div id="brandOrderProductEditDiv" class="divPopup" style="height:auto; width:400px;" >
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<thead>
					<tr>
						<th colspan="2"><span id="brandOrderProductEditDivTile"></span></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align:left; width:65px;">产品名称：</td>
						<td>
							<input type="text" id="brandOrderProductEditDivName" style="width:90%;" maxlength="20"/>							
						</td>
					</tr>
					<tr>
						<td style="text-align:left; width:65px;">时间：</td>
						<td style="text-align:left; width:65px;">
							<input type="text" id="brandOrderProductEditDivStartTime" style="width:45%;" maxlength="20" readonly='readonly' onclick="WdatePicker({minDate:'%y-%M-%d'})"/>--
							<input type="text" id="brandOrderProductEditDivEndTime"   style="width:45%;" readonly="readonly" onclick="WdatePicker({minDate:'#F{$dp.$D(\'brandOrderProductEditDivStartTime\',{d:1});}'})"/>
						</td>
					</tr>
					<tr>
						<td style="text-align:left; width:65px">备注：</td>
						<td>
							<input type="text" id="brandOrderProductEditDivRemark" style="width:90%;" maxlength="50"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input id="brandOrderProductEditDivConfirmButton" type="button" class="inputB" value="确定"/>
							<input id="brandOrderProductEditDivCancelButton" type="button" class="inputB" value="取消" onclick="showCustomDiv(false,'brandOrderProductEditDiv',1)"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="brandTemplateDiv" class="divPopup" style="width:485px;">
			<form onsubmit="searchBrandTemplateFlexiGrid(); return false;">
				<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
					<thead>
						<tr>
							<th colspan="10">
								选择模板
								<input type="button" class="inputB" value="关闭" onclick="showCustomDiv(false,'brandTemplateDiv',1)">
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="text-align:right; width:60px;">模板名称：</td>
							<td style="width:100px;">
								<input id="brandTemplateDivSearchName" type="text" value="" style="width:100px;"/>
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

		<!-- Product's hit div -->
		<div id="brandHitProductDiv" class="divPopup" style="height: auto; width: 800px;">
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<thead>
					<tr>
						<th colspan="4">
							<span id="brandHitProductDivTitle"></span>
							<input type="button" class="inputB divPopupClose" value="关闭" onclick="showCustomDiv(false, 'brandHitProductDiv', 1); $('#brandOrderProductFlexiGrid').flexReload();"/>
						</th>
					</tr>
				</thead>
			</table>

			<form id="brandHitProductDivAddForm">
				<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
					<tbody>
						<tr>
							<td style="width:80px;">命中词：</td>
							<td style="width:261px;">
								<input id="brandHitProductDivAddHit" type="text" value="" style="width:95%;" />
							</td>
							<td style="text-align:left;">
								<input id="brandHitProductDivAddButton" type="submit" value="添加" class="inputB" /><font color="red">命中词不能包含“|”</font>
							</td>
						</tr>
					</tbody>
				</table>
			</form>

			<form id="brandHitProductDivSearchForm">
				<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
					<tbody>
						<tr>
							<td style="width:80px;">命中词：</td>
							<td style="width:200px;">
								<input id="brandHitProductDivSearchHit" type="text" value="" style="width:95%;" />
							</td>
							<td style="text-align:left;">
								<input type="submit" class="inputB" value="搜索" />
								<input id="brandHitProductDivReset" type="button" class="inputB" value="重置"/>
							</td>
						</tr>
					</tbody>
				</table>
			</form>

			<div>
				<table id="brandHitProductFlexiGrid"></table>
			</div>
		</div>

		<!-- Add/Edit product's hit div-->
		<div id="brandHitProductEditDiv" class="divPopup" style="height: auto; width: 400px;">
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<thead>
					<tr>
						<th colspan="2">
							<span id="brandHitProductEditDivTitle"></span>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align:right; width:65px;">命中词：</td>
						<td style="width:335px;">
							<input id="brandHitProductEditDivHit" type="text" value="" length="255" style="width:90%;" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input id="brandHitProductEditDivConfirm" type="button" class="inputB" value="确定" />
							<input type="button" class="inputB" value="取消" onclick="showCustomDiv(false, 'brandHitProductEditDiv', 1); showCustomDiv(true, 'brandHitProductDiv');" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>



		<script type="text/javascript">
		var orderId = "<%=request.getParameter("id")%>";
		// Web page initialize function
		$(document).ready(function() {
			setBrandOrderProductTitle();
			$("#brandOrderProductTabs").tabs(1, {
				fxSlide : true,
				fxFade : true,
				fxSpeed : 'normal'
			});
			initBrandOrderProductFlexiGrid();
			initBrandTemplateFlexiGrid();
			initBrandHitProductFlexiGrid()
		});

		/**
		 *set the title of the page
		 */
		 //the param to be put in the request
		function setBrandOrderProductTitle(){
			var brandOrderProductTitle;
			$.ajax({
				url :  path + "/brandCustomerOrder/brandCustomerOrder_getBrandCustomerOrderById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : {
					id : orderId
				},
				type : "post",
				dataType : "json",
				beforeSend : function(){
					// showWaitDiv(true);
				},
				success : function(data){
					if(data.code <= 0){
						alert(data.message);
						// showWaitDiv(false);
					}else{
						// showWaitDiv(false);
						brandOrderProductTitle = "客户名：" + data.data._customerName + " 订单名：" + data.data.name + " 唯一ID：" + data.data.uniqueId;
					}
					if(brandOrderProductTitle != null && brandOrderProductTitle != ""){
						$("#brandOrderProductTitle").text(brandOrderProductTitle);
					}else{
						alert("查询不到结果！");
						window.close(path + "/brandCustomerOrder/brandCustomerOrder_toProduct");
					}
				},
				error : function(){
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					// showWaitDiv(false);
					window.close(path + "/brandCustomerOrder/brandCustomerOrder_toProduct");
				}
			});
		}
		
		/**
		 *init table#brandOrderProductFlexiGrid
		 */
		function initBrandOrderProductFlexiGrid() {
			$("#brandOrderProductFlexiGrid").flexigrid({
				url : path + "/brandCustomerOrder/brandCustomerOrder_searchBrandOrderProductForFlexigrid?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				dataType : "json",
				addparams : [{name : "orderId", value : "<%=request.getParameter("id")%>"}],
				rp : 15,
				useRp : false,
				colModel : [{
					display : "产品名称",
					width : 120,
					align : "left",
					render : function(val, row) {
						return  row.name ;
					}
				},{
					display : "命中词数",
					width : 100,
					align : "center",
					render : function(val, row) {
						if (row.templateId) {
							return "<a href='javascript:void(0)' onclick='showBrandHitProductDiv(\"" + row.id + "\", \"" + row.name + "\")'>" + row._totalHit + "</a><br/>";
						} else {
							return "<font color='red'>请先选择模板</font>";
						}
					}
				},{	
					display : "模板名称",
					width : 140,
					align : "left",
					render : function(val, row) {
						var result;
						if(row._templateName == null){
							result = "未选择模板！" + "<br/>" + "<input type='button' class='inputB' value='添加模板' onclick='showBrandTemplateDiv(\"" + row.templateId + "\" , \"" + row.id + "\");'/>";
						}else{
							result = "<a id='brandOrderProductTemplateNameLink' href='javascript:;' onclick='showBrandTemplateDiv(\"" + row.templateId + "\" , \"" +row.id+ "\"," + row._totalHit + ");'>" + row._templateName + "</a>";
						}
						return result;
					}
				},{
					display : "状态信息",
					width : 220,
					align : "left",
					render : function(val, row) {
						return "创建人：" + row._creatorName + "<br/>" +
						"创建时间：" + row.createTime.substring(0,19) + "<br/>" + 
						"最后更新人：" + row._updateUserName + "<br/>" +
						"最后更新时间：" + row.updateTime.substring(0,19);					}
				},{
					display : "发布状态",
					width : 300,
					align : "left",
					render : function(val ,row){
						var status, button;
						var previewButton = "<input type='button' class='inputB' value='预览' onclick='previewBrandProduct(" + row.id + ")'>";
						if (row.publishFlag) {
							// status = "已发布<br/> 发布人: " + row._publishUserName + "<br/>发布时间: " + row.publishTime.substring(0, 19) + "<br/>" + row.publishResult;
							status = "已发布";
							button = "<input type='button' class='inputB' value='撤销发布' onclick='updateBrandOrderProductPublishFlag(\"unpublish\" , " + row.id + ")' />";
							return status + "<br/>" + button + previewButton;
						} else {
							if (row.publishTime) {
								// status = "修改前发布过<br/> 上次发布人：" + row._publishUserName + "<br/>上次发布时间：" + row.publishTime.substring(0, 19);;
								status = "发布后有修改";
								button1 = "<input type='button' class='inputB' value='撤销发布' onclick='updateBrandOrderProductPublishFlag(\"unpublish\" , " + row.id + ")' />";
								button2 = "<input type='button' class='inputB' value='重新发布' onclick='updateBrandOrderProductPublishFlag(\"publish\" , " + row.id + ")' />";
								return status + "<br/>" + button1 + button2 + previewButton;
							} else {
								status = "未发布";
								button = "<input type='button' class='inputB' value='发布' onclick='updateBrandOrderProductPublishFlag(\"publish\" , " + row.id + ")' />";
								return status + "<br/>" + button + previewButton;
							}
						}
					}
				},{
					display : "备注",
					width : 100,
					align : "left",
					render : function(val ,row){
						return row.remark;
					}
				},{
					display : "操作",
					width : 200,
					align : "center",
					render : function(val, row) {
						var editButton = "<input type='button' class='inputB' value='修改' onclick='showBrandOrderProductEditDiv(\"edit\" " + "," + row.id + ")'/>";
						var deleteButton = "<input type='button' class='inputB' value='删除' onclick='deleteBrandOrderProductById(\""+ row.id +"\")'>";
						var editProductButton = "<br/><input type='button' class='inputB' value='编辑产品' onclick='window.open(\"" + path + "/brandCustomerOrder/brandCustomerOrder_toProductValue?productId=" + row.id + "\")' />";
						
						return editButton + deleteButton + editProductButton;
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
					if (data.data) {
						// $("#lastLoadTime").text(data.data.substring(0, 19));
					}
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
		 * Preview the brand product.
		 */
		function previewBrandProduct(productId) {
			window.open(path + "/brandCustomerOrder/brandCustomerOrder_previewBrandProductById?" + ajaxFlag + "&id=" + productId + "&tmp=" + Math.round(Math.random() * 100000))
		}

		/**
		 *search table#brandOrderProductFlexiGrid
		 */
		function searchBrandOrderProductFlexiGrid(){
			var brandOrderProductName = $("#brandOrderProductName").val();

			var params = new Array;
			params.push({name : "orderId",value : "<%=request.getParameter("id")%>"});
			if(brandOrderProductName != "" && brandOrderProductName != null){
				params.push({name : "name",value : brandOrderProductName});
			}
			$("#brandOrderProductFlexiGrid").flexOptions({

				newp : 1,
				addparams : params
			}).flexReload();

		}

		/**
		 *reset table#brandOrderProductFlexiGrid
		 */
		function resetBrandOrderProductFlexiGrid(){
			$("#brandOrderProductName").val("");
			$("#brandOrderProductOrderName").val("");
			$("#brandOrderProductFlexiGrid").flexOptions({
				newp : 1,
				addparams : [{name : "orderId",value :"<%=request.getParameter("id")%>"}]
			}).flexReload();
		}

		/**
		 *show the div whose id=brandOrderProductEditDiv
		 */
		function showBrandOrderProductEditDiv(mode,id){
			if(mode == 'add'){

				$("#brandOrderProductEditDivTile").text("增加产品信息");
				showCustomDiv(true,"brandOrderProductEditDiv");
				$("#brandOrderProductEditDivName").val("");
				$("#brandOrderProductEditDivRemark").val("");
				$("#brandOrderProductEditDivStartTime").val("");
				$("#brandOrderProductEditDivEndTime").val("");

				$("#brandOrderProductEditDivConfirmButton").unbind();
				$("#brandOrderProductEditDivConfirmButton").click(function(){
					addBrandOrderProduct();
				});
			}else{
				$.ajax({
					url : path + "/brandCustomerOrder/brandCustomerOrder_getBrandOrderProductById?" + ajaxFlag + "&tmp" + Math.round(Math.random * 100000),
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

								$("#brandOrderProductEditDivTile").text("修改产品相关信息");
								var data = data.data;
								$("#brandOrderProductEditDivName").val(data.name);
								$("#brandOrderProductEditDivRemark").val(data.remark);
								$("#brandOrderProductEditDivStartTime").val(data.startTime.substring(0,10));
								$("#brandOrderProductEditDivEndTime").val(data.endTime == null ? data.endTime : data.endTime.substring(0,10));

								$("#brandOrderProductEditDivConfirmButton").unbind();
								$("#brandOrderProductEditDivConfirmButton").click(function(){
									editBrandOrderProduct(data);
								});
								showWaitDiv(false);
								showCustomDiv(true,"brandOrderProductEditDiv");
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

		/**
		 *edit BrandOrderProduct
		 */
		function editBrandOrderProduct(data){
			var param = {};
			param.id = data.id;
			var changed = false;
			var name = $("#brandOrderProductEditDivName").val().trim();
			if(name == ""){
				alert("产品名称不能为空！");
				return;
			}
			param.name = name;
			if(name != data.name){
				changed = true;
			}
			var startTime = $("#brandOrderProductEditDivStartTime").val();
			if(startTime == ""){
				alert("开始时间不能为空！");
				return;
			}			
			param.startTime = startTime;
			if(startTime != data.startTime){
				changed = true;
			}
			var endTime = $("#brandOrderProductEditDivEndTime").val();
			if(endTime == ""){
				if(data.endTime != null){
					changed = true;
				}
			}else{
				param.endTime = endTime;
				if(data.endTime != endTime){
					changed = true;
				}
			}

			var remark = $("#brandOrderProductEditDivRemark").val().trim();
			if(remark == ""){
				if(data.remark != null){
					changed = true;
				}
			}else{
				param.remark = remark;
				if(data.remark != remark){
					changed = true;
				}
			}

			if(!changed){
				showCustomDiv(false,"brandOrderProductEditDiv",1);
				return;
			}

			$.ajax({
				url : path + "/brandCustomerOrder/brandCustomerOrder_updateBrandOrderProductById?" + ajaxFlag + "&tmp" + Math.round(Math.random() * 100000),
				data : param,
				type : "post",
				dataType : "json",
				beforeSend : function(){
					showCustomDiv(false,"brandOrderProductEditDiv",1);
					showWaitDiv(true);
				},
				success : function(data){
					if(ajaxResponseValidate(data)){
						if(data.code <= 0){
							alert(data.message);
							showWaitDiv(false);
							showCustomDiv(true,"brandOrderProductEditDiv");
						}else{
							showWaitDiv(false);
							$("#brandOrderProductFlexiGrid").flexReload();
						}
					}
				},
				error : function(){
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
					showCustomDiv(true,"brandOrderProductEditDiv");
				}
			});
		}

		/**
		 *dekete BrandOrderProduct by id
		 */
		function deleteBrandOrderProductById(id){
			if(!confirm("确定要删除该产品信息么？")){
				return;
			}
			$.ajax({
					url : path + "/brandCustomerOrder/brandCustomerOrder_deleteBrandOrderProductById?" + ajaxFlag + "&tmp" + Math.round(Math.random() * 100000),
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
							}
							showWaitDiv(false);
							$("#brandOrderProductFlexiGrid").flexReload();
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						$("#brandOrderProductFlexiGrid").flexReload();
					}
				});
		}

		/**
		 *add BrandOrderProduct
		 */
		function addBrandOrderProduct(){
			var param = {
				orderId : orderId
			};
			var name = $("#brandOrderProductEditDivName").val().trim();
			var remark = $("#brandOrderProductEditDivRemark").val().trim();

			var startTime = $("#brandOrderProductEditDivStartTime").val();
			if(startTime == "" || startTime == null){
				alert("开始时间不能为空！");
				return;
			}			
			param.startTime = startTime;
			
			var endTime = $("#brandOrderProductEditDivEndTime").val();
			if(endTime != "" && endTime != null){
				param.endTime = endTime;
			}

			if(name == "" || name == null){
				alert("输入的姓名不合法！");
				return;
			}
			param.name = name;

			if(remark != "" && remark != null){
				param.remark = remark;
			}

			$.ajax({
				url : path + "/brandCustomerOrder/brandCustomerOrder_addBrandOrderProduct?" + ajaxFlag + "&tmp" + Math.round(Math.random() * 100000),
				data : param,
				type : "post",
				dataType : "json",
				beforeSend : function(){
					showCustomDiv(false,"brandOrderProductEditDiv",1);
					showWaitDiv(true);
				},
				success : function(data){
					if(ajaxResponseValidate(data)){
							if(data.code <= 0){
								alert(data.message);
							}
							showWaitDiv(false);
							// showCustomDiv(false,"brandOrderProductEditDiv");
							$("#brandOrderProductFlexiGrid").flexReload();
						}
				},
				error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true,"brandOrderProductEditDiv");
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
				autoload : false,
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
							return "<img src=\"data:image/gif;base64," + row.previewImage + "\" width='100%' />";
						}
					}
				},{
					display : "操作",
					width : 250,
					align : "center",
					render : function(val, row) {
						var result;
						if(row.name != null && row.id == globalTemplateId){
							result = "当前模板";
						}else{
							result = "<input type='button' class='inputB' value='设为模板' onclick='updateBrandOrderProductTemplate(" + row.id+ ")'/>";
						}
						return result;
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

		/**
		 *	Search table brandTemplateFlexiGrid.
		 */
		function searchBrandTemplateFlexiGrid() {
			var params = new Array();

			var name = $("#brandTemplateDivSearchName").val().trim();
			if (name != "") {
				params.push({name : "name", value : name});
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
			$("#brandTemplateDivAddName").val("");

			$("#brandTemplateFlexiGrid").flexOptions({
				newp : 1,
				addparams : []
			}).flexReload();
		}

		/**
		 * show the brandTemplateDiv
		 */
		var globalTemplateId;
		var globalProductId;
		function showBrandTemplateDiv(templateId,productId, _totalHit){
			if (_totalHit > 0) {
				alert("产品已绑定命中词，请先删除命中词后，再绑定模板");
				return;
			}

			showCustomDiv(true,"brandTemplateDiv");
			globalTemplateId = templateId;
			globalProductId = productId;
			$("#brandTemplateFlexiGrid").flexReload();
		}

		/**
		 *update the template of the product
		 */
		function updateBrandOrderProductTemplate(templateId){
			var param = {};
			param.id = globalProductId;
			param.templateId = templateId;
			$.ajax({
					url : path + "/brandCustomerOrder/brandCustomerOrder_updateBrandOrderProductTemplateById?" + ajaxFlag + "&tmp" + Math.round(Math.random() * 100000),
					data : param,
					type : "post",
					dataType : "json",
					beforeSend : function(){
						showCustomDiv(false,"brandTemplateDiv",1);
						showWaitDiv(true);
					},
					success : function(data){
						if(ajaxResponseValidate(data)){
							if(data.code <= 0){
								alert(data.message);
								showWaitDiv(false);
								showCustomDiv(true,"brandTemplateDiv");
							}else{
								showWaitDiv(false);
								showCustomDiv(false,"brandTemplateDiv");
								$("#brandOrderProductFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true,"brandTemplateDiv");
					}
				});

		}

		function updateBrandOrderProductPublishFlag(status,productId){
			var publishFlag = false;
			if(status == "unpublish"){
				if(!confirm("您确定要撤销发布吗？")){
					return;
				}
			}
			if(status == "publish"){
				publishFlag = true;
			}
			$.ajax({
					url : path + "/brandCustomerOrder/brandCustomerOrder_updateBrandOrderProductPublishFlagById?" + ajaxFlag + "&tmp" + Math.round(Math.random() * 100000),
					data : {
						id : productId,
						publishFlag : publishFlag
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
								$("#brandOrderProductFlexiGrid").flexReload();
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
		 * Initialize the brandHitProductFlexiGrid
		 */
		function initBrandHitProductFlexiGrid() {
			$("#brandHitProductFlexiGrid").flexigrid({
				url : path + "/brandCustomerOrder/brandCustomerOrder_searchBrandHitProductForFlexigrid?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				dataType : "json",
				autoload : false,
				rp : 15,
				useRp : false,
				colModel : [{
					display : "命中词",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.hit;
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
						var editButton = "<input type='button' class='inputB' value='修改' onclick='showBrandTemplateBlockEditDiv(\"edit\", \"" + row.productId + "\", \"" + row.id + "\")' />";
						var deleteButton = "<input type='button' class='inputB' value='删除' onclick='deleteBrandHitProduct(\"" + row.id + "\", \"" + row.hit + "\")' />";
						return editButton + deleteButton;
					}
				}],
				width : "auto",
				height : "370",
				showToggleBtn : false,
				showTableToggleBtn : false,
				singleSelect : true,
				onSubmit : function() {
					var brandHitProductDiv = $("#brandHitProductDiv")[0];
					if (brandHitProductDiv.style.display == "display") {
						showCustomDiv(false, "brandHitProductDiv", 1);
					}
					showWaitDiv(true);
					return true;
				},
				onSuccess : function(grid, data) {
					showWaitDiv(false);
					var brandHitProductDiv = $("#brandHitProductDiv")[0];
					if (brandHitProductDiv.style.display == "" || brandHitProductDiv.style.display == "none") {
						showCustomDiv(true, 'brandHitProductDiv');
					}
					$("#brandHitProductDivAddHit").select();
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
		 * Search the table brandHitProductFlexiGrid
		 */
		function searchBrandHitProductFlexiGrid(productId) {
			var params = new Array();
			params.push({name : "productId", value : productId});

			var hit = $("#brandHitProductDivSearchHit").val().trim();
			if (hit != "") {
				params.push({name : "hit", value : hit});
			}

			$("#brandHitProductFlexiGrid").flexOptions({
				newp : 1,
				addparams : params
			}).flexReload();
		}

		/**
		 * Reset the table brandHitProductFlexiGrid
		 */
		function resetBrandHitProductFlexiGrid(productId) {
			$("#brandHitProductDivAddHit").val("");
			$("#brandHitProductDivSearchHit").val("");
			$("#brandHitProductDivAddHit").select();

			var params = new Array();
			params.push({name : "productId", value : productId});

			$("#brandHitProductFlexiGrid").flexOptions({
				newp : 1,
				addparams : params
			}).flexReload();
		}

		/*
		 * Show brandHitProduct div.
		 */
		function showBrandHitProductDiv(productId, productName) {
			$("#brandHitProductDivTitle").text("产品 “" + productName + "” 的命中词列表");
			$("#brandHitProductDivAddForm")[0].onsubmit = function() {
				addBrandHitProduct(productId);
				return false;
			};
			$("#brandHitProductDivAddHit").val("");
			$("#brandHitProductDivSearchHit").val("");
			$("#brandHitProductDivAddHit").select();
			$("#brandHitProductDivSearchForm")[0].onsubmit = function() {
				searchBrandHitProductFlexiGrid(productId);
				return false;
			};
			$("#brandHitProductDivReset")[0].onclick = function() {
				resetBrandHitProductFlexiGrid(productId);
			}
			searchBrandHitProductFlexiGrid(productId);
		}

		/*
		 *	Show the brandHitProductEdit div
		 */
		function showBrandTemplateBlockEditDiv(mode, productId, hitId) {
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
					url : path + "/brandCustomerOrder/brandCustomerOrder_getBrandHitProductById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : hitId
					},
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showCustomDiv(false, "brandHitProductDiv", 1);
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code <= 0) {
								alert(data.message);
								showWaitDiv(false);
								$("#brandHitProductFlexiGrid").flexReload();
							} else {
								$("#brandHitProductEditDivTitle").text("修改命中词");
								var hit = data.data;
								showWaitDiv(false);

								$("#brandHitProductEditDivHit").val(hit.hit);
								$("#brandHitProductEditDivConfirm")[0].onclick = function() {
									editBrandHitProduct(productId, hit);
								}
								showCustomDiv(true, "brandHitProductEditDiv");
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true, 'brandHitProductDiv');
					}
				});
			}
		}

		/*
		 * Add product's hit
		 */
		function addBrandHitProduct(productId) {
			var data = {productId : productId};
			var hit = $("#brandHitProductDivAddHit").val().trim();
			if (hit == "") {
				alert("命中词不能为空！");
				return;
			}
			if (hit.indexOf("|") >= 0) {
				alert("命中词不能包含“|”");
				return;
			}
			data.hit = hit;

			$.ajax({
				url : path + "/brandCustomerOrder/brandCustomerOrder_addBrandHitProduct?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : data,
				type : "post",
				dataType : "json",
				beforeSend : function() {
					showCustomDiv(false, "brandHitProductDiv", 1);
					showWaitDiv(true);
				},
				success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code <= 0) {
							showWaitDiv(false);
							bean = data.data;
							if (bean == null) {
								alert("操作失败！");
							}
							else {
								//The hit of the bean to be added has already exists in the channel
								alert("命中词已经存在于当前频道！请检查！\n【详情】：\n冲突的命中词：" + bean.hit + "\n--------------------\n订单名：" + bean._orderName + "\n订单号：" + bean._orderUniqueId + "\n客户公司名称：" + bean._customerCompanyName + "\n--------------------\n频道名称：" + bean._channelName + "\n产品名称：" + bean._productName);
							}
							showCustomDiv(true, "brandHitProductDiv");
							$("#brandHitProductDivAddHit").select();
						} else {
							showWaitDiv(false);
							$("#brandHitProductDivAddHit").val("");
							$("#brandHitProductDivSearchHit").val("");

							var params = new Array();
							params.push({name : "productId", value : productId});
							$("#brandHitProductFlexiGrid").flexOptions({
								newp : 1,
								addparams : params,
							}).flexReload();
						}
					}
				},
				error : function() {
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
					showCustomDiv(true, "brandHitProductDiv");
				}
			});
		}

		/*
		 * Edit product's hit.
		 */
		function editBrandHitProduct(productId, oldHit) {
			var data = {
				id : oldHit.id
			};
			
			var changed = false;
			
			var hit = $("#brandHitProductEditDivHit").val().trim();
			if (hit == "") {
				alert("命中词不能为空！");
				return;
			}
			if (hit.indexOf("|") >= 0) {
				alert("命中词不能包含“|”");
				return;
			}
			data.hit = hit;
			if (hit != oldHit.hit) {
				changed = true;
			}

			if (! changed) {
				showCustomDiv(false, "brandHitProductEditDiv", 1);
				showCustomDiv(true, "brandHitProductDiv");
				return;
			}

			$.ajax({
				url : path + "/brandCustomerOrder/brandCustomerOrder_updateBrandHitProductById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : data,
				type : "post",
				dataType : "json",
				beforeSend : function() {
					showCustomDiv(false, 'brandHitProductEditDiv', 1);
					showWaitDiv(true);
				},
				success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code <= 0) {
							showWaitDiv(false);
							bean = data.data;
							if (bean == null) {
								alert("操作失败！");
							}
							else {
								//The hit of the bean to be updated has already exists in the channel
								alert("命中词已经存在于当前频道！请检查！\n【详情】：\n冲突的命中词：" + bean.hit + "\n--------------------\n订单名：" + bean._orderName + "\n订单号：" + bean._orderUniqueId + "\n客户公司名称：" + bean._customerCompanyName + "\n--------------------\n频道名称：" + bean._channelName + "\n产品名称：" + bean._productName);
							}
							showCustomDiv(true, 'brandHitProductEditDiv');
						}
						else {
							showWaitDiv(false);
							$("#brandHitProductDivAddHit").val("");
							$("#brandHitProductDivSearchHit").val("");

							var params = new Array();
							params.push({
								name : "productId", 
								value : productId
							});

							$("#brandHitProductFlexiGrid").flexOptions({
								newp : 1,
								addparams : params
							}).flexReload();
						}
					}
				},
				error : function() {
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
					showCustomDiv(true, 'brandHitProductEditDiv');
				}
			});
		}

		/*
		 * Delete product's hit.
		 */
		function deleteBrandHitProduct(hitId, hitName) {
			if (confirm("确定要删除命中词 “" + hitName + "” 吗？")) {
				$.ajax({
					url : path + "/brandCustomerOrder/brandCustomerOrder_deleteBrandHitProductById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : hitId
					},
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showCustomDiv(false, 'brandHitProductDiv', 1);
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code <= 0) {
								alert(data.message);
								showWaitDiv(false);
								showCustomDiv(true, "brandHitProductDiv");
							} else {
								showWaitDiv(false);
								$("#brandHitProductFlexiGrid").flexReload();
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true, "brandHitProductDiv");
					}
				});
			}
		}
		</script>
	</body>
</html>