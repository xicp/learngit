<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>获取Web路径以及真实路径</title>
    
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
			font-size:15px;
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
  
    <table align="center">
   			<tr>
   				<td>Web路径：</td>
   				<td><%=(String)request.getAttribute("path") %></td>
   			</tr>
   			<tr>
   				<td>真实路径：</td>
   				<td><%=(String)request.getAttribute("realPath") %></td>
   			</tr>
   		</table>
  </body>
</html>
