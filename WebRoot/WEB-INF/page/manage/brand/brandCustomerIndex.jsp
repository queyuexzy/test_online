<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
	<head>
		<%@include file="/WEB-INF/page/include/head.jsp"%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>品牌专区客户管理</title>
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
		em {color: red;}
		</style>
	</head>
	<body style="overflow:hidden;">
		<div>
			<ul id="brandTabs">
				<li><a href='#brandCustomerTab'><span>客户管理</span></a></li>
			</ul>

			<div id="brandCustomerTab">
				<form onsubmit="searchBrandCustomerFlexiGrid();return false;">
					<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
						<thead>
							<tr>
								<th colspan="10">
									客户信息
									<input type="button" class="inputB" value="新增客户信息" onclick="showBrandCustomerEditDiv('add')" />
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="text-align:right; width:60px;">公司名：</td>
								<td style="width:100px;">
									<input id="brandCustomerDivSearchCompanyName" type="text"  style="width:100px;"/>
								</td>
								<td style="text-align:right; width:40px;">地区：</td>
								<td style="width:210px;">
									<select id="brandCustomerDivSearchFatherArea" style="width:100px;">
										<option value="">全部</option>
									</select>
									<select id="brandCustomerDivSearchChildArea" style="width:100px;" disabled="disabled">
										<option value="">全部</option>
									</select>
								</td>
								<td style="text-align:right; width:40px;">行业：</td>
								<td>
									<select id="brandCustomerDivSearchIndustry" style="width:100px;">
										<option value="">全部</option>
									</select>
								</td>
								<td>
									<input type="submit" class="inputB" value="搜索" />
									<input type="button" class="inputB" value="重置" onclick="resetBrandCustomerFlexiGrid()" />
								</td>
							</tr>
						</tbody>
					</table>
				</form>

				<div>
					<table id="brandCustomerFlexiGrid"></table>
				</div>
			</div>
		</div>

		<!-- Add/Edit brandCustomer div-->
		<div id="brandCustomerEditDiv" class="divPopup" style="height: auto; width: 900px;">
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<thead>
					<tr>
						<th colspan="10">
							<span id="brandCustomerEditDivMainTitle"></span>
						</th>
					</tr>
				</thead>
				<tbody>
				    <tr><td colspan="10">客户基本信息</td></tr>
				    <tr>
				        <td style="text-align:right; width:65px;">
				        	<em>*</em>公司名：
				        </td>
						<td style="width:200px;">
							<input id="brandCustomerEditDivCompanyName" type="text" length="30" style="width:97%;"/>
						</td>
						<td style="text-align:right; width:75px;">
							<em>*</em>行业：
						</td>
						<td style="width:100px;">
							<select id="brandCustomerEditDivIndustry" value="" style="width:90%;"><option value="">请选择</option></select>
						</td>
						<td style="text-align:right; width:75px;">
							<em>*</em>地区：
						</td>
						<td  colspan="4">
						    <select id="brandCustomerEditDivFatherArea" value=""  style="width:40%;" ><option value="">请选择</option></select>
						    <select id="brandCustomerEditDivChildArea" value=""  style="width:40%;"><option value="">请选择</option></select>
						</td>
					</tr>
					<tr>
						<td style="text-align:right;">
							<em>*</em>网站名：
						</td>
						<td >
							<input id="brandCustomerEditDivWebsite" type="text" length="50" style="width:97%;" />
						</td>
						<td style="text-align:right; ">
							<em>*</em>通讯地址：
						</td>
						<td colspan="20">
							<input id="brandCustomerEditDivAddress" type="text" length="200" style="width:97%;" />
						</td>
					</tr>
					
					<tr>
						<td style="text-align:right;">网站域名：</td>
						<td ><input id="brandCustomerEditDivWebsiteDomain" type="text" length="50" style="width:97%;" />
						</td>
						<td style="text-align:right;">邮编：</td>
						<td >
							<input id="brandCustomerEditDivZipCode" type="text" length="10" style="width:87%;" />
						</td>
					    <td style="text-align:right;">传真：</td>
						<td colspan="4">
							<input id="brandCustomerEditDivFax" type="text" length="20" style="width:95%;" />
						</td>
					</tr>
					<tr>
                        <td colspan="10">联系人信息</td>
                    </tr>
                    <tr>
                        <td style="text-align:right;">
                        	<em>*</em>联系人1：
                        </td>
                        <td> 
                        <input type="text" id="brandCustomerEditDivContactor1" length="30" style="width: 97%;">
                        </td>
                        <td style="text-align:right;">
                        	移动电话1：
                        </td>
                        <td>
                        <input type="text" id="brandCustomerEditDivMobile1" length="20" style="width:90%;">
                        </td>
                        <td style="text-align:right;">
                        	<em>*</em>联系电话1：
                        </td>
                        <td style="width:100px;">
                        <input type="text" style="width:90%;" length="50" id="brandCustomerEditDivTelephone1">
                        </td>
                        <td style="text-align: right; width: 75px;">
                        	<em>*</em>联系邮箱1：
                        </td>
                        <td>
                        <input type="text" id="brandCustomerEditDivMail1" length="50" style="width:90%;"></td>
                     </tr>
                     <tr>
                        <td style="text-align:right;">联系人2：</td>
                        <td> 
                        <input type="text" id="brandCustomerEditDivContactor2" length="30" style="width: 97%;">
                        </td>
                        <td style="text-align:right;">移动电话2：</td>
                        <td>
                        <input type="text" id="brandCustomerEditDivMobile2" length="20" style="width:90%;">
                        </td>
                        <td style="text-align:right;">联系电话2：</td>
                        <td style="width:100px;">
                        <input type="text" style="width:90%;" length="50" id="brandCustomerEditDivTelephone2">
                        </td>
                        <td style="text-align: right; width: 70px;">联系邮箱2：</td>
                        <td>
                        <input type="text" id="brandCustomerEditDivMail2" length="50" style="width:90%;"></td>
                     </tr>
                     <tr>
                        <td style="text-align:right;">联系人3：</td>
                        <td> 
                        <input type="text" id="brandCustomerEditDivContactor3" length="30" style="width: 97%;">
                        </td>
                        <td style="text-align:right;">移动电话3：</td>
                        <td>
                        <input type="text" id="brandCustomerEditDivMobile3" length="20" style="width:90%;">
                        </td>
                        <td style="text-align:right;">联系电话3：</td>
                        <td style="width:100px;">
                        <input type="text" style="width:90%;" length="20" id="brandCustomerEditDivTelephone3">
                        </td>
                        <td style="text-align: right; width: 70px;">联系邮箱3：</td>
                        <td>
                        <input type="text" id="brandCustomerEditDivMail3" length="50" style="width:90%;"></td>
                     </tr>
					<tr>
						<td style="text-align:right;">备注：</td>
						<td colspan="10"><textarea id="brandCustomerEditDivRemark" style="width:99%;" rows="3"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="10">
							<input id="brandCustomerEditDivConfirm" type="button" class="inputB" value="确定" />
							<input id="brandCustomerEditDivCancel" type="button" class="inputB" value="取消" onclick="showCustomDiv(false, 'brandCustomerEditDiv', 1);" />
						</td>
					</tr>
				</tbody>

			</table>
		</div>

		<div id="brandCustomerImageManagerDiv" class="divPopup" style="height: auto; width: 700px;">
			<div>
			   <table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				   <thead>
					  <tr>
						<th colspan="10">
							<span>图片管理</span>
							<input type="button" class="inputB" value="上传图片"  id="brandCustomerImageAddDivButton" />
							<input type="button" class="inputB" value="关闭" style="float:right" onclick="showCustomDiv(false, 'brandCustomerImageManagerDiv', 1);">
						</th>
					</tr>
				  </thead>
                  <tbody></tbody>
                </table>
				
			</div>
			<div>
				<table id="brandCustomerImageFlexiGrid"></table>
			</div>
		</div>

		<div id="brandCustomerImageAddDiv"  class="divPopup" style="height: auto; width: 600px;">
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
			<thead>
				<tr>
					<th colspan="2">
						<span id="brandCustomerImageAddDivMainTitle"></span>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align:right; width:65px;">图片：</td>
					<td style="width:335px;">
						<input id="brandCustomerImageAddDivImage" type="file" style="width:90%;" name="image" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="brandCustomerImageAddDivConfirm" type="button" class="inputB" value="上传" />
						<input id="brandCustomerImageAddDivCancel" type="button" class="inputB" value="取消" onclick="showCustomDiv(false, 'brandCustomerImageAddDiv', 1);" />
					</td>
				</tr>
			</tbody>
		</table>
		</div>

		<!-- Pop-up div on hover image.  -->
	    <div id="onHoverPopUpDiv" class="divPopup" style="height: 327; width: 402px;">
		<img src="" style="width: 100%;" />
	    </div>

		<script type="text/javascript">
			// Web page initialize function
			$(document).ready(function() {
				$("#brandTabs").tabs(1, {
					fxSlide : true,
					fxFade : true,
					fxSpeed : 'normal'
				});

				// Init father area.
				$.ajax({
					url : path + "/brandCustomer/brandCustomer_getBrandAreaBeanListByFatherAreaId?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : 1
					},
					type : "post",
					async : false,
					dataType : "json",
					beforeSend : function() {
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code < 0) {
								alert(data.message);
								showWaitDiv(false);
							} else {
								initBrandCustomerDivSearchFatherArea(data.data);
								initBrandCustomerEditDivFatherArea(data.data);
								showWaitDiv(false);
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					}
				});
				
				// Init industry.
				$.ajax({
					url : path + "/brandCustomer/brandCustomer_getBrandIndustryBeanList?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					type : "post",
					async : false,
					dataType : "json",
					beforeSend : function() {
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code < 0) {
								alert(data.message);
								showWaitDiv(false);
							} else {
								initBrandCustomerDivSearchIndustry(data.data);
							    initbrandCustomerEditDivIndustry(data.data);
								showWaitDiv(false);
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					}
				});
				
				initBrandCustomerImageFlexiGrid();
				initBrandCustomerFlexiGrid();

				
				// 对Date的扩展，将 Date 转化为指定格式的String   
				// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
				// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
				// 例子：   
				// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
				// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
				Date.prototype.Format = function(fmt) { //author: meizz   
					var o = {   
    					"M+" : this.getMonth()+1,                 //月份   
    					"d+" : this.getDate(),                    //日   
    					"h+" : this.getHours(),                   //小时   
    					"m+" : this.getMinutes(),                 //分   
    					"s+" : this.getSeconds(),                 //秒   
    					"q+" : Math.floor((this.getMonth()+3)/3), //季度   
    					"S"  : this.getMilliseconds()             //毫秒   
  					};   
  					if(/(y+)/.test(fmt))   
    					fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  					for(var k in o)   
    					if(new RegExp("("+ k +")").test(fmt))   
  							fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  					return fmt;   
				}
			});

			/* 
			 * Search
			 * Initialize the table#brandCustomerFlexiGrid
			 */
			function initBrandCustomerFlexiGrid() {
				$("#brandCustomerFlexiGrid").flexigrid({
					url : path + "/brandCustomer/brandCustomer_searchBrandCustomerForFlexigrid?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					dataType : "json",
					rp : 15,
					sortname : "updateTime",
					sortorder : "desc",
					useRp : false,
					colModel : [{
						display : "公司名",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.companyName;
						}
					},{
 						display : "订单数",
						width : 50,
						align : "center",
						render : function(val, row) {
							return "<a href='javascript:void(0)' onclick='window.open(\"" + path + "/brandCustomer/brandCustomer_toOrder?id=" + row.id + "&companyName="+row.companyName+"\")' >" + row._orderCount + "</a><br/>";
						}
 					},
 					{
 						display : "行业",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row._industryName;
						}
 					},
 					{
 						display : "地区",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row._fatherAreaName+row._childAreaName;
						}
 					},
 					{
 						display : "网站名",
						width : 120,
						align : "center",
						render : function(val, row) {
							return row.website;
						}
 					},
 					{
 						display : "网站域名",
						width : 120,
						align : "center",
						render : function(val, row) {
							return row.websiteDomain;
						}
 					},
 					{
 						display : "联系人1",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.contactor1;
						}
 					},
 					{
 						display : "移动电话1",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.mobile1;
						}
 					},
 					{
 						display : "联系电话1",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.telephone1;
						}
 					},
 					{
 						display : "联系邮箱1",
						width : 120,
						align : "center",
						render : function(val, row) {
							return row.mail1;
						}
 					},
 					{
 						display : "联系人2",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.contactor2;
						}
 					},
 					{
 						display : "移动电话2",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.mobile2;
						}
 					},
 					{
 						display : "联系电话2",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.telephone2;
						}
 					},
 					{
 						display : "联系邮箱2",
						width : 120,
						align : "center",
						render : function(val, row) {
							return row.mail2;
						}
 					},
 					{
 						display : "联系人2",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.contactor2;
						}
 					},
 					{
 						display : "移动电话3",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.mobile3;
						}
 					},
 					{
 						display : "联系电话3",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.telephone3;
						}
 					},
 					{
 						display : "联系邮箱3",
						width : 120,
						align : "center",
						render : function(val, row) {
							return row.mail3;
						}
 					},
 					{
 						display : "通讯地址",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.address;
						}
 					},
 					{
 						display : "邮编",
						width : 80,
						align : "center",
						render : function(val, row) {
							return row.zipCode;
						}
 					},
 					
 					{
 						display : "传真",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.fax;
						}
 					},
 					{
 						display : "备注",
						width : 100,
						align : "center",
						render : function(val, row) {
							return row.remark;
						}
 					},
 					
 					{
						display : "操作",
						width : 330,
						align : "center",
						render : function(val, row) {
							var editCustomerButton = "<input type='button' class='inputB' value='修改客户信息' onclick='showBrandCustomerEditDiv(\"edit\",\"" + row.id + "\")' />";
							var deleteCustomerButton = "<input type='button' class='inputB' value='删除客户信息' onclick='deleteBrandCustomer(" + row.id + ",\"" + row.companyName + "\")' /><br/>";
							var addOrderButtom = "<input type='button' class='inputB' value='查看订单信息' onclick='window.open(\"" + path + "/brandCustomer/brandCustomer_toOrder?id=" + row.id + "&companyName="+row.companyName+"\")' />";
							var imagemanagerButtom = "<input type='button' class='inputB' value='图片管理' onclick='showBrandCustomerImageManagerDiv(\"" + row.id + "\")' />";
							var result = editCustomerButton + deleteCustomerButton + addOrderButtom +  imagemanagerButtom;
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
			 *	Search table#brandCustomerFlexiGrid.
			 */
			function searchBrandCustomerFlexiGrid() {
				var params = new Array();
				
				var companyName  = $("#brandCustomerDivSearchCompanyName").val().trim();
				if (companyName != "") {
					params.push({name : "companyName", value : companyName});
				}
				
				var fatherAreaId  = $("#brandCustomerDivSearchFatherArea").val();
				if (fatherAreaId != "" ) {
					params.push({name : "fatherAreaId", value : fatherAreaId});
				}
				
				var childAreaId  = $("#brandCustomerDivSearchChildArea").val();
				if (childAreaId != "") {
					params.push({name : "childAreaId", value : childAreaId});
				}
			    
				var industryId  = $("#brandCustomerDivSearchIndustry").val();
				if (industryId != "") {
					params.push({name : "industryId", value : industryId});
				}
				
				$("#brandCustomerFlexiGrid").flexOptions({
					newp : 1,
					addparams : params
				}).flexReload();
			}

			/**
			 *	Reset table#brandCustomerFlexiGrid. 
			 */
			function resetBrandCustomerFlexiGrid() {
				$("#brandCustomerDivSearchCompanyName").val("");
				$("#brandCustomerDivSearchFatherArea").val("");
				
				$("#brandCustomerDivSearchChildArea").val("");
				$("#brandCustomerDivSearchChildArea").attr("disabled", "disabled");
				$("#brandCustomerDivSearchIndustry").val("");

				$("#brandCustomerFlexiGrid").flexOptions({
					newp : 1,
					addparams : []
				}).flexReload();
			}

			/**
			 * Init select#brandCustomerDivSearchFatherArea.
			 */
			function initBrandCustomerDivSearchFatherArea(areaList) {
				var select = $("#brandCustomerDivSearchFatherArea");
				for (var i in areaList) {
					var area = areaList[i];
					var option = $("<option></option>");
					option.attr("value", area.id);
					option.text(area.name);
					select.append(option);
				}
				select.unbind();
				select.change(function() {
					if (select.val() == "") {
						$("#brandCustomerDivSearchChildArea").val("");
						$("#brandCustomerDivSearchChildArea").attr("disabled", "disabled");
					} else {
						initBrandCustomerDivSearchChildArea(select.val());
					}
				});
			}
			
			/**
			 * Init select#brandCustomerDivSearchIndustry.
			 */
			function initBrandCustomerDivSearchIndustry(industryList){
				var select = $("#brandCustomerDivSearchIndustry");
				for (var i in industryList) {
					var  industry = industryList[i];
					var option = $("<option></option>");
					option.attr("value", industry.id);
					option.text(industry.industry);
					select.append(option);
				}
			}
			
			
			/**
			 * Init select#brandCustomerEditDivIndustry.
			 */
			function initbrandCustomerEditDivIndustry(industryList){
				var select = $("#brandCustomerEditDivIndustry");
				for (var i in industryList) {
					var  industry = industryList[i];
					var option = $("<option></option>");
					option.attr("value", industry.id);
					option.text(industry.industry);
					select.append(option);
				}
			}
			
			/**
			 * Init select#brandCustomerDivSearchFatherArea.
			 */
			function initBrandCustomerDivSearchChildArea(fatherAreaId) {
				$.ajax({
					url : path + "/brandCustomer/brandCustomer_getBrandAreaBeanListByFatherAreaId?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : parseInt(fatherAreaId)
					},
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code < 0) {
								alert(data.message);
								showWaitDiv(false);
							} else {
								var areaList = data.data;
								$("#brandCustomerDivSearchChildArea option:gt(0)").remove();
								var select = $("#brandCustomerDivSearchChildArea");
								for (var i in areaList) {
									var area = areaList[i];
									var option = $("<option></option>");
									option.attr("value", area.id);
									option.text(area.name);
									select.append(option);
								}
								$("#brandCustomerDivSearchChildArea").removeAttr("disabled");
								showWaitDiv(false);
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					}
				});
			}

			/**
			 * Init select#brandCustomerEditDivFatherArea.
			 */
			function initBrandCustomerEditDivFatherArea(areaList) {
				var select = $("#brandCustomerEditDivFatherArea");
				for (var i in areaList) {
					var area = areaList[i];
					var option = $("<option></option>");
					option.attr("value", area.id);
					option.text(area.name);
					select.append(option);
				}
				select.unbind();
				select.change(function() {
					if (select.val() == "") {
						$("#brandCustomerEditDivChildArea").val("");
						$("#brandCustomerEditDivChildArea").attr("disabled", "disabled");
					} else {
						initBrandCustomerEditDivChildArea(select.val());
					}
				});
			}
			
			/**
			 * Init select#brandCustomerDivSearchFatherArea.
			 */
			function initBrandCustomerEditDivChildArea(fatherAreaId) {
				$.ajax({
					url : path + "/brandCustomer/brandCustomer_getBrandAreaBeanListByFatherAreaId?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : parseInt(fatherAreaId)
					},
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code < 0) {
								alert(data.message);
								showWaitDiv(false);
							} else {
								var areaList = data.data;
								var select = $("#brandCustomerEditDivChildArea");
								select.val("");
								$("option:gt(0)", select).remove();
								for (var i in areaList) {
									var area = areaList[i];
									var option = $("<option></option>");
									option.attr("value", area.id);
									option.text(area.name);
									select.append(option);
								}
								$("#brandCustomerEditDivChildArea").removeAttr("disabled");
								showWaitDiv(false);
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					}
				});
			}
			
			
			/**
			 * Show the div#brandCustomerEditDiv
			 */
			function showBrandCustomerEditDiv(mode, brandCustomerId) {
				if (mode == "add") {
					$("#brandCustomerEditDivMainTitle").text("新增客户信息");
					$("#brandCustomerEditDivCompanyName").val("");
					$("#brandCustomerEditDivIndustry").val("");
					$("#brandCustomerEditDivFatherArea").val("");
					$("#brandCustomerEditDivChildArea").val("");
					$("#brandCustomerEditDivChildArea option:gt(0)").remove();
					$("#brandCustomerEditDivChildArea").attr("disabled","disabled");
					$("#brandCustomerEditDivWebsite").val("");
					$("#brandCustomerEditDivWebsiteDomain").val("");
					$("#brandCustomerEditDivContactor1").val("");
					$("#brandCustomerEditDivMobile1").val("");
					$("#brandCustomerEditDivTelephone1").val("");
					$("#brandCustomerEditDivMail1").val("");
					$("#brandCustomerEditDivContactor2").val("");
					$("#brandCustomerEditDivMobile2").val("");
					$("#brandCustomerEditDivTelephone2").val("");
					$("#brandCustomerEditDivMail2").val("");
					$("#brandCustomerEditDivContactor3").val("");
					$("#brandCustomerEditDivMobile3").val("");
					$("#brandCustomerEditDivTelephone3").val("");
					$("#brandCustomerEditDivMail3").val("");
					$("#brandCustomerEditDivAddress").val("");
					$("#brandCustomerEditDivZipCode").val("");
					$("#brandCustomerEditDivFax").val("");
					$("#brandCustomerEditDivRemark").val("");
					
					$("#brandCustomerEditDivConfirm")[0].onclick = function() {
						addBrandCustomer();
					}
					showCustomDiv(true,'brandCustomerEditDiv');
				} else if (mode = "edit") {
					$.ajax({
						url : path + "/brandCustomer/brandCustomer_getBrandCustomerBeanById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
						data : {
							id : brandCustomerId
						},
						type : "post",
						dataType : "json",
						beforeSend : function() {
							showWaitDiv(true);
						},
						success : function(data) {
							if (ajaxResponseValidate(data)) {
								if (data.code < 0) {
									alert(data.message);
									showWaitDiv(false);
									$("#brandCustomerFlexiGrid").flexReload();
								} else {
									var  brandCustomer= data.data;
									$("#brandCustomerEditDivMainTitle").text("修改客户信息");
									$("#brandCustomerEditDivCompanyName").val(brandCustomer.companyName);
									$("#brandCustomerEditDivIndustry").val(brandCustomer.industryId);
									$("#brandCustomerEditDivFatherArea").val(brandCustomer.fatherAreaId);
									$("#brandCustomerEditDivChildArea option:gt(0)").remove();
									var select = $("#brandCustomerEditDivChildArea");
									var areaList = brandCustomer._childAreaList;
								    for (var i in areaList) {
									var area = areaList[i];
									var option = $("<option></option>");
									option.attr("value", area.id);
									option.text(area.name);
									if(area.id==brandCustomer.childAreaId){
										option.attr("selected","selected");
									   }
									select.append(option);
								    }
								    $("#brandCustomerEditDivChildArea").removeAttr("disabled");
									$("#brandCustomerEditDivWebsite").val(brandCustomer.website);
									$("#brandCustomerEditDivWebsiteDomain").val(brandCustomer.websiteDomain);
									$("#brandCustomerEditDivContactor1").val(brandCustomer.contactor1);
									$("#brandCustomerEditDivMobile1").val(brandCustomer.mobile1);
									$("#brandCustomerEditDivTelephone1").val(brandCustomer.telephone1);
									$("#brandCustomerEditDivMail1").val(brandCustomer.mail1);
									$("#brandCustomerEditDivContactor2").val(brandCustomer.contactor2);
									$("#brandCustomerEditDivMobile2").val(brandCustomer.mobile2);
									$("#brandCustomerEditDivTelephone2").val(brandCustomer.telephone2);
									$("#brandCustomerEditDivMail3").val(brandCustomer.mail2);
									$("#brandCustomerEditDivContactor3").val(brandCustomer.contactor3);
									$("#brandCustomerEditDivMobile3").val(brandCustomer.mobile3);
									$("#brandCustomerEditDivTelephone3").val(brandCustomer.telephone3);
									$("#brandCustomerEditDivMail3").val(brandCustomer.mail3);
									$("#brandCustomerEditDivAddress").val(brandCustomer.address);
									$("#brandCustomerEditDivZipCode").val(brandCustomer.zipCode);
									$("#brandCustomerEditDivFax").val(brandCustomer.fax);
									$("#brandCustomerEditDivRemark").val(brandCustomer.remark);
									
									$("#brandCustomerEditDivConfirm")[0].onclick = function() {
										editbrandCustomer(brandCustomerId, brandCustomer);
									}
									showWaitDiv(false);
									showCustomDiv(true, "brandCustomerEditDiv");
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
			 *	Add brandCustomer.
			 */
			function addBrandCustomer() {
				var data = {};
				var regexpMail =/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
				var companyName = $("#brandCustomerEditDivCompanyName").val().trim();
				if (companyName == "") {
					alert("公司名不能为空！");
					return;
				}
				data.companyName = companyName;

				var industryId = $("#brandCustomerEditDivIndustry").val();
				if (industryId == "" || parseInt(industryId) == NaN) {
					alert("行业不能为空！");
					return;
				}
				data.industryId = industryId;
				
				var fatherAreaId = $("#brandCustomerEditDivFatherArea").val();
				if (fatherAreaId == "" || parseInt(fatherAreaId) == NaN ) {
					alert("所在省不能为空");
					return;
				}
				data.fatherAreaId = fatherAreaId;
				
				var childAreaId = $("#brandCustomerEditDivChildArea").val();
				if (childAreaId == "" || parseInt(childAreaId) == NaN) {
					alert("所在城市不能为空");
					return;
				}
				data.childAreaId = childAreaId;
				
				var website = $("#brandCustomerEditDivWebsite").val().trim();
				if (website == "") {
					alert("网站名不能为空");
					return;
				}
				data.website = website;
				
				var websiteDomain = $("#brandCustomerEditDivWebsiteDomain").val().trim();
				var regexpWebsiteDomain = /^([\w-]+\.)+((com)|(net)|(org)|(gov\.cn)|(info)|(cc)|(com\.cn)|(net\.cn)|(org\.cn)|(name)|(biz)|(tv)|(cn)|(mobi)|(name)|(sh)|(ac)|(io)|(tw)|(com\.tw)|(hk)|(com\.hk)|(ws)|(travel)|(us)|(tm)|(la)|(me\.uk)|(org\.uk)|(ltd\.uk)|(plc\.uk)|(in)|(eu)|(it)|(jp))$/;
				if (websiteDomain != "") {
					if (!regexpWebsiteDomain.test(websiteDomain)) {
						alert("输入的网站域名格式不正确");
						return;
					}
					data.websiteDomain = websiteDomain;
				};

				var contactor1 = $("#brandCustomerEditDivContactor1").val().trim();
				if (contactor1 == "") {
					alert("联系人1一姓名不能为空");
					return;
				}
				data.contactor1 = contactor1;
				
				var mobile1 = $("#brandCustomerEditDivMobile1").val().trim();
				if (mobile1 != "") {
					data.mobile1 = mobile1;
				}
				
				var telephone1 = $("#brandCustomerEditDivTelephone1").val().trim();
				if (telephone1 == "") {
					alert("联系电话1不能为空");
					return;
				}
				data.telephone1 = telephone1;
				
				var mail1 = $("#brandCustomerEditDivMail1").val().trim();
				if (mail1 == "" || !regexpMail.test(mail1)) {
					alert("联系邮箱-1不能为空或输入格式不正确！");
					return;
				}
				data.mail1 = mail1;
				
				var contactor2 = $("#brandCustomerEditDivContactor2").val().trim();
				if(contactor2!=""){
					data.contactor2 = contactor2;
				}
				
				var mobile2 = $("#brandCustomerEditDivMobile2").val().trim();
				if(mobile2!=""){
					data.mobile2 = mobile2;
				}
				
				var telephone2 = $("#brandCustomerEditDivTelephone2").val().trim();
				if(telephone2!=""){
					data.telephone2 = telephone2;
				}
				
				var mail2 = $("#brandCustomerEditDivMail2").val().trim();
				if(mail2!=""){
					if(!regexpMail.test(mail2)){
                    alert("联系邮箱-2输入格式不正确！");
					return;
				}
				data.mail2 = mail2;
				}
				
				var contactor3 = $("#brandCustomerEditDivContactor3").val().trim();
				if(contactor3!=""){
					data.contactor3 = contactor3;
				}
				
				var mobile3 = $("#brandCustomerEditDivMobile3").val().trim();
				if(mobile3!=""){
					data.mobile3 = mobile3;
				}
				
				var telephone3 = $("#brandCustomerEditDivTelephone3").val().trim();
				if(telephone3!=""){
					data.telephone3 = telephone3;
				}
				
				var mail3 = $("#brandCustomerEditDivMail3").val().trim();
				if(mail3!=""){
					if(!regexpMail.test(mail3)){
                    alert("联系邮箱-3输入格式不正确！");
					return;
				}
				data.mail3 = mail3;
				}
				
			    
				var address = $("#brandCustomerEditDivAddress").val().trim();
				if (address == "") {
					alert("地址不能为空");
					return;
				}
				data.address = address;
				
				var zipCode = $("#brandCustomerEditDivZipCode").val().trim();
				if(zipCode!=""){
					data.zipCode = zipCode;
				}
				
				
				var fax = $("#brandCustomerEditDivFax").val().trim();
				if(fax!=""){
					data.fax = fax;
				}
				
				var remark = $("#brandCustomerEditDivRemark").val().trim();
				if(remark!=""){
					data.remark = remark;
				}
				
				$.ajax({
					url : path + "/brandCustomer/brandCustomer_addBrandCustomerBean?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : data,
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showCustomDiv(false, "brandCustomerEditDiv", 1);
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code <= 0) {
								alert(data.message);
								showWaitDiv(false);
								showCustomDiv(true, "brandCustomerEditDiv");
							}
							else {
								showWaitDiv(false);
								$("#brandCustomerFlexiGrid").flexOptions({
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
			 *	Update
			 *	Edit brandCustomer.
			 */
			function editbrandCustomer(brandCustomerId, oldBrandCustomer) {
				var changed = false;
				var data = {id : brandCustomerId};
				var regexpMail =/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
				var regexpWebsiteDomain = /^([\w-]+\.)+((com)|(net)|(org)|(gov\.cn)|(info)|(cc)|(com\.cn)|(net\.cn)|(org\.cn)|(name)|(biz)|(tv)|(cn)|(mobi)|(name)|(sh)|(ac)|(io)|(tw)|(com\.tw)|(hk)|(com\.hk)|(ws)|(travel)|(us)|(tm)|(la)|(me\.uk)|(org\.uk)|(ltd\.uk)|(plc\.uk)|(in)|(eu)|(it)|(jp))$/; 

				var companyName = $("#brandCustomerEditDivCompanyName").val().trim();
				if (companyName == "") {
					alert("请输入公司名!");
					return;
				}
				data.companyName = companyName;
				if (companyName != oldBrandCustomer.companyName) {
					changed = true;
				}

				var industryId = $("#brandCustomerEditDivIndustry").val();
				if (industryId == "") {
					alert("请输入行业!");
					return;
				}
				data.industryId = industryId;
				if (industryId != oldBrandCustomer.industryId) {
					changed = true;
				}
				
				var fatherAreaId = $("#brandCustomerEditDivFatherArea").val();
				if (fatherAreaId == "") {
					alert("请输入省!");
					return;
				}
				data.fatherAreaId = fatherAreaId;
				if (fatherAreaId != oldBrandCustomer.fatherAreaId) {
					changed = true;
				}
				
				var childAreaId = $("#brandCustomerEditDivChildArea").val();
				if (childAreaId == "") {
					alert("请输入城市!");
					return;
				}
				data.childAreaId = childAreaId;
				if (childAreaId != oldBrandCustomer.childAreaId) {
					changed = true;
				}
				
				var website = $("#brandCustomerEditDivWebsite").val().trim();
				if (website == "") {
					alert("请输入公司网站!");
					return;
				}
				data.website = website;
				if (website != oldBrandCustomer.website) {
					changed = true;
				}
				
				var websiteDomain = $("#brandCustomerEditDivWebsiteDomain").val().trim();
				if (websiteDomain == "") {
					if (oldBrandCustomer.websiteDomain) {
						changed = true;
					}
				} else {
					if (!regexpWebsiteDomain.test(websiteDomain)) {
						alert("输入的网站域名格式不正确");
						return;
					}
					
					data.websiteDomain = websiteDomain;
					if (websiteDomain != oldBrandCustomer.websiteDomain) {
						changed = true;
					}
				}				

				var contactor1 = $("#brandCustomerEditDivContactor1").val().trim();
				if (contactor1 == "") {
					alert("请输入联系人-1姓名!");
					return;
				}
				data.contactor1 = contactor1;
				if (contactor1 != oldBrandCustomer.contactor1) {
					changed = true;
				}

				var mobile1 = $("#brandCustomerEditDivMobile1").val().trim();
				if(mobile1 == ""){
					if(oldBrandCustomer.mobile1){
						changed = true;
					}
				}else{
					data.mobile1 = mobile1;
					if(mobile1 != oldBrandCustomer.mobile1){
						changed = true;
					}
				}

				var telephone1 = $("#brandCustomerEditDivTelephone1").val().trim();
				if (telephone1 == "") {
					alert("请输入联系电话-1!");
					return;
				}
				data.telephone1 = telephone1;
				if (telephone1 != oldBrandCustomer.telephone1) {
					changed = true;
				}

				var mail1 = $("#brandCustomerEditDivMail1").val().trim();
				if (mail1 == "" || !regexpMail.test(mail1)) {
					alert("输入联系邮箱-1不能为空或者格式不正确!");
					return;
				}
				data.mail1 = mail1;
				if (mail1 != oldBrandCustomer.mail1) {
					changed = true;
				}

				var contactor2 = $("#brandCustomerEditDivContactor2").val().trim();
				if(contactor2==""){
					if(oldBrandCustomer.contactor2){
						changed = true;
					}
				}else{
					data.contactor2 = contactor2;
					if (contactor2 != oldBrandCustomer.contactor2) {
						changed = true;
					};
				}
			
				var mobile2 = $("#brandCustomerEditDivMobile2").val().trim();
				if(mobile2==""){
					if(oldBrandCustomer.mobile2){
						changed = true;
					}
				}else{
					data.mobile2 = mobile2;
				    if (mobile2 != oldBrandCustomer.mobile2) {
					changed = true;
				    }
				}

				var telephone2 = $("#brandCustomerEditDivTelephone2").val().trim();
				if (telephone2=="") {
					if (oldBrandCustomer.telephone2) {
						changed = true;
					}
				}else{
					data.telephone2 = telephone2;
					if (telephone2 != oldBrandCustomer.telephone2) {
					changed = true;
				}
				}
				
				var mail2= $("#brandCustomerEditDivMail2").val().trim();
				if(mail2==""){
					if(oldBrandCustomer.mail2){
						changed = true;
					}
				}else{
					if(!regexpMail.test(mail2)){
					alert("联系邮箱-2输入格式不正确！");
					return;
				}
				     data.mail2 = mail2;
				     if (mail2 != oldBrandCustomer.mail1) {
					     changed = true;
				      }
				}
				
				
				var contactor3 = $("#brandCustomerEditDivContactor3").val().trim();
				if(contactor3==""){
					if(oldBrandCustomer.contactor3){
						changed = true;
					}
				}else{
					data.contactor3 = contactor3;
					if (contactor3 != oldBrandCustomer.contactor3) {
					changed = true;
				}
				}
				
				var mobile3 = $("#brandCustomerEditDivMobile3").val().trim();
				if(mobile3==""){
					if(oldBrandCustomer.mobile3){
						changed = true;
					}
				}else{
					data.mobile3 = mobile3;
					if (mobile3 != oldBrandCustomer.mobile3) {
					changed = true;
				}
				}
				
				
				var telephone3 = $("#brandCustomerEditDivTelephone3").val().trim();
				if(telephone3==""){
					if(oldBrandCustomer.telephone3){
						changed = true;
					}
				}else{
					data.telephone3 = telephone3;
					if (telephone3 != oldBrandCustomer.telephone3) {
					changed = true;
				}
				}
				
				
				var mail3= $("#brandCustomerEditDivMail3").val().trim();
				if(mail3==""){
					if(oldBrandCustomer.mail3){
						changed = true;
					}
				}else{
					if(!regexpMail.test(mail3)){
					alert("联系邮箱-3输入格式不正确！");
					return;
			     	}
			     	data.mail3 = mail3;
			     	if (mail3 != oldBrandCustomer.mail3) {
					changed = true;
				}
				}
				

				var address = $("#brandCustomerEditDivAddress").val().trim();
				if (address == "") {
					alert("请输入通讯地址!");
					return;
				}
				data.address = address;
				if (address != oldBrandCustomer.address) {
					changed = true;
				}

				var zipCode= $("#brandCustomerEditDivZipCode").val().trim();
				if(zipCode==""){
					if(oldBrandCustomer.zipCode){
						changed = true;
					}
				}else{
					data.zipCode = zipCode;
					if (zipCode != oldBrandCustomer.zipCode) {
					changed = true;
				    }
				}
				
				

				var fax= $("#brandCustomerEditDivFax").val().trim();
				if(fax==""){
					if(oldBrandCustomer.fax){
						changed = true;
					}
				}else{
					data.fax = fax;
					if (fax != oldBrandCustomer.fax) {
					changed = true;
				    }
				}
				
				var remark= $("#brandCustomerEditDivRemark").val().trim();
				if(remark==""){
					if(oldBrandCustomer.remark){
						changed = true;
					}
				}else{
					data.remark = remark;
					if (remark != oldBrandCustomer.remark) {
					changed = true;
				    }
				}
				
				
				if (!changed) {
					showCustomDiv(false, "brandCustomerEditDiv", 1);
					return;
				}

				$.ajax({
					url : path + "/brandCustomer/brandCustomer_updateBrandCustomerById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : data,
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showCustomDiv(false, "brandCustomerEditDiv", 1);
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code <= 0) {
								alert(data.message);
								showWaitDiv(false);
								showCustomDiv(true, "brandCustomerEditDiv");
							} else {
								showWaitDiv(false);
								
								$("#brandCustomerFlexiGrid").flexOptions({
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
			 * 	Update
			 *	Delete  brandCustomer bean by id.
			 */
			function deleteBrandCustomer(brandCustomerId, companyName) {
				if (confirm("确定要删除客户 " + companyName + "” 吗？")) {
					$.ajax({
						url : path + "/brandCustomer/brandCustomer_deletebrandCustomerById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
						data : {
							id : brandCustomerId
						},
						type : "post",
						dataType : "json",
						beforeSend : function() {
							showWaitDiv(true);
						},
						success : function(data) {
							if (ajaxResponseValidate(data)) {
								if (data.code < 0) {
									alert(data.message);
									showWaitDiv(false);
								} else {
									showWaitDiv(false);
									$("#brandCustomerFlexiGrid").flexReload();
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
			 * Search
			 * Initialize the table#brandCustomerImageFlexiGrid
			 */
			function initBrandCustomerImageFlexiGrid(){
				$("#brandCustomerImageFlexiGrid").flexigrid({
					url : path + "/brandCustomer/brandCustomer_searchBrandCustomerImageForFlexigrid?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					dataType : "json",
					rp : 2,
					sortname : "updateTime",
					sortorder : "desc",
					useRp : false,
					colModel : [{
						display : "图片",
						width : 400,
						align : "center",
						render : function(val, row) {
							return  "<img src=\"" +  row.tfsUrl + "\" style='width:400px;' class='onHoverShowImg'/>";
						}
					},
 					{
						display : "操作",
						width : 100,
						align : "center",
						render : function(val, row) {
							var deletebrandCustomerImageButton = "<input type='button' class='inputB' value='删除图片' onclick='deleteBrandCustomerImage(" + row.id + ")' /><br/>";
							return deletebrandCustomerImageButton;
						}
					}],
					width : "auto",
					height : "400",
					showToggleBtn : false,
					showTableToggleBtn : false,
					singleSelect : true,
					onSubmit : function() {
						showWaitDiv(false);
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
			 * Show the div#brandCustomerImageManagerDiv
			 */
			function  showBrandCustomerImageManagerDiv(brandCustomerId){
				var params = new Array();
				params.push({name : "customerId", value : brandCustomerId});
				$("#brandCustomerImageFlexiGrid").flexOptions({
					newp : 1,
					addparams : params,
					sortname : "id",
					sortorder : "asc"					
				}).flexReload();
				$("#brandCustomerImageAddDivButton").unbind();
				$("#brandCustomerImageAddDivButton").click(function(){
					showBrandCustomerImageAddDiv(brandCustomerId);
				});
				showCustomDiv(true,'brandCustomerImageManagerDiv');
			}

			/**
			* show brandCustomerImageAddDiv 
			*/
			function showBrandCustomerImageAddDiv(brandCustomerId){
				$("#brandCustomerImageAddDivMainTitle").text("上传图片");
				$("#brandCustomerImageAddDivImage").val("");
				$("#brandCustomerImageAddDivConfirm").unbind();
				$("#brandCustomerImageAddDivConfirm").click(function () {
					   addBrandCustomerImage(brandCustomerId);
			    });
			    showCustomDiv(false, 'brandCustomerImageManagerDiv', 1);
			    showCustomDiv(true, "brandCustomerImageAddDiv");
			}

			/**
			*  add brandCustomerImagerBean
			*/
			function addBrandCustomerImage(brandCustomerId){
				var image = $("#brandCustomerImageAddDivImage").val();
				var description = $("#brandCustomerImageAddDivDescription").val().trim();
				if(image == ""){
					alert("请选择一个图片！");
					return;
				}
				var params = new Array();
				params.push({name : "customerId", value : brandCustomerId});
				$.ajaxFileUpload({
	        	url : path + "/brandCustomer/brandCustomer_addBrandCustomerImage?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
	        	type : "post",
	        	data : {
	        		customerId : brandCustomerId
	        	},
	        	dataType : "json",
	        	timeout : 10000,
	            fileElementId : "brandCustomerImageAddDivImage",// 文件类型的id
	            success : function (data) {

	            	if(ajaxResponseValidate(data)) {
	            		if(data.code <= 0) {
	            			alert(data.message);
	            			showWaitDiv(false);
	            			showCustomDiv(false, 'brandCustomerImageAddDiv', 1);
		            		showCustomDiv(true, 'brandCustomerImageManagerDiv');
	            		}
	            		else {
	            			showWaitDiv(false);
	            			alert("aaa");
	            			$("#brandCustomerImageFlexiGrid").flexOptions({
					            newp : 1,
					            addparams : params
				            }).flexReload();
	            			showCustomDiv(false, 'brandCustomerImageAddDiv', 1);
		            		showCustomDiv(true, 'brandCustomerImageManagerDiv');
	            		}
	            	}
	            },
	            error : function(){
					alert('<%=AjaxResponse.getAjaxErrorInfo()%>');
					showWaitDiv(false);
            		showCustomDiv(true, 'brandCustomerImageAddDiv');
				}
	        });
			}


			/**
			 * 	Update
			 *	Delete  brandCustomerImage bean by id.
			 */
			function deleteBrandCustomerImage(brandCustomerImageId){
				if (confirm("确定要删除图片吗？")) {
					$.ajax({
						url : path + "/brandCustomer/brandCustomer_deletebrandCustomerImageById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
						data : {
							id : brandCustomerImageId
						},
						type : "post",
						dataType : "json",
						beforeSend : function() {
							showWaitDiv(true);
						},
						success : function(data) {
							if (ajaxResponseValidate(data)) {
								if (data.code < 0) {
									alert(data.message);
									showWaitDiv(false);
								} else {
									showWaitDiv(false);
									$("#brandCustomerImageFlexiGrid").flexReload();
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


		</script>
	</body>
</html>