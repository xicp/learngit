<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	String sex = request.getParameter("sex");
	String age = request.getParameter("age");
	String email=request.getParameter("email");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>获取表单提交信息</title>
    
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
  
    <table height="150" width="300">
    		<tr>
   				<td align="center" colspan="4" height="20"></td>
   			</tr>
   			<tr>
   				<td align="center" colspan="4">获取表单信息</td>
   			</tr>
   			<tr>
   				<td>用户名：	</td>
   				<td>
   					<%if(name==null||"".equals(name)){
   						out.println("");
   					}else{
   						out.println(name);
   					} %>
   				</td>
   			</tr>
   			
   			<tr>
   				<td>性别：	</td>
   				<td>
   					<%if(sex==null||"".equals(sex)){
   						out.println("");
   					}else{
   						out.println(sex);
   					} %>
   				</td>
   			</tr>
   			<tr>
   				<td>年龄：	</td>
   				<td>
   					<%if(age==null||"".equals(age)){
   						out.println("");
   					}else{
   						out.println(age);
   					} %>
   				</td>
   			</tr>
   			<tr>
   				<td>Email：	</td>
   				<td>
   					<%if(email==null||"".equals(email)){
   						out.println("");
   					}else{
   						out.println(email);
   					} %>
   				</td>
   			</tr>
   			<tr>
   				<td align="center" colspan="4" height="20"></td>
   			</tr>
   		</table>
  </body>
</html>
