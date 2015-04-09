<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<html>
	<head>
		<%@include file="/WEB-INF/page/include/head.jsp"%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>职位管理</title>
		<script type="text/javascript" src="<%=path%>/js/jquery/jquery.json-2.2.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery-flexigrid/flexigrid.js"></script>
		<link rel="stylesheet" href="<%=path%>/js/jquery-flexigrid/css/gray/flexigrid.css" type="text/css" />
	</head>
	<body>
		<div>
			<form onsubmit="searchPostFlexiGrid(); return false;">
				<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
					<!-- 标题 -->
					<thead>
						<tr>
							<th colspan="100">
								职位管理
								<input type="button" class="inputB" value="添加" onclick="showAddPostDiv()" />
							</th>
						</tr>
					</thead>
					<!-- 查询条件 -->
					<tbody>
						<tr>
							<td>职位名称：</td>
							<td><input id="postName" type="text" value="" /></td>
							<td>
								<input type="submit" class="inputB" value="查询" />
								<input type="button" class="inputB" value="清空" onclick="resetPostFlexiGrid(true)" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		
		<!-- flexiGrid -->
		<div>
			<table id="postFlexiGrid"></table>
		</div>

		<!-- add/edit div -->
		<div id="postDiv" class="divPopup" style="height: auto; width: 300px;">
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<tr>
					<th colspan="2">
						<span id="postDivTitle"></span>
					</th>
				</tr>
				<tr>
					<td style="width:25%;">职位：</td>
					<td style="width:75%;"><input id="postDivName" type="text" style="width:90%;" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="postDivConfirm" type="button" class="inputB" value="确定" />
						<input id="postDivCancel" type="button" class="inputB" value="取消" onclick="showCustomDiv(false, 'postDiv', 1);" />
					</td>
				</tr>
			</table>
		</div>

		<script type="text/javascript">
			// Web page initialize function
			$(document).ready(function() {
				initPostFlexiGrid();
			});

			/*
			 * Search
			 * Initialize the table#postFlexiGrid
			 */
			function initPostFlexiGrid() {
				$("#postFlexiGrid").flexigrid({
					url : path + "/post/post_searchPostForFlexiGrid?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					dataType : "json",
					rp : 15,
					useRp : false,
					colModel : [{
							display : "职位名称",
							width : 150,
							align : "left",
							render : function(val, row) {
								return row.postName;
							}
						}, {
							display : "操作",
							width : 150,
							align : "center",
							render : function(val, row) {
								var editButton = "<input type='button' class='inputB' value='修改' onclick='showEditPostDiv(" + row.id + ")' />";
								var deleteButton = "<input type='button' class='inputB' value='删除' onclick='deletePost(" + row.id + ",\"" + row.postName + "\")' />";
								var result = editButton + deleteButton;
								return result;
							}
						}],
					width : "auto",
					height : "400",
					showToggleBtn : false,
					showTableToggleBtn : false,
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
			 * Reset the table#postFlexiGrid
			 */
			function resetPostFlexiGrid(search) {
				$("#postName").val("");

				if (search) {
					$("#postFlexiGrid").flexOptions({
						newp : 1,
						addparams : [],
						sortname : null,
						sortorder : null
					}).flexReload();
				}
			}

			/**
			 * Search the table#postFlexiGrid
			 */
			function searchPostFlexiGrid() {
				var params = new Array;

				var postName = $("#postName").val();
				if (postName.trim().length > 0) {
					params.push({name : "postName", value : postName.trim()});
				}
				
				$("#postFlexiGrid").flexOptions({
						newp : 1,
						addparams : params
				}).flexReload();
			}

			/*
			 * show add post div.
			 */
			function showAddPostDiv() {
				$("#postDivTitle").text("新增职位");
				$("#postDivName").val("");
				$("#postDivConfirm")[0].onclick = function() {
					addPost();
				};
				showCustomDiv(true, 'postDiv');
			}

			/**
			 * Insert
			 * Add post.
			 */ 
			function addPost() {
				var postName = $("#postDivName").val().trim();

				if (postName == "") {
					alert("请填入姓名！");
					return;
				}

				$.ajax({
					url : path + "/post/post_addPost?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : {
						postName : postName
					},
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showCustomDiv(false, 'postDiv', 1);
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code < 0) {
								alert(data.message);
								showWaitDiv(false);
								showCustomDiv(true, 'postDiv');
							} else {
								popUp(data.message);
								showWaitDiv(false);
								$("#postFlexiGrid").flexOptions({
									newp : 1,
									sortname : "createTime",
									sortorder : "desc"
								}).flexReload();
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true, 'postDiv');
					}
				});
			}

			/**
			 * Search
			 * show edit post div.
			 */
			function showEditPostDiv(id) {
				$.ajax({
					url : path + "/post/post_getPostById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
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
							if (data.code < 0) {
								alert(data.message);
								showWaitDiv(false);
								$("#postFlexiGrid").flexReload();
							} else {
								var post = data.data;
								$("#postDivTitle").text("修改职位 " + post.postName);
								$("#postDivName").val(post.postName);
								$("#postDivConfirm")[0].onclick = function() {
									editPost(id, post);
								};
								showWaitDiv(false);
								showCustomDiv(true, 'postDiv');
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true, 'postDiv');
					}
				});			
			}

			/**
			 * Update
			 * edit post.
			 */
			function editPost(id, oldPost) {
				var postName = $("#postDivName").val().trim();

				// Maybe there's some data verification here.
				if (postName == "") {
					alert("请填入姓名！");
					return;
				}

				var changed = false;
				var data = {id : id};
				if (postName != oldPost.postName) {
					data.postName = postName;
					changed = true;
				}

				if (!changed) {
					showCustomDiv(false, 'postDiv', 1);
					return;
				}

				$.ajax({
					url : path + "/post/post_updatePostById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
					data : data,
					type : "post",
					dataType : "json",
					beforeSend : function() {
						showCustomDiv(false, 'postDiv', 1);
						showWaitDiv(true);
					},
					success : function(data) {
						if (ajaxResponseValidate(data)) {
							if (data.code < 0) {
								alert(data.message);
								showWaitDiv(false);
								
								if (data.code == -201) {
									$("#postFlexiGrid").flexReload();
								} else {
									showCustomDiv(true, 'postDiv');
								}
							} else {
								popUp(data.message);
								showWaitDiv(false);
								$("#postFlexiGrid").flexOptions({
									newp : 1,
									sortname : "updateTime",
									sortorder : "desc"
								}).flexReload();
							}
						}
					},
					error : function() {
						alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
						showWaitDiv(false);
						showCustomDiv(true, 'postDiv');
					}
				});
			}

			/**
			 * Update
			 * Delete position
			 */
			function deletePost(id, name) {
				if (confirm("确定要删除" + name + "吗？")){
					$.ajax({
					url : path + "/post/post_deletePostById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
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
							if (data.code < 0) {
								alert(data.message);
							} else {
								popUp(data.message);
							}
							showWaitDiv(false);
							$("#postFlexiGrid").flexReload();
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