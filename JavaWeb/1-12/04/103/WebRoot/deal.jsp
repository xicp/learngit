<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%
String id=request.getParameter("id");	//��ȡid������ֵ
String user=request.getParameter("user");//��ȡuser������ֵ
String pwd=request.getParameter("pwd");//��ȡpwd����ֵ
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>����ҳ</title>
</head>
<body>
id������ֵΪ��<%=id %><br>
user������ֵΪ��<%=user %><br>
pwd������ֵΪ��<%=pwd %>
</body>
</html>