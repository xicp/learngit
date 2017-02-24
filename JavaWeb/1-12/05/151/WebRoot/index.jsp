<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
			border: 1px solid;
			border-color: green;
			font-family:华文细黑;
			font-size: 13px;
			color:gray;
			
		}
		input{
			font-family:华文细黑;
			font-size: 13px;
			color:gray;
		}
	</style>
	
  </head>
  
  <body>
  <form action="login.jsp" method="post">
   <table>
   		<tr>
   			<td>用户名：</td>
   			<td><input type="text" name="name" /></td>
   		</tr>
   		<tr>
   			<td>密码：</td>
   			<td><input type="password" name="name" /></td>
   		</tr>
   		<tr>
   			<td>年龄：</td>
   			<td><input type="text" name="name" /></td>
   		</tr>
   		<tr>
   			<td>性别：</td>
   			<td>
   				<input type="radio" name="sex" id="man" value="m"/>男
   				<input type="radio" name="sex" id="woman" value="f"/>女
   			</td>
   		</tr>
   		<tr>
   			<td align="center" colspan="1"><input type="submit" value="注 册" /></td>
   		</tr>
   </table>
   </form>
  </body>
</html>
