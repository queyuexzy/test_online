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
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<thead>
					<tr>
						<th id="brandCustomerOrderTitle">
						</th>
					</tr>
				<thead>
			</table>
		</div>
		<div>
			<ul id="brandCustomerOrderTabs">
				<li><a href='#brandCustomerOrderTab'><span>添加订单</span></a></li>
			</ul>

			<div id="brandCustomerOrderTab">
				<div style="text-align:center;">
				  订单管理<input type="button" class="inputB" id="brandCustomerOrderDivAddButton" value="新增订单信息"/>
				</div>
				<div>
					<table id="brandCustomerOrderFlexiGrid"></table>
				</div>
			</div>

		</div>

		<div id="brandCustomerOrderEditDiv" class="divPopup" style="height: auto; width: 900px;">
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;" >
				<thead>
					<tr>
						<th colspan="10">
							<span id="brandCustomerOrderEditDivTitle"></span>
						</th>
					</tr>
				</thead>
				<tbody>
					
					<tr>
						<td style="text-align:right; width:70px;">订单名称：</td>
						<td >
							<input type="text" id="brandCustomerOrderEditDivName" length="50"  style="width:97%;"/>
						</td>
						<td style="text-align:right; width:60px;">金额：</td>
						<td >
							<input type="text" id="brandCustomerOrderEditDivMoney" length="20" style="width:90%;"/>							
						</td>
						<td style="text-align:right; width:70px;">开始时间：</td>
						<td>
							<input id="brandCustomerOrderEditDivStartTime" type="text" style="width:90%" readonly="readonly" onclick="WdatePicker();"/>
						</td>
						<td style="text-align:right; width:70px;">结束时间：</td>
						<td>
							<input id="brandCustomerOrderEditDivEndTime" type="text"  style="width:90%" readonly="readonly" onclick="WdatePicker();"/>
						</td>
					</tr>
					
					<tr>
						<td style="text-align:right; width:80px;">联系人姓名：</td>
						<td >
							<input id="brandCustomerOrderEditDivContactName" type="text" length="50"  style="width:97%;"/>
						</td>
						<td style="text-align:right; width:80px;">联系人电话：</td>
						<td>
							<input id="brandCustomerOrderEditDivContactTel" type="text" length="20"  style="width:97%;"/>
						</td>
						<td style="text-align:right; width:80px;">联系人Email：</td>
						<td colspan="3">
							<input id="brandCustomerOrderEditDivContactEmail" type="text" length="50"  style="width:70%;"/>
						</td>
						
					</tr>
					<tr>
					    <td style="text-align:right; width:80px;">联系人住址：</td>
						<td colspan="7">
							<input id="brandCustomerOrderEditDivContactAddress" type="text" length="255"   style="width:70%;"/>
						</td>
						
					</tr>
					<tr>
						<td style="text-align:right; width:80px;">收款人姓名：</td>
						<td>
							<input id="brandCustomerOrderEditDivPayeeName" type="text" length="50" style="width:97%;"/>
						</td>
						<td style="text-align:right; width:80px;">收款人电话：</td>
						<td>
							<input id="brandCustomerOrderEditDivPayeeTel" type="text" length="20" style="width:97%;"/>
						</td>
						<td style="text-align:right; width:80px;">收款人Email：</td>
						<td>
							<input id="brandCustomerOrderEditDivPayeeEmail" type="text" length="50" style="width:97%;"/>
						</td>
						<td style="text-align:right; width:80px;">支付方式：</td>
						<td>
							<input id="brandCustomerOrderEditDivPayWay" type="text"  length="50" style="width:97%;"/>
						</td>
					</tr>
					
					<tr>
						<td style="text-align:right; width:70px;">发票类型：</td>
						<td>
							<input id="brandCustomerOrderEditDivInvoiceType" type="text" length="50" style="width:97%"/>
						</td>
						<td style="text-align:right; width:70px;">发票抬头：</td>
						<td>
							<input id="brandCustomerOrderEditDivInvoiceHead" type="text" length="50" style="width:97%"/>
						</td>
						<td style="text-align:right; width:70px;">发票内容：</td>
						<td colspan="3">
							<input id="brandCustomerOrderEditDivInvoiceContent" type="text" length="255" style="width:97%"/>
						</td>
					</tr>
					
					<tr>
						<td style="text-align:right;">备注：</td>
						<td colspan="10"><textarea id="brandCustomerOrderEditDivRemark" style="width:99%;" rows="3"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="10">
							<input id="brandCustomerOrderEditDivConfirm" type="button" class="inputB" value="确定"/>
							<input id="brandCustomerOrderEditDivCancel" type="button" class="inputB" value="取消" onclick="showCustomDiv(false,'brandCustomerOrderEditDiv',1)"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<script type="text/javascript">
			// Web page initialize function
			$(document).ready(function() {
				var brandCustomerId = "" + <%= request.getParameter("id") %>;
				var brandCustomerName = "<%= new String(request.getParameter("companyName").getBytes("ISO8859-1"),"utf-8")%>" ;
				initBrandCustomerOrderTitle(brandCustomerName,brandCustomerId);

				$("#brandCustomerOrderTabs").tabs(1, {
					fxSlide : true,
					fxFade : true,
					fxSpeed : 'normal'
				});

				$("#brandCustomerOrderDivAddButton")[0].onclick = function() {
								showCustomDiv(false, "brandCustomerOrderEditDiv", 1);
								showBrandCustomOrderAddDiv(brandCustomerId);
							};
				initBrandCustomerOrderFlexiGrid(brandCustomerId);
				
			});


			/**
			* init the title of the page
			*/
			function initBrandCustomerOrderTitle(brandCustomerName,brandCustomerId){
				var brandCustomerOrderTitle = "客户名：  " + brandCustomerName + "  客户ID：  " + brandCustomerId;
				$("#brandCustomerOrderTitle").text(brandCustomerOrderTitle);
			}
			/* 
			 * Search
			 * Initialize the table#brandCustomerOrderFlexiGrid
			 */
			function initBrandCustomerOrderFlexiGrid(brandCustomerId) {
				var params = new Array();
			    params.push({name : "customerId", value : brandCustomerId});

				$("#brandCustomerOrderFlexiGrid").flexigrid({
					url : path + "/brandCustomerOrder/brandCustomerOrder_searchBrandCustomerOrderForFlexigrid?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					dataType : "json",
					rp : 15,
					useRp : false,
					addparams : params,
					colModel : [{
						display : "订单信息",
						width : 210,
						align : "left",
						render : function(val, row) {
							return "订单id:" + row.id + "<br/>" +
							"订单名称:" + row.name + "<br/>" +
							"金额：" + row.money + "<br/>" + 
							"订单唯一码:" + row.uniqueId + "<br/>" +
							"开始时间:" + row.startTime.substring(0,10) + "<br/>" +
							"结束时间:" + row.endTime.substring(0,10);
						}
					},{
						display : "订单状态信息",
						width : 210,
						align : "left",
						render : function(val ,row){
							return "创建人：" + row._creatorName + "<br/>" +
							"创建时间：" + row.createTime + "<br/>" +
							"更新人：" + row._updateUserName + "<br/>" + 
							"更新时间：" + row.updateTime;
						}
					},{
 						display : "客户信息",
						width : 140,
						align : "left",
						render : function(val, row) {
							return "客户姓名：" + row._customerName + "<br/>" + 
							"支付方式：" + row.payWay;
						}
 					},{
						display : "联系人信息",
						width : 220,
						align : "left",
						render : function(val, row) {
							return "联系人姓名:" + row.contactName + "<br/>" +
							"联系人电话:" + row.contactTel + "<br/>" + 
							"联系人Email:" + row.contactEmail + "<br/>" +
							"联系人住址：" + row.contactAddress;
						}
					},{
						display : "收款人：",
						width : 220,
						align : "left",
						render : function(val ,row){
							return "收款人姓名：" + row.payeeName + "<br/>" + 
							"收款人电话：" + row.payeeTel + "<br/>" + 
							"收款人Email：" + row.payeeEmail;
						}
					},{
						display : "发票信息：",
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

			function showBrandCustomOrderAddDiv(brandCustomerId){
				$("#brandCustomerOrderEditDivTitle").text("新增订单");
				$("#brandCustomerOrderEditDivName").val("");
				$("#brandCustomerOrderEditDivMoney").val("");
				$("#brandCustomerOrderEditDivStartTime").val("");
				$("#brandCustomerOrderEditDivEndTime").val("");
				$("#brandCustomerOrderEditDivPayWay").val("");
				$("#brandCustomerOrderEditDivContactName").val("");
				$("#brandCustomerOrderEditDivContactTel").val("");
				$("#brandCustomerOrderEditDivContactEmail").val("");
				$("#brandCustomerOrderEditDivContactAddress").val("");
				$("#brandCustomerOrderEditDivPayeeName").val("");
				$("#brandCustomerOrderEditDivPayeeTel").val("");
				$("#brandCustomerOrderEditDivPayeeEmail").val("");
                $("#brandCustomerOrderEditDivInvoiceType").val("");
				$("#brandCustomerOrderEditDivInvoiceHead").val("");
				$("#brandCustomerOrderEditDivInvoiceContent").val("");
				$("#brandCustomerOrderEditDivRemark").val("");

				$("#brandCustomerOrderEditDivConfirm")[0].onclick = function() {
						addBrandCustomerOrder(brandCustomerId);
					}
					showCustomDiv(true,'brandCustomerOrderEditDiv');

			}

		   /**
			 *	Add brandCustomerOrder.
			 */
			function addBrandCustomerOrder(brandCustomerId) {
				var data = {};
				if(brandCustomerId==null){
					alert("客户不能为空");
					return;
				}
				data.customerId = brandCustomerId;
				var name = $("#brandCustomerOrderEditDivName").val().trim();
				if (name == "") {
					alert("订单名称不能为空！");
					return;
				}
				data.name = name;

				var money = $("#brandCustomerOrderEditDivMoney").val().trim();
				if(money == "" || parseInt(money) == NaN){
					alert("输入的金额不合法！");
					return;
				}
				data.money = money;

				var startTime = $("#brandCustomerOrderEditDivStartTime").val();
				var endTime = $("#brandCustomerOrderEditDivEndTime").val();
				if(startTime == "" || endTime == "" || startTime > endTime){
					alert("输入的时间不合法！");
					return;
				}
				data.startTime = startTime;
				data.endTime = endTime;

				var payWay = $("#brandCustomerOrderEditDivPayWay").val().trim();
				if(payWay == ""){
					alert("支付方式不能为空！");
					return;
				}
				data.payWay = payWay;

				var contactName = $("#brandCustomerOrderEditDivContactName").val().trim();
				if(contactName == ""){
					alert("联系人姓名不能为空！");
					return;
				}
				data.contactName = contactName;

				var contactTel = $("#brandCustomerOrderEditDivContactTel").val().trim();
				if(contactTel == ""){
					alert("联系人电话不能为空！");
					return;
				}
				data.contactTel = contactTel;

                var contactEmail = $("#brandCustomerOrderEditDivContactEmail").val().trim();
                var regexpMail =/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
				if(contactEmail == "" && !regexpMail.test(contactEmail)){
					alert("联系人邮箱不能为空或者格式不正确！");
					return;
				}
				data.contactEmail = contactEmail;

				var contactAddress = $("#brandCustomerOrderEditDivContactAddress").val().trim();
				if(contactAddress == ""){
					alert("联系人地址不能为空！");
					return;
				}
				data.contactAddress = contactAddress;

				var payeeName = $("#brandCustomerOrderEditDivPayeeName").val().trim();
				if(payeeName == ""){
					alert("收款人姓名不能为空！");
					return;
				}
				data.payeeName = payeeName;

				var payeeTel = $("#brandCustomerOrderEditDivPayeeTel").val().trim();
				if(payeeTel == ""){
					alert("收款人电话不能为空！");
					return;
				}
				data.payeeTel = payeeTel;

				var payeeEmail = $("#brandCustomerOrderEditDivPayeeEmail").val().trim();
				if(payeeEmail == "" && !regexpMail.test(payeeEmail) ){
					alert("收款人Email不能为空或者格式不正确！");
					return;
				}
				data.payeeEmail = payeeEmail;

				var invoiceType = $("#brandCustomerOrderEditDivInvoiceType").val().trim();
				if(invoiceType == ""){
					alert("发票类型不能为空！");
					return;
				}
				data.invoiceType = invoiceType;

                var invoiceHead = $("#brandCustomerOrderEditDivInvoiceHead").val().trim();
				if(invoiceHead == ""){
					alert("发票抬头不能为空！");
					return;
				}
				data.invoiceHead = invoiceHead;

				var invoiceType = $("#brandCustomerOrderEditDivInvoiceType").val().trim();
				if(invoiceType == ""){
					alert("发票抬头不能为空！");
					return;
				}
				data.invoiceType = invoiceType;

				var invoiceContent = $("#brandCustomerOrderEditDivInvoiceContent").val().trim();
				if(invoiceContent == ""){
					alert("发票内容不能为空！");
					return;
				}
				data.invoiceContent = invoiceContent;

				var remark = $("#brandCustomerOrderEditDivRemark").val().trim();
				if(remark!=""){
					data.remark = remark;
				}
				var params = new Array();
			    params.push({name : "customerId", value : brandCustomerId});

				$.ajax({
					url : path + "/brandCustomer/brandCustomer_addBrandCustomerOrderByCustomerId?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : data,
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showCustomDiv(false, "brandCustomerOrderEditDiv", 1);
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code <= 0) {
								alert(data.message);
								showWaitDiv(false);
								showCustomDiv(true, "brandCustomerOrderEditDiv");
							}
							else {
								showWaitDiv(false);
								 $("#brandCustomerOrderFlexiGrid").flexOptions({
									newp : 1,
									sortname : "updateTime",
									sortorder : "desc",
									addparams : params 
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
		</script>
	</body>
</html>