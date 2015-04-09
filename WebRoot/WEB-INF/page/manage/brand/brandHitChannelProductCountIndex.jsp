<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
<head>
	<%@include file="/WEB-INF/page/include/head.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>品牌专区 命中词管理</title>
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
		<ul id="brandHitChannelProductCountTabs">
			<li><a href='#brandHitChannelProductCountTab'><span>命中词管理</span></a></li>
		</ul>

		<div id="brandHitChannelProductCountTab">
			<form onsubmit="searchBrandHitChannelProductCountFlexiGrid(); return false;">
				<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
					<tbody>
						<tr>
							<td style="text-align:right; width:60px;">命中词：</td>
							<td style="width:100px;">
								<input id="brandHitChannelProductCountDivSearchHit" type="text" value="" style="width:100px;"/>
							</td>
							
							<td style="text-align:right; width:60px;">频道名称：</td>
							<td style="width:100px;">
								<select id="brandHitChannelProductCountDivSearchChannel" style="width:100px;">
									<!-- Options will be appended dynamically by JavaScript after page has been loaded  -->
								</select>
							</td>

							<td style="text-align:right; width:80px;">匹配产品数：</td>
							<td style="width:100px;">
								<select id="brandHitChannelProductCountDivSearchProductMatchedCount" style="width:100px;">
									<option value="all" selected="selected">全部</option>
									<option value="moreThanOne">多余1个</option>
								</select>
							</td>

							<td>
								<input type="submit" class="inputB" value="搜索" />
								<input type="button" class="inputB" value="重置" onclick="resetBrandHitChannelProductCountFlexiGrid()" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>

			<div>
				<table id="brandHitChannelProductCountFlexiGrid"></table>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		//Web page initialize function
		$(document).ready(function() {
			$("#brandHitChannelProductCountTabs").tabs(1, {
				fxSlide : true,
				fxFade : true,
				fxSpeed : 'normal'
			});

			fetchAllChannels();
			initBrandHitChannelProductCountFlexiGrid();
		});

		/*
		 * Fetch all channels.
		 */
		function fetchAllChannels() {
			// TODO
			$.ajax({
				url : path + "/brandHitChannelProductCount/brandHitChannelProductCount_getAllBrandChannelList?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
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
							$("#brandHitChannelProductCountDivSearchChannel").append("<option value='all'>全部</option>");
							var channelArray = data.data;
							for (var i = 0; i < channelArray.length; i++) {
								$("#brandHitChannelProductCountDivSearchChannel").append("<option value='" + channelArray[i].id + "'>" + channelArray[i].name + "</option>");
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
		 * Initialize the table brandHitChannelProductCountFlexiGrid
		 */
		function initBrandHitChannelProductCountFlexiGrid() {
			$("#brandHitChannelProductCountFlexiGrid").flexigrid({
				url : path + "/brandHitChannelProductCount/brandHitChannelProductCount_searchBrandHitChannelProductCountForFlexigrid?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				dataType : "json",
				rp : 15,
				sortname : "hit",
				sortorder : "asc",
				useRp : false,
				colModel : [{
					display : "命中词",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.hit;
					}
				},{
					display : "频道",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.channelName;
					}
				},{
					display : "产品数",
					width : 100,
					align : "center",
					render : function(val, row) {
						return row.productMatchedCount;
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
		 *	Search table brandHitChannelProductCountFlexiGrid.
		 */
		function searchBrandHitChannelProductCountFlexiGrid() {
			var params = new Array();

			var hit = $("#brandHitChannelProductCountDivSearchHit").val().trim();
			if (hit != "") {
				params.push({name : "hit", value : hit});
			}

			var channelId = $("#brandHitChannelProductCountDivSearchChannel").val().trim();
			if (channelId != "all") {
				params.push({ name: "channelId", value: channelId });
			}

			var productMatchedCount = $("#brandHitChannelProductCountDivSearchProductMatchedCount").val().trim();
			params.push({ name: "productMatchedCount", value: productMatchedCount });

			$("#brandHitChannelProductCountFlexiGrid").flexOptions({
				newp : 1,
				addparams : params
			}).flexReload();
		}

		function resetBrandHitChannelProductCountFlexiGrid() {
			$("#brandHitChannelProductCountDivSearchHit").val("");
			$("#brandHitChannelProductCountDivSearchChannel").val("all");
			$("#brandHitChannelProductCountDivSearchProductMatchedCount").val("all");

			$("#brandHitChannelProductCountFlexiGrid").flexOptions({
				newp : 1,
				addparams : []
			}).flexReload();
		}
	</script>
</body>
</html>