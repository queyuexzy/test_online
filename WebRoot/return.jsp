<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="com.test_online.util.StringTools"%>
<%@ page import="com.test_online.global.GlobalConstants"%>
<%
	String error = (String) session.getAttribute(GlobalConstants.KEY_ERROR_INFO);
	if (error == null) {
	error = StringTools.toTrim(request.getParameter(GlobalConstants.KEY_ERROR_INFO));
    session.setAttribute(GlobalConstants.KEY_ERROR_INFO,error);
	}
	session.removeAttribute(GlobalConstants.CURRENT_USER);
	String path = request.getContextPath();
%>

<html>
  <head>
<script language="javascript">
 window.top.location = "<%=path%>/login.jsp";
</script>
  </head>
  
  <body>
  </body>
</html>
