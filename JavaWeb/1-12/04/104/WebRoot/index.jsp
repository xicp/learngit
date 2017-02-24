<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>将表单请求提交到本页</title>
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
  			font-size: 13px;
  			border: 1 solid green;
  		}
  	</style>
  </head>
  
  <body>
  
   <form action="index.jsp" method="post">
    	<table height="150" width="300">
    		<tr>
   				<td align="center" colspan="4" height="20"></td>
   			</tr>
   			<tr>
   				<td align="center" colspan="4">用户登录</td>
   			</tr>
   			<tr>
   				<td>用户名：	</td>
   				<td>
   					<input type="text" name="name" />
   				</td>
   			</tr>
   			<tr>
   				<td>密码：	</td>
   				<td>
   					<input type="password" name="pwd" />
   				</td>
   			</tr>
   			<tr>
   				<td></td>
   				<td>
   					<input type="submit" value="登 录" />
   				</td>
   			</tr>
   			<tr>
   				<td>用户名参数为：</td>
   				<td>
   					<%=name %>
   				</td>
   			</tr>
   			<tr>
   				<td>密码参数为：</td>
   				<td>
   					<%=pwd %>
   				</td>
   			</tr>
   			<tr>
   				<td align="center" colspan="4" height="20"></td>
   			</tr>
   		</table>
   	</form>
  </body>
</html>
