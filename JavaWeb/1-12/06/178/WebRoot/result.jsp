<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人所得税计算器</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.fieldsetStyle{
			font-size: 14px;
			color: gray;
			width: 300;
			height: 100;
			border: 1px solid;
			border-color: orangered;
		}
		table{
			font-size: 14px;
			color: green;
			font-family: 楷体;
		}
	</style>
  </head>
  
  <body>
 
   <fieldset class="fieldsetStyle" >
   
   	<legend >个人所得税</legend>
   	
   		<table>
   			<tr>
   				<td>您应交纳的个人所得税为：</td>
   				<td>
   					<%=request.getAttribute("Tax").toString() %>元
   				</td>
   			</tr>
   		</table>
   </fieldset>
  </body>
</html>
