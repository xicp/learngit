<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
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
		input{
			font-size:12px;
			font-family: 隶书;
			color:gray;
		}
	</style>
  </head>
  
  <body>
  
   	<form action="login" method="post">
   		<table align="center">
   			<tr>
   				<td>用户名：</td>
   				<td><input type="text" name="name" /></td>
   			</tr>
   			<tr>
   				<td>密码：</td>
   				<td><input type="password" name="pwd" /></td>
   			</tr>
   			<tr>
   				<td>性别：</td>
   				<td>
   					<input type="radio" name="sex" value="男" />男
   					<input type="radio" name="sex" value="女" />女
   				</td>
   			</tr>
   			<tr>
   				<td>年龄：</td>
   				<td><input type="text" name="age" /></td>
   			</tr>
   			<tr>
   				<td>Email：</td>
   				<td><input type="text" name="email" /></td>
   			</tr>
   			<tr>
   				<td colspan="2" align="center">
   					<input type="submit" value="注 册" />
   					<input type="reset" value="重 置" />
   				</td>
   			</tr>
   		</table>
   	</form>
  </body>
</html>
