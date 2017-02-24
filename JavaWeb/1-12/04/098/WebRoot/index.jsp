<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>应用Java程序片段动态添加下拉列表</title>
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
  			font-size: 13px;
  			border: 1 solid green;
  		}
  	</style>
  </head>
  
  <body>
  
  		<%
  			String[] dept = {"策划部","销售部","研发部","人事部","测试部"};
  		 %>
  		 
   		<table height="150">
   			<tr>
   				<td align="center" colspan="4">员工信息查询</td>
   			</tr>
   			<tr>
   				<td>员工姓名：
   					<input type="text" name="name" />
   				</td>
   				<td>年龄：
   					<input type="text" name="age" />
   				</td>
   				<td>所在部门：
   					 <select>
   					 	<%
   					 		for(int i=0;i<dept.length;i++){%>
   					 			<option value="<%=dept[i] %>"><%=dept[i] %></option>
   					 		<%}
   					 	 %>
   					 </select>
   				</td>
   				<td>
   					<input type="button" value="查 询" />
   				</td>
   			</tr>
   			<tr>
   				<td align="center" colspan="4" height="50"></td>
   			</tr>
   		</table>
  </body>
</html>
