<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<html>
	<head>
		<%@include file="/WEB-INF/page/include/head.jsp"%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>角色管理</title>
		<script type="text/javascript"	src="<%=path%>/js/jquery/jquery.json-2.2.js"></script>
		<script type="text/javascript"	src="<%=path%>/js/jquery-flexigrid/flexigrid.js"></script>
  		<link rel="stylesheet"	type="text/css" href="<%=path%>/js/jquery-flexigrid/css/gray/flexigrid.css"/>
		<script type="text/javascript" src="<%=path%>/js/jquery-ztree/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery-ztree/jquery.ztree.excheck-3.5.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-ztree/zTreeStyle3.5/zTreeStyle.css" />
	</head>
	<body>
		<div>
			<form onsubmit="searchRoleFlexiGrid(); return false;">
			    <table class="tableC" width="100%" cellspacing="0" cellpadding="0">
			    	<!-- 标题 -->
					<thead>
						<tr>
							<th colspan="100">
								角色管理
								<input type="button" class="inputB" value="添加" onclick="showAddRoleDiv()" />
							</th>
						</tr>
					</thead>
					<!-- 查询条件 -->
					<tbody>
				    	<tr>
				    		<td>角色名称：</td>
					    	<td><input type="text" id="roleName" value=""/></td>
					    	<td>
					    		<input type="submit" class="inputB" value="查询" />
								<input type="button" class="inputB" value="清空" onclick="resetRoleFlexiGrid(true)" />
				    		</td>
				    	</tr>
			    	</tbody>
			    </table>
	    	</form>
		</div>

		<!-- flexiGrid -->
		<div>
			<table id="roleFlexiGrid"></table>
		</div>

  		 <!-- add/edit div -->
		<div id="roleDiv" class="divPopup" style="height: auto; width: 300px;">
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<tr>
					<th colspan="2">
						<span id="roleDivTitle"></span>
					</th>
				</tr>
				<tr>
					<td style="width:25%;">角色名：</td>
					<td style="width:75%;"><input id="roleDivName" type="text" style="width:90%;" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="roleDivConfirm" type="button" class="inputB" value="确定" />
						<input id="roleDivCancel" type="button" class="inputB" value="取消" onclick="showCustomDiv(false, 'roleDiv', 1);" />
					</td>
				</tr>
			</table>
		</div>

		<!-- 权限设置Div -->
		<div id="privilegeDiv" class="divPopup" style="height: auto; width: 300px;">
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<thead>
					<tr>
						<th>
							<span id="privilegeDivTitle"></span>
						</th>
					</tr>
				</thead>
			</table>
			<div style="height: 300px; overflow: auto;">
				<ul id="privilegeTree" class="ztree"></ul>
			</div>
			<table class="tableC" cellspacing="0" cellpadding="0" style="width:100%;">
				<tbody>
					<tr>
						<td>
							<input id="privilegeDivConfirm" type="button" class="inputB" value="确定" />
							<input type="button" class="inputB" value="取消" onclick="showCustomDiv(false, 'privilegeDiv', 1)" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<script type="text/javascript">
		// Web page initialize function
		$(document).ready(function() {
			initRoleFlexiGrid();
		});

		/*
		 * Search
		 * Initialize the table#roleFlexiGrid
		 */
		function initRoleFlexiGrid() {
			$("#roleFlexiGrid").flexigrid({
				url : path + "/role/role_searchRoleForFlexigrid?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				dataType : "json",
				rp : 15,
				useRp : false,
				colModel : [{
						display : "角色名称",
						width : 150,
						align : "left",
						render : function(val, row) {
							return row.roleName;
						}
					},{
						display : "操作",
						width : 200,
						align : "center",
						render : function(val, row) {
							var privilegeButton = "<input type='button' class='inputB' value='权限设置' onclick='showPrivilegeDiv(" + row.id + ", \"" + row.roleName + "\")' />";
							var editButton = "<input type='button' class='inputB' value='修改' onclick='showEditRoleDiv(" + row.id + ")' />";
							var deleteButton = "<input type='button' class='inputB' value='删除' onclick='deleteRole(" + row.id + ",\"" + row.roleName + "\")' />";
							var result = privilegeButton + editButton + deleteButton;
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
		 * Reset the table#roleFlexiGrid
		 */
		function resetRoleFlexiGrid(search) {
			$("#roleName").val("");

			if (search) {
				$("#roleFlexiGrid").flexOptions({
					newp : 1,
					addparams : [],
					sortname : null,
					sortorder : null
				}).flexReload();
			}
		}

		/**
		 * Search the table#roleFlexiGrid
		 */
		function searchRoleFlexiGrid() {
			var params = new Array;

			var roleName = $("#roleName").val();
			if (roleName.trim().length > 0) {
				params.push({name : "roleName", value : roleName.trim()});
			}

			$("#roleFlexiGrid").flexOptions({
					newp : 1,
					addparams : params
			}).flexReload();
		}

		/*
		 * show add role div.
		 */
		function showAddRoleDiv() {
			$("#roleDivTitle").text("新增角色");
			$("#roleDivName").val("");
			$("#roleDivConfirm")[0].onclick = function() {
				addRole();
			};
			showCustomDiv(true, 'roleDiv');
		}

		/**
		 * Insert
		 * Add role.
		 */ 
		function addRole() {
			var roleName = $("#roleDivName").val();

			// Maybe there's some data verification here.
			if (roleName.trim() == "") {
				alert("请填入角色名！");
				return;
			}

			$.ajax({
				url : path + "/role/role_addRole?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : {
					roleName : roleName
				},
				type : "post",
				dataType : "json",
				beforeSend : function() {
					showCustomDiv(false, 'roleDiv', 1);
					showWaitDiv(true);
				},
				success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code < 0) {
							alert(data.message);
							showWaitDiv(false);
							showCustomDiv(true, 'roleDiv');
						} else {
							popUp(data.message);
							showWaitDiv(false);
							$("#roleFlexiGrid").flexOptions({
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
					showCustomDiv(true, 'roleDiv');
				}
			});
		}

		/**
		 * Search
		 * show edit person div.
		 */
		function showEditRoleDiv(id) {
			$.ajax({
				url : path + "/role/role_getRoleById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
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
							$("#roleFlexiGrid").flexReload();
						} else {
							var role = data.data;
							$("#roleDivTitle").text("修改角色 " + role.roleName);
							$("#roleDivName").val(role.roleName);
							$("#roleDivConfirm")[0].onclick = function() {
								editRole(id, role);
							};
							showWaitDiv(false);
							showCustomDiv(true, 'roleDiv');
						}
					}
				},
				error : function() {
					alert("<%=AjaxResponse.getAjaxErrorInfo()%>");
					showWaitDiv(false);
					showCustomDiv(true, 'roleDiv');
				}
			});			
		}

		/**
		 * Update
		 * edit role.
		 */
		function editRole(id, oldRole) {
			var roleName = $("#roleDivName").val();

			// Maybe there's some data verification here.
			if (roleName.trim() == "") {
				alert("请填入角色名!");
				return;
			}

			var changed = false;
			var data = {id : id};
			if (roleName != oldRole.roleName) {
				data.roleName = roleName;
				changed = true;
			}

			if (!changed) {
				showCustomDiv(false, 'roleDiv', 1);
				return;
			}

			$.ajax({
				url : path + "/role/role_updateRoleById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
				data : data,
				type : "post",
				dataType : "json",
				beforeSend : function() {
					showCustomDiv(false, 'roleDiv', 1);
					showWaitDiv(true);
				},
				success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code < 0) {
							alert(data.message);
							showWaitDiv(false);
							
							if (data.code == -201) {
								$("#roleFlexiGrid").flexReload();
							} else {
								showCustomDiv(true, 'roleDiv');
							}
						} else {
							popUp(data.message);
							showWaitDiv(false);
							$("#roleFlexiGrid").flexOptions({
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
					showCustomDiv(true, 'roleDiv');
				}
			});
		}

		/**
		 * Update
		 * Delete role
		 */
		function deleteRole(id, name) {
			if (confirm("确定要删除" + name + "吗？")){
				$.ajax({
					url : path + "/role/role_deleteRoleById?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
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
							$("#roleFlexiGrid").flexReload();
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
	 	 * Search
	 	 * Get privilege div.
	 	 */
	 	function showPrivilegeDiv(roleId, roleName) {
	 		$.ajax({
	 			url : path + "/role/role_searchMenuForRole?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
	 			data : {
	 				id : roleId
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

							if (data.code == -201) {
								$("#roleFlexiGrid").flexReload();
							} 
						} else {
							$("#privilegeDivTitle").text("设置" + roleName + "的权限");
							var zNodes = data.data;
							zNodes.unshift({id : -1, menuName : "权限树", isParent : true, open : true});
							
							$.fn.zTree.init($("#privilegeTree"), {
								data : {
									key : {
										name : "menuName",
										checked : "_hasMenu"
									},
									simpleData : {
										enable : true,
										idKey : "id",
										pIdKey : "pid",
										rootPId : -1
									}
								},
								check : {
									enable : true
								},
								view : {
									selectedMulti : false
								},
								callback : {
									beforeCollapse : function(treeId, treeNode) {
										return treeNode.id != -1;
									}
								}
							}, zNodes);
							$("#privilegeDivConfirm")[0].onclick = function() {
								updatePrivilegeForRole(roleId);
							};
							showWaitDiv(false);
							showCustomDiv(true, 'privilegeDiv');
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
	 	 * Update
	 	 * Update privilege for role.
	 	 */
	 	function updatePrivilegeForRole(roleId) {
	 		var privilegeTree = $.fn.zTree.getZTreeObj('privilegeTree');
	 		var checkNodes = privilegeTree.getCheckedNodes(true);
	 		var menuId = [];
	 		for (var i = 0; i < checkNodes.length; i++) {
	 			if (checkNodes[i].id != -1) {
	 				menuId.push(checkNodes[i].id);
	 			}
	 		}

	 		$.ajax({
	 			url : path + "/role/role_updateMenuForRole?" + ajaxFlag + "&tmp=" + Math.round(Math.random() * 100000),
	 			data : {
	 				id : roleId,
	 				menuId : menuId.join(',')
	 			},
	 			type : "post",
	 			dataType : "json",
	 			beforeSend : function() {
	 				showCustomDiv(false, 'privilegeDiv', 1);
	 				showWaitDiv(true);
	 			},
	 			success : function(data) {
					if (ajaxResponseValidate(data)) {
						if (data.code < 0) {
							alert(data.message);
							showWaitDiv(false);

							if (data.code == -201) {
								$("#roleFlexiGrid").flexReload();
							} else {
								showCustomDiv(true, 'privilegeDiv');
							}
						} else {
							popUp(data.message);
							showWaitDiv(false);
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
