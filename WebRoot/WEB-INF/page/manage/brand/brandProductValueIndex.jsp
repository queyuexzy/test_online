<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
	<head>
		<%@include file="/WEB-INF/page/include/head.jsp"%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>产品编辑</title>
		<script type="text/javascript" src="<%=path%>/js/jquery/jquery.json-2.2.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/js/jqueryui/ui-tabs/ui.tabs.css"/>
		<script type="text/javascript" src="<%=path%>/js/jqueryui/ui-tabs/ui.tabs.js"></script>
		<link rel="stylesheet"  type="text/css" href="<%=path%>/js/jquery-flexigrid/css/gray/flexigrid.css" />
		<script type="text/javascript" src="<%=path%>/js/jquery-flexigrid/flexigrid.js"></script>
		<script type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=path%>/js/mJs/ajaxfileupload.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jcrop/jquery.Jcrop.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/js/jcrop/jquery.Jcrop.css" />
		<script type="text/javascript" src="<%=path%>/js/jquery-ztree/jquery.ztree.core-3.5.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-ztree/zTreeStyle3.5/zTreeStyle.css" />
	</head>
	<body style="overflow:hidden;">
		<!-- Product Title -->
		<div>
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<thead>
					<tr>
						<th>
							<span id="brandProductValueTitle"></span>
							<input type="button" class="inputB" value="预览" onclick="previewBrandProduct();">
						</th>
					</tr>
				<thead>
			</table>
		</div>

		<!-- Edit Tabs -->
		<div>
			<ul id="brandProductValueTabs">
				<li><a href="#brandProductValueTab"><span>产品编辑</span></a></li>
				<li><a href="#brandTemplateTab"><span>模板内容</span></a></li>
			</ul>

			<div id="brandProductValueTab">
				<div style="height: 550px; background: #b3d0db;">
					<div style="width: 200px; height: 550px; float: left; overflow-y: auto; background: #b3d0db;">
						<ul id="brandProductValueTree" class="ztree"></ul>
					</div>

					<div id="brandProductValueRootHint" style="text-align: center; height: 550px;">
						<h1>请点击左边的块儿，进行相应操作</h1>
					</div>

					<div id="brandProductValueAddDiv" style="display: none; float: left; width:1000px;">
						<form onsubmit="return false;">
							<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
								<thead>
									<tr>
										<th colspan="2">
											<span id="brandProductValueAddDivMainTitle"></span>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="text-align: right; width: 40px;">名称：</td>
										<td style="text-align: center;"><input id="brandProductValueAddDivName" type="text" style="width: 99%;" value=""></td>
									</tr>
									<tr>
										<td style="text-align: right;">类型：</td>
										<td style="text-align: center;">
											<select id="brandProductValueAddDivType" style="width: 99%;" onchange="brandProductValueAddDivTypeChanged();">
												<option value="0" selected="selected">文章</option>
												<option value="1" >列表</option>
											</select>
										</td>
									</tr>
									<tr>
										<td style="text-align: right;">text：</td>
										<td style="text-align: center;">
											<textarea id="brandProductValueAddDivText" rows="5" style="width: 99%;"></textarea>
										</td>
									</tr>
									<tr>
										<td style="text-align: right;">html：</td>
										<td style="text-align: center;">
											<textarea id="brandProductValueAddDivHtml" rows="5" style="width: 99%;"></textarea>
										</td>
									</tr>
									<tr>
										<td style="text-align: right;">link：</td>
										<td style="text-align: center;">
											<input id="brandProductValueAddDivLink" type="text" style="width:99%;" value="">
										</td>
									</tr>
									<tr>
										<td style="text-align: right;">img：</td>
										<td style="text-align: center;">
											<input id="brandProductValueAddDivImg" type="text" style="width:99%;" value="">
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: center;">
											<input type="submit" value="添加" class="inputB"/>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>

					<div id="brandProductValueEditDiv" style="display: none; float: left; width:1000px;">
						<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
							<thead>
								<tr>
									<th colspan="2">
										<span id="brandProductValueEditDivMainTitle"></span>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="text-align: right; width: 40px;">名称：</td>
									<td style="text-align: center;">
										<input id="brandProductValueEditDivName" type="text" style="width:99%;" value="">
									</td>
								</tr>
								<tr>
									<td style="text-align: right;">类型：</td>
									<td>
										<span id="brandProductValueEditDivType" style="margin-left: 5px;"></span>
									</td>
								</tr>
								<tr>
									<td style="text-align: right;">位置：</td>
									<td style="text-align: center;">
										<select id="brandProductValueEditDivIdx" style="width: 99%;">
										</select>
									</td>
								</tr>
								<tr>
									<td style="text-align: right;">text：</td>
									<td style="text-align: center;">
										<textarea id="brandProductValueEditDivText" style="width:99%;" rows="5"></textarea>
									</td>
								</tr>
								<tr>
									<td style="text-align: right;">html：</td>
									<td style="text-align: center;">
										<textarea id="brandProductValueEditDivHtml" type="text" style="width:99%;" rows="5"/></textarea>
									</td>
								</tr>
								<tr>
									<td style="text-align: right;">link：</td>
									<td style="text-align: center;">
										<input id="brandProductValueEditDivLink" type="text" style="width:99%;" value="">
									</td>
								</tr>
								<tr>
									<td style="text-align: right;">img：</td>
									<td style="text-align: center;">
										<input id="brandProductValueEditDivImg" type="text" style="width:88%;" value="">
										<input id="brandProuctVlaueEditDivImgResourceButton" type="button" class="inputB" value="图片资源库" >
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;">
										<input id="brandProductValueEditDivEditButton" type="button" value="修改" class="inputB"/>
										<input id="brandProductValueEditDivAddButton" type="button" value="添加子节点" class="inputB"/>
										<input id="brandProductValueEditDivDeleteButton" type="button" value="删除" class="inputB"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div id="brandTemplateTab">
				<textarea id="brandTemplateContent" wrap="off" readonly="readonly" style="width: 100%; background: #b3d0db; overflow: scroll;" rows="30"></textarea>
			</div>
		</div>

		<div id="brandCustomerImageManagerDiv" class="divPopup" style="height: auto; width: 700px;">
			<div>
			   <table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				   <thead>
					  <tr>
						<th colspan="10">
							<span>图片选择</span>
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

		<!-- Pop-up div on hover image.  -->
	    <div id="onHoverPopUpDiv" class="divPopup" style="width: 600px;">
		<img src="" style="width: 100%;" />
	    </div>

		
		<script type="text/javascript">
			var productId = "<%=request.getParameter("productId")%>";
			var templateId;
			var customerId;  //客户Id
			$(document).ready(function() {
				$.ajax({
					url : path + "/brandCustomerOrder/brandCustomerOrder_getBrandOrderProductById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : productId
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
								var product = data.data;
								$("#brandProductValueTitle").text("客户名：" + product._companyName + " || 订单名：" + product._orderName + " || 订单唯一ID：" + product._orderUniqueId);
								$("#brandTemplateContent").val(product._template);
								templateId = product.templateId;
								customerId = product._customerId;
								showWaitDiv(false);
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					}
				});
				
				$("#brandProductValueTabs").tabs(1, {
					fxSlide : true,
					fxFade : true,
					fxSpeed : 'normal'
				});

				$("#brandProuctVlaueEditDivImgResourceButton").unbind();
				$("#brandProuctVlaueEditDivImgResourceButton").click(function () {
					  showBrandCustomerImageManagerDiv(customerId);
			    });

				initBrandCustomerImageFlexiGrid();
				initBrandProductValueTree();

			});

			/**
			 * Search
			 * Search all the menu tree.
			 */
			function initBrandProductValueTree() {
				$.fn.zTree.init($("#brandProductValueTree"), {
					async : {
						enable : true,
						url : path + "/brandCustomerOrder/brandCustomerOrder_searchBrandProductValueBeanForZtree?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
						autoParam : [ "_tid" ],
						dataType : "json",
						dataFilter : function(treeId, parentNode, responseData) {
							var result = responseData.data;
							if (parentNode == null) {
								result.unshift({_tid : 0, name : "产品值树", isParent : true, open : true});
							} 

							for(var i = 0; i < result.length;i ++){
								if(result[i]._tpid == 0 || result[i].listFlag) {
									result[i].isParent = true;
								}

								if(result[i].name) {
									result[i]._name = result[i].name;	
								}else {
									if(result[i].listFlag == 1){
										result[i]._name = "列表" + result[i].idx;
									}else{
										result[i]._name = "文章" + result[i].idx;
									}
								}
							}
							return result;
						},
						otherParam : ["templateId", templateId, "productId", productId]
					},
					data : {
						key : {
							name : "_name"
						},
						simpleData : {
							enable : true,
							idKey : "_tid",
							pIdKey : "_tpid",
							rootPId : 0
						}
					},
					view : {
						selectedMulti : false
					},
					callback : {
						beforeCollapse : function(treeId, treeNode) {
							return treeNode._tid != 0;
						},
						onAsyncSuccess : function(event, treeId, treeNode, msg) {
							ajaxResponseValidate(msg);
						},
						onAsyncError : function() {
							alert("Ajax访问异常");
						},
						onClick : function(event, treeId, treeNode, clickFlag) {
							if(treeNode._tid == 0){
								$("#brandProductValueRootHint").show();
								$("#brandProductValueEditDiv").hide();
								$("#brandProductValueAddDiv").hide();
							}else {
								$("#brandProductValueRootHint").hide();
								if (treeNode._tid < 0 || treeNode.listFlag) {
									if (treeNode.listFlag) {
										$("#brandProductValueAddDiv").hide();
										showBrandProductValueEditDiv(treeNode);
									} else {
										$("#brandProductValueEditDiv").hide();
										showBrandProductValueAddDiv(treeNode);
									}
								} else {
									$("#brandProductValueAddDiv").hide();
									showBrandProductValueEditDiv(treeNode);
								}
							}
						}
					}
				});
			}

			/**
			 *	Show div#brandProductValueAddDiv
			 */
			function showBrandProductValueAddDiv(treeNode) {
				var name = treeNode.name ? treeNode.name : treeNode._name;
				$("#brandProductValueAddDivMainTitle").text("在 " + name + " 下添加子节点");
				$("input[type='text']", $("#brandProductValueAddDiv")).val("");
				$("textarea", $("#brandProductValueAddDiv")).val("");
				$("#brandProductValueAddDivType").val("0"); //default 文章
				$("tr", $("#brandProductValueAddDiv")).show();

				$("form", $("#brandProductValueAddDiv")).unbind();
				$("form", $("#brandProductValueAddDiv")).submit(function() {
					if (treeNode._tid < 0) {
						addBrandProductValue(treeNode, treeNode._tid * -1);
					} else if (treeNode.listFlag) {
						addBrandProductValue(treeNode, treeNode.blockId, treeNode._tid);
					} else {
						alert("节点信息有误！");
					}
					return false;
				})
				$("#brandProductValueAddDiv").show();
			}

			/**
			 * Add brand product value under the block and parent.
			 */
			function addBrandProductValue(treeNode, blockId, parentId){
				var data = {
					productId : productId,
					blockId : blockId,
					parentId : parentId
				};

				var name = $("#brandProductValueAddDivName").val().trim();
				if (name != "") {
					data.name = name;
				}

				var type = $("#brandProductValueAddDivType").val();
				switch(type) {
					case "0":
						data.listFlag = false;

						var validFlag = false;

						var text = $("#brandProductValueAddDivText").val().trim();
						if (text != "") {
							data.text = text;
							validFlag = true;
						}

						var html = $("#brandProductValueAddDivHtml").val().trim();
						if (html != "") {
							data.html = html;
							validFlag = true;
						}

						var link = $("#brandProductValueAddDivLink").val().trim();
						if (link != "") {
							data.link = link;
							validFlag = true;
						}

						var img = $("#brandProductValueAddDivImg").val().trim();
						if (img != "") {
							data.img = img;
							validFlag = true;
						}

						if (!validFlag) {
							alert("text, html, link, img至少填一个！");
							return;
						}
						break;
					case "1":
						data.listFlag = true;
						break;
					default:
						alert("类型错误！");
						return;
				}

				$.ajax({
					url : path + "/brandCustomerOrder/brandCustomerOrder_addBrandProductValue?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : data,
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
								$.fn.zTree.getZTreeObj("brandProductValueTree").reAsyncChildNodes(treeNode, "refresh", false);
								$("input[type='text']", $("#brandProductValueAddDiv")).val("");
								$("textarea", $("#brandProductValueAddDiv")).val("");
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
			 * select#brandProductValueAddDivType changed.
			 */
			function brandProductValueAddDivTypeChanged() {
				var type = $("#brandProductValueAddDivType").val();
				switch(type) {
					case "0": //文章
						$("tr", $("#brandProductValueAddDiv")).show();
						break;
					case "1": //列表
						var trs = $("tr", $("#brandProductValueAddDiv"));
						for (var i = 3; i < trs.length - 1; i++) {
							$(trs[i]).hide();
						}
						break;
				}
			}


			/**
			 * Show div#brandProductValueAddDiv.
			 */
			function showBrandProductValueEditDiv(treeNode) {
				var name = treeNode.name ? treeNode.name : treeNode._name;
				$("#brandProductValueEditDivMainTitle").text("节点 " + name + " 详细信息");
				$("#brandProductValueEditDivName").val(treeNode.name);

				var idxSelect = $("#brandProductValueEditDivIdx");
				idxSelect.empty();
				for (var i = 1; i <= treeNode._maxIdx; i++) {
					idxSelect.append("<option value=\"" + i + "\">" + i + "</option>");

				}
				idxSelect.val("" + treeNode.idx);
				idxSelect.unbind();
				idxSelect.change(function() {
					sortBrandProductValue(treeNode);
				});

				if (treeNode.listFlag) {
					$("#brandProductValueEditDivType").text("列表");
					var trs = $("tr", $("#brandProductValueEditDiv"));
					for (var i = 4; i < trs.length - 1; i++) {
						$(trs[i]).hide();
					}

					$("#brandProductValueEditDivAddButton").unbind();
					$("#brandProductValueEditDivAddButton").click(function() {
						$("#brandProductValueEditDiv").hide();
						showBrandProductValueAddDiv(treeNode);
					});
					$("#brandProductValueEditDivAddButton").show();

				} else {
					$("#brandProductValueEditDivType").text("文章");
					$("#brandProductValueEditDivText").val(treeNode.text ? treeNode.text : "");
					$("#brandProductValueEditDivHtml").val(treeNode.html ? treeNode.html : "");
					$("#brandProductValueEditDivLink").val(treeNode.link ? treeNode.link : "");
					$("#brandProductValueEditDivImg").val(treeNode.img ? treeNode.img : "");
					$("tr", $("#brandProductValueEditDiv")).show();

					$("#brandProductValueEditDivAddButton").hide();
				}

				$("#brandProductValueEditDivEditButton").unbind();
				$("#brandProductValueEditDivEditButton").click(function() {
					editBrandProductValue(treeNode);
				});

				$("#brandProductValueEditDivDeleteButton").unbind();
				$("#brandProductValueEditDivDeleteButton").click(function() {
					deleteBrandProductValue(treeNode);
				})

				$("#brandProductValueEditDiv").show();
			}

			/**
			 * Edit brand product value.
			 */
			function editBrandProductValue(treeNode) {
				var data = {
					id : treeNode._tid
				};

				var changed = false;

				var name = $("#brandProductValueEditDivName").val().trim();
				if (name == "") {
					if (treeNode.name) {
						changed = true;
					}
				} else {
					data.name = name;
					if (treeNode.name != name) {
						changed = true;
					}
				}

				if (!treeNode.listFlag) {
					var validFlag = false;

					var text = $("#brandProductValueEditDivText").val().trim();
					if (text == "") {
						if (treeNode.text) {
							changed = true;
						}
					} else {
						data.text = text;
						validFlag = true;
						if (treeNode.text != text) {
							changed = true;
						}
					}

					var html = $("#brandProductValueEditDivHtml").val().trim();
					if (html == "") {
						if (treeNode.html) {
							changed = true;
						}
					} else {
						data.html = html;
						validFlag = true;
						if (treeNode.html != html) {
							changed = true;
						}
					}

					var link = $("#brandProductValueEditDivLink").val().trim();
					if (link == "") {
						if (treeNode.link) {
							changed = true;
						}
					} else {
						data.link = link;
						validFlag = true;
						if (treeNode.link != link) {
							changed = true;
						}
					}

					var img = $("#brandProductValueEditDivImg").val().trim();
					if (img == "") {
						if (treeNode.img) {
							changed = true;
						}
					} else {
						data.img = img;
						validFlag = true;
						if (treeNode.img != img) {
							changed = true;
						}
					}

					if (!validFlag) {
						alert("text, html, link, img至少填一个！");
						return;
					}
				}
				
				if (!changed) {
					return;
				}

				$.ajax({
					url : path + "/brandCustomerOrder/brandCustomerOrder_updateBrandProductValueById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : data,
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code < 0) {
								alert(data.message);
							}
							$.fn.zTree.getZTreeObj("brandProductValueTree").reAsyncChildNodes(treeNode.getParentNode(), "refresh", false);
							showWaitDiv(false);
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					}
				});
			}

			/**
			 * Sort brand product value.
			 */
			function sortBrandProductValue(treeNode) {
				$.ajax({
					url : path + "/brandCustomerOrder/brandCustomerOrder_sortBrandProductValueById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						id : treeNode._tid,
						idx : $("#brandProductValueEditDivIdx").val()
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
							}
							$.fn.zTree.getZTreeObj("brandProductValueTree").reAsyncChildNodes(treeNode.getParentNode(), "refresh", false);
							showWaitDiv(false);
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					}
				});
			}

			/**
			 * Delete brand product value.
			 */
			function deleteBrandProductValue(treeNode) {
				if (treeNode._childCount > 0) {
					alert("有子节点，请先删除子节点！");
					return;
				}

				if (confirm("确定要删除 " + treeNode._name + " 吗？")) {
					$.ajax({
						url : path + "/brandCustomerOrder/brandCustomerOrder_deleteBrandProductValueById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
						data : {
							id : treeNode._tid
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
								}
								$.fn.zTree.getZTreeObj("brandProductValueTree").reAsyncChildNodes(treeNode.getParentNode(), "refresh", false);
								$("#brandProductValueRootHint").show();
								$("#brandProductValueEditDiv").hide();
								$("#brandProductValueAddDiv").hide();
								showWaitDiv(false);
							}
						},
						error : function() {
							alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						}
					});
				}
			}

			/**
			 * Preview the brand product.
			 */
			function previewBrandProduct() {
				window.open(path + "/brandCustomerOrder/brandCustomerOrder_previewBrandProductById?" + ajaxFlag + "&id=" + productId + "&tmp=" + Math.round(Math.random() * 100000))
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
					sortname : "id",
					sortorder : "asc",
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
							var selectBrandCustomerImageButton = "<input type='button' class='inputB' value='选择' onclick='selectBrandCustomerImage(\"" + row.tfsUrl + "\")' /><br/>";
							return selectBrandCustomerImageButton;
						}
					}],
					width : "700",
					height : "500",
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
			 * select the img
			 */

			function selectBrandCustomerImage(tfsUrl){
				$("#brandProductValueEditDivImg").val(tfsUrl);

				showCustomDiv(false, 'brandCustomerImageManagerDiv', 1);
			}



		</script>
	</body>
</html>