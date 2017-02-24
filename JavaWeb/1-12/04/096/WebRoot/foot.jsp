<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'foot.jsp' starting page</title>
    
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
			font-size: 12px;
			color: gray;
			font-family: 隶书;
		}
	</style>
  </head>
  
  <body>
  <table border="0" align="center">
  	<tr>
  		<td align="center">编程词典销售服务热线：400-675-1000 网址：www.mingrisoft.com</td>
  	</tr>
  	<tr>
  		<td align="center">Copyright@www.mingrisoft.com All Rights Reserved!</td>
  	</tr>
  </table>
  </body>
</html>
