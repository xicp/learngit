<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>获取表单提交的信息</title>
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
  
  	<form action="save.jsp" method="post">
    	<table height="150" width="300">
    		<tr>
   				<td align="center" colspan="4" height="20"></td>
   			</tr>
   			<tr>
   				<td align="center" colspan="4">用户注册</td>
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
   				<td>确认密码：	</td>
   				<td>
   					<input type="password" name="pwd1" />
   				</td>
   			</tr>
   			<tr>
   				<td>性别：	</td>
   				<td>
   					<input type="radio" name="sex" value="m" checked/>男
   					<input type="radio" name="sex" value="f" />女
   				</td>
   			</tr>
   			<tr>
   				<td>年龄：	</td>
   				<td>
   					<input type="text" name="age" />
   				</td>
   			</tr>
   			<tr>
   				<td>Email：	</td>
   				<td>
   					<input type="text" name="email" />
   				</td>
   			</tr>
   			<tr>
   				<td>	</td>
   				<td>
   					<input type="submit" value="注 册" />
   				</td>
   			</tr>
   			<tr>
   				<td align="center" colspan="4" height="20"></td>
   			</tr>
   		</table>
   	</form>
  </body>
</html>
