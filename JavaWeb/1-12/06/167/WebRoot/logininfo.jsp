<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�û�ע����Ϣ</title>
    
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
			font-size:12px;
			font-family: ����;
			color:gray;
			border: 1px green solid;
		}
	</style>
  </head>
  
  <body>
   <table align="center">
		<tr>
			<td>�û�����</td>
			<td><%=request.getParameter("name")%></td>
		</tr>
		<tr>
			<td>���룺</td>
			<td><%=request.getParameter("pwd")%></td>
		</tr>
		<tr>
			<td>�Ա�</td>
			<td>
				<%=request.getParameter("sex")%>
			</td>
		</tr>
		<tr>
			<td>���䣺</td>
			<td><%=request.getParameter("age")%></td>
		</tr>
		<tr>
			<td>Email��</td>
			<td><%=request.getParameter("email")%></td>
		</tr>
   	</table>
  </body>
</html>
