<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   			<table>
   					<tr>
   						<td>用户名:</td>
   						<td><%=request.getParameter("name")%></td>
   					</tr>
   					<Tr>
   						<td>密&nbsp;码</td>
   						<td><%=request.getParameter("pwd") %></td>
   					</Tr>
   					<Tr>
   						<td>QQ号码</td>
   						<td><%=request.getParameter("qqnumber") %></td>
   					</Tr>
   					<Tr>
   						<td>邮&nbsp;箱</td>
   						<td><%request.getParameter("email"); %></td>
   					</Tr>
   					<Tr>
   						<td>详细地址</td>
   						<td><%=request.getParameter("address") %></td>
   					</Tr>
   			</table>
  </body>
</html>
