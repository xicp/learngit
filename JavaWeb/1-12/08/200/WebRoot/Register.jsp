<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>利用JSTL实现用户注册协议</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styles.css">


  </head>
  
  <body><div align="center">用户注册协议</div>
  		<table align="center" border="2">
  			<tr bgcolor="#CCCCCC">
  				<Td align="center">注册协议</Td>
  			</tr>
  			<Tr>
  				<td>&nbsp;</td>
  			</Tr>
  			<tr>
  				<Td><textarea rows="15" cols="80">
  				<c:import url="agreement.txt" charEncoding="gbk"/>
  			</textarea></Td>
  			</tr>
  			<Tr>
  			<td align="center" colspan="2"><input type="submit" value="我同意"/>
  			<input type="submit" value="我不同意"/></td>
  			</Tr>
  		</table>

  </body>
</html>
