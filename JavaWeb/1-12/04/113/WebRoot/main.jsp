<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%
String username=(String)session.getAttribute("username");	//获取保存在session范围内的用户名 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>系统主页</title>
</head>
<body>
您好！[<%=username %>]欢迎您访问！<br>
<a href="exit.jsp">[退出]</a>
</body>
</html>