<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>应用Java程序片段动态生成表格</title>
    
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
			font-size: 15px;
			color: gray;
			font-family: 隶书;
		}
	</style>
  </head>
  
  <body>
  
  <%
  	String[] bookName = {"JavaWeb典型模块大全","JavaWeb开发实战宝典" ,"jsp项目开发全程实录"};
   %>
   
  <table border="1" align="center">
  	<tr>
  		<td align="center">编号</td>
  		<td align="center">书名</td>
  	</tr>
  	<%
  		for(int i=0;i<bookName.length;i++){
  	 %>
  	<tr>
  		<td align="center"><%=i %></td>
  		<td align="center"><%=bookName[i]%></td>
  	</tr>
  	<%} %>
  </table>
  </body>
</html>
