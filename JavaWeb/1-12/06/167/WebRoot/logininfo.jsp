<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		table{
			font-size:12px;
			font-family: 隶书;
			color:gray;
			border: 1px green solid;
		}
	</style>
  </head>
  
  <body>
   <table align="center">
		<tr>
			<td>用户名：</td>
			<td><%=request.getParameter("name")%></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><%=request.getParameter("pwd")%></td>
		</tr>
		<tr>
			<td>性别：</td>
			<td>
				<%=request.getParameter("sex")%>
			</td>
		</tr>
		<tr>
			<td>年龄：</td>
			<td><%=request.getParameter("age")%></td>
		</tr>
		<tr>
			<td>Email：</td>
			<td><%=request.getParameter("email")%></td>
		</tr>
   	</table>
  </body>
</html>
