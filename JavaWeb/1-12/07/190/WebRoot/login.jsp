<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>使用过滤器自动生成静态页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">

   <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 50px;
	margin-right: 0px;
	margin-bottom: 0px;
	
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style>
  </head>
  
  <body>
  	<form action="login_success.jsp" name="form1" method="post">
  		<table height="218" width="389" align="center" cellpadding="0" cellspacing="0" background="images/dlbg.jpg">
  			<Tr height="80">
  				<td>&nbsp;</td>
  			</Tr>
  			<Tr height="20" valign="middle"  >
  				<td height="10" align="right" style="color: #FFFFFF">
  					用户名: 
  				</td>
  				<td><input type="text" size="20" name="username"/></td>
  			</Tr>
  			<tr  valign="top">
  				<td height="10" width="150" align="right" style="color: #FFFFFF">密&nbsp;&nbsp;码:</td>
  				<Td><input type="password" name="pwd" size="21"/></Td>
  			</tr>
  			<tr valign="middle" height="10" >
  				<td align="right" valign="top">
  				<input type="submit" value="登录"/>
  				</td>
  				<td valign="middle"><input type="submit" value="退出"/></td>
  			</tr>
  			<tr height="60">
  				<td>&nbsp;</td>
  			</tr>
  		</table>
  		</form>
  </body>
</html>
