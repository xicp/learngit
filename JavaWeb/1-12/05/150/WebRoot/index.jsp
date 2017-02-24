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
	</style>
  </head>
  
  <body>
  
   	<table>
   		<tr bgcolor="skyblue">
   			<td align="center">生成的版权信息：</td>
   		</tr>
   		<tr>
   			<td>
   			<jsp:useBean id="copyright" class="com.lh.bean.Copyright"></jsp:useBean>
   			<jsp:getProperty property="copyrightStr" name="copyright"/>
   			</td>
   		</tr>
   	</table>
  </body>
</html>
