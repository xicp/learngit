<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page import="com.mr.filter.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>使用过滤器身份验证</title>
</head>
<%
request.setCharacterEncoding("gb2312");
String name=request.getParameter("name");
String password=request.getParameter("password");
  User user=new User();
  user.setUsername(name);
  user.setPassword(password);
  session.setAttribute("user",user);

response.sendRedirect("filter/loginsuccee.jsp");
%>
<body>





</body>
</html>
