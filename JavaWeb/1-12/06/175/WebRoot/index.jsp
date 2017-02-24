<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>并发问题</title>
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
			font-size:14px;
			font-family: 隶书;
			color:gray;
			border: 1px green solid;
		}
		input{
			font-size:14px;
			font-family: 隶书;
			color:gray;
		}
	</style>
  </head>
  
  <body>
  <form action="synchronization" method="post">
	   <table>
	   	<tr>
	   		<td valign="top"> 
	   			100  + <input type="text" name="num2" size="10" />
	   		</td>
	   		<td>
	   				<input type="submit" value="等 于" />
	   		</td>
	   	</tr>
	   </table>
   </form>
  </body>
</html>
