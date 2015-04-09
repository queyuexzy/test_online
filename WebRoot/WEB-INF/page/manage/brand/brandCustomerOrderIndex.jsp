<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
	<head>
		<%@include file="/WEB-INF/page/include/head.jsp"%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>订单管理</title>
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
			<ul id="brandCustomerOrderTabs">
				<li><a href='#brandCustomerOrderTab'><span>订单管理</span></a></li>
			</ul>

			<div id="brandCustomerOrderTab">
				<form onsubmit="searchBrandCustomerOrderFlexiGrid();return false;">
					<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
						<thead>
							<tr>
								<th colspan="100">
									订单管理
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="text-align:right; width:60px;">订单名称：</td>
								<td style="width:100px;">
									<input id="brandCustomerOrderName" type="text" value="" style="width:100px;"/>
								</td>
								<td style="text-align:right; width:60px;">客户名称：</td>
								<td style="width:100px;">
									<input id="brandCustomerOrderCustomerName" type="text" value="" style="width:100px;"/>
								</td>
								<td style="text-align:right; width:70px;">订单唯一id：</td>
								<td style="width:100px;">
									<input id="brandCustomerOrderUniqueId" type="text" value="" style="width:100px;"/>
								</td>
								<td style="text-align:right; width:68px;">开始时间：</td>
								<td style="width:100px;">
									<input id="brandCustomerOrderBeginTime" type="text" value="" style="width:100px;" readonly="readonly" onclick="WdatePicker()"/>
								</td>
								<td style="text-align:right; width:68px;">结束时间：</td>
								<td style="width:100px;">
									<input id="brandCustomerOrderEndTime" type="text" value="" style="width:100px;" readonly="readonly" onclick="WdatePicker()"/>
								</td>
								<td>
									<input type="submit" class="inputB" value="搜索" />
									<input type="button" class="inputB" value="重置" onclick="resetBrandCustomerOrderFlexiGrid()"/>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

				<div>
					<table id="brandCustomerOrderFlexiGrid"></table>
				</div>
			</div>
		</div>

		<!-- the brandCustomerOrderEdit div-->
		<div id="brandCustomerOrderEditDiv" class="divPopup" style="height: auto; width: 700px;">
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;" >
				<thead>
					<tr>
						<th colspan="4">
							<span id="brandCustomerOrderEditDivTile"></span>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan = "2" style="text-align:center; width:50%;">订单相关信息</td>
						<td colspan="2">客户信息</td>
					</tr>
					<tr>
						<td style="text-align:left; width:75px;">订单名称：</td>
						<td style="text-align:left; width:235px;">
							<input type="text" id="brandCustomerOrderEditDivName" style="width:90%;" maxlength="50"/>
						</td>
						<td style="text-align:left; width:80px;">客户姓名：</td>
						<td>
							<input id="brandCustomerOrderEditDivCustomerName" type="text" style="width:90%;" maxlength="50"/>
						</td>
					</tr>
					<tr>
						<td style="text-align:left; width:65px;">金额：</td>
						<td>
							<input type="text" id="brandCustomerOrderEditDivMoney" style="width:90%;" maxlength="20"/>							
						</td>
						<td style="text-align:left; width:65px;">支付方式：</td>
						<td>
							<input id="brandCustomerOrderEditDivPayWay" type="text" style="width:90%;" maxlength="50"/>
						</td>
					</tr>
					<tr>
						<td style="text-align:left; width:65px;">开始时间：</td>
						<td>
							<input id="brandCustomerOrderEditDivStartTime" type="text" style="width:90%" readonly="readonly" onclick="WdatePicker();"/>
						</td>
						<td colspan="2">收款人信息</td>
					</tr>
					<tr>
						<td style="text-align:left; width:65px;">结束时间：</td>
						<td>
							<input id="brandCustomerOrderEditDivEndTime" type="text" style="width:90%" readonly="readonly" onclick="WdatePicker();"/>
						</td>
						<td style="text-align:left; width:65px;">收款人姓名：</td>
						<td> 
							<input id="brandCustomerOrderEditDivPayeeName" type="text" style="width:90%;" maxlength="50"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">联系人信息</td>
						<td style="text-align:left; width:65px;">收款人电话：</td>
						<td>
							<input id="brandCustomerOrderEditDivPayeeTel" type="text" style="width:90%;" maxlength="20"/>
						</td>
					</tr>
					<tr>
						<td style="text-align:left; width:65px;">联系人姓名：</td>
						<td>
							<input id="brandCustomerOrderEditDivContactName" type="text" style="width:90%;" maxlength="50"/>
						</td>
						<td style="text-align:left; width:65px;">收款人Email：</td>
						<td>
							<input id="brandCustomerOrderEditDivPayeeEmail" type="text" style="width:90%;" maxlength="50"/>
						</td>
					</tr>
					<tr>
						<td style="text-align:left; width:65px;">联系人电话：</td>
						<td>
							<input id="brandCustomerOrderEditDivContactTel" type="text" style="width:90%;" maxlength="20"/>
						</td>
						<td colspan="2">发票信息</td>
					</tr>
					<tr>
						<td style="text-align:left; width:65px;">联系人Email：</td>
						<td>
							<input id="brandCustomerOrderEditDivContactEmail" type="text" style="width:90%;" maxlength="50"/>
						</td>
						<td style="text-align:left; width:65px;">发票类型：</td>
						<td>
							<input id="brandCustomerOrderEditDivInvoiceType" type="text" style="width:90%" maxlength="50"/>
						</td>
					</tr>
					<tr>
						<td style="text-align:left; width:65px;">联系人住址：</td>
						<td>
							<input id="brandCustomerOrderEditDivContactAddress" type="text" style="width:90%;" maxlength="255"/>
						</td>
						<td style="text-align:left; width:65px;">发票抬头：</td>
						<td>
							<input id="brandCustomerOrderEditDivInvoiceHead" type="text" style="width:90%" maxlength="20"/>
						</td>
					</tr>
					<tr>
						<td style="text-align:left; width:65px;">备注：</td>
						<td>
							<input id="brandCustomerOrderEditDivRemark" type="text" style="width:90%" maxlength="255"/>
						</td>
						<td style="text-align:left; width:65px;">发票内容：</td>
						<td>
							<input id="brandCustomerOrderEditDivInvoiceContent" type="text" style="width:90%" maxlength="255"/>
						</td>
					</tr>

					<tr>
						<td colspan="4">
							<input id="brandCustomerOrderEditDivConfirmButton" type="button" class="inputB" value="确定"/>
							<input id="brandCustomerOrderEditDivCancelButton" type="button" class="inputB" value="取消" onclick="showCustomDiv(false,'brandCustomerOrderEditDiv',1)"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<script type="text/javascript">
			// Web page initialize function
			$(document).ready(function() {
				$("#brandCustomerOrderTabs").tabs(1, {
					fxSlide : true,
					fxFade : true,
					fxSpeed : 'normal'
				});


				initBrandCustomerOrderFlexiGrid();
				
			});

			/* 
			 * Initialize the table#gsfocusFlexiGrid
			 */
			function initBrandCustomerOrderFlexiGrid() {
				$("#brandCustomerOrderFlexiGrid").flexigrid({
					url : path + "/brandCustomerOrder/brandCustomerOrder_searchBrandCustomerOrderForFlexigrid?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					dataType : "json",
					rp : 15,
					useRp : false,
					colModel : [{
						display : "订单信息",
						width : 220,
						align : "left",
						render : function(val, row) {
							return "订单id：" + row.id + "<br/>" +
							"订单名称：" + row.name + "<br/>" +
							"订单唯一码：" + row.uniqueId + "<br/>" +
							"开始时间：" + row.startTime.substring(0,10) + "<br/>" +
							"结束时间：" + row.endTime.substring(0,10);
						}
					},{
						display : "订单状态信息",
						width : 220,
						align : "left",
						render : function(val ,row){
							return "创建人：" + row._creatorName + "<br/>" +
							"创建时间：" + row.createTime.substring(0,19) + "<br/>" +
							"最后更新人：" + row._updateUserName + "<br/>" + 
							"最后更新时间：" + row.updateTime.substring(0,19);
						}
					},{
 						display : "客户信息",
						width : 140,
						align : "left",
						render : function(val, row) {
							return "客户姓名：" + row._customerName + "<br/>" + 
							"金额：" + row.money + "<br/>" + 
							"支付方式：" + row.payWay;
						}
 					},{
						display : "联系人信息",
						width : 220,
						align : "left",
						render : function(val, row) {
							return "联系人姓名：" + row.contactName + "<br/>" +
							"联系人电话：" + row.contactTel + "<br/>" + 
							"联系人Email：" + row.contactEmail + "<br/>" +
							"联系人住址：" + row.contactAddress;
						}
					},{
						display : "收款人",
						width : 220,
						align : "left",
						render : function(val ,row){
							return "收款人姓名：" + row.payeeName + "<br/>" + 
							"收款人电话：" + row.payeeTel + "<br/>" + 
							"收款人Email：" + row.payeeEmail;
						}
					},{
						display : "发票信息",
						width : 150,
						align : "left",
						render : function(val ,row){
							return "发票类型：" + row.invoiceType + "<br/>" + 
							"发票抬头：" + row.invoiceHead + "<br/>" + 
							"发票内容：" + row.invoiceContent;
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
						width : 80,
						align : "center",
						render : function(val, row) {
							var editButton = "<input type='button' class='inputB' value='修改' onclick='showBrandCustomerOrderEditDiv(" + row.id + ")'/>";
							var product = "<input type='button' class='inputB' value='产品列表' onclick='window.open(\"" + path + "/brandCustomerOrder/brandCustomerOrder_toProduct?id=" + row.id + "\")'/>";
							return editButton + "<br/>" + product;
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
			 *Search table#brandCustomerOrderFlexiGrid
			 */
			function searchBrandCustomerOrderFlexiGrid(){
				var params = new Array;
				var brandCustomerOrderName = $("#brandCustomerOrderName").val().trim();
				if(brandCustomerOrderName != ""){
					params.push({name : "name",value : brandCustomerOrderName});
				}

				var brandCustomerOrderCustomerName = $("#brandCustomerOrderCustomerName").val().trim();
				if(brandCustomerOrderCustomerName != ""){
					params.push({name : "_customerName",value : brandCustomerOrderCustomerName});
				}

				var brandCustomerOrderUniqueId = $("#brandCustomerOrderUniqueId").val().trim();
				if(brandCustomerOrderUniqueId != ""){
					params.push({name : "uniqueId",value : brandCustomerOrderUniqueId});
				}

				var brandCustomerOrderBeginTime = $("#brandCustomerOrderBeginTime").val();
				var brandCustomerOrderEndTime = $("#brandCustomerOrderEndTime").val();

				if(brandCustomerOrderBeginTime != "" && brandCustomerOrderEndTime != "" && brandCustomerOrderEndTime != null && brandCustomerOrderBeginTime != null){
					if(brandCustomerOrderBeginTime > brandCustomerOrderEndTime){
						alert("输入的时间不合法！");
					}
				}
				
				if(brandCustomerOrderBeginTime != "" && brandCustomerOrderBeginTime != null){
					params.push({name : "startTime",value : brandCustomerOrderBeginTime});
				}
				if(brandCustomerOrderEndTime != "" && brandCustomerOrderEndTime != null){
					params.push({name : "endTime",value : brandCustomerOrderEndTime});
				}

				$("#brandCustomerOrderFlexiGrid").flexOptions({
					newp : 1,
					addparams : params
				}).flexReload();
			}

			/**
			 *reset table#brandCustomerOrderFlexiGrid
			 */
			function resetBrandCustomerOrderFlexiGrid(){
				$("#brandCustomerOrderName").val("");
				$("#brandCustomerOrderCustomerName").val("");
				$("#brandCustomerOrderUniqueId").val("");
				$("#brandCustomerOrderBeginTime").val("");
				$("#brandCustomerOrderEndTime").val("");

				$("#brandCustomerOrderFlexiGrid").flexOptions({
					newp : 1,
					addparams : []
				}).flexReload();

			}

			/**
			 *show the brancCustomerOrderEditDiv
			 */
			function showBrandCustomerOrderEditDiv(id){
				$.ajax({
					url : path + "/brandCustomerOrder/brandCustomerOrder_getBrandCustomerOrderById?" + ajaxFlag + "&tmp" + Math.round(Math.random * 100000),
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

								$("#brandCustomerOrderEditDivTile").text("修改订单相关信息");
								var data = data.data;
								$("#brandCustomerOrderEditDivName").val(data.name);
								$("#brandCustomerOrderEditDivMoney").val(data.money);
								$("#brandCustomerOrderEditDivStartTime").val(data.startTime.substring(0,10));
								$("#brandCustomerOrderEditDivEndTime").val(data.endTime.substring(0,10));
								$("#brandCustomerOrderEditDivContactName").val(data.contactName);
								$("#brandCustomerOrderEditDivContactTel").val(data.contactTel);
								$("#brandCustomerOrderEditDivContactEmail").val(data.contactEmail);
								$("#brandCustomerOrderEditDivContactAddress").val(data.contactAddress);
								$("#brandCustomerOrderEditDivPayeeName").val(data.payeeName);
								$("#brandCustomerOrderEditDivPayeeTel").val(data.payeeTel);
								$("#brandCustomerOrderEditDivPayeeEmail").val(data.payeeTel);

								$("#brandCustomerOrderEditDivInvoiceType").val(data.invoiceType);
								$("#brandCustomerOrderEditDivInvoiceHead").val(data.invoiceHead);
								$("#brandCustomerOrderEditDivInvoiceContent").val(data.invoiceContent);

								$("#brandCustomerOrderEditDivRemark").val(data.remark);

								$("#brandCustomerOrderEditDivCustomerName").val(data._customerName);
								$("#brandCustomerOrderEditDivCustomerName").attr("readonly","readonly")
								$("#brandCustomerOrderEditDivPayWay").val(data.payWay);

								$("#brandCustomerOrderEditDivConfirmButton").unbind();
								$("#brandCustomerOrderEditDivConfirmButton").click(function(){
									editBrandCustomerOrder(data);
								});

								showWaitDiv(false);
								showCustomDiv(true,"brandCustomerOrderEditDiv");

							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
					}

				});
			}

			/**
			 *edit brandCustomerOrder
			 */
			function editBrandCustomerOrder(data){
				var param = {};
				param.id = data.id;
				var changed = false;
				var name = $("#brandCustomerOrderEditDivName").val().trim();
				if(name == ""){
					alert("订单名称不能为空！");
					return;
				}
				param.name = name;
				if(name != data.name){
					changed = true;
				}

				var money = $("#brandCustomerOrderEditDivMoney").val().trim();
				if(money == ""){
					alert("输入的金额不合法！");
					return;
				}
				param.money = money;
				if(money != data.money){
					changed = true;
				}

				var startTime = $("#brandCustomerOrderEditDivStartTime").val();
				var endTime = $("#brandCustomerOrderEditDivEndTime").val();
				if(startTime == "" || endTime == "" || startTime > endTime){
					alert("输入的时间不合法！");
					return;
				}
				param.startTime = startTime;
				if(startTime != data.startTime){
					changed = true;
				}
				param.endTime = endTime;
				if(endTime != data.endTime){
					changed = true;
				}
			
				var payWay = $("#brandCustomerOrderEditDivPayWay").val().trim();
				if(payWay == ""){
					alert("输入的支付方式不合法！");
					return;
				}
				param.payWay = payWay;
				if(payWay != data.payWay){
					changed = true;
				}

				var contactName = $("#brandCustomerOrderEditDivContactName").val().trim();
				if(contactName == ""){
					alert("输入的联系人姓名不合法！");
					return;
				}
				param.contactName = contactName;
				if(contactName != data.contactName){
					changed = true;
				}

				var contactTel = $("#brandCustomerOrderEditDivContactTel").val().trim();
				if(contactTel == ""){
					alert("输入的联系人电话不合法！");
					return;
				}
				param.contactTel = contactTel;
				if(contactTel != data.contactTel){
					changed = true;
				}

				var contactEmail = $("#brandCustomerOrderEditDivContactEmail").val().trim();
				if(contactEmail == ""){
					alert("输入的联系人Email不合法！");
					return;
				}
				param.contactEmail = contactEmail;
				if(contactEmail != data.contactEmail){
					changed = true;
				}

				var contactAddress = $("#brandCustomerOrderEditDivContactAddress").val().trim();
				if(contactAddress == ""){
					alert("输入的联系人住址不合法！");
					return;
				}
				param.contactAddress = contactAddress;
				if(contactAddress != data.contactAddress){
					changed = true;
				}

				var payeeName = $("#brandCustomerOrderEditDivPayeeName").val().trim();
				if(payeeName == ""){
					alert("输入的收款人姓名不合法！");
					return;
				}
				param.payeeName = payeeName;
				if(payeeName != data.payeeName){
					changed = true;
				}

				var payeeTel = $("#brandCustomerOrderEditDivPayeeTel").val().trim();
				if(payeeTel == ""){
					alert("输入的收款人电话不合法！");
					return;
				}
				param.payeeTel = payeeTel;
				if(payeeTel != data.payeeTel){
					changed = true;
				}

				var payeeEmail = $("#brandCustomerOrderEditDivPayeeEmail").val().trim();
				if(payeeEmail == ""){
					alert("输入的收款人Email不合法！");
					return;
				}
				param.payeeEmail = payeeEmail; 

				if(payeeEmail != data.payeeEmail){
					changed = true;
				}

				var invoiceType = $("#brandCustomerOrderEditDivInvoiceType").val().trim();
				if(invoiceType == ""){
					alert("输入的发票类型不合法！");
					return;
				}
				param.invoiceType = invoiceType;
				if(invoiceType != data.invoiceType){
					changed = true;
				}

				var invoiceHead = $("#brandCustomerOrderEditDivInvoiceHead").val().trim();
				if(invoiceHead == ""){
					alert("输入的发票抬头不合法！");
					return;
				}
				param.invoiceHead = invoiceHead;
				if(invoiceHead != data.invoiceHead){
					changed = true;
				}

				var invoiceContent = $("#brandCustomerOrderEditDivInvoiceContent").val().trim();
				if(invoiceContent == ""){
					alert("输入的发票内容不合法！");
					return;
				}
				param.invoiceContent = invoiceContent;
				if(invoiceContent != data.invoiceContent){
					changed = true;
				}

				var remark = $("#brandCustomerOrderEditDivRemark").val().trim();
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
					showCustomDiv(false,"brandCustomerOrderEditDiv",1);
					return;
				}

				$.ajax({
					url : path + "/brandCustomerOrder/brandCustomerOrder_updateBrandCustomerOrderById?" + ajaxFlag + "&tmp" + Math.round(Math.random() * 100000),
					data : param,
					type : "post",
					dataType : "json",
					beforeSend : function(){
						showCustomDiv(false,"brandCustomerOrderEditDiv",1);
						showWaitDiv(true);
					},
					success : function(data){
						if(ajaxResponseValidate(data)){
							if(data.code <= 0){
								alert(data.message);
								showWaitDiv(false);
								showCustomDiv(true,"brandCustomerOrderEditDiv");
							}else{
								showWaitDiv(false);
								$("#brandCustomerOrderFlexiGrid").flexReload();
							}
						}
					},
					error : function(){
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true,"brandCustomerOrderEditDiv");
					}

				});
			}
		</script>
	</body>
</html>