<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.mr.exception.OperationException" %>
<%@ page import="com.mr.exception.LoginException"%>
<%
	String action = request.getParameter("action");

	if("OperationException".equals(action)){
		throw new OperationException("此操作失败.  ");
	}
	else if("LoginException".equals(action)){
		throw new LoginException("请您登录后再进行此项操作.  ");
	}
	else if("exception".equals(action)){
		Integer.parseInt("null空传递参数");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>异常捕捉过滤器</title>
</head>
<body>
<table align="left" cellpadding="2" cellspacing="2">
<Tr> <td><a href="${ pageContext.request.requestURI }?action=OperationException">过滤操作</a></td></Tr>
<tr><td><a href="${ pageContext.request.requestURI }?action=LoginException">过滤登录</a></td></tr>
<Tr><td><a href="${ pageContext.request.requestURI }?action=exception">过滤异常</a></td></Tr>
</table>
</body>
</html>