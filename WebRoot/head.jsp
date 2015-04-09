<%@page contentType="text/html; charset=utf-8"%>
<%@page import="com.test_online.global.GlobalConstants"%>
<%@page import="com.test_online.util.AjaxResponse"%>
<%@page import="com.test_online.base.BaseAction"%>
<%@page import="com.test_online.module.UserBean"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	String path = request.getContextPath();
	String[] strGlobalMessagesArray = (String[]) request
			.getAttribute(GlobalConstants.GLOBAL_MESSAGES);
	if (strGlobalMessagesArray != null) {
		String strGlobalMessages = "";
		for(int i = 0; i < strGlobalMessagesArray.length; i++) {
			strGlobalMessages += strGlobalMessagesArray[i] + "\\n";
		}
	}


%>

<link rel="stylesheet" href="<%=path%>/style/css/style.css"	type="text/css">
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery/jqueryHelper.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery.easing.1.3.js"></script>
<script type="text/javascript">
	var path = "<%=path%>"; // 应用名
	var ajaxFlag = "<%=GlobalConstants.KEY_REQUEST_TYPE%>=<%=GlobalConstants.FLAG_REQUEST_TYPE_AJAX%>"; // ajax请求标识
	
	$(document).ready(function(){   
	    var listTR = $("tr[name='listTR']"); 
	    listTR.mouseout(mouseOutTR);  
	    listTR.mouseover(mouseOverTR); 
	});
	function mouseOutTR(){
	   var tr = $(this); 
	   tr.removeClass("tableTrMouse");
	}
	function mouseOverTR(){
	   var tr = $(this); 
	   tr.addClass("tableTrMouse");
	}
	function closeWindow(){
	    window.opener = null;
	  // window.open("","_self"); //fix ie7
	    window.close();
	}
	
	function getAjaxRequetUrl(url){
		var rootFlag = path;
		var endFlag = "?" + ajaxFlag + "&tmp=" + Math.round(Math.random()*100000);
		if(url!=null&&url.length>0){
			return rootFlag + url + endFlag;
		}else{
			return "";
		}
	}
	
	var ajax = {};
	// ajax静态方法
	/**
	 * 
	 * @param type
	 *            类型 post get
	 * @param url
	 *            请求地址
	 * @param data
	 *            请求参数
	 * @param beforeSendMenthord
	 *            请求之前所做操作
	 * @param callback
	 *            success成功之后回调函数
	 */ 
	ajax.submit = function(type,url,data,beforeSendMenthord,callback){
		$.ajax({
			type:type,
			url:getAjaxRequetUrl(url),
			data:data,
			beforeSend:function(){
				try {
					beforeSendMenthord();					
				} catch (e) {
				}
			},
			success:function(data){
				/*
				 * 操作失败
				 */
				
				// public final static int OPR_FAIL = 0;
				
				/*
				 * 后台异常
				 */
				// public final static int MANAGE_ERROR = -1;
				
				/*
				 * session 失效
				 */
				// public final static int SESSION_FAIL = -2;

				/*
				 * 传入参数为空
				 */
				// public final static int PARAMETER_NULL = -3;

				/*
				 * 根据id查询时 -4 对象为null
				 */
				// public final static int FINDBYID_NULL = -4;
				
				// public final static int EXIST = -5;
				var flag = false;
				if(data==null||data=='-1'){
					alert("后台异常！请联系管理员");
				<%--
				}else if(data=='-5'){
					alert("登录超市，请重新登录");
					window.location = "<%=path%>/return.jsp";
					return;
				--%>
				}else if(data=='0'){
					alert("操作失败！");
				}else if(data=='-2'){
					alert("已经存在请重新输入！");
				}else if(data=='-3'){
					alert("传入参数为空！");
				}else if(data=='-4'){
					alert("操作对象为空！");
				}else if(data=='-5'){
					alert("登录超时，请重新登录！");
					window.location.href ="return.jsp";
				}else if(data='-6'){
					alert("保存失败！");
				}else if(data='-7'){
					alert("删除失败！");
				}
				else{
					flag = true;
				}
				callback(data,flag);		
			},
			error:function(msg){
				alert("请求错误:" + msg);
			}
		});
	}
	
	// Don't edit.
	function ajaxResponseValidate(data) {
		var flag = false;
		if (data == null) {
			alert("ajax无应答！");
		}else {
			flag = true;
		}
		return flag;
	}
	// Don't edit.
	
	function ajaxResultValidate(data){
		var flag = false;
		if(data==null||data=='-1'){
			alert("后台异常！请联系管理员");
		}else if(data=='0'){
			alert("操作失败");
		}else if(data=='-2'){
			alert("已经存在，请重新输入");
		}else if(data=='-3'){
			alert("传入参数为空");
		}else if(data=='-4'){
			alert("操作对象为空");
		}else if(data=='-5'){
			alert("登录超时，请重新登录");
			window.location.href = "return.jsp";
			// return ;
		}else{
			flag = true;
		}
		return flag;
	}
	
	function getRandom(){
		return Math.round(Math.random()*100000);
	}
	
	// ajax请求标识及随机数
	function getAjaxTmp(){
		return 	"requestType=ajax&tmp="+ getRandom();
	}
	
	/* 防脚本注入 字符转义 */
	function stringFilter(str){
		if(str==null || str==undefined ){
			return "";
		}
		str = str.replace(/>/g,"&gt;");
		str = str.replace(/</g,"&lt;");
		str = str.replace(/"/g,"&quot;");
		str = str.replace(/'/g,"&apos;");
		return str;
	}
</script>
