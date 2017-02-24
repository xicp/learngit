<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.io.* " %>
<%@ page import="com.lh.dao.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>读取文本内容到数据库</title>
  <style type="text/css">
  	table{
  		font-size: 14px;
  		border: 1px solid green;	
  	}
  </style>
  </head>
  <body>
  
<%
	request.setCharacterEncoding("UTF-8");//设置请求编码
	String submit = request.getParameter("submit");//获取按钮的值
	String filePath = application.getRealPath("table.txt");//获取文件路径
	if(submit!=null){
	boolean res = EmpDao.getInstance().readDataToMySQLDB(filePath);//调用方法保存文件内容到数据库 
 if(res){
     out.print("<script language=javascript>alert('数据导入成功 ！ ')</script>");
 }
}
 %>
      <form action="index.jsp">
      <table>
      	<tr align="center" height="40">
      		<td>
      		【读取文本文件内容到数据库】
      		</td>
      	</tr>
      	<tr align="center" height="40">
      		<td>
      		<input type="submit" value="执 行" name="submit">
      		</td>
      	</tr>
      </table>
      </form>
  </body>
</html>
