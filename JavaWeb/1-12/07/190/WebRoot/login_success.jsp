<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login_success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	

  </head>
  
  <body>
   		<table width="389" height="218" align="center" cellpadding="0" cellspacing="0" background="images/dlbg.jpg">
   		<tr>
   		<Td>&nbsp;</Td>
   			</tr>
   			<Tr>
   				<td valign="middle" align="center">欢迎<%=request.getParameter("username") %>登录成功！！</td>
   			</Tr>
   			<tr><td>&nbsp;</td></tr>
   		</table>
  </body>
</html>
