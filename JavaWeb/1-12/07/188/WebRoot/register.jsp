<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
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
  <div align="center">后台管理员注册页面</div>
    	<form action="success.jsp" method="post" name="form1">
    		<table border="1" align="center" background="lightblue" >
    				<Tr><td>用户名</td>
    				<td><input type="text" name="name"/></td></Tr>
    				<tr>
    					<td>密&nbsp;码</td>
    					<td><input type="password" name="pwd"/></td>
    				</tr>
    				<tr>
    					<td>QQ号码</td>
    					<td><input type="text" name="qqnumber"/></td>
    				</tr>
    				<tr>
    				<td>邮箱</td>
    				<td><input type="text" name="email"/></td>
    				</tr>
    				<Tr>
    					<td>详细地址</td>
    					<td><input type="text" name="address" /></td>
    				</Tr>
    					<tr>
    						<Td><input type="submit" value="提交"/></Td>
    						<Td>&nbsp;</Td>
    					</tr>
    		</table>
    	</form>
  </body>
</html>
