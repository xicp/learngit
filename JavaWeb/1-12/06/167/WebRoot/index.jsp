<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�û�ע��</title>
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
		input{
			font-size:12px;
			font-family: ����;
			color:gray;
		}
	</style>
  </head>
  
  <body>
  
   	<form action="login" method="post">
   		<table align="center">
   			<tr>
   				<td>�û�����</td>
   				<td><input type="text" name="name" /></td>
   			</tr>
   			<tr>
   				<td>���룺</td>
   				<td><input type="password" name="pwd" /></td>
   			</tr>
   			<tr>
   				<td>�Ա�</td>
   				<td>
   					<input type="radio" name="sex" value="��" />��
   					<input type="radio" name="sex" value="Ů" />Ů
   				</td>
   			</tr>
   			<tr>
   				<td>���䣺</td>
   				<td><input type="text" name="age" /></td>
   			</tr>
   			<tr>
   				<td>Email��</td>
   				<td><input type="text" name="email" /></td>
   			</tr>
   			<tr>
   				<td colspan="2" align="center">
   					<input type="submit" value="ע ��" />
   					<input type="reset" value="�� ��" />
   				</td>
   			</tr>
   		</table>
   	</form>
  </body>
</html>
